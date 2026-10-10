"""
luac_float_convert.py — 将 lua_Number=double(8字节) 的 Lua 5.1 .luac
转换为 lua_Number=float(4字节) 的版本，以匹配 S2TW 32 位引擎。

背景:
  S2TW 引擎内置的 Lua 是 LUA_NUMBER=float 的定制编译版本,
  而官方 luac 5.1 默认 LUA_NUMBER=double。
  两者产物 header 的 sizeof(lua_Number) 字段不同, 导致引擎报
  "bad header in precompiled chunk" 拒绝加载。

用法:
  py luac_float_convert.py <输入.luac> [输出.luac]
  # 省略输出时: 自动生成 <输入名>_float.luac
  # 可传入多个输入文件, 依次批量转换
  py luac_float_convert.py a.luac b.luac c.luac

依据: Lua 5.1.5 lundump.c 的二进制格式。
Proto 结构 (按文件顺序):
  string  source        (每个 Proto 含顶层, 都以 source 字符串开头)
  int     linedefined
  int     lastlinedefined
  byte    nups          <-- 易漏!
  byte    numparams
  byte    is_vararg
  byte    maxstacksize
  int     sizecode;      Instruction code[sizecode]
  int     sizek;         TValue k[sizek]   (常量表)
  int     sizep;         Proto *p[sizep]   (子函数)
  int     sizelineinfo;  int lineinfo[sizelineinfo]
  int     sizelocvars;   LocVar locvars[sizelocvars]
  int     sizeupvalues;  TString *upvalues[sizeupvalues]
常量 TValue: 1字节类型 + 内容
  0=NIL  1=BOOLEAN(1字节)  3=NUMBER(lua_Number)  4=STRING(size_t+bytes)
"""
import struct
import sys
import os

SZ_INT = 4
SZ_SIZET = 4
SZ_INSTR = 4


class Reader:
    def __init__(self, data, endian):
        self.d = data
        self.off = 0
        self.e = endian

    def u8(self):
        v = self.d[self.off]; self.off += 1; return v

    def i32(self):
        v = struct.unpack_from(self.e + 'i', self.d, self.off)[0]; self.off += 4; return v

    def sz(self):
        v = struct.unpack_from(self.e + 'I', self.d, self.off)[0]; self.off += 4; return v

    def raw(self, n):
        v = self.d[self.off:self.off + n]; self.off += n; return v


class Writer:
    def __init__(self, endian):
        self.b = bytearray()
        self.e = endian

    def u8(self, v):
        self.b.append(v)

    def raw(self, v):
        self.b += v

    def i32(self, v):
        self.b += struct.pack(self.e + 'i', v)

    def sz(self, v):
        self.b += struct.pack(self.e + 'I', v)


def convert_proto(r, w):
    # --- 每个 Proto 以 source 字符串开头 (无则为 NULL/长度0) ---
    n = r.sz()
    w.sz(n)
    w.raw(r.raw(n))

    # linedefined, lastlinedefined (int)
    w.i32(r.i32())
    w.i32(r.i32())
    # nups, numparams, is_vararg, maxstacksize (各 1 字节)
    # 注意: lundump.c LoadFunction 顺序为
    #   nups -> numparams -> is_vararg -> maxstacksize
    w.u8(r.u8())   # nups
    w.u8(r.u8())   # numparams
    w.u8(r.u8())   # is_vararg
    w.u8(r.u8())   # maxstacksize
    # --- code ---
    sizecode = r.sz(); w.sz(sizecode)
    w.raw(r.raw(sizecode * SZ_INSTR))
    # --- constants ---
    sizek = r.sz(); w.sz(sizek)
    for _ in range(sizek):
        t = r.u8(); w.u8(t)
        if t == 0:
            pass
        elif t == 1:
            w.u8(r.u8())
        elif t == 3:
            v = struct.unpack_from(r.e + 'd', r.d, r.off)[0]
            r.off += 8
            w.raw(struct.pack(w.e + 'f', v))
        elif t == 4:
            n = r.sz(); w.sz(n); w.raw(r.raw(n))
        else:
            raise ValueError("unknown constant type %d at %d" % (t, r.off))
    # --- sub protos ---
    sizep = r.sz(); w.sz(sizep)
    for _ in range(sizep):
        convert_proto(r, w)
    # --- lineinfo ---
    n = r.sz(); w.sz(n)
    w.raw(r.raw(n * SZ_INT))
    # --- locvars ---
    n = r.sz(); w.sz(n)
    for _ in range(n):
        ln = r.sz(); w.sz(ln); w.raw(r.raw(ln))   # varname string
        w.i32(r.i32())   # startpc
        w.i32(r.i32())   # endpc
    # --- upvalues ---
    n = r.sz(); w.sz(n)
    for _ in range(n):
        un = r.sz(); w.sz(un); w.raw(r.raw(un))   # name string
    return


def convert_one(src_path, dst_path):
    """转换单个文件。成功返回 True，失败返回 False。"""
    data = open(src_path, 'rb').read()

    # --- 前置校验 ---
    if len(data) < 12 or data[0] != 0x1b or data[1:4] != b'Lua':
        print("[跳过] %s: 不是 Lua 5.1 字节码文件" % src_path)
        return False
    if data[4] != 0x51:
        print("[跳过] %s: 版本字节 0x%02x 不是 Lua 5.1 (0x51)" % (src_path, data[4]))
        return False
    if not (data[7] == 4 and data[8] == 4 and data[9] == 4):
        print("[跳过] %s: int/size_t/Instruction 宽度非 4 字节, 属其他平台" % src_path)
        return False
    if data[10] == 4:
        print("[跳过] %s: 已是 float(4 字节) 版本, 无需转换" % src_path)
        return False
    if data[10] != 8:
        print("[跳过] %s: lua_Number 宽度 0x%02x 既非 8 也非 4, 不支持" % (src_path, data[10]))
        return False

    endian = '<' if data[6] == 1 else '>'

    r = Reader(data, endian)
    w = Writer(endian)

    # header: 复制前 10 字节, 把 sizeof(lua_Number) 改为 4, 再复制 integral flag
    w.raw(data[0:10])
    w.u8(4)                 # sizeof(lua_Number) = 4 (float)
    w.raw(data[11:12])      # integral flag
    r.off = 12

    # 顶层 Proto
    try:
        convert_proto(r, w)
    except Exception as e:
        print("[失败] %s: 解析出错 %s" % (src_path, e))
        return False

    parsed_ok = (r.off == len(data))
    print("[%s] %s" % ("OK" if parsed_ok else "警告", src_path))
    print("    原始大小 : %d 字节" % len(data))
    print("    转换后   : %d 字节 (省 %d)" % (len(w.b), len(data) - len(w.b)))
    print("    解析进度 : %d / %d  -> %s" % (
        r.off, len(data), "完全解析 ✓" if parsed_ok else "!! 未完全解析, 结果可能不可靠"))
    if not parsed_ok:
        print("    剩余未解析: %d 字节" % (len(data) - r.off))

    if parsed_ok:
        open(dst_path, 'wb').write(bytes(w.b))
        print("    已写出   : %s" % dst_path)
        return True
    print("    因未完全解析, 已放弃写出以避免损坏文件")
    return False


def main(argv):
    if not argv:
        print(__doc__)
        print("错误: 请至少指定一个输入 .luac 文件")
        return 1

    # 单文件且指定了输出
    if len(argv) == 2 and not argv[1].lower().endswith('.luac'):
        return 0 if convert_one(argv[0], argv[1]) else 1
    if len(argv) == 2 and argv[0].lower().endswith('.luac') and argv[1].lower().endswith('.luac'):
        return 0 if convert_one(argv[0], argv[1]) else 1

    # 批量: 每个输入生成 <name>_float.luac
    ok = 0
    for src in argv:
        base, ext = os.path.splitext(src)
        dst = base + '_float' + ext
        if convert_one(src, dst):
            ok += 1
    print("\n完成: %d / %d 个文件成功转换" % (ok, len(argv)))
    return 0 if ok == len(argv) else 1


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))

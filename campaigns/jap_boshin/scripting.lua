-------------------------------------------------------------------------------
------------------------------ SCRIPT SETUP -----------------------------------
-------------------------------------------------------------------------------
local core = require "ui/CoreUtils"
local advice = require "export_advice"
local scripting = require "EpisodicScripting"
local camera_pan = 0

local new_game = false
local panning = false
local boshin_victory_advice = false
local player_faction = "bos_aizu"
local foreign_diplomacy = false

EpisodicScripting = scripting

scripting.SetCampaign("jap_boshin")
out.ting("Shogun: Fall of the Samurai campaign script!")

local function OnNewCampaignStarted(context)
	new_game = true
	boshin_victory_advice = true
	
	-- ER:FU
	scripting.game_interface:add_event_restricted_unit_record("Boshin_Inf_Elite_Infanterie_de_marine")
	scripting.game_interface:add_event_restricted_unit_record("Boshin_Ironclad_L'Ocean")
	
	scripting.game_interface:add_event_restricted_unit_record("Boshin_Inf_Elite_Royal_Marines")
	scripting.game_interface:add_event_restricted_unit_record("Boshin_Ironclad_HMS_Warrior")
	
	scripting.game_interface:add_event_restricted_unit_record("Boshin_Inf_Elite_United_States_Marines")
	scripting.game_interface:add_event_restricted_unit_record("Boshin_Ironclad_USS_Roanoke")
	
	-- ER:FB
	scripting.game_interface:add_event_restricted_building_record("bos_port_4_american_trading_district")
	scripting.game_interface:add_event_restricted_building_record("bos_port_4_british_trading_district")
	scripting.game_interface:add_event_restricted_building_record("bos_port_4_french_trading_district")
		
end

local function OnUICreated(context)

	if scripting.IsOnCampaignMap() then
		
		if new_game and not CampaignUI.IsMultiplayer() then
			
	-- Add black screen cover, hide pop-in
			CampaignUI.ToggleScreenCover(true)
			CampaignUI.ToggleCinematicBorders(true)
		
		
		-- AIZU --
			if conditions.FactionKeyIsLocal("bos_aizu", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_SHOGUN.bik")
				out.ting("Aizu Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(1.1)
				CampaignUI.SetCameraHeading(-1.09)
				CampaignUI.SetCameraTargetInstant(233.0, -35.0)
				new_game = false
		
		-- JOZAI --
			elseif conditions.FactionKeyIsLocal("bos_jozai", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_SHOGUN.bik")
				out.ting("Jozai Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.6)
				CampaignUI.SetCameraHeading(0.349)
				CampaignUI.SetCameraTargetInstant(188.0, -124.0)
				new_game = false

		-- NAGAOKA --
			elseif conditions.FactionKeyIsLocal("bos_nagaoka", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_SHOGUN.bik")
				out.ting("Nagaoka Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(1.15)
				CampaignUI.SetCameraHeading(-1.09)
				CampaignUI.SetCameraTargetInstant(147.0, -36.0)
				new_game = false

		-- CHOSHU --
			elseif conditions.FactionKeyIsLocal("bos_choshu", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_EMPEROR.bik")
				out.ting("Choshu Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.65)
				CampaignUI.SetCameraHeading(-0.769)
				CampaignUI.SetCameraTargetInstant(-122.0, -133.0)
				new_game = false
	
		-- TOSA --
			elseif conditions.FactionKeyIsLocal("bos_tosa", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_EMPEROR.bik")
				out.ting("Tosa Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.7)
				CampaignUI.SetCameraHeading(-0.51)
				CampaignUI.SetCameraTargetInstant(-58.0, -198.0)
				new_game = false
											

		-- SATSUMA --
			elseif conditions.FactionKeyIsLocal("bos_satsuma", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_EMPEROR.bik")
				out.ting("Satsuma Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.7)
				CampaignUI.SetCameraHeading(-0.581)
				CampaignUI.SetCameraTargetInstant(-198.0, -229.0)
				new_game = false
				
	-- SE --

		-- SENDAI --
			elseif conditions.FactionKeyIsLocal("bos_sendai", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_SHOGUN.bik")
				out.ting("Sendai Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.7)
				CampaignUI.SetCameraHeading(-0.7)
				CampaignUI.SetCameraTargetInstant(221.0, 22.0)
				new_game = false
				
		-- OBAMA --
			elseif conditions.FactionKeyIsLocal("bos_obama", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_SHOGUN.bik")
				out.ting("Obama Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.65)
				CampaignUI.SetCameraHeading(0.626)
				CampaignUI.SetCameraTargetInstant(20.0, -71.0)
				new_game = false				
				
		-- TSU (UENO) --
			elseif conditions.FactionKeyIsLocal("bos_ueno", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_EMPEROR.bik")
				out.ting("Tsu Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.7)
				CampaignUI.SetCameraHeading(0.0)
				CampaignUI.SetCameraTargetInstant(45.0, -106.0)
				new_game = false

		-- SAGA --
			elseif conditions.FactionKeyIsLocal("bos_saga", context) then
				scripting.game_interface:register_movies("FallOfTheSamurai/FALL_INTRO_EMPEROR.bik")
				out.ting("Saga Han! Moving camera to initial position")
		--		scripting.game_interface:take_shroud_snapshot()
				scripting.game_interface:make_neighbouring_regions_visible_in_shroud()
				scripting.game_interface:override_ui("disable_settlement_labels", true)
				scripting.game_interface:override_ui("disable_advice_changes", true)
				scripting.game_interface:steal_user_input(true)
				scripting.game_interface:set_zoom_limit(1.19, 0.676)
				CampaignUI.SetCameraZoom(0.7)
				CampaignUI.SetCameraHeading(0.0)
				CampaignUI.SetCameraTargetInstant(-207.0, -145.0)
				new_game = false
				
				
			else
				CampaignUI.ToggleCinematicBorders(false)
				CampaignUI.ToggleScreenCover(false)
				
			end
			
		elseif new_game and CampaignUI.IsMultiplayer() then
			scripting.game_interface:set_zoom_limit(1.1, 0.8)
			CampaignUI.SetCameraZoom(0.95)		
		
		end
	end
end


local message_handler = MessageManager

-------------------------------------------------------------------------------------------------------------------------
--
-- INTRO MISSION SETUP
--


--
-- INTRO FOR ALL --
--

	local function bos_intro_mission()
		out.ting("Intro: Gain Clan Level")
		scripting.game_interface:trigger_custom_mission(--[MISSION KEY]-- 
															"bos_intro_1_mission_clan_level",
														--[MISSION ISSUER]--
															"CLAN_ELDERS",													
														--[FACTION KEY]--
															player_faction,													
														--[TURN LIMIT]--
															0,
														--[TARGET]--
															"",
														--[REWARD]--
															"effect_bundle:p_bos_inspired_endeavours_global#12")
	end



-------------------------------------------------------------------------------------------------------------------------
--
-- SET DIFFICULTY LEVEL BOOLS
--

local BOOL_dif_easy = false
local BOOL_dif_normal = false
local BOOL_dif_hard = false
local BOOL_dif_very_hard = false


-------------------------------------------------------------------------------------------------------------------------
--
-- POST-INTRO ADVICE
--

local function OnPanelClosedCampaign(context)
	if conditions.IsComponentType("events", context) then
	
		if boshin_victory_advice then
			out.ting("Triggering the Boshin Victory advice in a few seconds!")
			effect.advance_scripted_advice_thread("2235a_Campaign_Advice_Attaining_Victory_Thread", 1)
			boshin_victory_advice = false
		end
	end
	

end




-------------------------------------------------------------------------------------------------------------------------
--
-- TIME TRIGGERS
--

local function OnTimeTrigger(context)

-- INTRO MISSIONS
	if context.string == "boshin_victory_advice_trigger" then
			effect.advance_scripted_advice_thread("2235a_Campaign_Advice_Attaining_Victory_Thread", 1)
			boshin_victory_advice = false
	
	
	elseif context.string == "trigger_bos_intro_mission" then
		bos_intro_mission()
		
	end
	
	
end



-------------------------------------------------------------------------------------------------------------------------
--
-- CLAN INTROS AND CAMERA PANS
--

-- TRIGGER A PAN BASED UPON A PIECE OF ADVICE TRIGGERING

local function OnAdviceIssued(context)

	-- AIZU --
	
	if conditions.AdviceJustDisplayed("2139658954", context) and not CampaignUI.IsMultiplayer() then
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(20,	
													{233.0, -35.0, 1.1, -1.09},
													{183.0, -6.9, 0.9, -0.43})

		camera_pan = 100
		
		
	
	-- JOZAI --
	
	elseif conditions.AdviceJustDisplayed("2139658961", context) and not CampaignUI.IsMultiplayer() then
		

		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(22,	
												{188.0, -124.0, 0.6, 0.349},
												{190.0, -92.0, 1.1, -0.28})
			
		camera_pan = 110

		
	-- NAGAOKA --
	
	elseif conditions.AdviceJustDisplayed("2139658969", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(22,
												{147.0, -36.0, 1.15, -1.09},
												{112.0, -23.0, 0.934, -0.772})
			
		camera_pan = 120	
			

	-- SATSUMA --
	
	elseif conditions.AdviceJustDisplayed("2139658944", context) and not CampaignUI.IsMultiplayer() then
		

		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(20,	
												{-198.0, -229.0, 0.7, -0.581},
												{-210.0, -214.0, 1.1, 0.566})
			
		camera_pan = 130

		
		
	-- CHOSHU --
	
	elseif conditions.AdviceJustDisplayed("2139658946", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(20,
												{-122.0, -133.0, 0.65, -0.769},
												{-140.8, -113.9, 1.1, -0.71})
			
		camera_pan = 140
		
		
		
	-- TOSA --
	
	elseif conditions.AdviceJustDisplayed("2139658951", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(22,
												{-58.0, -198.0, 0.7, -0.51},
												{-69.0, -170.0, 1.1, -0.67})
			
		camera_pan = 150	

		
		
-- SE --
	
	-- SENDAI --
	
	elseif conditions.AdviceJustDisplayed("2139659610", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(21,
												{221.0, 22.0, 0.7, -0.7},
												{204.0, 38.0, 1.0, 1.1})
			
		camera_pan = 160	

	
	
	-- OBAMA --
	
	elseif conditions.AdviceJustDisplayed("2139659618", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(18,
												{20.0, -71.0, 0.65, 0.626},
												{27.0, -69.0, 1.0, 0.359})
			
		camera_pan = 170				



	-- TSU (UENO) --
	
	elseif conditions.AdviceJustDisplayed("2139659602", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(24,
												{66.0, -147.0, 1.15, -0.65},
												{47.0, -104.0, 1.0, 0.172})
			
		camera_pan = 180	

		
		
	-- SAGA --
	
	elseif conditions.AdviceJustDisplayed("2139659596", context) and not CampaignUI.IsMultiplayer() then
		
		panning = true
		scripting.game_interface:set_zoom_limit(1.19, 0.676)
		scripting.game_interface:scroll_camera_with_direction(20,
												{-239.0, -162.0, 0.65, 1.0},
												{-211.0, -149.0, 1.0, 0.47})
			
		camera_pan = 190	
		
	end		
end

--[[

local function OnAdviceFinished(context)

	if conditions.AdviceJustDisplayed("", context) then
	end
	
end
]]	

-- TRIGGER A CAMERA PAN BASED UPON A PREVIOUS CAMERA PAN ENDING

local function OnCameraMoverFinished(context)

	-- AIZU --
	if camera_pan == 100 then
		scripting.game_interface:scroll_camera_with_direction(5,
												{183.0, -6.9, 0.9, -0.43},
												{183.0, -6.9, 0.9001, -0.43})
			
		camera_pan = 101

	elseif camera_pan == 101 then
		scripting.game_interface:scroll_camera_with_direction(45,
												{183.0, -6.9, 0.9001, -0.43},
												{125.0, -34.0, 0.85, -0.7},
												{181.0, -48.0, 0.93, 0.300},
												{122.0, -77.0, 0.7, 1.0},
												{179.6, -6.83, 0.95, 0.0})
			
		camera_pan = 102

	elseif camera_pan == 102 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{179.6, -6.83, 0.95, 0.0},
												{179.6, -6.83, 0.9501, 0.0})
			
		camera_pan = 103
		
	elseif camera_pan == 103 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(0.95)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(179.6, -6.83)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)


	-- JOZAI --
	elseif camera_pan == 110 then
		scripting.game_interface:scroll_camera_with_direction(7,
												{190.0, -92.0, 1.1, -0.28},
												{190.0, -92.0, 1.0999, -0.28})
			
		camera_pan = 111

	elseif camera_pan == 111 then
		scripting.game_interface:scroll_camera_with_direction(42,
												{190.0, -92.0, 1.0999, -0.28},
												{149.0, -35.0, 0.8, -0.18},
												{50.0, -102.0, 0.7, -1.0},
												{122.0, -135.0, 0.9, -0.18},
												{190.0, -95.0, 1.0, 0.0})
												
			
		camera_pan = 112

	elseif camera_pan == 112 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{190.0, -95.0, 1.0, 0.0},
												{190.0, -95.0, 1.0001, 0.0})
			
		camera_pan = 113
		
	elseif camera_pan == 113 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(190.0, -95.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)		
		
	-- NAGAOKA --
	elseif camera_pan == 120 then
		scripting.game_interface:scroll_camera_with_direction(5,
												{112.0, -23.0, 0.934, -0.772},
												{112.0, -23.0, 0.9341, -0.772})
			
		camera_pan = 121

	elseif camera_pan == 121 then
		scripting.game_interface:scroll_camera_with_direction(39,
												{112.0, -23.0, 0.9341, -0.772},
												{54.71, -98.0, 0.70, -1.8},
												{163.0, -99.0, 0.7, -0.2},
												{110.0, -28.0, 1.0, 0.0})
												
			
		camera_pan = 122

	elseif camera_pan == 122 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{110.0, -28.0, 1.0, 0.0},
												{110.0, -28.0, 1.0001, 0.0})
			
		camera_pan = 123
		
	elseif camera_pan == 123 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(110.0, -28.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)		
		
		
	-- SATSUMA --
	elseif camera_pan == 130 then
		scripting.game_interface:scroll_camera_with_direction(5,
												{-210.0, -214.0, 1.1, 0.566},
												{-210.0, -214.0, 1.099, 0.566})
			
		camera_pan = 131

	elseif camera_pan == 131 then
		scripting.game_interface:scroll_camera_with_direction(12,
												{-210.0, -214.0, 1.099, 0.566},
												{-189.0, -154.0, 0.86, 0.024},
												{-159.0, -188.0, 0.79, -0.303})
			
		camera_pan = 132
	
	elseif camera_pan == 132 then
		scripting.game_interface:scroll_camera_with_direction(4,
												{-159.0, -188.0, 0.79, -0.303},
												{-159.0, -188.0, 0.791, -0.303})
			
		camera_pan = 133	
	
	elseif camera_pan == 133 then
		scripting.game_interface:scroll_camera_with_direction(28,
												{-159.0, -188.0, 0.791, -0.303},
												{-108.0, -124.0, 0.7, -0.113},
												{22.0, -95.0, 0.85, 1.2},
												{-14.0, -155.0, 0.7, 0.374},
												
												{-201.0, -205.0, 1.0, 0.0})
			
		camera_pan = 134	

	elseif camera_pan == 134 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{-201.0, -205.0, 1.0, 0.0},
												{-201.0, -205.0, 1.0001, 0.0})
			
		camera_pan = 135
		
	elseif camera_pan == 135 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(-201.0, -205.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)
			
	-- CHOSHU --
	elseif camera_pan == 140 then
		scripting.game_interface:scroll_camera_with_direction(6,
												{-140.8, -113.9, 1.1, -0.71},
												{-140.8, -113.9, 1.1001, -0.71})
			
		camera_pan = 141

	elseif camera_pan == 141 then
		scripting.game_interface:scroll_camera_with_direction(42,
												{-140.8, -113.9, 1.1001, -0.71},
												{-162.0, -162.0, 0.7, -1.93},
												{-62.0, -110.0, 0.7, -0.2},
												{22.0, -95.0, 0.85, 0.8},
												{-39.0, -61.0, 0.7, 1.0},
												{-146.0, -117.0, 0.9, 0.0})
			
		camera_pan = 142

	elseif camera_pan == 142 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{-146.0, -117.0, 0.9, 0.0},
												{-146.0, -117.0, 0.9001, 0.0})
			
		camera_pan = 143
		
	elseif camera_pan == 143 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(0.9)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(-146.0, -117.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)

		
		
	-- TOSA --
	elseif camera_pan == 150 then
		scripting.game_interface:scroll_camera_with_direction(7,									
												{-69.0, -170.0, 1.1, -0.67},
												{-69.0, -170.0, 1.101, -0.67})
			
		camera_pan = 151

	elseif camera_pan == 151 then
		scripting.game_interface:scroll_camera_with_direction(43,
												{-69.0, -170.0, 1.101, -0.67},
												{-91.0, -150.0, 0.85, -1.01},
												{-26.0, -150.0, 0.7, -1.29},
												{29.0, -113.0, 0.81, 0.31},
												{-37.0, -105.0, 0.75, 1.14},
												{-74.0, -168.0, 1.0, 0.0})
			
		camera_pan = 152

	elseif camera_pan == 152 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{-74.0, -168.0, 1.0, 0.0},
												{-74.0, -168.0, 1.0001, 0.0})
			
		camera_pan = 153
		
	elseif camera_pan == 153 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(-74.0, -168.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)

	-- SENDAI --
	elseif camera_pan == 160 then
		scripting.game_interface:scroll_camera_with_direction(5,									
												{204.0, 38.0, 1.0, 1.1},
												{204.0, 38.0, 1.0001, 1.1})
			
		camera_pan = 161

	elseif camera_pan == 161 then
		scripting.game_interface:scroll_camera_with_direction(32,
												{204.0, 38.0, 1.0001, 1.1},
												{200.0, 70.0, 0.9, 0.85},
												{168.0, 25.5, 0.85, 0.2},
												{176.0, -84.0, 0.8, -0.1},
												{209.0, 30.0, 1.0, 0.0})
			
		camera_pan = 162

	elseif camera_pan == 162 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{209.0, 30.0, 1.0, 0.0},
												{209.0, 30.0, 1.0001, 0.0})
			
		camera_pan = 163
		
	elseif camera_pan == 163 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(209.0, 30.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)
		

	-- OBAMA --
	elseif camera_pan == 170 then
		scripting.game_interface:scroll_camera_with_direction(6,									
												{27.0, -69.0, 1.0, 0.359},
												{27.0, -69.0, 1.0001, 0.359})
			
		camera_pan = 171

	elseif camera_pan == 171 then
		scripting.game_interface:scroll_camera_with_direction(34,
												{27.0, -69.0, 1.0001, 0.359},
												{53.0, -62.0, 0.85, 0.1},
												{-10.0, -76.5, 0.75, -0.8},
												{33.0, -94.0, 0.85, -0.17},
												{109.0, -90.0, 0.85, 1.3},
												{30.0, -68.0, 1.0, 0.0})
			
		camera_pan = 172

	elseif camera_pan == 172 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{30.0, -68.0, 1.0, 0.0},
												{30.0, -68.0, 1.0001, 0.0})
			
		camera_pan = 173
		
	elseif camera_pan == 173 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(30.0, -68.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)		
		
		
	-- TSU (UENO) --
	elseif camera_pan == 180 then
		scripting.game_interface:scroll_camera_with_direction(6,									
												{47.0, -104.0, 1.0, 0.172},
												{47.0, -104.0, 1.0001, 0.172})
			
		camera_pan = 181

	elseif camera_pan == 181 then
		scripting.game_interface:scroll_camera_with_direction(34,
												{47.0, -104.0, 1.0001, 0.172},
												{40.0, -68.0, 0.86, -0.5},
												{-5.0, -76.0, 0.86, 0.24},
												{22.0, -96.0, 0.7, 1.16},
										--		{2.0, -138.0, 0.74, 0.4},
												{47.0, -111.0, 1.0, 0.0})
			
		camera_pan = 182

	elseif camera_pan == 182 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{47.0, -111.0, 1.0, 0.0},
												{47.0, -111.0, 1.0001, 0.0})
			
		camera_pan = 183
		
	elseif camera_pan == 183 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(1.0)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(47.0, -111.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)
		
		
	-- SAGA --
	elseif camera_pan == 190 then
		scripting.game_interface:scroll_camera_with_direction(7,									
												{-211.0, -149.0, 1.0, 0.47},
												{-211.0, -149.0, 1.0001, 0.47})
			
		camera_pan = 191

	elseif camera_pan == 191 then
		scripting.game_interface:scroll_camera_with_direction(39,
												{-208.0, -144.0, 1.0001, 0.54},
												{-193.0, -203.0, 0.75, -0.2},
												{-140.0, -141.0, 0.74, 0.70},
												{-76.0, -108.0, 0.74, 1.4},
												{-206.0, -149.0, 0.95, 0.0})
			
		camera_pan = 192

	elseif camera_pan == 192 then
		scripting.game_interface:scroll_camera_with_direction(2,
												{-206.0, -149.0, 0.95, 0.0},
												{-206.0, -149.0, 0.9501, 0.0})
			
		camera_pan = 193
		
	elseif camera_pan == 193 then
		panning = false
		scripting.game_interface:override_ui("disable_settlement_labels", false)
		scripting.game_interface:override_ui("disable_advice_changes", false)
		scripting.game_interface:steal_user_input(false)
		scripting.game_interface:set_zoom_limit(1.1, 0.8)
		CampaignUI.ToggleCinematicBorders(false)
		CampaignUI.SetCameraZoom(0.95)
		CampaignUI.SetCameraHeading(0.0)
		CampaignUI.SetCameraTargetInstant(-206.0, -149.0)
		camera_pan = 0

		scripting.game_interface:add_time_trigger("trigger_bos_intro_mission", 0.1)
	

		
	end

end


local function OnAdviceDismissed(context)
	
	if boshin_victory_advice then
		scripting.game_interface:add_time_trigger("boshin_victory_advice_trigger", 0.1)
		boshin_victory_advice = false
	end
	
	
	if camera_pan ~= 0 then
			
		-- AIZU --
		if (camera_pan == 100) or (camera_pan == 101) or (camera_pan == 102)  or (camera_pan == 103) then
			camera_pan = 103
			scripting.game_interface:stop_camera()
			
		-- JOZAI --
		elseif (camera_pan == 110) or (camera_pan == 111) or (camera_pan == 112) or (camera_pan == 113)then
			camera_pan = 113
			scripting.game_interface:stop_camera()
						
		-- NAGAOKA --
		elseif (camera_pan == 120) or (camera_pan == 121) or (camera_pan == 122) or (camera_pan == 123) then
			camera_pan = 123
			scripting.game_interface:stop_camera()
			
		-- SATSUMA --
		elseif (camera_pan == 130) or (camera_pan == 131) or (camera_pan == 132) or (camera_pan == 133) or (camera_pan == 134) or (camera_pan == 135) then
			camera_pan = 135
			scripting.game_interface:stop_camera()
						
		-- CHOSHU --
		elseif (camera_pan == 140) or (camera_pan == 141) or (camera_pan == 142) or (camera_pan == 143) then
			camera_pan = 143
			scripting.game_interface:stop_camera()
			
		-- TOSA --
		elseif (camera_pan == 150) or (camera_pan == 151) or (camera_pan == 152) or (camera_pan == 153) then
			camera_pan = 153
			scripting.game_interface:stop_camera()

		-- SENDAI --
		elseif (camera_pan == 160) or (camera_pan == 161) or (camera_pan == 162) or (camera_pan == 163) then
			camera_pan = 163
			scripting.game_interface:stop_camera()

		-- OBAMA --
		elseif (camera_pan == 170) or (camera_pan == 171) or (camera_pan == 172) or (camera_pan == 173) then
			camera_pan = 173
			scripting.game_interface:stop_camera()
			
		-- TSU --
		elseif (camera_pan == 180) or (camera_pan == 181) or (camera_pan == 182) or (camera_pan == 183) then
			camera_pan = 183
			scripting.game_interface:stop_camera()
			
		-- SAGA --
		elseif (camera_pan == 190) or (camera_pan == 191) or (camera_pan == 192) or (camera_pan == 193) then
			camera_pan = 193
			scripting.game_interface:stop_camera()

					
		end
		
	end

end






-------------------------------------------------------------------------------------------------------------------------
--
-- POSITIONS THE STARTING CAMERA APPROPRIATELY IN MP CAMPAIGNS DEPENDING ON THE CURRENT FACTION
--


local function OnFactionTurnStart(context)
	
	player_faction = context.string
	
	-- TURN ONE EVENTS
	
	if conditions.TurnNumber(context) == 1 then
		out.ting ("Turn 1. Playing as the " .. context.string)
		
	-- DIFFICULTY LEVEL DETECTION
		if conditions.DifficultyLevel(context) == 1 then
			out.ting("Playing on Easy.")
			BOOL_dif_easy = true
		
		elseif conditions.DifficultyLevel(context) == 0 then
			out.ting("Playing on Normal.")
			BOOL_dif_normal = true
			
		elseif conditions.DifficultyLevel(context) == -1 then
			out.ting("Playing on Hard.")
			BOOL_dif_hard = true
			
		elseif conditions.DifficultyLevel(context) == -2 then
			out.ting("Playing on Very Hard.")
			BOOL_dif_very_hard = true
		
		elseif conditions.DifficultyLevel(context) == -3 then
			out.ting("Playing on Legendary.")
			BOOL_dif_legendary = true
		
		end
		
	
		
	-- INITIAL MP CAMERA
		
		if conditions.FactionIsLocal(context) then
							
			-- Remove the black screen cover
			CampaignUI.ToggleScreenCover(false)
					
			-- AIZU --
			if conditions.FactionName("bos_aizu", context) and conditions.FactionIsHuman("bos_aizu", context) then
				out.ting ("Playing as Aizu Han!")
				
								
				if CampaignUI.IsMultiplayer() then
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.95)
					CampaignUI.SetCameraTargetInstant(179.6, -6.83)
				end
			
			-- JOZAI --
			elseif conditions.FactionName("bos_jozai", context) and conditions.FactionIsHuman("bos_jozai", context) then
				out.ting ("Playing as Jozai Han!")
				
				if CampaignUI.IsMultiplayer() then
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(1.0)
					CampaignUI.SetCameraTargetInstant(190.0, -95.0)
				end
			

			-- NAGAOKA --
			elseif conditions.FactionName("bos_nagaoka", context) and conditions.FactionIsHuman("bos_nagaoka", context) then
				out.ting ("Playing as Nagaoka Han!")
				
				if CampaignUI.IsMultiplayer() then	
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.90)
					CampaignUI.SetCameraTargetInstant(110.0, -28.0)
				end
			
			-- CHOSHU --			
			elseif conditions.FactionName("bos_choshu", context) and conditions.FactionIsHuman("bos_choshu", context) then
				out.ting ("Playing as Choshu Han!")
				
				if CampaignUI.IsMultiplayer() then
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.90)
					CampaignUI.SetCameraTargetInstant(-146.0, -117.0)				
				end
				

			-- TOSA --	
			elseif conditions.FactionName("bos_tosa", context) and conditions.FactionIsHuman("bos_tosa", context) then
				out.ting ("Playing as Tosa Han!")
				
				if CampaignUI.IsMultiplayer() then	
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(1.0)
					CampaignUI.SetCameraTargetInstant(-74.0, -168.0)
				end
			
			-- SATSUMA --
			elseif conditions.FactionName("bos_satsuma", context) and conditions.FactionIsHuman("bos_satsuma", context) then
				out.ting ("Playing as Satsuma Han!")

				if CampaignUI.IsMultiplayer() then
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.90)
					CampaignUI.SetCameraTargetInstant(-201.0, -205.0)
				end
			
		-- SE --
			
			-- SENDAI --
			elseif conditions.FactionName("bos_sendai", context) and conditions.FactionIsHuman("bos_sendai", context) then
				out.ting ("Playing as Sendai Han!")
				
				if CampaignUI.IsMultiplayer() then
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.90)
					CampaignUI.SetCameraTargetInstant(208.0, 36.0)
				end
			

			-- OBAMA --
			elseif conditions.FactionName("bos_obama", context) and conditions.FactionIsHuman("bos_obama", context) then
				out.ting ("Playing as Obama Han!")
				
				if CampaignUI.IsMultiplayer() then	
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(1.0)
					CampaignUI.SetCameraTargetInstant(30.0, -68.0)
				end
			
			-- TSU (UENO) --			
			elseif conditions.FactionName("bos_ueno", context) and conditions.FactionIsHuman("bos_ueno", context) then
				out.ting ("Playing as Tsu Han!")
				
				if CampaignUI.IsMultiplayer() then
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.90)
					CampaignUI.SetCameraTargetInstant(45.0, -106.0)				
				end
				

			-- SAGA --	
			elseif conditions.FactionName("bos_saga", context) and conditions.FactionIsHuman("bos_saga", context) then
				out.ting ("Playing as Saga Han!")
				
				if CampaignUI.IsMultiplayer() then	
					scripting.game_interface:set_zoom_limit(1.1, 0.8)
					CampaignUI.SetCameraZoom(0.90)
					CampaignUI.SetCameraTargetInstant(-207.0, -145.0)
				end
			
			
			end
		end
	end
end



local function OnFactionTurnEnd(context)

	if not foreign_diplomacy then
	
	-- DIPLOMACY JAPES --
		
		foreign_diplomacy = true
		out.ting ("Preventing weirdenss with Foreign Powers declaring war or allying with other factions")
		
		-- WAR --
		-- France
		scripting.game_interface:force_diplomacy("bos_france", "bos_aizu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_choshu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_jozai", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_nagaoka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_obama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_saga", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_satsuma", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sendai", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tosa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_ueno", "war", false, false)
		
		scripting.game_interface:force_diplomacy("bos_france", "bos_awaji_sumoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_edo", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_fukue", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_fukui", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_fukuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_gujohachiman", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hikone", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hirado", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hirosaki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hiroshima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_iwakuni", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kakegawa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kanazawa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kofu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_koga", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kokura", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kubota", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kumamoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kuwana", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_marugame", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsue", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsumae", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsumoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsushiro", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_mito", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_miyazu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_morioka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_nagoya", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_nobeoka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_numata", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_odawara", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_oka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_okayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_okazaki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_ozu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sado", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sasayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sunpu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_takatori", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_takatsuki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_takayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tanegashima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tatsuno", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tokushima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tottori", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_toyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_toyooka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tsushima_fuchu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tsuwano", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tsuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_utsonomiya", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_wakayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_yodo", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_yonago", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_yonezawa", "war", false, false)
		
		-- Britain
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_aizu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_choshu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_jozai", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_nagaoka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_obama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_saga", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_satsuma", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sendai", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tosa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_ueno", "war", false, false)		
	
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_awaji_sumoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_edo", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_fukue", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_fukui", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_fukuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_gujohachiman", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hikone", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hirado", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hirosaki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hiroshima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_iwakuni", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kakegawa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kanazawa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kofu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_koga", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kokura", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kubota", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kumamoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kuwana", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_marugame", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsue", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsumae", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsumoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsushiro", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_mito", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_miyazu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_morioka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_nagoya", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_nobeoka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_numata", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_odawara", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_oka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_okayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_okazaki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_ozu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sado", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sasayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sunpu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_takatori", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_takatsuki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_takayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tanegashima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tatsuno", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tokushima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tottori", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_toyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_toyooka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tsushima_fuchu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tsuwano", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tsuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_utsonomiya", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_wakayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_yodo", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_yonago", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_yonezawa", "war", false, false)	
		
		-- America
		scripting.game_interface:force_diplomacy("bos_usa", "bos_aizu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_choshu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_jozai", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_nagaoka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_obama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_saga", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_satsuma", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sendai", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tosa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_ueno", "war", false, false)

		scripting.game_interface:force_diplomacy("bos_usa", "bos_awaji_sumoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_edo", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_fukue", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_fukui", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_fukuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_gujohachiman", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hikone", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hirado", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hirosaki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hiroshima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_iwakuni", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kakegawa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kanazawa", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kofu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_koga", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kokura", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kubota", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kumamoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kuwana", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_marugame", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsue", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsumae", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsumoto", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsushiro", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_mito", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_miyazu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_morioka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_nagoya", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_nobeoka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_numata", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_odawara", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_oka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_okayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_okazaki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_ozu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sado", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sasayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sunpu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_takatori", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_takatsuki", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_takayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tanegashima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tatsuno", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tokushima", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tottori", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_toyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_toyooka", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tsushima_fuchu", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tsuwano", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tsuyama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_utsonomiya", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_wakayama", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_yodo", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_yonago", "war", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_yonezawa", "war", false, false)


		-- ALLIANCE --
		-- France
		scripting.game_interface:force_diplomacy("bos_france", "bos_aizu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_choshu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_jozai", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_nagaoka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_obama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_saga", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_satsuma", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sendai", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tosa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_ueno", "alliance", false, false)
		
		scripting.game_interface:force_diplomacy("bos_france", "bos_awaji_sumoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_edo", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_fukue", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_fukui", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_fukuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_gujohachiman", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hikone", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hirado", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hirosaki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_hiroshima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_iwakuni", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kakegawa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kanazawa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kofu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_koga", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kokura", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kubota", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kumamoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_kuwana", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_marugame", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsue", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsumae", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsumoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsushiro", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_matsuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_mito", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_miyazu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_morioka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_nagoya", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_nobeoka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_numata", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_odawara", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_oka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_okayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_okazaki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_ozu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sado", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sasayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_sunpu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_takatori", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_takatsuki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_takayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tanegashima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tatsuno", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tokushima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tottori", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_toyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_toyooka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tsushima_fuchu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tsuwano", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_tsuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_utsonomiya", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_wakayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_yodo", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_yonago", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_france", "bos_yonezawa", "alliance", false, false)
		
		-- Britain
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_aizu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_choshu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_jozai", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_nagaoka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_obama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_saga", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_satsuma", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sendai", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tosa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_ueno", "alliance", false, false)		
	
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_awaji_sumoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_edo", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_fukue", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_fukui", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_fukuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_gujohachiman", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hikone", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hirado", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hirosaki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_hiroshima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_iwakuni", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kakegawa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kanazawa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kofu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_koga", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kokura", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kubota", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kumamoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_kuwana", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_marugame", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsue", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsumae", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsumoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsushiro", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_matsuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_mito", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_miyazu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_morioka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_nagoya", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_nobeoka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_numata", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_odawara", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_oka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_okayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_okazaki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_ozu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sado", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sasayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_sunpu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_takatori", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_takatsuki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_takayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tanegashima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tatsuno", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tokushima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tottori", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_toyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_toyooka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tsushima_fuchu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tsuwano", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_tsuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_utsonomiya", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_wakayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_yodo", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_yonago", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_great_britain", "bos_yonezawa", "alliance", false, false)	
		
		-- America
		scripting.game_interface:force_diplomacy("bos_usa", "bos_aizu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_choshu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_jozai", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_nagaoka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_obama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_saga", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_satsuma", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sendai", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tosa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_ueno", "alliance", false, false)

		scripting.game_interface:force_diplomacy("bos_usa", "bos_awaji_sumoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_edo", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_fukue", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_fukui", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_fukuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_gujohachiman", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hikone", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hirado", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hirosaki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_hiroshima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_iwakuni", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kakegawa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kanazawa", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kofu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_koga", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kokura", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kubota", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kumamoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_kuwana", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_marugame", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsue", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsumae", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsumoto", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsushiro", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_matsuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_mito", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_miyazu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_morioka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_nagoya", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_nobeoka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_numata", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_odawara", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_oka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_okayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_okazaki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_ozu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sado", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sasayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_sunpu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_takatori", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_takatsuki", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_takayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tanegashima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tatsuno", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tokushima", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tottori", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_toyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_toyooka", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tsushima_fuchu", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tsuwano", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_tsuyama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_utsonomiya", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_wakayama", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_yodo", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_yonago", "alliance", false, false)
		scripting.game_interface:force_diplomacy("bos_usa", "bos_yonezawa", "alliance", false, false)
	end
end

-------------------------------------------------------------------------------------------------------------------------
--
-- SET UP THE ESCAPE KEY TO CIRCUMVENT PLAYER INTERACTION LOCKING
--

function OnKeyPressed(key, is_key_up)
	if is_key_up == true then
		if key == "ESCAPE" or key == "SPACE" then
			if camera_pan ~= 0 then		
				scripting.game_interface:stop_camera()
				scripting.game_interface:dismiss_advice()
				OnCameraMoverFinished(context)	
			end
		end
	end
end

--
-- IF CLICKING ON THE CLOSE ADVISOR BUTTON DURING THE PAN, THEN END WITHOUT LOCKING THE CAMERA
--

local function OnComponentLClickUp(context)
	out.ting("Component clicked!")

	if conditions.IsComponentType("minimise_button", context) and panning then
		out.ting("Cancelling the advice")
		scripting.game_interface:stop_camera()
		scripting.game_interface:dismiss_advice()
		OnCameraMoverFinished(context)
	end
end

-------------------------------------------------------------------------------------------------------------------------
--
-- SAVE AND LOAD BOOLS, PREVENT MISSIONS BEING RE-ISSUED AFTER LOADING A SAVEGAME
--

local function OnSavingGame(context)
	scripting.game_interface:save_named_value("VERSION", 1, context)
	scripting.game_interface:save_named_value("BOOL_dif_easy", BOOL_dif_easy, context)
	scripting.game_interface:save_named_value("BOOL_dif_normal", BOOL_dif_normal, context)
	scripting.game_interface:save_named_value("BOOL_dif_hard", BOOL_dif_hard, context)
	scripting.game_interface:save_named_value("BOOL_dif_very_hard", BOOL_dif_very_hard, context)
end

local function OnLoadingGame(context)
	BOOL_dif_easy =											scripting.game_interface:load_named_value("BOOL_dif_easy", false, context)
	BOOL_dif_normal =										scripting.game_interface:load_named_value("BOOL_dif_normal", false, context)
	BOOL_dif_hard =											scripting.game_interface:load_named_value("BOOL_dif_hard", false, context)
	BOOL_dif_very_hard =									scripting.game_interface:load_named_value("BOOL_dif_very_hard", false, context)
end



--------------------------------------------------------------------------------------------------------------------
-- Add event callbacks
-- For a list of all events supported create a "documentation" directory in your empire directory, run a debug build of the game and see
-- the events.txt file
--------------------------------------------------------------------------------------------------------------------

scripting.AddEventCallBack("UICreated", OnUICreated)
scripting.AddEventCallBack("NewCampaignStarted", OnNewCampaignStarted)
scripting.AddEventCallBack("SavingGame", OnSavingGame)
scripting.AddEventCallBack("LoadingGame", OnLoadingGame)


scripting.AddEventCallBack("FactionTurnStart", OnFactionTurnStart)
scripting.AddEventCallBack("FactionTurnEnd", OnFactionTurnEnd)

scripting.AddEventCallBack("AdviceIssued", OnAdviceIssued)
scripting.AddEventCallBack("AdviceDismissed", OnAdviceDismissed)
--scripting.AddEventCallBack("AdviceFinishedTrigger", OnAdviceFinished)
scripting.AddEventCallBack("CameraMoverFinished", OnCameraMoverFinished)

scripting.AddEventCallBack("TimeTrigger", OnTimeTrigger)
--scripting.AddEventCallBack("SettlementOccupied", OnSettlementOccupied)
--scripting.AddEventCallBack("CampaignSettlementAttacked", OnCampaignSettlementAttacked)
--scripting.AddEventCallBack("FactionBecomesLiberationProtectorate", OnFactionBecomesLiberationProtectorate)

scripting.AddEventCallBack("ComponentLClickUp", OnComponentLClickUp)
scripting.AddEventCallBack("PanelClosedCampaign", OnPanelClosedCampaign)

--scripting.AddEventCallBack("CameraMoverCancelled", OnCameraMoverCancelled)
--scripting.AddEventCallBack("ModelCreated", OnModelCreated)
--scripting.AddEventCallBack("BattleCompleted", OnBattleCompleted)

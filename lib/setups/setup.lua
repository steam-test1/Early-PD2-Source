core:register_module("lib/managers/PlatformManager")
core:register_module("lib/managers/SystemMenuManager")
core:register_module("lib/managers/UserManager")
core:register_module("lib/managers/SequenceManager")
core:register_module("lib/managers/ControllerManager")
core:register_module("lib/managers/SlotManager")
core:register_module("lib/managers/DebugManager")
core:register_module("lib/utils/game_state_machine/GameState")
core:register_module("lib/utils/dev/FreeFlight")
Global.DEBUG_MENU_ON = Application:debug_enabled()
Global.SKIP_OVERKILL_290 = SystemInfo:platform() == Idstring("PS3")
core:import("CoreSetup")
require("lib/managers/DLCManager")
managers.dlc = DLCManager:new()
require("lib/tweak_data/TweakData")
if Application:production_build() then
	core:import("DebugManager")
end
require("lib/utils/EventListenerHolder")
require("lib/managers/UpgradesManager")
require("lib/managers/ExperienceManager")
require("lib/managers/PlayerManager")
require("lib/managers/SavefileManager")
require("lib/managers/MenuManager")
require("lib/managers/AchievmentManager")
require("lib/managers/SkillTreeManager")
require("lib/managers/DynamicResourceManager")
require("lib/managers/InfamyManager")
core:import("PlatformManager")
core:import("SystemMenuManager")
core:import("UserManager")
core:import("ControllerManager")
core:import("SlotManager")
core:import("FreeFlight")
core:import("CoreGuiDataManager")
require("lib/managers/ControllerWrapper")
require("lib/utils/game_state_machine/GameStateMachine")
require("lib/utils/LightLoadingScreenGuiScript")
require("lib/managers/LocalizationManager")
require("lib/managers/MousePointerManager")
require("lib/managers/VideoManager")
require("lib/managers/menu/TextBoxGui")
require("lib/managers/menu/BookBoxGui")
require("lib/managers/menu/FriendsBoxGui")
require("lib/managers/menu/CircleGuiObject")
require("lib/managers/menu/BoxGuiObject")
require("lib/managers/menu/NewsFeedGui")
require("lib/managers/menu/ImageBoxGui")
require("lib/managers/menu/ProfileBoxGui")
require("lib/managers/menu/ContractBoxGui")
require("lib/managers/menu/ServerStatusBoxGui")
require("lib/managers/menu/DebugStringsBoxGui")
require("lib/managers/menu/DebugDrawFonts")
require("lib/managers/menu/MenuBackdropGUI")
require("lib/managers/SimpleGUIEffectSpewer")
require("lib/managers/WeaponFactoryManager")
require("lib/managers/BlackMarketManager")
require("lib/managers/CrimeNetManager")
require("lib/managers/LootDropManager")
require("lib/managers/ChatManager")
require("lib/managers/LootManager")
require("lib/managers/JobManager")
require("lib/managers/VoiceBriefingManager")
require("lib/managers/FeatureManager")
require("lib/managers/MissionAssetsManager")
require("lib/managers/GageAssignmentManager")
require("lib/managers/PrePlanningManager")
require("lib/units/UnitDamage")
require("lib/units/props/DigitalGui")
require("lib/units/props/TextGui")
require("lib/units/MaskExt")
script_data = script_data or {}
game_state_machine = game_state_machine or nil
Setup = Setup or class(CoreSetup.CoreSetup)
function Setup:init_category_print()
	CoreSetup.CoreSetup.init_category_print(self)
	if Global.category_print_initialized.setup then
		return
	end
	if not Global.interface_sound then
	end
	local cat_list = {
		"dialog_manager",
		"user_manager",
		"exec_manager",
		"savefile_manager",
		"loading_environment",
		"player_intel",
		"player_damage",
		"player_action",
		"AI_action",
		"bt",
		"dummy_ai",
		"dummy_block_chance",
		"johan",
		"george",
		"qa",
		"bob",
		"sound_placeholder",
		"spam"
	}
	for _, cat in ipairs(cat_list) do
		Global.category_print[cat] = false
	end
	catprint_load()
end
function Setup:load_packages()
	if not Application:editor() then
		TextureCache:set_streaming_enabled(true)
		PackageManager:set_streaming_enabled(true)
	end
	if not PackageManager:loaded("packages/base") then
		PackageManager:load("packages/base")
	end
	if not PackageManager:loaded("packages/dyn_resources") then
		PackageManager:load("packages/dyn_resources")
	end
end
function Setup:init_managers(managers)
	Global.game_settings = Global.game_settings or {
		level_id = managers.dlc:is_trial() and "bank_trial" or "bank",
		difficulty = "normal",
		permission = "public",
		team_ai = true,
		reputation_permission = 0,
		drop_in_allowed = true,
		kicking_allowed = true,
		search_appropriate_jobs = true
	}
	managers.dyn_resource = DynamicResourceManager:new()
	managers.gui_data = CoreGuiDataManager.GuiDataManager:new()
	managers.platform = PlatformManager.PlatformManager:new()
	managers.system_menu = SystemMenuManager.SystemMenuManager:new()
	managers.achievment = AchievmentManager:new()
	managers.savefile = SavefileManager:new()
	managers.user = UserManager.UserManager:new()
	managers.upgrades = UpgradesManager:new()
	managers.experience = ExperienceManager:new()
	managers.skilltree = SkillTreeManager:new()
	managers.player = PlayerManager:new()
	managers.video = VideoManager:new()
	managers.menu = MenuManager:new(self.IS_START_MENU)
	managers.subtitle:set_presenter(CoreSubtitlePresenter.OverlayPresenter:new(tweak_data.menu.pd2_medium_font, tweak_data.menu.pd2_medium_font_size))
	managers.mouse_pointer = MousePointerManager:new()
	managers.weapon_factory = WeaponFactoryManager:new()
	managers.blackmarket = BlackMarketManager:new()
	managers.crimenet = CrimeNetManager:new()
	managers.lootdrop = LootDropManager:new()
	managers.chat = ChatManager:new()
	managers.menu_component = MenuComponentManager:new()
	managers.loot = LootManager:new()
	managers.job = JobManager:new()
	managers.briefing = VoiceBriefingManager:new()
	managers.infamy = InfamyManager:new()
	managers.features = FeatureManager:new()
	managers.gage_assignment = GageAssignmentManager:new()
	managers.assets = MissionAssetsManager:new()
	managers.preplanning = PrePlanningManager:new()
	game_state_machine = GameStateMachine:new()
end
function Setup:start_boot_loading_screen()
	if not PackageManager:loaded("packages/boot_screen") then
		PackageManager:load("packages/boot_screen")
	end
	self:_start_loading_screen()
end
function Setup:start_loading_screen()
	self:_start_loading_screen()
end
function Setup:stop_loading_screen()
	if Global.is_loading then
		cat_print("loading_environment", "[LoadingEnvironment] Stop.")
		self:set_main_thread_loading_screen_visible(false)
		LoadingEnvironment:stop()
		Global.is_loading = nil
	else
		Application:stack_dump_error("[LoadingEnvironment] Tried to stop loading screen when it wasn't started.")
	end
end
function Setup:_start_loading_screen()
	if Global.is_loading then
		Application:stack_dump_error("[LoadingEnvironment] Tried to start loading screen when it was already started.")
		return
	elseif not SystemInfo:threaded_renderer() then
		cat_print("loading_environment", "[LoadingEnvironment] Skipped (renderer is not threaded).")
		Global.is_loading = true
		return
	end
	cat_print("loading_environment", "[LoadingEnvironment] Start.")
	local setup
	if not LoadingEnvironmentScene:loaded() then
		LoadingEnvironmentScene:load("levels/zone", false)
	end
	local load_level_data
	if Global.load_level then
		if not PackageManager:loaded("packages/load_level") then
			PackageManager:load("packages/load_level")
		end
		setup = "lib/setups/LevelLoadingSetup"
		load_level_data = {}
		load_level_data.level_data = Global.level_data
		load_level_data.level_tweak_data = tweak_data.levels[Global.level_data.level_id] or {}
		load_level_data.level_tweak_data.name = load_level_data.level_tweak_data.name_id and managers.localization:text(load_level_data.level_tweak_data.name_id)
		load_level_data.gui_tweak_data = tweak_data.load_level
		load_level_data.menu_tweak_data = tweak_data.menu
		load_level_data.scale_tweak_data = tweak_data.scale
		load_level_data.tip_id = tweak_data.tips:get_a_tip()
		load_level_data.controller_coords = tweak_data:get_controller_help_coords()
		if load_level_data.controller_coords then
			for id, data in pairs(load_level_data.controller_coords) do
				data.string = managers.localization:to_upper_text(id)
			end
		end
		local load_data = load_level_data.level_tweak_data.load_data
		Global.current_load_package = load_data and load_data.package or "packages/load_default"
		if Global.current_load_package then
			PackageManager:load(Global.current_load_package)
		end
		local safe_rect_pixels = managers.viewport:get_safe_rect_pixels()
		local safe_rect = managers.viewport:get_safe_rect()
		local aspect_ratio = managers.viewport:aspect_ratio()
		local res = RenderSettings.resolution
		load_level_data.gui_data = {
			safe_rect_pixels = safe_rect_pixels,
			safe_rect = safe_rect,
			aspect_ratio = aspect_ratio,
			res = res,
			workspace_size = {
				x = 0,
				y = 0,
				w = res.x,
				h = res.y
			},
			saferect_size = {
				x = safe_rect.x,
				y = safe_rect.y,
				w = safe_rect.width,
				h = safe_rect.height
			},
			bg_texture = load_data and load_data.image or "guis/textures/loading/loading_bg"
		}
	elseif not Global.boot_loading_environment_done then
		setup = "lib/setups/LightLoadingSetup"
	else
		setup = "lib/setups/HeavyLoadingSetup"
	end
	self:_setup_loading_environment()
	local data = {
		res = RenderSettings.resolution,
		layer = tweak_data.gui.LOADING_SCREEN_LAYER,
		load_level_data = load_level_data,
		is_win32 = SystemInfo:platform() == Idstring("WIN32")
	}
	LoadingEnvironment:start(setup, "LoadingEnvironmentScene", data)
	Global.is_loading = true
end
function Setup:_setup_loading_environment()
	local env_map = {
		hdr_post_processor = {
			tone_mapping = {
				disable_tone_mapping = 1,
				copy_luminance_target = 0,
				luminance_clamp = Vector3(0, 0, 0),
				white_luminance = 0,
				middle_grey = 0,
				dark_to_bright_adaption_speed = 0,
				bright_to_dark_adaption_speed = 0
			},
			radial_blur = {
				world_pos = Vector3(0, 0, 0),
				kernel_size = 16,
				falloff_exponent = 1,
				opacity = 0
			},
			light_adaption = {
				disable_tone_mapping = 1,
				copy_luminance_target = 0,
				luminance_clamp = Vector3(0, 0, 0),
				white_luminance = 0,
				middle_grey = 0,
				dark_to_bright_adaption_speed = 0,
				bright_to_dark_adaption_speed = 0
			},
			bloom_brightpass = {
				disable_tone_mapping = 1,
				middle_grey = 0,
				white_luminance = 0,
				threshold = 0
			},
			exposure_sepia_levels = {
				disable_tone_mapping = 1,
				copy_luminance_target = 0,
				luminance_clamp = Vector3(0, 0, 0),
				white_luminance = 0,
				middle_grey = 0,
				dark_to_bright_adaption_speed = 0,
				bright_to_dark_adaption_speed = 0
			},
			bloom_apply = {opacity = 0},
			dof = {
				near_focus_distance_min = 0,
				near_focus_distance_max = 0,
				far_focus_distance_min = 50000,
				far_focus_distance_max = 50000,
				clamp = 0
			}
		},
		deferred = {
			shadow = {
				fadeout_blend = 1,
				shadow_slice_depths = Vector3(800, 1600, 5500),
				shadow_slice_overlap = Vector3(150, 300, 400),
				shadow_fadeout = Vector3(16000, 17500, 0),
				slice0 = Vector3(0, 800, 0),
				slice1 = Vector3(650, 1600, 0),
				slice2 = Vector3(1300, 5500, 0),
				slice3 = Vector3(5100, 17500, 0)
			},
			apply_ambient = {
				ambient_color = Vector3(1, 1, 1),
				ambient_scale = 1,
				ambient_falloff_scale = 0,
				ambient_view_falloff_sharpness = 0,
				sky_top_color = Vector3(0, 0, 0),
				sky_bottom_color = Vector3(0, 0, 0),
				sky_reflection_top_color = Vector3(0, 0, 0),
				sky_reflection_bottom_color = Vector3(0, 0, 0),
				sun_specular_color = Vector3(0, 0, 0),
				height_fade = Vector3(25000, 25000, 0),
				height_fade_intesity_clamp = Vector3(1, 1, 0),
				environment_map_intensity = 0,
				environment_map_intensity_shadow = 0,
				effect_light_scale = 0
			}
		},
		fog_processor = {
			fog = {
				start_color = Vector3(0, 0, 0),
				color0 = Vector3(0, 0, 0),
				alpha0 = 0,
				color1 = Vector3(0, 0, 0),
				alpha1 = 0,
				color2 = Vector3(0, 0, 0),
				start = 0,
				end0 = 1000000,
				end1 = 1000000,
				end2 = 1000000
			}
		},
		shadow_processor = {
			shadow_modifier = {
				slice0 = Vector3(0, 800, 0),
				slice1 = Vector3(650, 1600, 0),
				slice2 = Vector3(1300, 5500, 0),
				slice3 = Vector3(5100, 17500, 0),
				shadow_slice_depths = Vector3(800, 1600, 5500),
				shadow_slice_overlap = Vector3(150, 300, 400),
				shadow_fadeout = Vector3(16000, 17500, 0)
			}
		}
	}
	local dummy_vp = Application:create_world_viewport(0, 0, 1, 1)
	LoadingEnvironment:viewport():set_post_processor_effect("World", Idstring("hdr_post_processor"), Idstring("empty"))
	LoadingEnvironment:viewport():set_post_processor_effect("World", Idstring("bloom_combine_post_processor"), Idstring("bloom_combine_empty"))
	Application:destroy_viewport(dummy_vp)
end
function Setup:init_game()
	if not Global.initialized then
		Global.level_data = {}
		Global.initialized = true
	end
	self._end_frame_clbks = {}
	local scene_gui = Overlay:gui()
	self._main_thread_loading_screen_gui_script = LightLoadingScreenGuiScript:new(scene_gui, RenderSettings.resolution, -1, tweak_data.gui.LOADING_SCREEN_LAYER, SystemInfo:platform() == Idstring("WIN32"))
	self._main_thread_loading_screen_gui_visible = true
	return game_state_machine
end
function Setup:init_finalize()
	game_state_machine:init_finilize()
	managers.dlc:init_finalize()
	managers.system_menu:init_finalize()
	managers.controller:init_finalize()
	if Application:editor() then
		managers.user:init_finalize()
	end
	managers.player:aquire_default_upgrades()
	managers.blackmarket:init_finalize()
	if SystemInfo:platform() == Idstring("WIN32") then
		AnimationManager:set_anim_cache_size(10485760, 0)
	end
end
function Setup:update(t, dt)
	local main_t, main_dt = TimerManager:main():time(), TimerManager:main():delta_time()
	managers.weapon_factory:update(t, dt)
	managers.platform:update(t, dt)
	managers.dyn_resource:update()
	managers.system_menu:update(main_t, main_dt)
	managers.savefile:update(t, dt)
	managers.menu:update(main_t, main_dt)
	managers.player:update(t, dt)
	managers.blackmarket:update(t, dt)
	game_state_machine:update(t, dt)
	if self._main_thread_loading_screen_gui_visible then
		self._main_thread_loading_screen_gui_script:update(-1, dt)
	end
end
function Setup:paused_update(t, dt)
	managers.platform:paused_update(t, dt)
	managers.dyn_resource:update()
	managers.system_menu:paused_update(t, dt)
	managers.savefile:paused_update(t, dt)
	managers.menu:update(t, dt)
	managers.blackmarket:update(t, dt)
	game_state_machine:paused_update(t, dt)
end
function Setup:end_update(t, dt)
	game_state_machine:end_update(t, dt)
	while #self._end_frame_clbks > 0 do
		table.remove(self._end_frame_clbks, 1)()
	end
end
function Setup:paused_end_update(t, dt)
	game_state_machine:end_update(t, dt)
	while #self._end_frame_clbks > 0 do
		table.remove(self._end_frame_clbks, 1)()
	end
end
function Setup:end_frame(t, dt)
	while self._end_frame_callbacks and #self._end_frame_callbacks > 0 do
		table.remove(self._end_frame_callbacks)()
	end
end
function Setup:add_end_frame_callback(callback)
	self._end_frame_callbacks = self._end_frame_callbacks or {}
	table.insert(self._end_frame_callbacks, callback)
end
function Setup:add_end_frame_clbk(func)
	table.insert(self._end_frame_clbks, func)
end
function Setup:destroy()
	managers.system_menu:destroy()
	managers.menu:destroy()
	if self._main_thread_loading_screen_gui_script then
		self._main_thread_loading_screen_gui_script:destroy()
		self._main_thread_loading_screen_gui_script = nil
	end
end
function Setup:load_level(level, mission, world_setting, level_class_name, level_id)
	managers.menu:close_all_menus()
	Global.load_level = true
	Global.load_start_menu = false
	Global.load_start_menu_lobby = false
	Global.level_data.level = level
	Global.level_data.mission = mission
	Global.level_data.world_setting = world_setting
	Global.level_data.level_class_name = level_class_name
	Global.level_data.level_id = level_id
	self:exec(level)
end
function Setup:load_start_menu_lobby()
	self:load_start_menu()
	Global.load_start_menu_lobby = true
end
function Setup:load_start_menu()
	managers.job:deactivate_current_job()
	managers.gage_assignment:deactivate_assignments()
	managers.menu:close_all_menus()
	managers.mission:pre_destroy()
	Global.load_level = false
	Global.load_start_menu = true
	Global.load_start_menu_lobby = false
	Global.level_data.level = nil
	Global.level_data.mission = nil
	Global.level_data.world_setting = nil
	Global.level_data.level_class_name = nil
	Global.level_data.level_id = nil
	self:exec(nil)
end
function Setup:exec(context)
	self:set_fps_cap(30)
	managers.music:stop()
	SoundDevice:stop()
	if not managers.system_menu:is_active() then
		self:set_main_thread_loading_screen_visible(true)
	end
	CoreSetup.CoreSetup.exec(self, context)
end
function Setup:quit()
	CoreSetup.CoreSetup.quit(self)
	if not managers.system_menu:is_active() then
		self:set_main_thread_loading_screen_visible(true)
		self._main_thread_loading_screen_gui_script:set_text("Exiting")
	end
end
function Setup:restart()
	local data = Global.level_data
	if data.level then
		self:load_level(data.level, data.mission, data.world_setting, data.level_class_name)
	else
		self:load_start_menu()
	end
end
function Setup:block_exec()
	if not self._main_thread_loading_screen_gui_visible then
		self:set_main_thread_loading_screen_visible(true)
		return true
	end
	if not managers.network:is_ready_to_load() then
		print("BLOCKED BY STOPPING NETWORK")
		return true
	end
	if not managers.dyn_resource:is_ready_to_close() then
		print("BLOCKED BY DYNAMIC RESOURCE MANAGER")
		managers.dyn_resource:set_file_streaming_chunk_size_mul(1, 1)
		return true
	end
	if managers.system_menu:block_exec() or managers.savefile:is_active() then
		return true
	else
		return false
	end
end
function Setup:block_quit()
	return self:block_exec()
end
function Setup:set_main_thread_loading_screen_visible(visible)
	if not self._main_thread_loading_screen_gui_visible ~= not visible then
		cat_print("loading_environment", "[LoadingEnvironment] Main thread loading screen visible: " .. tostring(visible))
		self._main_thread_loading_screen_gui_script:set_visible(visible, RenderSettings.resolution)
		self._main_thread_loading_screen_gui_visible = visible
	end
end
function Setup:set_fps_cap(value)
	if not self._framerate_low then
		Application:cap_framerate(value)
	end
end
function Setup:george_test()
	local package_name = "packages/dyn_resources"
	local asset_type = Idstring("texture")
	local asset_name = Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4_df")
	PackageManager:package(package_name):load_temp_resource(asset_type, asset_name, callback(self, self, "clbk_george_test"))
end
function Setup:george_test2()
	local package_name = "packages/dyn_resources"
	local asset_type = Idstring("texture")
	local asset_name = Idstring("units/payday2/characters/civ_female_casual_4/civ_female_casual_4_df")
	PackageManager:package(package_name):unload_resource(asset_type, asset_name, false)
end
function Setup:clbk_george_test(status, type, name)
	print("[Setup:clbk_george_test] status", status, "type", type, "name", name)
	if status then
	end
end

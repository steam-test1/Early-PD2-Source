core:register_module("lib/managers/RumbleManager")
core:import("CoreAiDataManager")
require("lib/setups/Setup")
require("lib/utils/ListenerHolder")
require("lib/managers/SlotManager")
require("lib/managers/MissionManager")
require("lib/utils/dev/editor/WorldDefinition")
require("lib/managers/ObjectInteractionManager")
require("lib/managers/LocalizationManager")
require("lib/managers/DialogManager")
require("lib/managers/EnemyManager")
require("lib/managers/SpawnManager")
require("lib/managers/HUDManager")
require("lib/managers/RumbleManager")
require("lib/managers/NavigationManager")
require("lib/managers/EnvironmentEffectsManager")
require("lib/managers/OverlayEffectManager")
require("lib/managers/ObjectivesManager")
require("lib/managers/GamePlayCentralManager")
require("lib/managers/HintManager")
require("lib/managers/MoneyManager")
require("lib/managers/KillzoneManager")
require("lib/managers/ActionMessagingManager")
require("lib/managers/GroupAIManager")
require("lib/managers/StatisticsManager")
require("lib/managers/OcclusionManager")
require("lib/managers/TradeManager")
require("lib/managers/CriminalsManager")
require("lib/managers/FeedBackManager")
require("lib/managers/TimeSpeedManager")
require("lib/managers/ExplosionManager")
core:import("SequenceManager")
if Application:editor() then
	require("lib/utils/dev/tools/WorldEditor")
	if Application:production_build() then
		require("lib/utils/dev/tools/ParseAllDramas")
	end
end
if Application:production_build() then
	require("lib/units/SimpleCharacter")
end
require("lib/units/ScriptUnitData")
require("lib/units/UnitBase")
require("lib/units/SyncUnitData")
require("lib/units/beings/player/PlayerBase")
require("lib/units/beings/player/PlayerCamera")
require("lib/units/beings/player/PlayerSound")
require("lib/units/beings/player/PlayerAnimationData")
require("lib/units/beings/player/PlayerDamage")
require("lib/units/beings/player/PlayerInventory")
require("lib/units/beings/player/PlayerEquipment")
require("lib/units/beings/player/PlayerMovement")
require("lib/network/base/extensions/NetworkBaseExtension")
require("lib/units/beings/player/HuskPlayerMovement")
require("lib/units/beings/player/HuskPlayerInventory")
require("lib/units/beings/player/HuskPlayerBase")
require("lib/units/beings/player/HuskPlayerDamage")
require("lib/units/cameras/AnimatedCamera")
require("lib/units/cameras/FPCameraPlayerBase")
require("lib/units/cameras/PrevisCamera")
require("lib/units/cameras/WaitingForPlayersCamera")
require("lib/units/cameras/MissionAccessCamera")
require("lib/units/characters/CharacterAttentionObject")
require("lib/units/enemies/cop/CopBase")
require("lib/units/enemies/cop/CopDamage")
require("lib/units/enemies/cop/CopBrain")
require("lib/units/enemies/cop/CopSound")
require("lib/units/enemies/cop/CopInventory")
require("lib/units/enemies/cop/CopMovement")
require("lib/units/enemies/tank/TankCopDamage")
require("lib/units/enemies/cop/HuskCopBase")
require("lib/units/enemies/cop/HuskCopInventory")
require("lib/units/enemies/cop/HuskCopDamage")
require("lib/units/enemies/cop/HuskCopBrain")
require("lib/units/enemies/cop/HuskCopMovement")
require("lib/units/enemies/tank/HuskTankCopDamage")
require("lib/units/characters/DummyCorpseBase")
require("lib/units/civilians/DummyCivilianBase")
require("lib/units/civilians/CivilianBase")
require("lib/units/civilians/CivilianBrain")
require("lib/units/civilians/CivilianDamage")
require("lib/units/civilians/HuskCivilianBase")
require("lib/units/civilians/HuskCivilianDamage")
require("lib/units/player_team/TeamAIBase")
require("lib/units/player_team/TeamAIBrain")
require("lib/units/player_team/TeamAIDamage")
require("lib/units/player_team/HuskTeamAIDamage")
require("lib/units/player_team/TeamAIInventory")
require("lib/units/player_team/HuskTeamAIInventory")
require("lib/units/player_team/TeamAIMovement")
require("lib/units/player_team/HuskTeamAIMovement")
require("lib/units/player_team/TeamAISound")
require("lib/units/player_team/HuskTeamAIBase")
require("lib/units/vehicles/AnimatedVehicleBase")
require("lib/units/interactions/InteractionExt")
require("lib/units/DramaExt")
require("lib/units/pickups/Pickup")
require("lib/units/pickups/AmmoClip")
require("lib/units/pickups/SpecialEquipmentPickup")
require("lib/units/pickups/GageAssignmentBase")
require("lib/units/equipment/ammo_bag/AmmoBagBase")
require("lib/units/equipment/doctor_bag/DoctorBagBase")
require("lib/units/equipment/sentry_gun/SentryGunBase")
require("lib/units/equipment/sentry_gun/SentryGunBrain")
require("lib/units/equipment/sentry_gun/SentryGunMovement")
require("lib/units/equipment/sentry_gun/SentryGunDamage")
require("lib/units/equipment/ecm_jammer/ECMJammerBase")
require("lib/units/equipment/grenade_crate/GrenadeCrateBase")
require("lib/units/equipment/bodybags_bag/BodyBagsBagBase")
require("lib/units/ContourExt")
require("lib/units/weapons/RaycastWeaponBase")
require("lib/units/weapons/NewRaycastWeaponBase")
require("lib/units/weapons/NPCRaycastWeaponBase")
require("lib/units/weapons/NewNPCRaycastWeaponBase")
require("lib/units/weapons/NPCSniperRifleBase")
require("lib/units/weapons/SawWeaponBase")
require("lib/units/weapons/NPCSawWeaponBase")
require("lib/units/weapons/trip_mine/TripMineBase")
require("lib/units/weapons/shotgun/ShotgunBase")
require("lib/units/weapons/shotgun/NewShotgunBase")
require("lib/units/weapons/shotgun/NPCShotgunBase")
require("lib/units/weapons/grenades/GrenadeBase")
require("lib/units/weapons/grenades/FragGrenade")
require("lib/units/weapons/grenades/FlashGrenade")
require("lib/units/weapons/grenades/SmokeGrenade")
require("lib/units/weapons/grenades/QuickSmokeGrenade")
require("lib/units/weapons/grenades/QuickFlashGrenade")
require("lib/units/equipment/repel_rope/RepelRopeBase")
require("lib/units/weapons/GrenadeLauncherBase")
require("lib/units/weapons/NPCGrenadeLauncherBase")
require("lib/units/weapons/grenades/M79GrenadeBase")
require("lib/units/weapons/SentryGunWeapon")
require("lib/units/weapons/WeaponGadgetBase")
require("lib/units/weapons/WeaponFlashLight")
require("lib/units/weapons/WeaponLaser")
require("lib/units/weapons/WeaponSecondSight")
require("lib/units/weapons/WeaponSimpleAnim")
require("lib/network/NetworkSpawnPointExt")
require("lib/units/props/MissionDoor")
require("lib/units/props/SecurityCamera")
require("lib/units/props/TimerGui")
require("lib/units/props/MoneyWrapBase")
require("lib/units/props/Drill")
require("lib/units/props/SecurityLockGui")
require("lib/units/props/ChristmasPresentBase")
require("lib/units/props/TvGui")
require("lib/units/props/CarryData")
require("lib/units/props/AIAttentionObject")
require("lib/units/props/SmallLootBase")
require("lib/units/props/SafehouseMoneyStack")
require("lib/units/props/OffshoreGui")
require("lib/units/props/Ladder")
require("lib/units/vehicles/SimpleVehicle")
require("lib/units/props/ZipLine")
require("lib/units/props/TextTemplateBase")
require("lib/managers/menu/FadeoutGuiObject")
require("lib/units/cameras/CinematicStateCamera")
GameSetup = GameSetup or class(Setup)
function GameSetup:load_packages()
	Setup.load_packages(self)
	if not PackageManager:loaded("packages/game_base") then
		PackageManager:load("packages/game_base")
	end
	local prefix = "packages/dlcs/"
	local sufix = "/game_base"
	local package = ""
	for dlc_package, bundled in pairs(DLCManager.BUNDLED_DLC_PACKAGES) do
		package = prefix .. tostring(dlc_package) .. sufix
		Application:debug("[MenuSetup:load_packages] DLC package: " .. package, "Is package OK to load?: " .. tostring(bundled))
		if bundled and (bundled == true or bundled == 2) and PackageManager:package_exists(package) and not PackageManager:loaded(package) then
			PackageManager:load(package)
		end
	end
	local level_package
	if not Global.level_data or not Global.level_data.level_id then
		level_package = "packages/level_debug"
	else
		local lvl_tweak_data = Global.level_data and Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
		level_package = lvl_tweak_data and lvl_tweak_data.package
	end
	if level_package then
		if type(level_package) == "table" then
			self._loaded_level_package = level_package
			for _, package in ipairs(level_package) do
				if not PackageManager:loaded(package) then
					PackageManager:load(package)
				end
			end
		elseif not PackageManager:loaded(level_package) then
			self._loaded_level_package = level_package
			PackageManager:load(level_package)
		end
	end
	local job_tweak_contact_data, job_tweak_package_data
	if Global.job_manager and Global.job_manager.current_job and Global.job_manager.current_job.job_id then
		job_tweak_contact_data = tweak_data.narrative:job_data(Global.job_manager.current_job.job_id)
		job_tweak_package_data = tweak_data.narrative:job_data(Global.job_manager.current_job.job_id, true)
	end
	local contact
	if Global.job_manager and Global.job_manager.interupt_stage then
		contact = "interupt"
		if tweak_data.levels[Global.job_manager.interupt_stage].bonus_escape then
			contact = "bain"
		end
	else
		contact = job_tweak_contact_data and job_tweak_contact_data.contact
	end
	local contact_tweak_data = tweak_data.narrative.contacts[contact]
	local contact_package = contact_tweak_data and contact_tweak_data.package
	if contact_package and not PackageManager:loaded(contact_package) then
		self._loaded_contact_package = contact_package
		PackageManager:load(contact_package)
	end
	local contract_package = job_tweak_package_data and job_tweak_package_data.package
	if contract_package and not PackageManager:loaded(contract_package) then
		self._loaded_contract_package = contract_package
		PackageManager:load(contract_package)
	end
end
function GameSetup:unload_packages()
	Setup.unload_packages(self)
	if not Global.load_level then
		local prefix = "packages/dlcs/"
		local sufix = "/game_base"
		local package = ""
		for dlc_package, bundled in pairs(DLCManager.BUNDLED_DLC_PACKAGES) do
			package = prefix .. tostring(dlc_package) .. sufix
			if bundled and (bundled == true or bundled == 2) and PackageManager:package_exists(package) and PackageManager:loaded(package) then
				PackageManager:unload(package)
			end
		end
	end
	if self._loaded_level_package then
		if type(self._loaded_level_package) == "table" then
			for _, package in ipairs(self._loaded_level_package) do
				if PackageManager:loaded(package) then
					PackageManager:unload(package)
				end
			end
		elseif PackageManager:loaded(self._loaded_level_package) then
			PackageManager:unload(self._loaded_level_package)
		end
		self._loaded_level_package = nil
	end
	if PackageManager:loaded(self._loaded_contact_package) then
		PackageManager:unload(self._loaded_contact_package)
		self._loaded_contact_package = nil
	end
	if PackageManager:loaded(self._loaded_contract_package) then
		PackageManager:unload(self._loaded_contract_package)
		self._loaded_contract_package = nil
	end
end
function GameSetup:init_managers(managers)
	Setup.init_managers(self, managers)
	managers.interaction = ObjectInteractionManager:new()
	managers.dialog = DialogManager:new()
	managers.enemy = EnemyManager:new()
	managers.spawn = SpawnManager:new()
	managers.hud = HUDManager:new()
	managers.navigation = NavigationManager:new()
	managers.objectives = ObjectivesManager:new()
	managers.game_play_central = GamePlayCentralManager:new()
	managers.hint = HintManager:new()
	managers.money = MoneyManager:new()
	managers.killzone = KillzoneManager:new()
	managers.action_messaging = ActionMessagingManager:new()
	managers.groupai = GroupAIManager:new()
	managers.statistics = StatisticsManager:new()
	managers.ai_data = CoreAiDataManager.AiDataManager:new()
	managers.occlusion = _OcclusionManager:new()
	managers.criminals = CriminalsManager:new()
	managers.trade = TradeManager:new()
	managers.feedback = FeedBackManager:new()
	managers.time_speed = TimeSpeedManager:new()
	managers.explosion = ExplosionManager:new()
	if SystemInfo:platform() == Idstring("X360") then
		managers.blackmarket:load_equipped_weapons()
	end
end
function GameSetup:init_game()
	local gsm = Setup.init_game(self)
	if not Application:editor() then
		local engine_package = PackageManager:package("engine-package")
		engine_package:unload_all_temp()
		managers.mission:set_mission_filter(managers.job:current_mission_filter() or {})
		local level = Global.level_data.level
		local mission = Global.level_data.mission
		local world_setting = Global.level_data.world_setting
		local level_class_name = Global.level_data.level_class_name
		local level_class = level_class_name and rawget(_G, level_class_name)
		if level then
			if level_class then
				script_data.level_script = level_class:new()
			end
			local level_path = "levels/" .. tostring(level)
			local t = {
				file_path = level_path .. "/world",
				file_type = "world",
				world_setting = world_setting
			}
			assert(WorldHolder:new(t):create_world("world", "all", Vector3()), "Cant load the level!")
			local mission_params = {
				file_path = level_path .. "/mission",
				activate_mission = mission,
				stage_name = "stage1"
			}
			managers.mission:parse(mission_params)
		else
			error("No level loaded! Use -level 'levelname'")
		end
		managers.worlddefinition:init_done()
	end
	return gsm
end
function GameSetup:init_finalize()
	if script_data.level_script and script_data.level_script.post_init then
		script_data.level_script:post_init()
	end
	if Global.current_load_package then
		PackageManager:unload(Global.current_load_package)
		Global.current_load_package = nil
	end
	Setup.init_finalize(self)
	managers.hud:init_finalize()
	managers.dialog:init_finalize()
	managers.gage_assignment:init_finalize()
	managers.assets:init_finalize()
	if not Application:editor() then
		managers.navigation:on_game_started()
	end
	if not Application:editor() then
		game_state_machine:change_state_by_name("ingame_waiting_for_players")
	end
	if SystemInfo:platform() == Idstring("PS3") then
		managers.achievment:chk_install_trophies()
	end
	if managers.music then
		managers.music:init_finalize()
	end
	managers.dyn_resource:post_init()
	tweak_data.gui.crime_net.locations = {}
	self._keyboard = Input:keyboard()
end
function GameSetup:update(t, dt)
	Setup.update(self, t, dt)
	managers.interaction:update(t, dt)
	managers.enemy:update(t, dt)
	managers.groupai:update(t, dt)
	managers.spawn:update(t, dt)
	managers.navigation:update(t, dt)
	managers.hud:update(t, dt)
	managers.killzone:update(t, dt)
	managers.game_play_central:update(t, dt)
	managers.trade:update(t, dt)
	managers.statistics:update(t, dt)
	managers.time_speed:update()
	managers.objectives:update(t, dt)
	managers.explosion:update(t, dt)
	if script_data.level_script and script_data.level_script.update then
		script_data.level_script:update(t, dt)
	end
	self:_update_debug_input()
end
function GameSetup:paused_update(t, dt)
	Setup.paused_update(self, t, dt)
	managers.groupai:paused_update(t, dt)
	if script_data.level_script and script_data.level_script.paused_update then
		script_data.level_script:paused_update(t, dt)
	end
	self:_update_debug_input()
end
function GameSetup:destroy()
	Setup.destroy(self)
	if script_data.level_script and script_data.level_script.destroy then
		script_data.level_script:destroy()
	end
	managers.navigation:destroy()
	managers.time_speed:destroy()
end
function GameSetup:end_update(t, dt)
	Setup.end_update(self, t, dt)
	managers.game_play_central:end_update(t, dt)
end
function GameSetup:save(data)
	Setup.save(self, data)
	managers.game_play_central:save(data)
	managers.hud:save(data)
	managers.objectives:save(data)
	managers.music:save(data)
	managers.environment_effects:save(data)
	managers.mission:save(data)
	managers.groupai:state():save(data)
	managers.player:sync_save(data)
	managers.trade:save(data)
	managers.groupai:state():save(data)
	managers.loot:sync_save(data)
	managers.enemy:save(data)
	managers.gage_assignment:sync_save(data)
	managers.preplanning:sync_save(data)
	managers.assets:sync_save(data)
	managers.job:sync_save(data)
end
function GameSetup:load(data)
	Setup.load(self, data)
	managers.game_play_central:load(data)
	managers.hud:load(data)
	managers.objectives:load(data)
	managers.music:load(data)
	managers.environment_effects:load(data)
	managers.mission:load(data)
	managers.groupai:state():load(data)
	managers.player:sync_load(data)
	managers.trade:load(data)
	managers.groupai:state():load(data)
	managers.loot:sync_load(data)
	managers.enemy:load(data)
	managers.gage_assignment:sync_load(data)
	managers.preplanning:sync_load(data)
	managers.assets:sync_load(data)
	managers.job:sync_load(data)
	managers.menu_component:load(data)
end
function GameSetup:_update_debug_input()
	local editor_ok = not Application:editor() or Global.running_simulation
	local debug_on_ok = Global.DEBUG_MENU_ON or Application:production_build()
	if not editor_ok or not debug_on_ok then
		return
	end
	if self._keyboard then
		if self._keyboard:pressed(59) then
			print("[GameSetup:_update_debug_input]", Application:paused() and "UNPAUSING" or "PAUSING")
			Application:set_pause(not Application:paused())
		elseif self._keyboard:pressed(60) then
			if self._framerate_low then
				self._framerate_low = nil
				Application:cap_framerate(managers.user:get_setting("fps_cap"))
			else
				self._framerate_low = true
				Application:cap_framerate(30)
			end
		end
	end
end
return GameSetup

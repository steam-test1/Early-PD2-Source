core:import("CoreUnit")
require("lib/states/GameState")
IngameLobbyMenuState = IngameLobbyMenuState or class(GameState)
IngameLobbyMenuState.GUI_LOOTSCREEN = Idstring("guis/lootscreen/lootscreen_fullscreen")
function IngameLobbyMenuState:init(game_state_machine)
	GameState.init(self, "ingame_lobby_menu", game_state_machine)
	if managers.hud then
		self._setup = true
		managers.hud:load_hud(self.GUI_LOOTSCREEN, false, true, false, {}, nil, nil, true)
		managers.hud:hide(self.GUI_LOOTSCREEN)
	end
	self._continue_cb = callback(self, self, "_continue")
end
function IngameLobbyMenuState:setup_controller()
	if not self._controller then
		self._controller = managers.controller:create_controller("ingame_lobby_menu", managers.controller:get_default_wrapper_index(), false)
		if Network:is_server() or managers.dlc:is_trial() then
			self._controller:add_trigger("continue", self._continue_cb)
		end
		self._controller:set_enabled(true)
	end
end
function IngameLobbyMenuState:_clear_controller()
	if not self._controller then
		return
	end
	if Network:is_server() or managers.dlc:is_trial() then
		self._controller:remove_trigger("continue", self._continue_cb)
	end
	self._controller:set_enabled(false)
	self._controller:destroy()
	self._controller = nil
end
function IngameLobbyMenuState:_continue()
	self:continue()
end
function IngameLobbyMenuState:continue()
	if self:_continue_blocked() then
		return
	end
	if managers.network:session() and Network:is_server() then
		managers.network.matchmake:set_server_joinable(true)
	end
	if Global.game_settings.single_player then
		MenuCallbackHandler:_dialog_end_game_yes()
	elseif Network:is_server() or managers.dlc:is_trial() then
		MenuCallbackHandler:load_start_menu_lobby()
	else
		setup:load_start_menu()
	end
end
function IngameLobbyMenuState:_continue_blocked()
	local in_focus = managers.menu:active_menu() == self._loot_menu
	if not in_focus then
		return true
	end
	if managers.hud:showing_stats_screen() then
		return true
	end
	if managers.system_menu:is_active() then
		return true
	end
	if managers.menu_component:input_focus() == 1 then
		return true
	end
	if self._continue_block_timer > Application:time() then
		return true
	end
	return false
end
function IngameLobbyMenuState:set_controller_enabled(enabled)
	if self._controller then
	end
end
function IngameLobbyMenuState:update(t, dt)
end
function IngameLobbyMenuState:can_drop_weapon_mods()

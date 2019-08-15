require("lib/states/GameState")
MissionEndState = MissionEndState or class(GameState)
MissionEndState.GUI_ENDSCREEN = Idstring("guis/victoryscreen/stage_endscreen")
function MissionEndState:init(name, game_state_machine, setup)
	GameState.init(self, name, game_state_machine)
	self._type = ""
	self._completion_bonus_done = false
	self._continue_cb = callback(self, self, "_continue")
	self._controller = nil
	self._continue_block_timer = 0
end
function MissionEndState:setup_controller()
	if not self._controller then
		self._controller = managers.controller:create_controller("victoryscreen", managers.controller:get_default_wrapper_index(), false)
		if Network:is_server() then
		end
		self._controller:set_enabled(true)
	end
end
function MissionEndState:set_controller_enabled(enabled)
	if self._controller then
	end
end
function MissionEndState:at_enter(old_state, params)
	managers.platform:set_presence("Mission_end")
	managers.platform:set_rich_presence(Global.game_settings.single_player and "SPEnd" or "MPEnd")
	managers.hud:remove_updator("point_of_no_return")
	managers.hud:hide_stats_screen()
	self._continue_block_timer = Application:time() + 1.5
	if Network:is_server() then
		managers.network.matchmake:set_server_joinable(false)
		if self._success then
			for peer_id, data in pairs(managers.player:get_all_synced_carry()) do
				if not tweak_data.carry[data.carry_id].skip_exit_secure then
					print("Secure loot for", peer_id, data.carry_id, data.value)
					managers.loot:secure(data.carry_id, data.value)
				end
			end
		end
	end
	local player = managers.player:player_unit()
	if player then
		player:camera():remove_sound_listener()
		player:camera():play_redirect(Idstring("idle"))
	end
	managers.dialog:quit_dialog()
	Application:debug("1 second to managers.mission:pre_destroy()")
	self._mission_destroy_t = Application:time() + 1
	if not self._success then
		managers.job:set_stage_success(false)
	end
	if self._success then
		print("MissionEndState:at_enter", managers.job:on_last_stage())
		managers.job:set_stage_success(true)
		if self._type == "victory" then
			managers.money:on_mission_completed(params.num_winners)
		end
	end
	if SystemInfo:platform() == Idstring("WIN32") and managers.network.account:has_alienware() then
		LightFX:set_lamps(0, 255, 0, 255)
	end
	self._completion_bonus_done = self._completion_bonus_done or false
	self:setup_controller()
	if not self._setup then
		self._setup = true
		managers.hud:load_hud(self.GUI_ENDSCREEN, false, true, false, {}, nil, nil, true)
		managers.menu:open_menu("mission_end_menu", 1)
		self._mission_end_menu = managers.menu:get_menu("mission_end_menu")
	end
	self._old_state = old_state
	managers.menu_component:set_max_lines_game_chat(7)
	for _, component in ipairs(managers.hud:script(PlayerBase.PLAYER_INFO_HUD).panel:children()) do
		if component:name() == "title_mid_text" or component:name() == "present_mid_text" or component:name() == "present_mid_icon" then
			if not managers.hud._mid_text_presenting or managers.hud._mid_text_presenting.type ~= "challenge" then
				component:set_visible(false)
			end
		else
			component:set_visible(false)
		end
	end
	if not managers.hud._mid_text_presenting or managers.hud._mid_text_presenting.type ~= "challenge" then
		managers.hud:script(PlayerBase.PLAYER_INFO_HUD_FULLSCREEN).present_background:set_visible(false)
	end
	managers.hud:set_success_endscreen_hud(self._success, self._server_left)
	managers.hud:show_endscreen_hud()
	managers.groupai:state():set_AI_enabled(false)
	local player = managers.player:player_unit()
	if player then
		player:character_damage():set_invulnerable(true)
		player:character_damage():stop_heartbeat()
		player:base():set_stats_screen_visible(false)
		if player:movement():current_state():shooting() then
			player:movement():current_state()._equipped_unit:base():stop_shooting()
		end
		if player:movement():current_state()._interupt_action_interact then
			player:movement():current_state():_interupt_action_interact()
		end
	end
	self._sound_listener = SoundDevice:create_listener("lobby_menu")
	self._sound_listener:set_position(Vector3(0, -50000, 0))
	self._sound_listener:activate(true)
	if self._success then
		if not managers.statistics:is_dropin() then
			local mask_pass, diff_pass, no_shots_pass, contract_pass, job_pass, jobs_pass
			for achievement, achievement_data in pairs(tweak_data.achievement.complete_heist_achievements) do
				diff_pass = not achievement_data.difficulty or table.contains(achievement_data.difficulty, Global.game_settings.difficulty)
				mask_pass = not achievement_data.mask or managers.blackmarket:equipped_mask().mask_id == achievement_data.mask
				job_pass = not achievement_data.job or managers.job:on_last_stage() and managers.job:current_job_id() == achievement_data.job
				contract_pass = not achievement_data.contract or managers.job:current_contact_id() == achievement_data.contract
				no_shots_pass = not achievement_data.no_shots or managers.statistics:session_total_shots(achievement_data.no_shots) == 0
				jobs_pass = not achievement_data.jobs or false
				if achievement_data.jobs and managers.job:on_last_stage() then
					for _, job_id in ipairs(achievement_data.jobs) do
						if managers.job:current_job_id() == job_id then
							jobs_pass = true
						else
						end
					end
				end
				if job_pass and jobs_pass and contract_pass and diff_pass and mask_pass and no_shots_pass then
					if achievement_data.stat then
						managers.achievment:award_progress(achievement_data.stat)
					elseif achievement_data.award then
						managers.achievment:award(achievement_data.award)
					end
				end
			end
		end
		for achievement, achievement_data in pairs(tweak_data.achievement.four_mask_achievements) do
			if achievement_data.masks then
				local available_masks = deep_clone(achievement_data.masks)
				for id, member in pairs(managers.network:game():all_members()) do
					local current_mask = member:peer():mask_id()
					for id, mask_id in ipairs(available_masks) do
						if current_mask == mask_id then
							table.remove(available_masks, id)
						else
						end
					end
				end
				if #available_masks == 0 then
					if achievement_data.stat then
						managers.achievment:award_progress(achievement_data.stat)
					elseif achievement_data.award then
						managers.achievment:award(achievement_data.award)
					end
				end
			end
		end
	end
	self._criminals_completed = self._success and params.num_winners or 0
	managers.statistics:stop_session({
		success = self._success,
		type = self._type
	})
	managers.statistics:send_statistics()
	managers.hud:set_statistics_endscreen_hud(self._criminals_completed, self._success)
	if self._success and not managers.statistics:is_dropin() and managers.job:on_last_stage() then
		for achievement, achievement_data in pairs(tweak_data.achievement.complete_heist_stats_achievements) do
			if Global.game_settings.difficulty == achievement_data.difficulty then
				local available_jobs
				if achievement_data.contact == "all" then
					available_jobs = {}
					for _, list in pairs(tweak_data.achievement.job_list) do
						for _, job in pairs(list) do
							table.insert(available_jobs, job)
						end
					end
				else
					available_jobs = deep_clone(tweak_data.achievement.job_list[achievement_data.contact])
				end
				for id = #available_jobs, 1, -1 do
					if 0 < managers.statistics:completed_job(available_jobs[id], achievement_data.difficulty) then
						table.remove(available_jobs, id)
					end
				end
				if table.size(available_jobs) == 0 then
					if achievement_data.stat then
						managers.achievment:award_progress(achievement_data.stat)
					elseif achievement_data.award then
						managers.achievment:award(achievement_data.award)
					end
				end
			end
		end
	end
	managers.music:post_event(self._success and "resultscreen_win" or "resultscreen_lose")
	managers.enemy:add_delayed_clbk("play_finishing_sound", callback(self, self, "play_finishing_sound", self._success), Application:time() + 2)
	local ghost_bonus = 0
	if self._type == "victory" or self._type == "gameover" then
		local total_xp_bonus, bonuses = self:_get_xp_dissected(self._success, params and params.num_winners, params and params.personal_win)
		self._bonuses = bonuses
		self:completion_bonus_done(total_xp_bonus)
		managers.job:clear_saved_ghost_bonus()
		ghost_bonus = managers.job:accumulate_ghost_bonus(ghost_bonus)
	end
	if self._success then
		if managers.job:on_last_stage() then
			managers.job:check_add_heat_to_jobs()
			managers.job:activate_accumulated_ghost_bonus()
			managers.hud:set_ghost_bonus_endscreen_hud(managers.job:get_saved_ghost_bonus())
		else
			managers.hud:set_ghost_bonus_endscreen_hud(ghost_bonus)
		end
	end
	if Network:is_server() then
		managers.network:session():set_state("game_end")
	end
end
function MissionEndState:is_success()
	return self._success
end
function MissionEndState:_get_xp_dissected(success, num_winners, personal_win)
	return managers.experience:get_xp_dissected(success, num_winners, personal_win)
end
function MissionEndState:_get_contract_xp(success)
	local has_active_job = managers.job:has_active_job()
	local job_and_difficulty_stars = has_active_job and managers.job:current_job_and_difficulty_stars() or 1
	local job_stars = has_active_job and managers.job:current_job_stars() or 1
	local difficulty_stars = has_active_job and managers.job:current_difficulty_stars() or 0
	local player_stars = managers.experience:level_to_stars()
	local total_stars = math.min(job_and_difficulty_stars, player_stars + 1)
	if job_and_difficulty_stars > total_stars then
		self._bonuses[5] = true
	end
	local total_difficulty_stars = math.max(0, total_stars - job_stars)
	local xp_multiplier = managers.experience:get_contract_difficulty_multiplier(total_difficulty_stars)
	self._bonuses[1] = difficulty_stars > 0 and difficulty_stars or false
	total_stars = math.min(job_stars, total_stars)
	self._bonuses[3] = has_active_job and managers.job:on_last_stage() or false
	local contract_xp = 0
	if success and has_active_job and managers.job:on_last_stage() then
		contract_xp = contract_xp + managers.experience:get_job_xp_by_stars(total_stars)
	else
		contract_xp = contract_xp + managers.experience:get_stage_xp_by_stars(total_stars)
	end
	contract_xp = contract_xp + contract_xp * xp_multiplier
	contract_xp = contract_xp * (not success and tweak_data:get_value("experience_manager", "stage_failed_multiplier") or 1)
	if not success then
		self._bonuses[4] = true
	end
	return contract_xp
end
function MissionEndState:set_continue_button_text()
	if self._completion_bonus_done then
		self:_set_continue_button_text()
	end
end
function MissionEndState:_set_continue_button_text()
	local text_id = "failed_disconnected_continue"
	local not_clickable = false
	if self._continue_block_timer and self._continue_block_timer > Application:time() then
		text_id = "menu_es_calculating_experience"
		not_clickable = true
	elseif managers.job:stage_success() and managers.job:on_last_stage() then
		text_id = "menu_victory_goto_payday"
	end
	local continue_button = managers.menu:is_pc_controller() and "[ENTER]" or nil
	local text = utf8.to_upper(managers.localization:text(text_id, {CONTINUE = continue_button}))
	managers.menu_component:set_endscreen_continue_button_text(text, not_clickable)
end
function MissionEndState:play_finishing_sound(success)
	if self._server_left then
		return
	end
	if managers.groupai:state():bain_state() then
	else
	end
end
function MissionEndState:completion_bonus_done(total_xp_bonus)
	self._total_xp_bonus = total_xp_bonus
	self._completion_bonus_done = false
end
function MissionEndState:at_exit(next_state)
	managers.briefing:stop_event(true)
	managers.hud:hide(self.GUI_ENDSCREEN)
	managers.menu_component:hide_game_chat_gui()
	self:_clear_controller()
	if not self._debug_continue and not Application:editor() then
		managers.savefile:save_progress()
		if Network:multiplayer() then
			self:_shut_down_network()
		end
		local player = managers.player:player_unit()
		if player then
			player:camera():remove_sound_listener()
		end
		if self._sound_listener then
			self._sound_listener:delete()
			self._sound_listener = nil
		end
		if next_state:name() ~= "disconnected" then
			self:_load_start_menu(next_state)
		end
	else
		self._debug_continue = nil
		managers.groupai:state():set_AI_enabled(true)
		local player = managers.player:player_unit()
		if player then
			player:character_damage():set_invulnerable(false)
		end
	end
	managers.menu:close_menu("mission_end_menu")
end
function MissionEndState:_shut_down_network()
	Network:set_multiplayer(false)
	managers.network:queue_stop_network()
	managers.network.matchmake:destroy_game()
	managers.network.voice_chat:destroy_voice()
end
function MissionEndState:_load_start_menu(next_state)
	if next_state:name() == "disconnected" then
		return
	end
	if managers.dlc:is_trial() then
		Global.open_trial_buy = true
	end
	managers.job:deactivate_current_job()
	setup:load_start_menu()
end
function MissionEndState:on_statistics_result(best_kills_peer_id, best_kills_score, best_special_kills_peer_id, best_special_kills_score, best_accuracy_peer_id, best_accuracy_score, most_downs_peer_id, most_downs_score, total_kills, total_specials_kills, total_head_shots, group_accuracy, group_downs)
	print("on_statistics_result begin")
	if managers.network and managers.network:session() then
		local best_kills_peer = managers.network:session():peer(best_kills_peer_id)
		local best_special_kills_peer = managers.network:session():peer(best_special_kills_peer_id)
		local best_accuracy_peer = managers.network:session():peer(best_accuracy_peer_id)
		local most_downs_peer = managers.network:session():peer(most_downs_peer_id)
		local best_kills = best_kills_peer and best_kills_peer:name() or "N/A"
		local best_special_kills = best_special_kills_peer and best_special_kills_peer:name() or "N/A"
		local best_accuracy = best_accuracy_peer and best_accuracy_peer:name() or "N/A"
		local most_downs = most_downs_peer and most_downs_peer:name() or "N/A"
		local stage_cash_summary_string
		if self._success and managers.job._global.next_interupt_stage then
			local victory_cash_postponed_id = "victory_cash_postponed"
			if tweak_data.levels[managers.job._global.next_interupt_stage].bonus_escape then
				victory_cash_postponed_id = "victory_cash_postponed_bonus"
			end
			stage_cash_summary_string = managers.localization:text(victory_cash_postponed_id)
		elseif self._success then
			local stage_payout, job_payout, bag_payout, small_loot_payout, crew_payout = managers.money:get_payouts()
			local bonus_bags = managers.loot:get_secured_bonus_bags_amount() + managers.loot:get_secured_mandatory_bags_amount()
			local bag_cash = bag_payout
			local loose_cash = small_loot_payout or 0
			local cleaner_cost = 0
			local assets_cost = 0
			local current_total_money = managers.money:total()
			if job_payout > 0 then
				local job_string = managers.localization:text("victory_stage_cash_summary_name_job", {
					stage_cash = managers.experience:cash_string(stage_payout),
					job_cash = managers.experience:cash_string(job_payout)
				})
				stage_cash_summary_string = job_string
			else
				local stage_string = managers.localization:text("victory_stage_cash_summary_name", {
					stage_cash = managers.experience:cash_string(stage_payout)
				})
				stage_cash_summary_string = stage_string
			end
			if bonus_bags > 0 and bag_cash > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_bags", {
					bag_cash = managers.experience:cash_string(bag_cash),
					bag_amount = bonus_bags,
					bonus_bags = bonus_bags
				})
			end
			if self._criminals_completed and crew_payout > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_crew", {
					winners = tostring(self._criminals_completed),
					crew_cash = managers.experience:cash_string(crew_payout)
				})
			end
			if loose_cash > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. " " .. managers.localization:text("victory_stage_cash_summary_name_loose", {
					loose_cash = managers.experience:cash_string(loose_cash)
				})
			end
			stage_cash_summary_string = stage_cash_summary_string .. "\n"
			if cleaner_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. managers.localization:text("victory_stage_cash_summary_name_civ_kill", {
					civ_killed_cash = managers.experience:cash_string(cleaner_cost)
				}) .. " "
			end
			if assets_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. managers.localization:text("victory_stage_cash_summary_name_assets", {
					asset_cash = managers.experience:cash_string(assets_cost)
				}) .. " "
			end
			if cleaner_cost > 0 or assets_cost > 0 then
				stage_cash_summary_string = stage_cash_summary_string .. "\n"
			end
			stage_cash_summary_string = stage_cash_summary_string .. "\n"
			local offshore_string = managers.localization:text("victory_stage_cash_summary_name_offshore", {
				offshore = managers.localization:text("hud_offshore_account"),
				cash = managers.experience:cash_string(managers.money:heist_offshore())
			})
			local spending_string = managers.localization:text("victory_stage_cash_summary_name_spending", {
				cash = "##" .. managers.experience:cash_string(managers.money:heist_spending()) .. "##"
			})
			stage_cash_summary_string = stage_cash_summary_string .. offshore_string .. "\n"
			stage_cash_summary_string = stage_cash_summary_string .. spending_string .. "\n"
		else
			stage_cash_summary_string = managers.localization:text("failed_summary_name")
		end
		self._statistics_data = {
			best_killer = managers.localization:text("victory_best_killer_name", {PLAYER_NAME = best_kills, SCORE = best_kills_score}),
			best_special = managers.localization:text("victory_best_special_name", {PLAYER_NAME = best_special_kills, SCORE = best_special_kills_score}),
			best_accuracy = managers.localization:text("victory_best_accuracy_name", {PLAYER_NAME = best_accuracy, SCORE = best_accuracy_score}),
			most_downs = managers.localization:text("victory_most_downs_name", {PLAYER_NAME = most_downs, SCORE = most_downs_score}),
			total_kills = total_kills,
			total_specials_kills = total_specials_kills,
			total_head_shots = total_head_shots,
			group_hit_accuracy = group_accuracy .. "%",
			group_total_downed = group_downs,
			stage_cash_summary = stage_cash_summary_string
		}
	end
	print("on_statistics_result end")
	if Network:is_server() and self._success and not managers.achievment:get_script_data("cant_touch_fail") and tweak_data:difficulty_to_index(Global.game_settings.difficulty) >= 4 and Global.level_data.level_id == "heat_street" and group_accuracy >= 60 then
		managers.challenges:set_flag("cant_touch")
		managers.network:session():send_to_peers("award_achievment", "cant_touch")
	end
end
function MissionEndState:_continue_blocked()
	local in_focus = managers.menu:active_menu() == self._mission_end_menu
	if not in_focus then
		return true
	end
	if managers.hud:showing_stats_screen() then
		return true
	end
	if managers.system_menu:is_active() then
		return true
	end
	if not self._completion_bonus_done then
		return true
	end
	if managers.menu_component:input_focus() == 1 then
		return true
	end
	if self._continue_block_timer and self._continue_block_timer > Application:time() then
		return true
	end
	return false
end
function MissionEndState:_continue()
	self:continue()
end
function MissionEndState:continue()
	if self:_continue_blocked() then
		return
	end
	if managers.job:stage_success() and managers.job:on_last_stage() then
		Application:debug(managers.job:stage_success(), managers.job:on_last_stage(), managers.job:is_job_finished())
		self:_clear_controller()
		managers.menu_component:close_stage_endscreen_gui()
		self:gsm():change_state_by_name("ingame_lobby_menu")
	elseif self._old_state then
		self:_clear_controller()
		self:gsm():change_state_by_name("empty")
	else
		Application:error("Trying to continue from victory screen, but I have no state to goto")
	end
end
function MissionEndState:_clear_controller()
	if not self._controller then
		return
	end
	if Network:is_server() then
	end
	self._controller:set_enabled(false)
	self._controller:destroy()
	self._controller = nil
end
function MissionEndState:debug_continue()
	if not self._success then
		return
	end
	if not self._completion_bonus_done then
		return
	end
	if self._old_state then
		self._debug_continue = true
		self:_clear_controller()
		self:gsm():change_state_by_name(self._old_state:name())
	end
end
function MissionEndState:set_completion_bonus_done(done)
	self._completion_bonus_done = done
	self:_set_continue_button_text()
end
function MissionEndState:update(t, dt)
	managers.hud:update_endscreen_hud(t, dt)
	if self._mission_destroy_t and self._mission_destroy_t <= Application:time() then
		Application:debug("managers.mission:pre_destroy()")
		managers.mission:pre_destroy()
		self._mission_destroy_t = nil
	end
	if self._total_xp_bonus then
		if self._total_xp_bonus >= 0 then
			local data = managers.experience:give_experience(self._total_xp_bonus)
			data.bonuses = self._bonuses
			managers.hud:send_xp_data_endscreen_hud(data, callback(self, self, "set_completion_bonus_done"))
		else
			self:set_completion_bonus_done(true)
		end
		self._total_xp_bonus = nil
	end
	if self._continue_block_timer and t >= self._continue_block_timer then
		self._continue_block_timer = nil
		self:_set_continue_button_text()
	end
	local in_focus = managers.menu:active_menu() == self._mission_end_menu
	if in_focus and not self._in_focus then
		self:_set_continue_button_text()
		self._statistics_feeded = nil
	end
	if not self._statistics_feeded and self._statistics_data then
		self._statistics_data.success = self._success
		self._statistics_data.criminals_finished = self._criminals_completed
		managers.menu_component:feed_endscreen_statistics(self._statistics_data)
		self._statistics_feeded = true
	end
	self._in_focus = in_focus
end
function MissionEndState:game_ended()
	return true
end
function MissionEndState:on_server_left()
	IngameCleanState.on_server_left(self)
end
function MissionEndState:on_kicked()
	IngameCleanState.on_kicked(self)
end
function MissionEndState:on_disconnected()
	IngameCleanState.on_disconnected(self)
end

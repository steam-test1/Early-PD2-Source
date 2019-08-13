TankCopLogicAttack = class(CopLogicAttack)
function TankCopLogicAttack.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)
	local old_internal_data = data.internal_data
	local my_data = {
		unit = data.unit
	}
	data.internal_data = my_data
	my_data.detection = data.char_tweak.detection.combat
	my_data.rsrv_pos = {}
	if old_internal_data then
		my_data.rsrv_pos = old_internal_data.rsrv_pos or my_data.rsrv_pos
	end
	local key_str = tostring(data.key)
	my_data.detection_task_key = "CopLogicAttack._upd_enemy_detection" .. key_str
	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicAttack._upd_enemy_detection, data)
	CopLogicTravel.reset_actions(data, my_data, old_internal_data, CopLogicTravel.allowed_transitional_actions)
	my_data.attitude = data.objective and data.objective.attitude or "avoid"
	my_data.weapon_range = data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].range
	local upper_body_action = data.unit:movement()._active_actions[3]
	if not upper_body_action or upper_body_action:type() ~= "shoot" then
		data.unit:movement():set_stance("hos")
	end
	data.unit:brain():set_update_enabled_state(false)
	my_data.update_queue_id = "TankCopLogicAttack.queued_update" .. key_str
	TankCopLogicAttack.queue_update(data, my_data)
	data.unit:movement():set_cool(false)
	if my_data ~= data.internal_data then
		return
	end
	data.unit:brain():set_attention_settings({cbt = true})
end
function TankCopLogicAttack.exit(data, new_logic_name, enter_params)
	CopLogicBase.exit(data, new_logic_name, enter_params)
	local my_data = data.internal_data
	TankCopLogicAttack._cancel_chase_attempt(data, my_data)
	data.unit:brain():cancel_all_pathing_searches()
	CopLogicBase.cancel_queued_tasks(my_data)
	local rsrv_pos = my_data.rsrv_pos
	if rsrv_pos.path then
		managers.navigation:unreserve_pos(rsrv_pos.path)
		rsrv_pos.path = nil
	end
	if rsrv_pos.move_dest then
		managers.navigation:unreserve_pos(rsrv_pos.move_dest)
		rsrv_pos.move_dest = nil
	end
	data.unit:brain():set_update_enabled_state(true)
end
function TankCopLogicAttack.update(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)
	local t = data.t
	local unit = data.unit
	local my_data = data.internal_data
	if CopLogicIdle._chk_relocate(data) then
		return
	end
	if not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
		CopLogicAttack._upd_enemy_detection(data, true)
		if my_data ~= data.internal_data or not data.attention_obj or data.attention_obj.reaction < AIAttentionObject.REACT_AIM then
			return
		end
	end
	local focus_enemy = data.attention_obj
	TankCopLogicAttack._process_pathing_results(data, my_data)
	local enemy_visible = focus_enemy.verified
	local engage = my_data.attitude == "engage"
	local action_taken = my_data.turning or data.unit:movement():chk_action_forbidden("walk") or my_data.walking_to_chase_pos
	if action_taken then
		return
	end
	if unit:anim_data().crouch then
		action_taken = CopLogicAttack._chk_request_action_stand(data)
	end
	if action_taken then
		return
	end
	local enemy_pos = enemy_visible and focus_enemy.m_pos or focus_enemy.verified_pos
	action_taken = CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, enemy_pos)
	if action_taken then
		return
	end
	local chase
	local z_dist = math.abs(data.m_pos.z - focus_enemy.m_pos.z)
	if focus_enemy.reaction >= AIAttentionObject.REACT_COMBAT then
		if enemy_visible then
			if z_dist < 300 or focus_enemy.verified_dis > 2000 or engage and focus_enemy.verified_dis > 500 then
				chase = true
			end
			if focus_enemy.verified_dis < 800 and unit:anim_data().run then
				local new_action = {type = "idle", body_part = 2}
				data.unit:brain():action_request(new_action)
			end
		elseif z_dist < 300 or focus_enemy.verified_dis > 2000 or engage and (not focus_enemy.verified_t or t - focus_enemy.verified_t > 5 or focus_enemy.verified_dis > 700) then
			chase = true
		end
	end
	if chase then
		if my_data.walking_to_chase_pos then
		elseif my_data.pathing_to_chase_pos then
		elseif my_data.chase_path then
			local dist = focus_enemy.verified_dis
			local run_dist = focus_enemy.verified and 1500 or 800
			local walk = dist < run_dist
			TankCopLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, walk and "walk" or "run")
		elseif my_data.chase_pos then
			my_data.chase_path_search_id = tostring(unit:key()) .. "chase"
			my_data.pathing_to_chase_pos = true
			local to_pos = my_data.chase_pos
			my_data.chase_pos = nil
			if my_data.rsrv_pos.path then
				managers.navigation:unreserve_pos(my_data.rsrv_pos.path)
				my_data.rsrv_pos.path = nil
			end
			local reservation = {
				position = mvector3.copy(to_pos),
				radius = 70,
				filter = data.pos_rsrv_id
			}
			managers.navigation:add_pos_reservation(reservation)
			my_data.rsrv_pos.path = reservation
			unit:brain():search_for_path(my_data.chase_path_search_id, to_pos)
		elseif focus_enemy.nav_tracker then
			my_data.chase_pos = CopLogicAttack._find_flank_pos(data, my_data, focus_enemy.nav_tracker)
		end
	else
		TankCopLogicAttack._cancel_chase_attempt(data, my_data)
	end
end
function TankCopLogicAttack.queued_update(data)
	local my_data = data.internal_data
	my_data.update_queued = false
	data.t = TimerManager:game():time()
	TankCopLogicAttack.update(data)
	if my_data == data.internal_data then
		TankCopLogicAttack.queue_update(data, data.internal_data)
	end
end
function TankCopLogicAttack._process_pathing_results(data, my_data)
	if data.pathing_results then
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		local path = pathing_results[my_data.chase_path_search_id]
		if path then
			if path ~= "failed" then
				my_data.chase_path = path
			else
				print("[TankCopLogicAttack._process_pathing_results] chase path failed")
			end
			my_data.pathing_to_chase_pos = nil
			my_data.chase_path_search_id = nil
		end
	end
end
function TankCopLogicAttack._cancel_chase_attempt(data, my_data)
	my_data.chase_path = nil
	if my_data.walking_to_chase_pos then
		local new_action = {type = "idle", body_part = 2}
		data.unit:brain():action_request(new_action)
	elseif my_data.pathing_to_chase_pos then
		if my_data.rsrv_pos.path then
			managers.navigation:unreserve_pos(my_data.rsrv_pos.path)
			my_data.rsrv_pos.path = nil
		end
		if data.active_searches[my_data.chase_path_search_id] then
			managers.navigation:cancel_pathing_search(my_data.chase_path_search_id)
			data.active_searches[my_data.chase_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.chase_path_search_id] = nil
		end
		my_data.chase_path_search_id = nil
		my_data.pathing_to_chase_pos = nil
		data.unit:brain():cancel_all_pathing_searches()
	elseif my_data.chase_pos then
		my_data.chase_pos = nil
	end
end
function TankCopLogicAttack.action_complete_clbk(data, action)
	local action_type = action:type()
	local my_data = data.internal_data
	if action_type == "walk" then
		if my_data.rsrv_pos.stand then
			managers.navigation:unreserve_pos(my_data.rsrv_pos.stand)
			my_data.rsrv_pos.stand = nil
		end
		if action:expired() then
			my_data.rsrv_pos.stand = my_data.rsrv_pos.move_dest
			my_data.rsrv_pos.move_dest = nil
		else
			if my_data.rsrv_pos.move_dest then
				managers.navigation:unreserve_pos(my_data.rsrv_pos.move_dest)
				my_data.rsrv_pos.move_dest = nil
			end
			local reservation = {
				position = mvector3.copy(data.m_pos),
				radius = 70,
				filter = data.pos_rsrv_id
			}
			managers.navigation:add_pos_reservation(reservation)
			my_data.rsrv_pos.stand = reservation
		end
		if my_data.walking_to_chase_pos then
			my_data.walking_to_chase_pos = nil
		end
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "hurt" and action:expired() then
		CopLogicAttack._upd_aim(data, my_data)
	end
end
function TankCopLogicAttack.chk_should_turn(data, my_data)
	return not my_data.turning and not data.unit:movement():chk_action_forbidden("walk") and not my_data.surprised and not my_data.walking_to_chase_pos
end
function TankCopLogicAttack.queue_update(data, my_data)
	my_data.update_queued = true
	CopLogicBase.queue_task(my_data, my_data.update_queue_id, TankCopLogicAttack.queued_update, data, data.t + 1.5, data.important)
end
function TankCopLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, speed, end_rot)
	if not data.unit:movement():chk_action_forbidden("walk") then
		local new_action_data = {
			type = "walk",
			nav_path = my_data.chase_path,
			variant = speed or "run",
			body_part = 2,
			end_rot = end_rot
		}
		my_data.chase_path = nil
		my_data.walking_to_chase_pos = data.unit:brain():action_request(new_action_data)
		if my_data.walking_to_chase_pos then
			my_data.rsrv_pos.move_dest = my_data.rsrv_pos.path
			my_data.rsrv_pos.path = nil
			if my_data.rsrv_pos.stand then
				managers.navigation:unreserve_pos(my_data.rsrv_pos.stand)
				my_data.rsrv_pos.stand = nil
			end
		end
	end
end
function TankCopLogicAttack.is_advancing(data)
	if data.internal_data.walking_to_chase_pos then
		return data.internal_data.rsrv_pos.move_dest.position
	end
end
function TankCopLogicAttack._get_all_paths(data)
	return {
		chase_path = data.internal_data.chase_path
	}
end
function TankCopLogicAttack._set_verified_paths(data, verified_paths)
	data.internal_data.chase_path = verified_paths.chase_path
end

HuskPlayerInventory = HuskPlayerInventory or class(PlayerInventory)
function HuskPlayerInventory:init(unit)
	HuskPlayerInventory.super.init(self, unit)
	self._align_places.right_hand = {
		obj3d_name = Idstring("a_weapon_right_front"),
		on_body = true
	}
	self._align_places.left_hand = {
		obj3d_name = Idstring("a_weapon_left_front"),
		on_body = true
	}
	self._peer_weapons = {}
end
function HuskPlayerInventory:_send_equipped_weapon()
end
function HuskPlayerInventory:synch_equipped_weapon(weap_index, blueprint_string)
	local weapon_name = self._get_weapon_name_from_sync_index(weap_index)
	if type(weapon_name) == "string" then
		self:add_unit_by_factory_name(weapon_name, true, true, blueprint_string)
		return
	end
	self:add_unit_by_name(weapon_name, true, true)
end
function HuskPlayerInventory:check_peer_weapon_spawn()
	if SystemInfo:platform() ~= Idstring("PS3") then
		return true
	end
	local next_in_line = self._peer_weapons[1]
	if next_in_line then
		if type(next_in_line) == "table" then
			print("[HuskPlayerInventory:check_peer_weapon_spawn()] Adding weapon to inventory.", inspect(next_in_line))
			self:add_unit_by_factory_blueprint(unpack(next_in_line))
		else
			print("[HuskPlayerInventory:check_peer_weapon_spawn()] waiting")
		end
		table.remove(self._peer_weapons, 1)
	else
		return true
	end
end
function HuskPlayerInventory:set_melee_weapon_by_peer(peer)
	local blackmarket_outfit = peer and peer:blackmarket_outfit()
	if blackmarket_outfit then
		self:set_melee_weapon(blackmarket_outfit.melee_weapon, true)
	end
end
function HuskPlayerInventory:add_unit_by_name(new_unit_name, equip, instant)
	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())
	local setup_data = {}
	setup_data.user_unit = self._unit
	setup_data.ignore_units = {
		self._unit,
		new_unit
	}
	setup_data.expend_ammo = false
	setup_data.autoaim = false
	setup_data.alert_AI = false
	setup_data.user_sound_variant = "1"
	new_unit:base():setup(setup_data)
	self:add_unit(new_unit, equip, instant)
end
function HuskPlayerInventory:add_unit_by_factory_name(factory_name, equip, instant, blueprint_string)
	local blueprint = managers.weapon_factory:unpack_blueprint_from_string(factory_name, blueprint_string)
	self:add_unit_by_factory_blueprint(factory_name, equip, instant, blueprint)
end
function HuskPlayerInventory:add_unit_by_factory_blueprint(factory_name, equip, instant, blueprint)
	local factory_weapon = tweak_data.weapon.factory[factory_name]
	local new_unit = World:spawn_unit(Idstring(factory_weapon.unit), Vector3(), Rotation())
	new_unit:base():set_factory_data(factory_name)
	new_unit:base():assemble_from_blueprint(factory_name, blueprint)
	new_unit:base():check_npc()
	local setup_data = {}
	setup_data.user_unit = self._unit
	setup_data.ignore_units = {
		self._unit,
		new_unit
	}
	setup_data.expend_ammo = false
	setup_data.autoaim = false
	setup_data.alert_AI = false
	setup_data.user_sound_variant = "1"
	new_unit:base():setup(setup_data)
	self:add_unit(new_unit, equip, instant)
end
function HuskPlayerInventory:synch_weapon_gadget_state(state)
	if self:equipped_unit():base().set_gadget_on then
		self:equipped_unit():base():set_gadget_on(state)
		if state and state > 0 then
			self._unit:movement():set_cbt_permanent(true)
		else
			self._unit:movement():set_cbt_permanent(false)
		end
	end
end
function HuskPlayerInventory._get_weapon_name_from_sync_index(w_index)
	if w_index <= #tweak_data.character.weap_unit_names then
		return tweak_data.character.weap_unit_names[w_index]
	end
	w_index = w_index - #tweak_data.character.weap_unit_names
	HuskPlayerInventory._chk_create_w_factory_indexes()
	local fps_id = PlayerInventory._weapon_factory_indexed[w_index]
	if tweak_data.weapon.factory[fps_id .. "_npc"] then
		return fps_id .. "_npc"
	else
		return fps_id
	end
end

local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")
HuskCivilianBase = HuskCivilianBase or class(HuskCopBase)
function HuskCivilianBase:post_init()
	self._ext_movement = self._unit:movement()
	self._unit:brain():post_init()
	self:set_anim_lod(1)
	self._lod_stage = 1
	self._allow_invisible = true
	local spawn_state = self._spawn_state or "civilian/idle/group_1/blend_1/1"
	self._ext_movement:play_state(spawn_state)
	self._ext_movement:post_init()
	managers.enemy:register_civilian(self._unit)
end
function HuskCivilianBase:default_weapon_name()
end
function HuskCivilianBase:sync_net_event(event_id)
	if event_id == 1 then
		managers.groupai:state():on_hostage_follow(managers.player:player_unit(), self._unit, true)
	elseif event_id == 2 then
		managers.groupai:state():on_hostage_follow(managers.player:player_unit(), self._unit, false)
	end
end

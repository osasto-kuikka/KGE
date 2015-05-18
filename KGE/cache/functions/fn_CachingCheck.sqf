_unit = _this select 0;

_unit setVariable ["KGE_Cache_DeadTimer", (_unit getVariable ["KGE_Cache_DeadTimer", 0]) + 1];

_canBeRemoved = true;
{
	if((_x distance _unit) < KGE_Cache_BodyRemovalDistance) exitWith {_canBeRemoved = false};
} forEach ([] call KGE_Core_fnc_GetAlivePlayers);

if(_unit getVariable ["KGE_Cache_DeadTimer", 0] < KGE_Cache_BodyRemovalTime) then {_canBeRemoved = false};

_canBeRemoved
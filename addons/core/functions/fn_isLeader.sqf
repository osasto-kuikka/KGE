/*
 * Author: nikolauska
 *
 * Check if unit is leader or if group given check if local player is leader
 *
 * Argument:
 * 0: Unit (Object, Group)
 *
 * Return value:
 * Bool
 */

private ["_unit", "_isLeader", "_grpLeader"];

_unit = [_this, 0, objNull, [objNull, grpNull]] call BIS_fnc_param;

_isLeader = false;

if(!isNull _unit) then {
	_grpLeader = leader _unit;

	if(typename _unit == "OBJECT") then {
		if(_grpLeader isEqualTo _unit) then {_isLeader = true};
	} else {
		if(_grpLeader isEqualTo KGE_Player) then {_isLeader = true};
	};
};

_isLeader
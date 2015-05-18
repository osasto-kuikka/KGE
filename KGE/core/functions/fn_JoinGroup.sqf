/*
 * Author: nikolauska
 *
 * Join group
 *
 * Argument:
 * 0: Unit joining (Object)
 * 1: Group or Unit to join (Group, Object)
 *
 * Return value:
 *
 */

private ["_unit", "_group"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_group = [_this, 1, grpNull, [grpNull, objNull]] call BIS_fnc_param;

if(!isNull _unit) then {
	if(!isNull _group) then {
		if(typename _group isEqualTo "GROUP") then {
			[_unit] joinSilent _group;
		} else {
			[_unit] joinSilent (group _group);
		};
	} else {
		// Null group error message here
	};
} else {
	// Null unit error message here
};

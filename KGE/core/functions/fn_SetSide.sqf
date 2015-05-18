/*
 * Author: nikolauska
 *
 * Set side of unit
 *
 * Argument:
 * 0: Unit (Object)
 * 1: Side (Side)
 *
 * Return value:
 *
 */

private ["_unit", "_side"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_side = [_this, 1, sideUnknown, [sideUnknown]] call BIS_fnc_param;

if(!isNull _unit) then {
	if(_side in [WEST, EAST, INDEPENDENT, CIVILIAN]) then {
		[_unit] joinSilent (createGroup _side);
	} else {
		// Invalid side error message here
	};
} else {
	// Null unit error message here
};

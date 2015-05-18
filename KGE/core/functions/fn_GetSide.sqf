/*
 * Author: nikolauska
 *
 * Get unit side
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Side
 */

private ["_unit", "_side"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_side = sideUnknown;

if(!isNull _unit) then {
	_side = side (group _unit);
};

_side
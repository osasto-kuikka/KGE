/*
 * Author: nikolauska
 *
 * Get leader group leader of unity or group
 *
 * Argument:
 * 0: Unit/Group (Object, group)
 *
 * Return value:
 * Object
 */

private ["_unit", "_return"];

_unit = [_this, 0, objNull, [objNull, grpNull]] call BIS_fnc_param;

_return = objNull;

if(!isNull _unit) then {
	_return = leader _unit;
};

_return


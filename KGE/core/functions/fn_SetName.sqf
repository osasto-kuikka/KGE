/*
 * Author: nikolauska
 *
 * Saves name of unit
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 *
 */

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if (isNull _unit || {!alive _unit}) exitWith {};

if (_unit isKindOf "CAManBase") then {
	_unit setVariable ["KGE_Name", name _unit, true];
};
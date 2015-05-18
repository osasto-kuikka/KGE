/*
 * Author: nikolauska
 *
 * Check if unit is alive
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Boolean
 */

private ["_unit", "_return"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_return = false;

if(!isNull _unit) then {
	_return = if(([_unit] call KGE_Core_fnc_GetState) isEqualTo "Alive") then {true} else {false};
};

_return
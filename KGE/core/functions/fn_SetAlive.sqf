/*
 * Author: nikolauska
 *
 * Sets state of unit
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 *
 */

/*
 * States currently available:
 * "Alive" = Player is alive and not in spectator mode or in zeus
 * "Dead" = Player is in spectator
 */

private ["_unit", "_state"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_state = [_this, 1, true, [true]] call BIS_fnc_param;

if(!isNull _unit) then {
	_updateText = format["KGE_Core_Alive_%1", [_unit] call KGE_Core_fnc_GetName];

	_unit setVariable ["KGE_Core_Alive", _state, true];
	missionNameSpace setVariable [_updateText, _state];
	publicVariable _updateText;
};

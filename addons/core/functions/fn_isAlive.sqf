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

private ["_unit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_return = false;

if(!isNull _unit) then {
	if(isPlayer _unit) then {
		_updateText = format["KGE_Core_Alive_%1", [_unit] call KGE_Core_fnc_GetName];
		
		if(!isNil _updateText) then {
			_return = missionNamespace getVariable [_updateText, true];
		} else {
			_return = _unit getVariable ["KGE_Core_Alive", true];
		};
	} else {
		if(alive _unit) then {_return = true};
	};
};

_return
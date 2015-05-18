/*
 * Author: nikolauska
 *
 * Get unit KGE state
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * String
 */

private ["_unit", "_return"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_return = "NotDefined";

if(!isNull _unit) then {
	if(isPlayer _unit) then {
		_updateText = format["KGE_Core_Status_%1", [_unit] call KGE_Core_fnc_GetName];
		
		if(!isNil _updateText) then {
			_return = missionNamespace getVariable [_updateText, "Alive"];
		} else {
			_return = (_unit getVariable ["KGE_State", "Alive"]);
		};
	} else {
		if(alive _unit) then {_return = "Alive"}
		else {_return = "Dead"};
	};
};

_return
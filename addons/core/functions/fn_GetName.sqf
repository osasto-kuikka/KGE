/*
 * Author: nikolauska
 *
 * Get unit saved name
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * String
 */

private ["_unit", "_name"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

_name = "";
if(!isNull _unit) then {
	if (_unit isKindOf "CAManBase") then {
		if(isPlayer _unit) then {
			_name = _unit getVariable ["KGE_Name", if(alive _unit) then {name _unit} else {""}];
		} else {
			_name = if(alive _unit) then {name _unit} else {""};
		};
	} else {
		_name = getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
	};
};
_name
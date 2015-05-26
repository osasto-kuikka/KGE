/*
	Author: Karel Moricky, modified by voiper for client-only use

	Description:
	Return an unique object variable.
	The variable is preserved after unit respawn.

	Parameter(s):
		0: OBJECT
		1 (Optional): STRING - variable name (number will be added behind it)

	Returns:
	STRING
*/

#include "script_component.hpp";

EXPLODE_1_PVT(_this, _object, _name);

if (isNull _object) exitwith {""};
if(isNil "_name") then {_name = ""};


private ["_var", "_varID"];

_var = _object GETVAR_SYS(BIS_fnc_objectVar_var, "");

if (_var == "") then {
	_var = vehicleVarname _object;
	
	if (_var == "") then {
		_var = _name;
		_varID = [_var, 1] call BIS_fnc_counter;
		_var = _var + str _varID;
	};

	_object SETVAR_SYS(BIS_fnc_objectVar_var, _var);
	SETMVAR(_var, _object);
	_object setVehicleVarname _var;
};

_var
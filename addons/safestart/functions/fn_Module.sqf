/*
 * Author: nikolauska
 *
 * Script for module handling
 *
 * Argument:
 * 0: Sides (Array, Side)
 *
 * Return value:
 *
 */

private ["_safeStartSideNumber", "_logic", "_moduleName", "_cfg"];

_safeStartSideNumber = -2;

KGE_SafeStart_Initialized = true;
publicVariable "KGE_SafeStart_Initialized";

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_moduleName = typeOf _logic;
_cfg = (ConfigFile >> "CfgVehicles" >> _moduleName >> "Arguments");
if (isClass _cfg) then {
	_safeStartSideNumber = [_logic getVariable (ConfigName (_cfg select 1))] call BIS_fnc_parseNumber;
};

switch (_safeStartSideNumber) do {
	case -1: {[_safeStartTimer] call KGE_SafeStart_fnc_Initialize};
	case 0: {[_safeStartTimer, [WEST]] call KGE_SafeStart_fnc_Initialize};
	case 1: {[_safeStartTimer, [EAST]] call KGE_SafeStart_fnc_Initialize};
	case 2: {[_safeStartTimer, [INDEPENDENT]] call KGE_SafeStart_fnc_Initialize};
	case 3: {[_safeStartTimer, [CIVILIAN]] call KGE_SafeStart_fnc_Initialize};
	default {};
};


/*
 * Author: nikolauska
 *
 * Return boolean info if class exists or not. Used to check if there are other mods that could be used with KGE
 *
 * Argument:
 * 0: Class name (String)
 *
 * Return value:
 * Boolean
 */


private ["_className", "_return"];

_className = [_this, 0, "", [""]] call BIS_fnc_param;

_return = false;

if (isClass(configFile >> "cfgPatches" >> _className)) then {
	_return = true;
};

_return
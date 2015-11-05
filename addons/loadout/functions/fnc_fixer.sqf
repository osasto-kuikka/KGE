/*
 * Author: nikolauska
 *
 * Check if class name should be changed to something else
 *
 * Argument:
 * 0: Class <String>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp";

params ["_class"];

private ["_return"];
_return = _class;

if ([GVAR(fixerHash), _class] call cba_fnc_hashHasKey) then {
    _return = [GVAR(fixerHash), _class] call cba_fnc_hashGet;
    KGE_LOGINFO_2("Fixer changed class %1 to %2",_class,_return);
};

_return

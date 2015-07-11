/*
 * Author: nikolauska
 *
 * Get array of all dead players
 *
 * Argument:
 *
 * Return value:
 * Array
 */

#include "script_component.hpp"

private ["_deadArray"];

_deadArray = [];
{
    if(_x GETVAR_SYS(GVAR(status),"") isEqualTo "dead") then {PUSH(_deadArray,_x)};
} forEach (call CFUNC(players));

_deadArray

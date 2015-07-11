/*
 * Author: nikolauska
 *
 * Get array of all alive players
 *
 * Argument:
 *
 * Return value:
 * Array
 */

#include "script_component.hpp"

private ["_aliveArray"];

_aliveArray = [];
{
    if(_x GETVAR_SYS(GVAR(status),"") isEqualTo "alive") then {PUSH(_aliveArray,_x)};
} forEach (call CFUNC(players));

_aliveArray

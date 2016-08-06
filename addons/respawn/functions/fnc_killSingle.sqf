/*
 * Author: nikolauska
 *
 * Kill single player
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit"];

[QGVAR(serverEvent), [_unit, "KGE_KILL"]] call CBA_fnc_serverEvent;

/*
 * Author: nikolauska
 *
 * BIS killed eventhandler
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit", "_killer"];

// Send event info to server
[QGVAR(serverEvent), [_unit, "BIS_KILLED"]] call CBA_fnc_serverEvent;

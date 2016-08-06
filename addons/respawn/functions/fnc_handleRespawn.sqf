/*
 * Author: nikolauska
 *
 * BIS respawn eventhandler
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit", "_corpse"];

// Send event info to server
[QGVAR(serverEvent), [_unit, "BIS_RESPAWN"]] call CBA_fnc_serverEvent;

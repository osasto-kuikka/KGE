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

#include "..\script_component.hpp"

if !(GVAR(active)) exitWith {};

params ["_unit", "_corpse"];

// Send event info to server
[QGVAR(serverEvent), [_unit, "BIS_RESPAWN"]] call cba_fnc_globalEvent;

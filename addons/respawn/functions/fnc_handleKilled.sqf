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

#include "..\script_component.hpp"

if !(GVAR(active)) exitWith {};

// Send event info to server
[QGVAR(serverEvent), [_unit, "BIS_KILLED"]] call cba_fnc_globalEvent;

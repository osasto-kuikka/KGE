/*
 * Author: nikolauska
 *
 * BIS killed and respawn eventhandlers
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_event);

if !(_event in ["init", "killed", "respawn"]) exitWith {ERROR(FORMAT_1("invalid eventhandler: %1"), _event])};

[QGVAR(serverEvent), [_unit, _event]] call cba_fnc_globalEvent;

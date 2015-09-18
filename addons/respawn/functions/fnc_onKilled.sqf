/*
 * Author: nikolauska
 *
 * On KGE killed
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_unit"];

// Publish information about player dying
["KGE_onKilled", [_unit]] call cba_fnc_globalEvent;

_unit setVariable ["KGE_alive", false, true];

_unit setPos ([_unit, "killed"] call FUNC(getMarkerPosition));
_unit hideObjectGlobal true;

GVAR(animationLock) = true;
call FUNC(animationLock);

/*
 * Author: nikolauska
 *
 * On KGE respawn
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_unit"];

// publish information about player respawning
["KGE_onRespawn", [_unit]] call cba_fnc_globalEvent;

_unit setVariable ["KGE_alive", true, true];

_unit setPos ([_unit, "respawn"] call FUNC(getMarkerPosition));
_unit hideObjectGlobal false;

GVAR(animationLock) = false;

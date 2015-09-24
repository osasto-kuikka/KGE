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

_unit allowDamage false;

_unit setPos ([_unit, "killed"] call FUNC(getMarkerPosition));
_unit hideObjectGlobal true;

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,classExists)) then {ace_hearing_disableVolumeUpdate = tru};
if (["acre_sys_radio"] call EFUNC(common,classExists)) then {[true] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,classExists)) then {
    [KGE_Player, true] call TFAR_fnc_forceSpectator;
    KGE_Player setVariable ["tf_unable_to_use_radio", true];
};

GVAR(animationLock) = true;
call FUNC(animationLock);

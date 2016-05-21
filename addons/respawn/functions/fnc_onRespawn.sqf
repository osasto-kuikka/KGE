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

#include "script_component.hpp"

params ["_unit", "_position"];

_unit setVariable [QGVAR(alive), true, true];

_unit allowDamage true;

_unit setPos _position;
_unit hideObjectGlobal false;

// Handle common addon audio
if (["ace_hearing"] call EFUNC(common,classExists)) then {ace_hearing_disableVolumeUpdate = false};
if (["acre_sys_radio"] call EFUNC(common,classExists)) then {[false] call acre_api_fnc_setSpectator};
if (["task_force_radio"] call EFUNC(common,classExists)) then {
    [KGE_Player, false] call TFAR_fnc_forceSpectator;
    KGE_Player setVariable ["tf_unable_to_use_radio", false];
};

GVAR(animationLock) = false;

// publish information about player respawning
[QGVAR(onRespawn), [_unit]] call AFUNC(common,globalEvent);

KGE_LOGINFO_1("%1 respawned",_unit);

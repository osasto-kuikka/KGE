/*
 * Author: nikolauska
 *
 * Saves module variables
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

if !(isServer) exitWith {};

params ["_logic", "_units", "_activated"];

// Activate KGE respawn, so server handles events
GVAR(active) = true;

GVAR(maxKilled) = [_logic, "amount"] call EFUNC(common,moduleSettings);

GVAR(respawn) set [0, [_logic, "respawn_west"] call EFUNC(common,moduleSettings)];
GVAR(respawn) set [1, [_logic, "respawn_east"] call EFUNC(common,moduleSettings)];
GVAR(respawn) set [2, [_logic, "respawn_independent"] call EFUNC(common,moduleSettings)];
GVAR(respawn) set [3, [_logic, "respawn_civilian"] call EFUNC(common,moduleSettings)];

GVAR(death) set [0, [_logic, "death_west"] call EFUNC(common,moduleSettings)];
GVAR(death) set [1, [_logic, "death_east"] call EFUNC(common,moduleSettings)];
GVAR(death) set [2, [_logic, "death_independent"] call EFUNC(common,moduleSettings)];
GVAR(death) set [3, [_logic, "death_civilian"] call EFUNC(common,moduleSettings)];

KGE_LOGINFO("Respawn Module Initialized.");

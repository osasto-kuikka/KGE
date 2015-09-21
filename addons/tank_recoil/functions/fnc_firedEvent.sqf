/*
 * Author: nikolauska
 *
 * Code run on vehicle fired event
 *
 * Argument:
 * 0: Vehicle (Object)
 * 1: Turret (String)
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_tank", "_usedGun"];

// Check if fired weapon is allowed for recoil
if !([GVAR(allowedTanks), typeOf (vehicle _tank)] call cba_fnc_hashGet isEqualTo _usedGun) exitWith {};

[_tank, _usedGun] call FUNC(addRecoil);
[_tank, _usedGun] call FUNC(addSmoke);

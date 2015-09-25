/*
 * Author: nikolauska
 *
 * Saves module variables and start ambient civilian cars
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

if !(isServer) exitWith {};

params ["_logic", "_units", "_activated"];

GVAR(active) = true;
publicVariable QGVAR(active);

GVAR(maxAmount) = [_logic, "amount"] call EFUNC(common,moduleSettings);

GVAR(minDist) = [_logic, "minDist"] call EFUNC(common,moduleSettings);
GVAR(maxDist) = [_logic, "maxDist"] call EFUNC(common,moduleSettings);

call FUNC(civLoop);
call FUNC(mainLoop);

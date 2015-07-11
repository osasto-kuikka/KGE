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

EXPLODE_3_PVT(_this,_logic,_units,_activated);

GVAR(maxKilled) = [_logic, "amount"] call EFUNC(common,moduleSettings);

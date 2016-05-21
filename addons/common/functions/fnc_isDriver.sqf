/*
 * Author: nikolauska
 *
 * Check if unit is driver of vehicle
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Boolean
 */
#include "script_component.hpp"

params [["_unit", objNull]];

if !(alive _unit) exitWith { false };

!(vehicle _unit isEqualTo _unit) &&
driver (vehicle _unit) isEqualTo _unit

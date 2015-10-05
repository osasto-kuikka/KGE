/*
 * Author: nikolauska
 *
 * Check if unit is commander of vehicle
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Boolean
 */
#include "..\script_component.hpp"

params [["_unit", objNull]];

if !(alive _unit) exitWith { false };

!(vehicle _unit isEqualTo _unit) &&
commander (vehicle _unit) isEqualTo _unit

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
#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

[_unit] call FUNC(isAlive) &&
{vehicle _unit isEqualTo _unit} &&
{commander (vehicle _unit) isEqualTo _unit}

/*
 * Author: nikolauska
 *
 * Check if unit is gunner of vehicle
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Boolean
 */

#include "script_component.hpp"

params [["_unit", objNull]];

[_unit] call FUNC(isAlive) &&
{vehicle _unit isEqualTo _unit} &&
{gunner (vehicle _unit) isEqualTo _unit}

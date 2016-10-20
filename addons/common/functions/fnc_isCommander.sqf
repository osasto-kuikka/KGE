/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Check if unit is commander of vehicle
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Is commander <BOOLEAN>
 */

#include "script_component.hpp"

this call CBA_fnc_vehicleRole == "commander"

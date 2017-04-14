/*
 * Author: nikolauska
 *
 * Check if unit is passenger in vehicle
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Boolean
 */

#include "script_component.hpp"

params [["_unit", objNull, [objNull]]];

([_unit] call FUNC(isAlive)) &&
{vehicle _unit isEqualTo _unit} &&
{!(_unit call kge_common_fnc_isDriver)} &&
{!(_unit call kge_common_fnc_isGunner)} &&
{!(_unit call kge_common_fnc_isCommander)}

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

#include "..\script_component.hpp"

params [["_unit", objNull]];

if !(_unit call FUNC(isAlive)) exitWith { false };

vehicle _unit != _unit &&
{!(_this call kge_common_fnc_isDriver)} &&
{!(_this call kge_common_fnc_isGunner)} &&
{!(_this call kge_common_fnc_isCommander)}

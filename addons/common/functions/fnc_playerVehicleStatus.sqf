/*
 * Author: nikolauska
 *
 * Returns information about in which position unit is in vehicle
 * -1 = not in vehicle
 * 0  = commander
 * 1  = driver
 * 2  = gunner
 * 3  = passenger
 *
 * Argument:
 * 0: Unit to
 *
 * Return value:
 * Number
 */

#include "script_component.hpp"

params [
  ["_unit", KGE_Player, [objNull]]
];

private _role = _unit call CBA_fnc_vehicleRole;

if(_role == "") exitWith {-1};
if(_role == "commander") exitWith {0};
if(_role == "driver") exitWith {1};
if(_role == "gunner") exitWith {2};
if(_role == "cargo") exitWith {3};

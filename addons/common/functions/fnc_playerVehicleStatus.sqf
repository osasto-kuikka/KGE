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

params [["_unit", KGE_Player, [objNull]]];

if((vehicle _unit) == _unit) exitWith {-1};
if(_unit call FUNC(isCommander)) exitWith {0};
if(_unit call FUNC(isDriver)) exitWith {1};
if(_unit call FUNC(isGunner)) exitWith {2};
if(_unit call FUNC(isPassenger)) exitWith {3};

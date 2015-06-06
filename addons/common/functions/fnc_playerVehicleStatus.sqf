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
 *
 * Return value:
 * Number
 */

if(vehicle _this == _this) exitWith {-1};
if(_this call FUNC(isCommander)) exitWith {0};
if(_this call FUNC(isDriver)) exitWith {1};
if(_this call FUNC(isGunner)) exitWith {2};
if(_this call FUNC(isPassenger)) exitWith {3};
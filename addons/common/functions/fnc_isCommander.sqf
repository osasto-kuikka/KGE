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

if(vehicle _this != _this) then {
	commander (vehicle _this) isEqualTo _this
} else {false}

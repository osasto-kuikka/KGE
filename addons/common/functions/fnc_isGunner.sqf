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

if(vehicle _this != _this) then {
	gunner (vehicle _this) isEqualTo _this
} else {false}
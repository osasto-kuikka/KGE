/*
 * Author: nikolauska
 *
 * Check if unit is driver of vehicle
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Boolean
 */

if(vehicle _this != _this) then {
    driver (vehicle _this) isEqualTo _this
} else {false}

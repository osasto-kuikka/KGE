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

if(vehicle _this != _this) then {
	!(_this call kge_common_fnc_isDriver) && {!(_this call kge_common_fnc_isGunner) && !(_this call kge_common_fnc_isCommander)}
} else {false}
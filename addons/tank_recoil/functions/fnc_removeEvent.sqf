/*
 * Author: nikolauska
 *
 * Remove fired event from vehicle
 *
 * Argument:
 * 0: Vehicle (Object)
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

if(!(vehicle _this) GETVAR_SYS(GVAR(firedEventAdded),false)) exitWith {};

(vehicle _this) GETVAR_SYS(GVAR(firedEventAdded),false);

(vehicle _this) removeEventHandler ["fired", (vehicle _this) GETVAR_SYS(GVAR(firedEvent),nil)];
(vehicle _this) GETVAR_SYS(GVAR(firedEvent),nil);
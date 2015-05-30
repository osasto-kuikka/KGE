/*
 * Author: nikolauska
 *
 * Get unit side
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * Side
 */

#include "script_component.hpp"

if !(_this call FUNC(isAlive)) then {side (group _this)} else {sideUnknown}

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

params [["_unit",objNull]];

if (!isNull _this) then {
    side (group _this)
} else {
    sideUnknown
};

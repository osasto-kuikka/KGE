/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Get unit side
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Side <SIDE>
 */

#include "script_component.hpp"

params [["_unit",objNull]];

if (!isNull _this) then {
    side (group _this)
} else {
    sideUnknown
};

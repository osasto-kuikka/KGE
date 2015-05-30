/*
 * Author: nikolauska
 *
 * Saves name of unit
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 *
 */

#include "script_component.hpp"

if (!isNull _this) exitWith {};

if (_this isKindOf "CAManBase") then {
    _this setVariable ["KGE_name", name _this, true];
};
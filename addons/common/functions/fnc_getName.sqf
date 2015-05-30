/*
 * Author: nikolauska
 *
 * Get unit saved name
 *
 * Argument:
 * 0: Unit (Object)
 *
 * Return value:
 * String
 */

#include "script_component.hpp"

if !(_this call FUNC(isAlive)) exitWith {""};

if (_this isKindOf "CAManBase") then {
	_this GETVAR_SYS(KGE_Name, "Unknown");
} else {
	getText (configFile >> "CfgVehicles" >> typeOf _this >> "displayName")
}
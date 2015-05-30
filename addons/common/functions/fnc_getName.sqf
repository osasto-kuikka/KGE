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

if (isNull _this) exitWith {"Unknown"};

if (_this isKindOf "CAManBase") then {
	if(isPlayer _this) then {
		_this getVariable ["KGE_name", "Undefined"]
	} else {
		name _this
	}
} else {
	getText (configFile >> "CfgVehicles" >> typeOf _this >> "displayName")
}
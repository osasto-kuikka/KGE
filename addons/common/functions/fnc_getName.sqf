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

#include "..\script_component.hpp"

params ["_unit"];

if !(alive _unit) exitWith {"Unknown"};

if (_unit isKindOf "CAManBase") then {
    if (isPlayer _unit) then {
        _unit getVariable ["KGE_name", "Undefined"];
    } else {
        name _unit;
    };
} else {
    getText (configFile >> "CfgVehicles" >> typeOf _unit >> "displayName");
};

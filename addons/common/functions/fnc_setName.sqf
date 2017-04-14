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

params [["_unit", objNull]];

if !(alive _unit) exitWith {};

if (_unit isKindOf "CAManBase") then {
    _unit setVariable ["KGE_name", name _unit, true];
};

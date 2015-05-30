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

PARAMS_1(_unit);

if (_unit call FUNC(isAlive)) exitWith {};

if (_unit isKindOf "CAManBase") then {
    _unit setVariable ["KGE_name", name _unit, true];
};
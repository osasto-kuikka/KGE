/*
 * Author: KoffeinFlummi, commy2
 *
 * Filters array and removes every element not fitting the condition
 *
 * Arguments:
 * 0: Array to be filtered.
 * 1: Code to be evaluated.
 *
 * Return Value:
 * Final array
 *
 * Usage:
 * [[0,1,2,3,4], {_x > 2}] call kge_common_fnc_filter ==> [3,4]
 */
#include "script_component.hpp"

params ["_array", "_code"];

if (isNil "_array") exitWith {
    KGE_LOGERROR("No array for function filter");
    []
};

_array select _code

/*
 * Author: KoffeinFlummi, commy2
 *
 * Applies given code to every element in an array, LIKE SOMETHING SQF SHOULD HAVE BY DEFAULT.
 *
 * Arguments:
 * 0: Array to be thingied.
 * 1: Code to be applied to every element.
 *
 * Return Value:
 * Final array
 *
 * Usage:
 * [["2", "gobblecock", "25"], {parseNumber _this}] call FUNC(map) ==> [2, 0, 25]
 */
#include "..\script_component.hpp"

private ["_array"];
params ["_arrayIn", "_code"];
_array = +_arrayIn;

if (isNil "_array") exitWith {
    diag_log text "[KGE] ERROR: No array for function map";
    []
};

{
    _array set [_forEachIndex, _x call _code];
} forEach _array;
_array

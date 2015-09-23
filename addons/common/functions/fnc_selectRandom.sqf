/*
 * Author: nikolauska
 *
 * Selects random value from array
 *
 * Argument:
 * 0: Array <ARRAY>
 *
 * Return value:
 * Selected item and index <ARRAY>
 */

#include "..\script_component.hpp"

params [
    ["_array", [], [[]]]
];

if(count _array == 0) exitWith {
    diag_log text "[KGE] Error: Array is empty!";
    [nil, -1];
};

private ["_index"];
_index = floor (random (count _array));

[_array select _index, _index]

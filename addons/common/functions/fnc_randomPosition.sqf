/*
 * Author: nikolauska
 *
 * Selects random position from area
 *
 * Argument:
 * 0: Center position <ARRAY>
 * 1: Radius <NUMBER>
 *
 * Return value:
 * Position <ARRAY>
 */

#include "..\script_component.hpp"

params [
    ["_pos", [], [[]], 3],
    ["_dist", 0, [0]]
];

if(count _pos == 0) exitWith {
    diag_log text "[KGE] Error: Invalid position array given";
    [0, 0, 0]
};

private ["_dir"];
_dir = random 360;



[(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, (_pos select 2)]

/*
 * Author: nikolauska
 *
 * Get nearest road from position
 *
 * Argument:
 * 0: Position <ARRAY>
 * 1: Radius <NUMBER>
 *
 * Return value:
 * Position <ARRAY>
 */

#include "..\script_component.hpp"

params ["_searchPos", "_radius"];
private ["_roadList"];

_roadList = _searchPos nearRoads _radius;

if(count _roadList == 0) exitWith {
    diag_log text format ["[KGE] No road found for position %1 within radius of %2", _searchPos, _radius];
    [];
};

getPosATL (_roadlist select 0)

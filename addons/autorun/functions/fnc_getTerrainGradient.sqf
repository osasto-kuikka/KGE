/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Get terrain gradient on unit location
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return:
 * Terraing gradient <NUMBER>
 */

#include "script_component.hpp"

params ["_unit"];

private _pos1 = getPosASL _unit;
private _dir = getDir _unit;
private _delta = 1;

private _pos2 = [_pos1, _delta, _dir] call BIS_fnc_relPos;
_pos1 = getTerrainHeightASL [_pos1 select 0, _pos1 select 1];
_pos2 = getTerrainHeightASL [_pos2 select 0, _pos2 select 1];

atan((_pos2 - _pos1)/_delta);

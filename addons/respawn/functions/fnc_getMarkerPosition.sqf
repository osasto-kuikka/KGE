/*
  * Author: nikolauska
  *
  * Get respawn position depending on player side
  *
  * Argument:
  *
  * Return value:
  * Action children array
  */

#include "script_component.hpp"

params ["_unit", "_type"];

private _side = _unit call EFUNC(common,getSide);

if(_type == "alive") exitWith {
    if(_side == west) exitWith {getMarkerPos (GVAR(respawn) select 0)};
    if(_side == east) exitWith {getMarkerPos (GVAR(respawn) select 1)};
    if(_side == independent) exitWith {getMarkerPos (GVAR(respawn) select 2)};
    if(_side == civilian) exitWith {getMarkerPos (GVAR(respawn) select 3)};
};

if(_type == "dead") exitWith {
    if(_side == west) exitWith {getMarkerPos (GVAR(death) select 0)};
    if(_side == east) exitWith {getMarkerPos (GVAR(death) select 1)};
    if(_side == independent) exitWith {getMarkerPos (GVAR(death) select 2)};
    if(_side == civilian) exitWith {getMarkerPos (GVAR(death) select 3)};
};

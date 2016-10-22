/*
 * Author: nikolauska
 *
 * Teleport unit to map position
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

cutText ["Select position to teleport by clicking position on map", "PLAIN"];

[QGVAR(mapClick), "onMapSingleClick", {
    cutText ["", "PLAIN"];
    GVAR(mapClickPos) = _pos;
}] call BIS_fnc_addStackedEventHandler;

[{
  [QGVAR(mapClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

  {
    if(alive _x && {_x getVariable [QEGVAR(respawn,alive), true]}) then {
      _x setPos GVAR(mapClickPos);

      private _respawnedIndex = GVAR(respawned) find _x;
      if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
    } else {
      private _respawnedIndex = GVAR(respawned) find _x;
      if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
    };
  } forEach (call cba_fnc_players);

  // Remove nils
  GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

  GVAR(mapClickPos) = nil;
}, [], {!(isNil QGVAR(mapClickPos))}] call EFUNC(common,waitUntil);

/*
 * Author: nikolauska
 *
 * Teleport unit to map position
 *
 * Argument:
 * 0: Unit to be teleported <Object>
 * 1: Position to teleport <Position> (Empty position start mapclick event)
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit"];

// Target is in vehicle so we have to use teleport to vehicle
if ((vehicle _unit) != _unit) exitWith {
  Hint "Player is currently in vehicle and cannot be teleported";
};

cutText ["Select position to teleport by clicking position on map", "PLAIN"];

[QGVAR(mapClick), "onMapSingleClick", {
  cutText ["", "PLAIN"];
  GVAR(mapClickPos) = _pos;
}] call BIS_fnc_addStackedEventHandler;

[{
  params ["_unit"];

  [QGVAR(mapClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

  [QGVAR(onTeleport), [], _target] call CBA_fnc_targetEvent;

  // If unit is in water
  // We need to change animation and teleport location height before teleporting
  if (surfaceIsWater (getPosASL _unit) && {!(surfaceIsWater GVAR(mapClickPos))}) then {
    _unit switchMove "AmovPercMstpSlowWrflDnon";
    GVAR(mapClickPos) set [2, (GVAR(mapClickPos) select 2) + 1];
  };

  if !((_unit call EFUNC(common,playerVehicleStatus)) in [-1, 3]) exitWith {
    Hint "You cannot teleport player who is in vehicle and is not passenger!";
  };

  [QGVAR(remoteTeleport), [_unit, GVAR(mapClickPos), KGE_Player], _unit] call CBA_fnc_targetEvent;

  Hint format ["%1 teleported to %2!", _unit call EFUNC(common,getName), GVAR(mapClickPos)];

  GVAR(mapClickPos) = nil;

  // Find teleported object and remove it from respawned array
  private _respawnedIndex = GVAR(respawned) find _unit;
  if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
  GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);
}, [_unit], {!(isNil QGVAR(mapClickPos))}] call EFUNC(common,waitUntil);

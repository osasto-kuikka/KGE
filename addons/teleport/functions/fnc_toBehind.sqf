/*
 * Author: nikolauska
 *
 * Teleport unit behind target unit
 *
 * Argument:
 * 0: Unit to be teleported <Object>
 * 1: Unit to teleport to <Object>
 *
 * Return value:
 *
 */

#include "script_component.hpp"

#define MINDISTANCE 2
#define MAXDISTANCE 10

params ["_unit", "_target"];

private _targetPos = (position _target) findEmptyPosition [MINDISTANCE, MAXDISTANCE, (typeof _target)];

if(count _targetPos == 0) exitWith {
  GVAR(target) = _target;
  [{
    params ["_unit", "_target"];
    [_unit, _target] call FUNC(toBehind);
  },[_unit, _target],
  {count ((position GVAR(target)) findEmptyPosition [MINDISTANCE, MAXDISTANCE, (typeof GVAR(target))]) != 0}, 1] call EFUNC(common,waitUntil);

  hint "No space nearby! Get to more open area for teleport!";
};

// If unit is in water
// We need to change animation and teleport location height before teleporting
if (surfaceIsWater (getPosASL _unit) && {!(surfaceIsWater _targetPos)}) then {
  _unit switchMove "AmovPercMstpSlowWrflDnon";
  _targetPos set [2, (_targetPos select 2) + 1];
};

if !((_unit call EFUNC(common,playerVehicleStatus)) in [-1, 3]) exitWith {
  Hint "You cannot teleport player who is in vehicle and is not passenger!";
};

[QGVAR(remoteTeleport), [_unit, _targetPos, KGE_Player], _unit] call CBA_fnc_targetEvent;

Hint format ["%1 teleported to your location!", _unit call EFUNC(common,getName)];

// Find teleported object and remove it from respawned array
private _respawnedIndex = GVAR(respawned) find _unit;
if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

#include "script_component.hpp"

// Add respawning players to respawned array
[QEGVAR(respawn,onRespawn), {
  params ["_unit"];

  GVAR(respawned) pushBack _unit;
}] call CBA_fnc_addEventHandler;

// Remove killed players from respawned array
[QEGVAR(respawn,onKilled), {
  params ["_unit"];

  private _respawnedIndex = GVAR(respawned) find _unit;
  if(_respawnedIndex != -1) then {
      GVAR(respawned) set [_respawnedIndex, nil];
  };

  // Remove nils
  GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);
}] call CBA_fnc_addEventHandler;

// When teleport
[QGVAR(remoteTeleport), {
  params ["_unit", "_position", "_teleporter"];

  [QGVAR(onTeleport), [_unit, _position]] call CBA_fnc_localEvent;

  if (typeName _position isEqualTo "ARRAY") exitWith {
    _unit setPos _position;
    hint format["You were teleported to %1 by %2", _position, name _teleporter];
  };
}] call CBA_fnc_addEventHandler;

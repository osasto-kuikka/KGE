/*
 * Author: nikolauska
 *
 * Select what type on teleport is needed
 *
 * Argument:
 * 0: Object to be teleported <Object>
 * 1: Vehicle to teleport to <Object>
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit", "_target"];

if((vehicle _target) emptyPositions "cargo" == 0) exitWith {

  // Wait until target has space on vehicle or steps out of vehicle
  GVAR(vehicle) = _target;
  [{
    params ["_unit", "_target"];

    // Target is out of vehicle so use teleport behind
    if ((vehicle _target) == _target) exitWith {
      [_unit, _target] call FUNC(toBehind);
    };

    [_unit, _target] call FUNC(toVehicle);
  },[_unit, _vehicle],
  {vehicle GVAR(vehicle) == GVAR(vehicle) || (GVAR(vehicle) emptyPositions "cargo") != 0}, 0.1] call EFUNC(common,waitUntil);

  hint "Vehicle is full! Player will be teleported when there is space in vehicle or when you step out of vehicle!";
};

if !((_unit call EFUNC(common,playerVehicleStatus)) in [-1, 3]) exitWith {
  Hint "You cannot teleport player who is in vehicle and is not passenger!";
};

_unit moveInCargo _target;

Hint format ["%1 teleported to your vehicle!", _unit call EFUNC(common,getName)];

[QGVAR(onTeleport), [], _target] call CBA_fnc_targetEvent;

/*
 * Author: nikolauska
 *
 * Select what type on teleport is needed
 *
 * Argument:
 * 0: Object to be teleported <Object>
 * 1: Where to be teleported <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_unit", "_target"];

// Target is in vehicle
if ((vehicle _target) != _target) exitWith {
    Hint "You need to get out of vehicle to teleport!";
};

// Unit is in vehicle
if ((vehicle _unit) != _unit) exitWith {
    Hint "Player is currently in vehicle and cannot be teleported!";
};

// Unit is in vehicle
if (surfaceIsWater (getPosASL _unit)) exitWith {
    Hint "Player is currently in water and cannot be teleported!";
};

["KGE_onTeleport", [_target]] call cba_fnc_whereLocalEvent;

[_unit, _target] call FUNC(toBehind);

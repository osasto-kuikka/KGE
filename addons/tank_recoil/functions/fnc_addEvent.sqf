/*
 * Author: nikolauska
 *
 * Adds fired event to vehicle if not already added
 *
 * Argument:
 * 0: Object
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params [["_unit", KGE_Player, [objNull]]];

private _vehicle = vehicle _unit;

// Check if fired event is already added or if vehicle is not defined
if !(isNil {_unit getVariable [QGVAR(firedEvent), nil]}) exitWith {};
if (isNil {GVAR(tankNamespace) getVariable (typeOf _vehicle)}) exitWith {};

// Save vehicle and fired event to firedEvent variable
_unit setvariable [
  QGVAR(firedEvent),
  [
    _vehicle,
    _vehicle addEventHandler ["Fired", {_this call FUNC(firedEvent)}]
  ]
];

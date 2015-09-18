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

#include "..\script_component.hpp"

params [["_unit", KGE_Player, [objNull]]];

private ["_vehicle"];
_vehicle = vehicle _unit;

if (!(_vehicle isKindOf "Tank") || !(isNil {_unit getVariable [QGVAR(firedEvent), nil]})) exitWith {};

_unit setvariable [QGVAR(firedEvent), [_vehicle, _vehicle addEventHandler ["Fired", {_this call FUNC(firedEvent)}]]];

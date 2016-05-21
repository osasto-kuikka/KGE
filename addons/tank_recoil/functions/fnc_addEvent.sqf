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

#include "\z\kge\addons\tank_recoil\script_component.hpp"

params [["_unit", KGE_Player, [objNull]]];

private _vehicle = vehicle _unit;

if !(isNil {_unit getVariable [QGVAR(firedEvent), nil]}) exitWith {};
if !(GVAR(tankNamespace) getVariable [typeOf _vehicle, ""] == "") exitWith {};

_unit setvariable [QGVAR(firedEvent), [_vehicle, _vehicle addEventHandler ["Fired", {_this call FUNC(firedEvent)}]]];

KGE_LOGINFO_1("Fired event added for %1",_vehicle);

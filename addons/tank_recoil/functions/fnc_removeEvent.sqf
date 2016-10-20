/*
 * Author: nikolauska
 *
 * Remove fired event from vehicle
 *
 * Argument:
 * 0: Vehicle (Object)
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params [["_unit", KGE_Player, [objNull]]];

private _var = _unit getVariable [QGVAR(firedEvent), nil];
if(isNil "_var") exitWith {};

_var params ["_vehicle", "_event"];
_vehicle removeEventHandler ["fired", _event];
_unit setVariable [QGVAR(firedEvent), nil];

/*
 * Author: SilentSpike
 * Read spectator settings from module
 *
 * Arguments:
 * 0: The module logic <LOGIC>
 * 1: units <ARRAY>
 * 2: activated <BOOL>
 *
 * Return Value:
 * None <NIL>
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

[_logic, QGVAR(filterUnits), "unitsFilter"] call AFUNC(common,readSettingFromModule);
[_logic, QGVAR(filterSides), "sidesFilter"] call AFUNC(common,readSettingFromModule);
[_logic, QGVAR(restrictModes), "cameraModes"] call AFUNC(common,readSettingFromModule);
[_logic, QGVAR(restrictVisions), "visionModes"] call AFUNC(common,readSettingFromModule);

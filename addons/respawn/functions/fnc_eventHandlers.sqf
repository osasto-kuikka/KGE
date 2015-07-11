/*
 * Author: nikolauska
 *
 * BIS killed and respawn eventhandlers
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_event);

if !(_event in ["bisInit", "bisKilled", "bisRespawn", "kgeRespawn", "kgeKilled"]) exitWith {ERROR(FORMAT_1("invalid eventhandler: %1",_event))};

[QGVAR(serverEvent), [_unit, _event]] call cba_fnc_globalEvent;

if(_event == "bisKilled") then {
    private ["_pos"];

    _pos = getPosATL _unit;
    if(surfaceIsWater _pos) then {_pos = getPosASL _unit};

    GVAR(killedPos) = _pos;
};

if(_event == "bisInit") then {
    private ["_pos"];

    _pos = getPosATL _unit;
    if(surfaceIsWater _pos) then {_pos = getPosASL _unit};

    GVAR(respawnPos) = _pos;
};

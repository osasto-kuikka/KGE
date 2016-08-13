#include "script_component.hpp"

// Add tank defines to tank namespace
{
    _x params ["_tank", "_weapon"];
    GVAR(tankNamespace) setVariable [_tank, _weapon];
} forEach GVAR(tankDefines);

["ace_playerVehicleChanged", {
    params ["_unit"];

    if(_unit call EFUNC(common,playerVehicleStatus) == 2) exitWith {
        _unit call FUNC(addEvent);
    };

    _unit call FUNC(removeEvent);
}] call CBA_fnc_addEventHandler;

KGE_LOGINFO("Tank Recoil Module Initialized.");

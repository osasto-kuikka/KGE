#include "script_component.hpp"

GVAR(allowedTanks) = [GVAR(allowedTanksPair), ""] call cba_fnc_hashCreate;

{
    _x params ["_tank", "_weapon"];
    GVAR(tankNamespace) setVariable [_tank,_weapon];
} forEach GVAR(tankDefines);

["ace_playerVehicleChanged", {
    params ["_unit"];

    if(_unit call FUNC(playerVehicleStatus) == 2) exitWith {
        _unit call FUNC(addEvent);
    };

    _unit call FUNC(removeEvent);
}] call CBA_fnc_addEventHandler;

KGE_LOGINFO("Tank Recoil Module Initialized.");

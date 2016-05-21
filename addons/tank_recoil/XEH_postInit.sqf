#include "script_component.hpp"

GVAR(allowedTanks) = [GVAR(allowedTanksPair), ""] call cba_fnc_hashCreate;

{
    _x params ["_tank", "_weapon"];
    GVAR(tankNamespace) setVariable [_tank,_weapon];
} forEach GVAR(tankDefines);

["playerVehicleChanged", {
    params ["_unit"];

    if(_unit call FUNC(playerVehicleStatus) == 2) exitWith {
        _unit call FUNC(addEvent);
    };

    _unit call FUNC(removeEvent);
}] call AFUNC(common,addEventHandler);

KGE_LOGINFO("Tank Recoil Module Initialized.");

#include "script_component.hpp"

GVAR(allowedTanks) = [GVAR(allowedTanksPair), ""] call cba_fnc_hashCreate;

["playerVehicleChanged", {
    params ["_unit"];

    if(_unit call EFUNC(common,vehicleStatus) == 2) exitWith {
        _unit call FUNC(addEvent);
    };

    _unit call FUNC(removeEvent);
}] call AFUNC(common,addEventHandler);

KGE_LOGINFO("Tank Recoil Module Initialized.");

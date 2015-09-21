#include "script_component.hpp"

GVAR(allowedTanks) = [GVAR(allowedTanksPair), ""] call cba_fnc_hashCreate;

["KGE_vehicleStatusChanged", {
    params ["_vehicleStatus"];

    if(_vehicleStatus == 2) exitWith {
        call FUNC(addEvent);
    };

    call FUNC(removeEvent);
}] call cba_fnc_addEventHandler;

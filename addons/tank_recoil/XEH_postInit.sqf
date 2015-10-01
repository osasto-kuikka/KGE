#include "script_component.hpp"

GVAR(allowedTanks) = [GVAR(allowedTanksPair), ""] call cba_fnc_hashCreate;

["vehicleStatusChanged", {
    params ["_vehicleStatus"];

    if(_vehicleStatus == 2) exitWith {
        call FUNC(addEvent);
    };

    call FUNC(removeEvent);
}] call AFUNC(common,addEventHandler);

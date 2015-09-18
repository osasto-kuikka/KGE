#include "script_component.hpp"

["KGE_vehicleStatusChanged", {
    params ["_vehicleStatus"];

    if(_vehicleStatus == 2) exitWith {
        call FUNC(addEvent);
    };

    call FUNC(removeEvent);
}] call cba_fnc_addEventHandler;

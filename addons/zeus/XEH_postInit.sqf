#include "script_component.hpp"

if(hasInterface) exitWith {
    ["KGE_adminChanged", {
        params ["_isAdmin"];

        if(_isAdmin) then {
            call FUNC(activateClient);
        };
    }] call cba_fnc_addEventHandler;
};

if(!isServer) exitWith {};

call FUNC(serverInit);

[QGVAR(activateEvent), {
    _this call FUNC(activateServer);
}] call cba_fnc_addEventHandler;

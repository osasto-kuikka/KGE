#include "script_component.hpp"

if(isServer) then {
    call FUNC(serverInit);

    [QGVAR(activateEvent), {
        _this call FUNC(activateServer);
    }] call cba_fnc_addEventHandler;
};

if(hasInterface) then {
    [{
        ["KGE_adminChanged", {
            params ["_isAdmin"];

            if(_isAdmin) then {
                call FUNC(activateClient);
            };
        }] call cba_fnc_addEventHandler;

        ["KGE_PlayerChanged", {
            params ["_newPlayer"];

            if(call EFUNC(common,isAdmin)) then {
                _newPlayer call FUNC(activateClient);
            };
        }] call cba_fnc_addEventHandler;

        if(call EFUNC(common,isAdmin)) then {
            call FUNC(activateClient);
        };
    }, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);
};

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

        [{
            if (!(KGE_Player call EFUNC(common,isAlive)) || !(call EFUNC(common,isAdmin))) exitWith {};
            KGE_Player call FUNC(activateClient);
        }, 60, []] call cba_fnc_addPerFrameHandler;

    }, [], {!(isNull KGE_Player)}] call EFUNC(common,waitUntil);
};

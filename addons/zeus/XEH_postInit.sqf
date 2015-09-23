#include "script_component.hpp"

if(isServer) then {
    call FUNC(serverInit);

    [QGVAR(activateEvent), {
        _this call FUNC(activateServer);
    }] call cba_fnc_addEventHandler;

    [{
        [objNull, false] call FUNC(activateServer);
    }, 10, []] call cba_fnc_addPerFrameHandler;
};

if(hasInterface) then {
    ["KGE_adminChanged", {
        [KGE_Player, false] call FUNC(activateClient);
    }] call cba_fnc_addEventHandler;

    ["KGE_PlayerChanged", {
        params ["_newPlayer"];

        [_newPlayer, true] call FUNC(activateClient);
    }] call cba_fnc_addEventHandler;

    [{
        [KGE_Player, true] call FUNC(activateClient);
    }, [], {!(isNull KGE_Player) && {getClientState == "BRIEFING READ"}}] call EFUNC(common,waitUntil);
};

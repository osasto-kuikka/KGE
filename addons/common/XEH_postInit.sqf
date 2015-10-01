#include "script_component.hpp"

if(hasInterface) then {
    KGE_Player call FUNC(setName);

    ["systemChatEvent", {
        params ["_msg"];
        systemChat _msg;
    }]  call AFUNC(common,addEventHandler);

    ["playerChanged", {
        params ["_newPlayer", "_oldPlayer"];
        KGE_Player = _newPlayer;
        KGE_PlayerOld = _oldPlayer;
    }] call AFUNC(common,addEventHandler);
};

call FUNC(checkFiles);

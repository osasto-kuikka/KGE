#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

if (hasInterface) then {
    KGE_Player = player;
    KGE_PlayerOld = player;

    [QGVAR(systemChatEvent), {
        params ["_msg"];
        systemChat _msg;
    }] call CBA_fnc_addEventHandler;

    ["ace_playerChanged", {
        params ["_newPlayer", "_oldPlayer"];
        KGE_Player = _newPlayer;
        KGE_PlayerOld = _oldPlayer;
    }] call CBA_fnc_addEventHandler;

    // Update player information
    [{
        // So player never turns to enemy side
        if(rating KGE_Player < 0) then {
            // Set rating to 0
            KGE_Player addRating (0 - (rating KGE_Player));
        };
    }, 1, [], 0.2] call cba_fnc_addPerFrameHandler;
};

ADDON = true;

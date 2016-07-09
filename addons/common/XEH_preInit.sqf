#include "script_component.hpp"

ADDON = false;

PREP(checkFiles);
PREP(classExists);
PREP(errorMessage);
PREP(filter);
PREP(getName);
PREP(getSide);
PREP(getSideNumber);
PREP(isAdmin);
PREP(isAlive);
PREP(isCommander);
PREP(isDriver);
PREP(isGunner);
PREP(isLeader);
PREP(isPassenger);
PREP(map);
PREP(moduleSettings);
PREP(player);
PREP(playerVehicleStatus);
PREP(sanitizeString);
PREP(setName);
PREP(waitUntil);

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

    GVAR(admin) = false;
    GVAR(ratingDisabled) = true;

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

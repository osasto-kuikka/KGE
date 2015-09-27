#include "script_component.hpp"

ADDON = false;

PREP(checkFiles);
PREP(classExists);
PREP(errorMessage);
PREP(filter);
PREP(fixHeadbug);
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

    GVAR(admin) = false;
    GVAR(vehicleStatus) = -1;
    GVAR(mapOpen) = false;
    GVAR(ratingDisabled) = true;

    // Update player information
    [{
        if !(KGE_Player isEqualTo (call FUNC(player))) then {
            private ["_oldPlayer"];

            _oldPlayer = KGE_Player;
            KGE_Player = call FUNC(player);

            SETUVAR(KGE_Player,KGE_Player);

            KGE_Player call FUNC(setName);

            ["KGE_PlayerChanged", [KGE_Player, _oldPlayer]] call cba_fnc_localEvent;
        };

        if !(GVAR(admin) isEqualTo (call FUNC(isAdmin))) then {
            GVAR(admin) = call FUNC(isAdmin);

            ["KGE_adminChanged", [GVAR(admin)]] call cba_fnc_localEvent;
        };

        if !(GVAR(vehicleStatus) isEqualTo (KGE_Player call FUNC(playerVehicleStatus))) then {
            GVAR(vehicleStatus) = KGE_Player call FUNC(playerVehicleStatus);

            ["KGE_vehicleStatusChanged", [GVAR(vehicleStatus)]] call cba_fnc_localEvent;
        };

        if !(GVAR(mapOpen) isEqualTo visibleMap) then {
            GVAR(mapOpen) = visibleMap;

            ["KGE_mapOpen", [GVAR(mapOpen)]] call cba_fnc_localEvent;
        };

        // So player never turns to enemy side
        if(GVAR(ratingDisabled) && {rating KGE_Player < 0}) then {
                // Set rating to 0
                KGE_Player addRating (0 - (rating KGE_Player));
        };
    }, 0, []] call cba_fnc_addPerFrameHandler;
};

ADDON = true;

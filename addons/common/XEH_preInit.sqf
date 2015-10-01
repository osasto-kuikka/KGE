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
    KGE_PlayerOld = player;

    GVAR(admin) = false;
    GVAR(vehicleStatus) = -1;
    GVAR(mapOpen) = false;
    GVAR(ratingDisabled) = true;

    // Update player information
    [{
        if !(GVAR(admin) isEqualTo (call FUNC(isAdmin))) then {
            GVAR(admin) = call FUNC(isAdmin);

            ["adminChanged", [GVAR(admin)]] call AFUNC(common,localEvent);
        };

        if !(GVAR(vehicleStatus) isEqualTo (KGE_Player call FUNC(playerVehicleStatus))) then {
            GVAR(vehicleStatus) = KGE_Player call FUNC(playerVehicleStatus);

            ["vehicleStatusChanged", [GVAR(vehicleStatus)]] call AFUNC(common,localEvent);
        };

        if !(GVAR(mapOpen) isEqualTo visibleMap) then {
            GVAR(mapOpen) = visibleMap;

            ["KGE_mapOpen", [GVAR(mapOpen)]] call AFUNC(common,localEvent);
        };

        // So player never turns to enemy side
        if(GVAR(ratingDisabled) && {rating KGE_Player < 0}) then {
                // Set rating to 0
                KGE_Player addRating (0 - (rating KGE_Player));
        };
    }, 0, []] call cba_fnc_addPerFrameHandler;
};

ADDON = true;

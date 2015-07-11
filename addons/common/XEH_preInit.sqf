#include "script_component.hpp"

ADDON = false;

PREP(classExists);
PREP(execDelayed);
PREP(fixHeadbug);
PREP(getName);
PREP(getSide);
PREP(getSideNumber);
PREP(isAdmin);
PREP(isAlive);
PREP(isCommander);
PREP(isDriver);
PREP(isGunner);
PREP(isPassenger);
PREP(listMenuClicked);
PREP(listMenuOpen);
PREP(moduleSettings);
PREP(player);
PREP(playerVehicleStatus);
PREP(setName);

KGE_player = player;

GVAR(admin) = false;
GVAR(vehicleStatus) = -1;

if (hasInterface) then {
    // Update player information
    [{
        if !(KGE_player isEqualTo (call FUNC(player))) then {
               _oldPlayer = KGE_player;
            KGE_player = call FUNC(player);

            SETUVAR(KGE_player,KGE_player);

            ["KGE_playerChanged", [KGE_Player, _oldPlayer]] call cba_fnc_localEvent;
        };

        if !(GVAR(admin) isEqualTo (call FUNC(isAdmin))) then {
            GVAR(admin) = call FUNC(isAdmin);

            ["KGE_adminChanged", [GVAR(admin)]] call cba_fnc_localEvent;
        };

        if !(GVAR(vehicleStatus) isEqualTo (KGE_player call FUNC(playerVehicleStatus))) then {
            GVAR(vehicleStatu) = call FUNC(playerVehicleStatus);

            ["KGE_vahicleStatusChanged", [GVAR(vehicleStatu)]] call cba_fnc_localEvent;
        };
    }, 0, []] call cba_fnc_addPerFrameHandler;
};

ADDON = true;

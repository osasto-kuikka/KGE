#include "script_component.hpp"

if(isServer) exitWith {
    [QGVAR(serverEvent), {_this call FUNC(serverRequest)}] call cba_fnc_addEventHandler;
};

// Server return event
[QGVAR(clientEvent), {_this call FUNC(serverAnswer)}] call cba_fnc_addEventHandler;

// Respawn and killed events for menu
[QGVAR(returnAliveEvent), {
    if(KGE_player GETVAR_SYS(GVAR(status),"") == "dead") then {
        [KGE_player,"kgeRespawn"] call FUNC(eventHandlers);
    };
}] call cba_fnc_addEventHandler;

[QGVAR(killEvent), {
    if(KGE_player GETVAR_SYS(GVAR(status),"") == "alive") then {
        [KGE_player,"kgeKilled"] call FUNC(eventHandlers);
    };
}] call cba_fnc_addEventHandler;

// Player position save for when player changes
["KGE_playerChanged", {
    EXPLODE_2_PVT(_this,_newPlayer,_oldPlayer);

    _pos = getPosATL _oldPlayer;
    if(surfaceIsWater _pos) then {_pos = getPosASL _oldPlayer};

    _pos set [2, 20];
    GVAR(killedPos) = _pos;
}] call cba_fnc_addEventHandler;


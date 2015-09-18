#include "script_component.hpp"

if(isServer) then {
    // Server request event
    [QGVAR(serverEvent), {_this call FUNC(serverEvent)}] call cba_fnc_addEventHandler;
};

if !(hasInterface) exitWith {};

// Server return event
[QGVAR(clientEvent), {_this call FUNC(clientEvent)}] call cba_fnc_addLocalEventHandler;

// When player gets out of briefing, check if player status is dead for reconnecting
[{
    // BIS event handlers
    KGE_Player addEventHandler ["respawn", {_this call FUNC(handleRespawn)}];

    [QGVAR(serverEvent), [KGE_player, "BIS_INIT"]] call cba_fnc_globalEvent;
}, [], {!(isNull KGE_player)}] call EFUNC(common,waitUntil);

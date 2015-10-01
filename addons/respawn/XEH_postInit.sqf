#include "script_component.hpp"

if(isServer) then {
    // Server request event
    [QGVAR(serverEvent), {_this call FUNC(serverEvent)}] call AFUNC(common,addEventHandler);
};

if !(hasInterface) exitWith {};

// Server return event
[QGVAR(clientEvent), {_this call FUNC(clientEvent)}] call AFUNC(common,addEventHandler);

// When player gets out of briefing, check if player status is dead for reconnecting
[{
    // BIS event handlers
    KGE_Player addEventHandler ["respawn", {_this call FUNC(handleRespawn)}];

    [QGVAR(serverEvent), [KGE_player, "BIS_INIT"]] call AFUNC(common,serverEvent);
}, [], {!(isNull KGE_player)}] call EFUNC(common,waitUntil);

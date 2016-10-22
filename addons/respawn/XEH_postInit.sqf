#include "script_component.hpp"

if(isServer) then {
  // Server request event
  [QGVAR(serverEvent), {_this call FUNC(serverEvent)}] call CBA_fnc_addEventHandler;
};

if !(hasInterface) exitWith {};

// Server return event
[QGVAR(clientEvent), {_this call FUNC(clientEvent)}] call CBA_fnc_addEventHandler;

// When player gets out of briefing, check if player status is dead for reconnecting
[{!(isNull KGE_Player)},
{
  // BIS event handlers
  KGE_Player addEventHandler ["respawn", {_this call FUNC(handleRespawn)}];

  [QGVAR(serverEvent), [KGE_player, "BIS_INIT"]] call CBA_fnc_serverEvent;
}, []] call CBA_fnc_waitUntilAndExecute;

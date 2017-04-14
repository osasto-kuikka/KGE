#include "script_component.hpp"

if(isServer) then {
	// Server request event
	[QGVAR(serverEvent), {_this call FUNC(serverEvent)}] call CBA_fnc_addEventHandler;
};

if !(hasInterface) exitWith {};

// Server return event
[QGVAR(clientEvent), {_this call FUNC(clientEvent)}] call CBA_fnc_addEventHandler;

// When player gets out of briefing, check if player status is dead for reconnecting
[{!(isNull KGE_Player)}, {
	// BIS event handlers
	KGE_Player addEventHandler ["respawn", {_this call FUNC(handleRespawn)}];

	[QGVAR(serverEvent), [KGE_player, "BIS_INIT"]] call CBA_fnc_serverEvent;
}, []] call CBA_fnc_waitUntilAndExecute;

/*
GVAR(active) = if(!isNil QGVAR(active_eden)) then { GVAR(active_eden) } else { if(isNil QGVAR(active)) then { nil } else { GVAR(active) } };
GVAR(maxKilled) = if(!isNil QGVAR(max_killed_eden)) then { GVAR(max_killed_eden) } else { GVAR(maxKilled) };

GVAR(respawn) set [0, if(!isNil QGVAR(respawn_west_eden)) then { GVAR(respawn_west_eden) } else { GVAR(respawn) select 0 } ];
GVAR(respawn) set [1, if(!isNil QGVAR(respawn_east_eden)) then { GVAR(respawn_east_eden) } else { GVAR(respawn) select 1 } ];
GVAR(respawn) set [2, if(!isNil QGVAR(respawn_independent_eden)) then { GVAR(respawn_independent_eden) } else { GVAR(respawn) select 2 } ];
GVAR(respawn) set [3, if(!isNil QGVAR(respawn_civilian_eden)) then { GVAR(respawn_civilian_eden) } else { GVAR(respawn) select 3 } ];

GVAR(death) set [0, if(!isNil QGVAR(death_west_eden)) then { GVAR(death_west_eden) } else { GVAR(death) select 0 } ];
GVAR(death) set [1, if(!isNil QGVAR(death_east_eden)) then { GVAR(death_east_eden) } else { GVAR(death) select 1 } ];
GVAR(death) set [2, if(!isNil QGVAR(death_independent_eden)) then { GVAR(death_independent_eden) } else { GVAR(death) select 2 } ];
GVAR(death) set [3, if(!isNil QGVAR(death_civilian_eden)) then { GVAR(death_civilian_eden) } else { GVAR(death) select 3 } ];
*/

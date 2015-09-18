/*
 * Author: nikolauska
 *
 * Respawn all dead players
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

{
    if !(_x getVariable ["KGE_alive", true]) then {
        [QGVAR(serverEvent), [_x, "KGE_RESPAWN"]] call cba_fnc_globalEvent;
    };
} forEach (call cba_fnc_players);

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

#include "script_component.hpp"

{
    if (!(alive _x) || !(_x getVariable [QEGVAR(respawn,alive), true])) then {
        [QGVAR(serverEvent), [_x, "KGE_RESPAWN"]] call CBA_fnc_serverEvent;
    };
} forEach (call cba_fnc_players);

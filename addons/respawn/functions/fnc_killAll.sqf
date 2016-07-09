/*
 * Author: nikolauska
 *
 * Kill all alive players
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

{
    if (_x getVariable [QEGVAR(respawn,alive), true]) then {
        [QGVAR(serverEvent), [_x, "KGE_KILL"]] call CBA_fnc_serverEvent;
    };
} forEach (call cba_fnc_players);

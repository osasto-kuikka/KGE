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

private ["_deadArray"];
_deadArray = [];
{
    if !(_x getVariable ["KGE_alive", true]) then {
        _deadArray pushBack _x;
    };
} forEach (call cba_fnc_players);

_deadArray

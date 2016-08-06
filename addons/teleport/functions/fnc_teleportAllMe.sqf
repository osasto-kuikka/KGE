/*
 * Author: nikolauska
 *
 * Teleport unit to map position
 *
 * Argument:
 * 0: Unit to be teleported <Object>
 * 1: Position to teleport <Position> (Empty position start mapclick event)
 *
 * Return value:
 *
 */

#include "script_component.hpp"

private _inVehicle = 0;
{
    if(!local _x && {alive _x || _x getVariable [QEGVAR(respawn,alive), true]}) then {
        [_x, KGE_Player] call FUNC(toBehind);

        private _respawnedIndex = GVAR(respawned) find _x;
        if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
    } else {
        private _respawnedIndex = GVAR(respawned) find _x;
        if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
    };
} forEach (call cba_fnc_players);

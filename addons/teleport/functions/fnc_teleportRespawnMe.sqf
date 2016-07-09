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

{
    if(!local _x && {alive _x || _x getVariable [QEGVAR(respawn,alive), true]} && {(_x call EFUNC(common,playerVehicleStatus)) in [-1, 3]}) then {
        [_x, KGE_Player] call FUNC(toBehind);
    };

    GVAR(respawned) set [_forEachIndex, nil];
} forEach GVAR(respawned);

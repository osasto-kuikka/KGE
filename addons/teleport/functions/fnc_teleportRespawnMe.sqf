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

#include "..\script_component.hpp"

private _inVehicle = 0;
{
    if(!local _x && {alive _x || _x getVariable [QEGVAR(respawn,alive), true]}) then {
        if(((vehicle _x) == _x) && {!(surfaceIsWater (getPosASL _x))}) then {
            [_x, KGE_Player] call FUNC(toBehind);

            GVAR(respawned) set [_forEachIndex, nil];
        } else {
            INC(_inVehicle);
        };
    } else {
        GVAR(respawned) set [_forEachIndex, nil];
    };
} forEach GVAR(respawned);


if(_inVehicle != 0) then {
    Hint "Some players were in vehicle or in water and were not teleported";
};

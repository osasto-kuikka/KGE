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

private ["_inVehicle"];
_inVehicle = 0;

{
    if(!local _x && {alive _x || _x getVariable [QEGVAR(respawn,alive), true]}) then {
        if(((vehicle _x) == _x) && {!(surfaceIsWater (getPosASL _x))}) then {
            [_x, GVAR(player)] call FUNC(toBehind);

            _respawnedIndex = GVAR(respawned) find _x;
            if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
        } else {
            INC(_inVehicle);
        };
    } else {
        _respawnedIndex = GVAR(respawned) find _x;
        if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
    };
} forEach (call cba_fnc_players);

if(_inVehicle != 0) then {
    Hint "Some players were in vehicle or in water and were not teleported";
};

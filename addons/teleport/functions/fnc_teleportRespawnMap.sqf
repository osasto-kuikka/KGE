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

cutText ["Select position to teleport by clicking position on map", "PLAIN"];

[QGVAR(mapClick), "onMapSingleClick", {
    cutText ["", "PLAIN"];
    GVAR(mapClickPos) = _pos;
}] call BIS_fnc_addStackedEventHandler;

[{
    [QGVAR(mapClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

    {
        if(alive _x && {_x getVariable [QEGVAR(respawn,alive), true]} && {(_x call EFUNC(common,playerVehicleStatus)) in [-1, 3]}) then {
            [QGVAR(remoteTeleport), [_x, GVAR(mapClickPos), KGE_Player], _x] call CBA_fnc_targetEvent;
        };

        GVAR(respawned) set [_forEachIndex, nil];
    } forEach GVAR(respawned);

    // Remove nils
    GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

    GVAR(mapClickPos) = nil;

}, [], {!(isNil QGVAR(mapClickPos))}] call EFUNC(common,waitUntil);

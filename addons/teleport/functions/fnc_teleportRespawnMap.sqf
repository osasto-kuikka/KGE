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

cutText ["Select position to teleport by clicking position on map", "PLAIN"];

[QGVAR(mapClick), "onMapSingleClick", {
    cutText ["", "PLAIN"];
    GVAR(mapClickPos) = _pos;
}] call BIS_fnc_addStackedEventHandler;

[{
    [QGVAR(mapClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

    private ["_inVehicle"];
    _inVehicle = 0;

    {
        if(alive _x && {_x getVariable [QEGVAR(respawn,alive), true]}) then {
            if(((vehicle _x) == _x) && {!(surfaceIsWater (getPosASL _x))}) then {
                _x setPos GVAR(mapClickPos);

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

    // Remove nils
    GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

    GVAR(mapClickPos) = nil;

}, [], {!(isNil QGVAR(mapClickPos))}] call EFUNC(common,waitUntil);

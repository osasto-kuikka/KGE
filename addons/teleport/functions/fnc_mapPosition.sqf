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

params ["_unit"];

// Target is in vehicle so we have to use teleport to vehicle
if ((vehicle _unit) != _unit) exitWith {
    Hint "Player is currently in vehicle and cannot be teleported";
};

cutText ["Select position to teleport by clicking position on map", "PLAIN"];

[QGVAR(mapClick), "onMapSingleClick", {
    cutText ["", "PLAIN"];
    GVAR(mapClickPos) = _pos;
}] call BIS_fnc_addStackedEventHandler;

[{
    params ["_unit"];

    [QGVAR(mapClick), "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

    [QGVAR(onTeleport), _target, []] call AFUNC(common,targetEvent);

    _unit setPos GVAR(mapClickPos);

    GVAR(mapClickPos) = nil;

    // Find teleported object and remove it from respawned array
    _respawnedIndex = GVAR(respawned) find _unit;
    if(_respawnedIndex != -1) then {GVAR(respawned) set [_respawnedIndex, nil]};
    GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);

}, [_unit], {!(isNil QGVAR(mapClickPos))}] call EFUNC(common,waitUntil);

#include "script_component.hpp"

// Add respawning players to respawned array
[QEGVAR(respawn,onRespawn), {
    params ["_unit"];

    GVAR(respawned) pushBack _unit;
}] call AFUNC(common,addEventHandler);

// Remove killed players from respawned array
[QEGVAR(respawn,onKilled), {
    params ["_unit"];
    private ["_respawnedIndex"];

    _respawnedIndex = GVAR(respawned) find _unit;
    if(_respawnedIndex != -1) then {
        GVAR(respawned) set [_respawnedIndex, nil];
    };

    // Remove nils
    GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);
}] call AFUNC(common,addEventHandler);

// When teleport
[QGVAR(remoteTeleport), {
    params ["_unit", "_position"];

    if (typeName _position isEqualTo "ARRAY") exitWith {
        _unit setPos _position;
    };

    _unit moveincargo (vehicle _position);
}] call AFUNC(common,addEventHandler);

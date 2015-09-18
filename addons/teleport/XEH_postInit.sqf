#include "script_component.hpp"

// Add respawning players to respawned array
["KGE_onRespawn", {
    params ["_unit"];

    GVAR(respawned) pushBack _unit;
}] call cba_fnc_addEventHandler;

// Remove killed players from respawned array
["KGE_onKilled", {
    params ["_unit"];
    private ["_respawnedIndex"];

    _respawnedIndex = GVAR(respawned) find _unit;
    if(_respawnedIndex != -1) then {
        GVAR(respawned) set [_respawnedIndex, nil];
    };

    // Remove nils
    GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);
}] call cba_fnc_addEventHandler;

// Change player
["KGE_PlayerChanged", {
    params ["_newPlayer", "_oldPlayer"];

    GVAR(player) = _newPlayer;
}] call cba_fnc_addEventHandler;

// When teleport
[QGVAR(remoteTeleport), {
    params ["_unit", "_position"];

    if (typeName _position isEqualTo "ARRAY") exitWith {
        _unit setPos _position;
    };

    _unit moveincargo (vehicle _position);
}] call cba_fnc_addLocalEventHandler;

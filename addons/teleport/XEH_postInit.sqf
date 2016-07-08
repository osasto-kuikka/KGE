#include "script_component.hpp"

// Add respawning players to respawned array
[QEGVAR(respawn,onRespawn), {
    params ["_unit"];

    GVAR(respawned) pushBack _unit;

    KGE_LOGINFO_1("%1 added to respawned array",_unit);
}] call CBA_fnc_addEventHandler;

// Remove killed players from respawned array
[QEGVAR(respawn,onKilled), {
    params ["_unit"];

    private _respawnedIndex = GVAR(respawned) find _unit;
    if(_respawnedIndex != -1) then {
        GVAR(respawned) set [_respawnedIndex, nil];

        KGE_LOGINFO_1("%1 removed from respawned array",_unit);
    };

    // Remove nils
    GVAR(respawned) = GVAR(respawned) arrayIntersect GVAR(respawned);
}] call CBA_fnc_addEventHandler;

// When teleport
[QGVAR(remoteTeleport), {
    params ["_unit", "_position"];

    KGE_LOGINFO_2("%1 teleported to %2",_unit,_position);

    ["onTeleport", [_unit, _position]] call CBA_fnc_localEvent; 

    if (typeName _position isEqualTo "ARRAY") exitWith {
        _unit setPos _position;
    };

    _unit moveincargo (vehicle _position);
}] call CBA_fnc_addEventHandler;

KGE_LOGINFO("Teleport Module Initialized.");

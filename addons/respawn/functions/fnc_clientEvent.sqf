/*
 * Author: nikolauska
 *
 * Handles server request events
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit", "_event", "_status", "_position"];

switch(_event) do {
        case "BIS_INIT": {
            // If server returned event, it means KGE respawn is active
            GVAR(active) = true;

            if(_status isEqualTo "dead") then {
                // Kill player
                [_unit, _position] call FUNC(onKilled);
            };
        };
        case "BIS_RESPAWN": {
            if(_status isEqualTo "dead") exitWith {
                // Kill player
                [_unit, _position] call FUNC(onKilled);
            };

            if(_status isEqualTo "alive") exitWith {
                // Respawn player
                [_unit, _position] call FUNC(onRespawn);
            };
        };

        // Force respawn
        case "KGE_RESPAWN": {
            // Respawn player
            [_unit, _position] call FUNC(onRespawn);
        };

        // Force respawn
        case "KGE_KILL": {
            // Kill player
            [_unit, _position] call FUNC(onKilled);
        };
};

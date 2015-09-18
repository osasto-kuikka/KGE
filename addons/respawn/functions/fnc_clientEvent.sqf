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

#include "..\script_component.hpp"

params ["_unit", "_event", "_status"];

switch(_event) do {
        case "BIS_INIT": {
            if(_status isEqualTo "death") then {
                // Kill player
                _unit call FUNC(onKilled);
            };
        };
        case "BIS_RESPAWN": {
            if(_status isEqualTo "death") exitWith {
                // Kill player
                _unit call FUNC(onKilled);
            };

            if(_status isEqualTo "alive") exitWith {
                // Respawn player
                _unit call FUNC(onRespawn);
            };
        };

        // Force respawn
        case "KGE_RESPAWN": {
            // Respawn player
            _unit call FUNC(onRespawn);
        };
};

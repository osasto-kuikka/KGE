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

EXPLODE_2_PVT(_this,_unit,_event);

if(isNil QGVAR(savedStatus)) then {
    GVAR(savedStatus) = [];
};

private ["_name"];
_name = _unit call EFUNC(common,getName);

switch (_event) do {
    // Player initialization
    case "bisInit": {
        private ["_exists"];
        _exists = false;
        {
            EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

            // if found save info to unit and return info to player
            if(_savedName isEqualTo _name) exitWith {
                _exists = true;
                _unit SETPVAR_SYS(GVAR(status),_savedStatus);
                [QGVAR(clientEvent), [_unit, _savedStatus]] call cba_fnc_whereLocalEvent;
            };
            true
        } count GVAR(savedStatus);

        // if not found save info to unit and add it to array
        if(!_exists) then {
            _unit SETPVAR_SYS(GVAR(status),"alive");
            GVAR(savedStatus) pushBack [_name, 0, "alive"];
            [QGVAR(clientEvent), [_unit, "alive"]] call cba_fnc_whereLocalEvent;
        };
    };

    // Player killed
    case "bisKilled": {
        private ["_savedIndex", "_newSavedArray"];
        _savedIndex = -1;
        _newSavedArray = [];
        {
            EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

            // If found add 1 death to unit
            if(_savedName isEqualTo _name) exitWith {
                _savedIndex = _forEachIndex;
                INC(_savedKilled);

                // check if deathcount is greater than max killed amount and set status to dead
                if(_savedKilled >= GVAR(maxKilled)) then {
                    _savedStatus = "dead";
                };

                // Save array info to set later
                _newSavedArray = [_savedName, _savedKilled, _savedStatus];
            };
        } forEach GVAR(savedStatus);

        if(_savedIndex != -1) then {
            GVAR(savedStatus) set [_savedIndex, _newSavedArray];
        }
    };

    // Player respawned
    case "bisRespawn": {
        {
            EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

            // Send player info back to player
            if(_savedName isEqualTo _name) exitWith {
                _unit SETPVAR_SYS(GVAR(status),_savedStatus);
                [QGVAR(clientEvent), [_unit, _savedStatus]] call cba_fnc_whereLocalEvent;
            };
        } forEach GVAR(savedStatus);
    };

    // Force killed
    case "kgeKilled": {
        private ["_savedIndex", "_newSavedArray"];
        _savedIndex = -1;
        _newSavedArray = [];
        {
            EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

            // save index and array
            if(_savedName isEqualTo _name) exitWith {
                _savedIndex = _forEachIndex;
                _newSavedArray = [_savedName, _savedKilled, "dead"];
            };
        } forEach GVAR(savedStatus);

        // Force kill unit
        _unit setDamage 1;

        // Set status to array and send info back to player
        GVAR(savedStatus) set [_savedIndex, _newSavedArray];
        _unit SETPVAR_SYS(GVAR(status),"dead");
        [QGVAR(clientEvent), [_unit, "dead"]] call cba_fnc_whereLocalEvent;
    };

    // Force respawn
    case "kgeRespawn": {
        private ["_savedIndex", "_newSavedArray"];
        _savedIndex = -1;
        _newSavedArray = [];
        {
            EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

            // save index and array
            if(_savedName isEqualTo _name) exitWith {
                _savedIndex = _forEachIndex;
                _newSavedArray = [_savedName, _savedKilled, "alive"];
            };
        } forEach GVAR(savedStatus);

        // Set status to array and send info back to player
        GVAR(savedStatus) set [_savedIndex, _newSavedArray];
        _unit SETPVAR_SYS(GVAR(status),"alive");
        [QGVAR(clientEvent), [_unit, "respawn"]] call cba_fnc_whereLocalEvent;
    };
};

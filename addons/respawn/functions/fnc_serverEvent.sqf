/*
 * Author: nikolauska
 *
 * Handles server answer
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_unit", "_event"];

// KGE respawn is not active so don't handle events
if (!GVAR(active)) exitWith {};

private _unitName = _unit call EFUNC(common,getName);

switch(_event) do {
        case "BIS_INIT": {
            private _found = false;
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    _found = true;
                    private _position = [_unit, _status] call FUNC(getMarkerPosition);
                    [QGVAR(clientEvent), [_unit, _event, _status, _position], _unit] call CBA_fnc_targetEvent;
                };
            } forEach GVAR(playerList);

            if !(_found) then {
                private _status = "alive";
                private _position = [_unit, _status] call FUNC(getMarkerPosition);
                GVAR(playerList) pushBack [_unitName, _status, 0];
                [QGVAR(clientEvent), [_unit, _event, _status, _position], _unit] call CBA_fnc_targetEvent;
            };
        };

        case "BIS_RESPAWN": {
            // Don change status due to unlimited deaths
            if(GVAR(maxKilled) isEqualTo -1) exitWith {};

            private _found = false;
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    INC(_killedAmount);

                    _found = true;

                    if(_killedAmount > GVAR(maxKilled)) then {
                        _status = "dead";
                        GVAR(playerList) set [_forEachIndex, [_name, _status, _killedAmount]];
                    };

                    private _position = [_unit, _status] call FUNC(getMarkerPosition);
                    [QGVAR(clientEvent), [_unit, _event, _status, _position], _unit] call CBA_fnc_targetEvent;
                };
            } forEach GVAR(playerList);

            if !(_found) then {
                private _status = "alive";
                if(GVAR(maxKilled) == 0) then { _status = "dead" };
                private _position = [_unit, _status] call FUNC(getMarkerPosition);
                GVAR(playerList) pushBack [_unitName, _status, 1];
                [QGVAR(clientEvent), [_unit, _event, _status, _position], _unit] call CBA_fnc_targetEvent;
            };
        };

        // Force respawn
        case "KGE_RESPAWN": {
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    _status = "alive";
                    GVAR(playerList) set [_forEachIndex, [_name, _status, _killedAmount]];

                    private _position = [_unit, _status] call FUNC(getMarkerPosition);
                    [QGVAR(clientEvent), [_unit, _event, _status, _position], _unit] call CBA_fnc_targetEvent;
                };
            } forEach GVAR(playerList);
        };

        // Force dead
        case "KGE_KILL": {
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    _status = "dead";
                    GVAR(playerList) set [_forEachIndex, [_name, _status, _killedAmount]];

                    private _position = [_unit, _status] call FUNC(getMarkerPosition);
                    [QGVAR(clientEvent), [_unit, _event, _status, _position], _unit] call CBA_fnc_targetEvent;
                };
            } forEach GVAR(playerList);
        };
};

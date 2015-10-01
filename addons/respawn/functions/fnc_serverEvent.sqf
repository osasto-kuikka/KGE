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

#include "..\script_component.hpp"

params ["_unit", "_event"];
private ["_unitName"];

_unitName = _unit call EFUNC(common,getName);

switch(_event) do {
        case "BIS_INIT": {
            _found = false;
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    _found = true;

                    [QGVAR(clientEvent), _unit, [_unit, _event, _status]] call AFUNC(common,targetEvent);
                };
            } forEach GVAR(playerList);

            if !(_found) then {
                GVAR(playerList) pushBack [_unitName, "alive", 0];
                [QGVAR(clientEvent), _unit, [_unit, _event, "alive"]] call AFUNC(common,targetEvent);
            };
        };
        case "BIS_KILLED": {
            // Don change status due to unlimited deaths
            if(GVAR(maxKilled) isEqualTo -1) exitWith {};

            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    INC(_killedAmount);

                    if(_killedAmount > GVAR(maxKilled)) then {
                        _status = "death";
                        GVAR(playerList) set [_forEachIndex, [_name, _status, _killedAmount]];
                    };
                };
            } forEach GVAR(playerList);
        };

        case "BIS_RESPAWN": {
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    INC(_killedAmount);

                    if(GVAR(maxKilled) != -1 && {_killedAmount > GVAR(maxKilled)}) then {
                        _status = "death";
                        GVAR(playerList) set [_forEachIndex, [_name, _status, _killedAmount]];
                    };

                    [QGVAR(clientEvent), _unit, [_unit, _event, _status]] call AFUNC(common,targetEvent);
                };
            } forEach GVAR(playerList);
        };

        // Force respawn
        case "KGE_RESPAWN": {
            {
                _x params ["_name","_status", "_killedAmount"];

                if(_unitName isEqualTo _name) exitWith {
                    _status = "alive";
                    GVAR(playerList) set [_forEachIndex, [_name, _status, _killedAmount]];
                    [QGVAR(clientEvent), _unit, [_unit, _event, _status]] call AFUNC(common,targetEvent);
                };
            } forEach GVAR(playerList);
        };
};

/*
 * Author: nikolauska
 *
 * Regular waypoint and distance checks
 *
 * Argument:
 * 0: Vehicle <OBJECT>
 *
 * Return value:
 * perFrameHandler
 */

#include "..\script_component.hpp"

params ["_civ", "_car"];

[{
    (_this select 0) params ["_civ", "_car"];
    private ["_carPos", "_movePos", "_pos"];

    _carPos = getPosATL _car;
    _movePos = _civ getVariable [QGVAR(movePos), _carPos];

    if((_carPos distance2D _movePos) < 100) exitWith {
        _pos = [(getPosATL _car), 5500] call EFUNC(common,randomPosition);
        _civ setVariable [QGVAR(movePos), _pos];
        _civ setDestination [_pos, "LEADER PLANNED", true];
    };

    if({(_x distance2D _car) < GVAR(minDist)} count (call cba_fnc_players) != 0) then {
        _pos = [(getPosATL _car), 5500] call EFUNC(common,randomPosition);
        _civ setVariable [QGVAR(movePos), _pos];
        _civ setDestination [_pos, "LEADER PLANNED", true];
    };

    if({(_x distance2D _car) < GVAR(maxDist)} count (call cba_fnc_players) != 0) exitWith {};

    deleteVehicle _car;
    deleteVehicle _civ;

    DEC(GVAR(currentAmount));

    [(_this select 1)] call cba_fnc_removePerFrameHandler;

}, 2, [_civ, _car]] call cba_fnc_addPerFrameHandler;

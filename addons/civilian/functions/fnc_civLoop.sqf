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

[{
    if(count GVAR(spawned) == 0) exitWith {};
    if(GVAR(iterator) >= count GVAR(spawned)) then {GVAR(iterator) = 0};

    // Select handled _civ and _car from list
    (GVAR(spawned) select GVAR(iterator)) params ["_civ", "_lastPos"];
    INC(GVAR(iterator));

    private ["_carPos", "_movePos", "_pos"];
    _carPos = position _civ;
    _movePos = _civ getVariable [QGVAR(movePos), _carPos];
    _lastPos = _civ getVariable [QGVAR(lastPos), _carPos];

    _civ setVariable [QGVAR(lastPos), _carPos];

    if((_carPos distance2D _movePos) < 100) exitWith {
        _pos = [(position _civ), GVAR(minDist)] call EFUNC(common,randomPosition);
        _pos = [_pos, 250] call FUNC(getRoad);

        if(count _pos != 0) then {
            _civ setVariable [QGVAR(movePos), _pos];
            _civ forceSpeed (_civ getSpeed "FAST");
            _civ setDestination [_pos, "LEADER PLANNED", true];
        };
    };

    if(_lastPos isEqualTo _carPos || {(_x distance _civ) < GVAR(maxDist)} count (call cba_fnc_players) == 0) exitWith {
        GVAR(spawned) = GVAR(spawned) - [_civ, _carPos];
        DEC(GVAR(iterator));

        // Empty vehicle cargo
        if("ace_cargo" call EFUNC(common,classExists)) then {
            [(vehicle _civ)] call ace_cargo_fnc_handleDestroyed;
        };

        deleteVehicle (vehicle _civ);
        deleteVehicle _civ;
    };

}, 0.2, []] call cba_fnc_addPerFrameHandler;

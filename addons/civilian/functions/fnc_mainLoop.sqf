/*
 * Author: nikolauska
 *
 *
 *
 * Argument:
 * 0: Position <ARRAY>
 * 1: Radius <NUMBER>
 *
 * Return value:
 * Position <ARRAY>
 */

#include "..\script_component.hpp"

[{
    if(GVAR(currentAmount) >= GVAR(maxAmount)) exitWith {};
    private ["_players", "_player", "_pos", "_spawnPos"];
    _players = call cba_fnc_players;
    _player = ([_players] call EFUNC(common,selectRandom)) select 0;

    if(isNil "_player") exitWith {
            diag_log text "[KGE] Error: Selected player is undefined";
    };
    _pos = getPosATL _player;

    _spawnPos = [_pos, (GVAR(minDist) + random (GVAR(maxDist) - GVAR(minDist)))] call EFUNC(common,randomPosition);
    _spawnPos = [_spawnPos, 250] call FUNC(getRoad);

    // Failed to get road for that position so stop here
    if(count _spawnPos == 0) exitWith {};

    [_spawnPos] call FUNC(spawn);
}, 2, []] call cba_fnc_addPerFrameHandler;

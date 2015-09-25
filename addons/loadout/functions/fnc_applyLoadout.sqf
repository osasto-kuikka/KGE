/*
 * Author: nikolauska
 *
 * Filter loadout items to add for player and AI
 *
 * Argument:
 * 0: Respawn status <String>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

private ["_configPath", "_units"];
params ["_type"];

_configPath = missionConfigFile >> "CfgLoadouts";

// Make sure that only local player is considered as target on respawn.
// This is because AI don't respawn, and we especially don't want to have local AI go through an entire loadout loop again, everytime the player respawns that the AI belongs to.
_units = [];
if !(!isNil "_type" && { _type isEqualTo "postInit" }) then {
  _units pushBack KGE_Player;
} else {
  {
    if ( local _x ) then {
      _units pushBack _x;
    };
  } forEach allUnits;
};

{
    private ["_isPlayer", "_side"];
    _isPlayer = isPlayer _x;
    _side = side (group _x);

    // Every single unit
    if( isClass(_configPath >> "AllUnits") ) then {
        [_configPath >> "AllUnits", _x] call FUNC(doLoadout);
    };

    // All AI units
    if( !_isPlayer && {isClass(_configPath >> "AllAi")} ) then {
        [_configPath >> "AllAi", _x] call FUNC(doLoadout);
    };

    // All players
    if( _isPlayer && {isClass(_configPath >> "AllPlayers")} ) then {
        [_configPath >> "AllPlayers", _x] call FUNC(doLoadout);
    };

    // All blufor units
    if( _side == blufor && {isClass(_configPath >> "Blufor")} ) then {
        [_configPath >> "Blufor", _x] call FUNC(doLoadout);
    };

    // All opfor units
    if( _side == opfor && {isClass(_configPath >> "Opfor")} ) then {
        [_configPath >> "Opfor", _x] call FUNC(doLoadout);
    };

    // All independent units
    if( _side == independent && {isClass (_configPath >> "Independent")} ) then {
        [_configPath >> "Independent", _x] call FUNC(doLoadout);
    };

    // All civilian units
    if( _side == civilian && {isClass(_configPath >> "Civilian")} ) then {
        [_configPath >> "Civilian", _x] call FUNC(doLoadout);
    };

    // All blufor AI units
    if( _side == blufor && {!_isPlayer} && {isClass(_configPath >> "BluforAi")} ) then {
        [_configPath >> "BluforAi", _x] call FUNC(doLoadout);
    };

    // All opfor AI units
    if( _side == opfor && {!_isPlayer} && {isClass(_configPath >> "OpforAi")} ) then {
        [_configPath >> "OpforAi", _x] call FUNC(doLoadout);
    };

    // All independent AI units
    if( _side == independent && {!_isPlayer} && {isClass(_configPath >> "IndependentAi")} ) then {
        [_configPath >> "IndependentAi", _x] call FUNC(doLoadout);
    };

    // All civilian AI units
    if( _side == civilian && {!_isPlayer} && {isClass(_configPath >> "CivilianAi")} ) then {
        [_configPath >> "CivilianAi", _x] call FUNC(doLoadout);
    };

    // All blufor players
    if( _side == blufor && {_isPlayer} && {isClass(_configPath >> "BluforPlayers")} ) then {
        [_configPath >> "BluforPlayers", _x] call FUNC(doLoadout);
    };

    // All opfor players
    if( _side == opfor && {_isPlayer} && {isClass(_configPath >> "OpforPlayers")} ) then {
        [_configPath >> "OpforPlayers", _x] call FUNC(doLoadout);
    };

    // All independent players
    if( _side == independent && {_isPlayer} && {isClass(_configPath >> "IndependentPlayers")} ) then {
        [_configPath >> "IndependentPlayers", _x] call FUNC(doLoadout);
    };

    // All civilian players
    if( _side == civilian && {_isPlayer} && {isClass(_configPath >> "CivilianPlayers")} ) then {
        [_configPath >> "CivilianPlayers", _x] call FUNC(doLoadout);
    };

    // Class based loadouts
    if( isClass(_configPath >> typeof _x) ) then {
        [_configPath >> typeof _x, _x] call FUNC(doLoadout);
    };

    // Name based loadouts
    if( isClass(_configPath >> str _x) ) then {
        [_configPath >> str _x, _x] call FUNC(doLoadout);
    };
} forEach _units;

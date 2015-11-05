/*
 * Author: nikolauska
 *
 * Filter loadout items to add for player
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

if (hasInterface) then {
    params ["_player"];
    private ["_configPath", "_fnc_loadout"];
    _configPath = missionConfigFile >> "cfgLoadouts";

    _fnc_loadout = {
        params ["_unit"];

        if(local _unit) then {
            private ["_sideUnit", " _custom"];
            _sideUnit = _unit call EFUNC(common,getSide);
            _custom = _unit getVariable [QGVAR(custom), ""];

            // All
            if( isClass(_configPath >> "All") ) then {
                [_configPath >> "All", _unit] call FUNC(doLoadout);
            };

            // All blufor units
            if( _sideUnit == blufor && {isClass(_configPath >> "Blufor")} ) then {
                [_configPath >> "Blufor", _unit] call FUNC(doLoadout);
            };

            // All opfor units
            if( _sideUnit == opfor && {isClass(_configPath >> "Opfor")} ) then {
                [_configPath >> "Opfor", _unit] call FUNC(doLoadout);
            };

            // All independent units
            if( _sideUnit == independent && {isClass (_configPath >> "Independent")} ) then {
                [_configPath >> "Independent", _unit] call FUNC(doLoadout);
            };

            // All civilian units
            if( _sideUnit == civilian && {isClass(_configPath >> "Civilian")} ) then {
                [_configPath >> "Civilian", _unit] call FUNC(doLoadout);
            };

            // Class based loadouts
            if( isClass(_configPath >> typeof _unit) ) then {
                [_configPath >> typeOf _unit, _unit] call FUNC(doLoadout);
            };

            // Name based loadouts
            if( isClass(_configPath >> str _unit) ) then {
                [_configPath >> str _unit, _unit] call FUNC(doLoadout);
            };

            // Variable based loadouts
            if( !(_custom isEqualTo "") && {isClass(_configPath >> _custom)} ) then {
                [_configPath >> _custom, _unit] call FUNC(doLoadout);
            };
        };
    };

    if (typeName _player == "OBJECT") then {
        // Player is object, so this is run on respawn
        // Apply loadout to given unit
        _player call _fnc_loadout;
    } else {
        // Player is not object, so this is postinit run
        // Apply loadout to all local playable unit
        // This allows missionmaker to see loadout on AI
        {   
            _x call _fnc_loadout;
        } forEach ([switchableUnits, playableUnits] select isMultiplayer)
    }
};

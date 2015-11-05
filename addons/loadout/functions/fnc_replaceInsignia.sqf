/*
 * Author: nikolauska
 *
 * Replace GPS for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_configPath", "_loadoutTarget"];

if(getText _configPath == "") then {
    [_loadoutTarget, "empty"] call bis_fnc_setUnitInsignia;
} else {
    [_loadoutTarget, (getText _configPath call FUNC(fixer))] call bis_fnc_setUnitInsignia;
};

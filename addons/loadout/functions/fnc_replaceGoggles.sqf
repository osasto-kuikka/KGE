/*
 * Author: nikolauska
 *
 * Replace goggles for target unit
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
    removeGoggles _loadoutTarget;
} else {
    _loadoutTarget addGoggles (getText _configPath call FUNC(fixer));
};

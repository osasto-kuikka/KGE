/*
 * Author: nikolauska
 *
 * Replace secondary weapon for target unit
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
    _loadoutTarget removeWeapon (secondaryWeapon _loadoutTarget);
} else {
    _loadoutTarget addWeapon (getText _configPath call FUNC(fixer));
};

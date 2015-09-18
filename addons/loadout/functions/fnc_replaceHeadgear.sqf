/*
 * Author: nikolauska
 *
 * Replace headgear for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

params ["_configPath", "_loadoutTarget"];

if(getText _configPath == "") then {
    removeHeadgear _loadoutTarget;
} else {
    _loadoutTarget addHeadgear getText (_configPath);
};

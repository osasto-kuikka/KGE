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

params ["_configPath", "_loadoutTarget"];

if(getText _configPath == "") then {
    removeGoggles _loadoutTarget;
} else {
    _loadoutTarget addGoggles getText (_configPath);
};
/*
 * Author: nikolauska
 *
 * Replace map for target unit
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
    _loadoutTarget unlinkItem "ItemMap";
} else {
    _loadoutTarget linkItem getText (_configPath);
};
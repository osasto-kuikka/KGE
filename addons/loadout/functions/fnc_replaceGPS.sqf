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

params ["_configPath", "_loadoutTarget"];

if(getText _configPath == "") then {
    _loadoutTarget unlinkItem "ItemGPS";
} else {
    _loadoutTarget linkItem getText (_configPath);
};

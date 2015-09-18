/*
 * Author: nikolauska
 *
 * Replace uniform for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

params ["_configPath", "_loadoutTarget"];

// Backup items ( contains magazines )
_backUpItems = uniformItems _loadoutTarget;

if(getText _configPath == "") then {
    removeUniform _loadoutTarget;
    { _loadoutTarget addItem _x; } forEach _backUpItems;
} else {
    _loadoutTarget forceAddUniform getText (_configPath);
    // Reapply items
    { _loadoutTarget addItemToUniform _x; } forEach _backUpItems;
};

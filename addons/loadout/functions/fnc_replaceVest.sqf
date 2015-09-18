/*
 * Author: nikolauska
 *
 * Replace vest for target unit
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
_backUpItems = vestItems _loadoutTarget;

if(getText _configPath == "") then {
    removeVest _loadoutTarget;
    { _loadoutTarget addItem _x; } forEach _backUpItems;
} else {
    _loadoutTarget addVest getText (_configPath);
    // Reapply items
    { _loadoutTarget addItemToVest _x; } forEach _backUpItems;
};

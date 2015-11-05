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

#include "..\script_component.hpp"

params ["_configPath", "_loadoutTarget"];

// Backup items ( contains magazines )
_backUpItems = uniformItems _loadoutTarget;

if(getText _configPath == "") then {
    removeUniform _loadoutTarget;
    { _loadoutTarget addItem (_x call FUNC(fixer)); } forEach _backUpItems;
} else {
    _loadoutTarget forceAddUniform (getText _configPath call FUNC(fixer));
    // Reapply items
    { _loadoutTarget addItemToUniform (_x call FUNC(fixer)); } forEach _backUpItems;
};

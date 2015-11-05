/*
 * Author: nikolauska
 *
 * Replace primary weapon attachment for target unit
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

removeAllPrimaryWeaponItems _loadoutTarget;
{ _loadoutTarget addPrimaryWeaponItem (_x call FUNC(fixer)); } forEach getArray (_configPath);

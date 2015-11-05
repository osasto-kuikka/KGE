/*
 * Author: nikolauska
 *
 * Replace secondary weapon attachment for target unit
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

{ _loadoutTarget removeSecondaryWeaponItem _x; } forEach secondaryWeaponItems _loadoutTarget;
{ _loadoutTarget addSecondaryWeaponItem (_x call FUNC(fixer)); } forEach getArray _configPath;

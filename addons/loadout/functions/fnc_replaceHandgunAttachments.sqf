/*
 * Author: nikolauska
 *
 * Replace handgun attachment for target unit
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

removeAllHandgunItems _loadoutTarget;
{ _loadoutTarget addHandgunItem (_x call FUNC(fixer)); } forEach getArray (_configPath);

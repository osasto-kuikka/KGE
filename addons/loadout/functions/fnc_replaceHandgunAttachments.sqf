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

params ["_configPath", "_loadoutTarget"];

removeAllHandgunItems _loadoutTarget;
{ _loadoutTarget addHandgunItem _x; } forEach getArray (_configPath);

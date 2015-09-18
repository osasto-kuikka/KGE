/*
 * Author: nikolauska
 *
 * Add item to units vest
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

params ["_configPath", "_loadoutTarget"];

{ _loadoutTarget addItemToVest _x; } forEach getArray (_configPath);

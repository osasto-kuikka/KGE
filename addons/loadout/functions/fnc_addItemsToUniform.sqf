/*
 * Author: nikolauska
 *
 * Add item to units uniform
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

params ["_configPath", "_loadoutTarget"];

{ _loadoutTarget addItemToUniform _x; } forEach getArray (_configPath);

/*
 * Author: nikolauska
 *
 * Add item to unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 * 
 */

params ["_configPath", "_loadoutTarget"];

{ _loadoutTarget addItem _x; } forEach getArray (_configPath);

/*
 * Author: nikolauska
 *
 * Check if config entry exists
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Config entry <String>
 *
 * Return value:
 * Boolean
 */

params ["_configPath", "_entryName"];

!(([_configPath, _entryName, false] call bis_fnc_returnConfigEntry) isEqualTo false)

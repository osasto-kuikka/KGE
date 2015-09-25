/*
 * Author: nikolauska
 *
 * Replace magazines for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

params ["_configPath", "_loadoutTarget"];

{ _loadoutTarget removeMagazine _x; } forEach magazines _loadoutTarget;
{ _loadoutTarget addMagazine _x; } forEach getArray (_configPath);

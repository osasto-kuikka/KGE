/*
 * Author: nikolauska
 *
 * Return boolean info if class exists or not. Used to check if there are other
 * mods that could be used with KGE
 *
 * Argument:
 * 0: Class name (String)
 *
 * Return value:
 * Boolean
 */

params [["_name", ""]];

isClass(configFile >> "cfgPatches" >> _name)

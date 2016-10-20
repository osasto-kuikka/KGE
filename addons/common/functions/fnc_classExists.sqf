/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Return boolean info if class exists or not.
 * Used to check if there are other mods that could be used with KGE
 *
 * Argument:
 * 0: Class name <STRING>
 *
 * Return value:
 * Class exists <BOOLEAN>
 */

params [["_name", ""]];

isClass(configFile >> "cfgPatches" >> _name)

/*
 * Author: nikolauska
 *
 * Checks if unit is admin
 *
 * Argument:
 *
 * Return value:
 * Bool
 */

params [["_unit", KGE_Player, [objNull]]];

_unit getVariable ["KGE_Admin", false] || serverCommandAvailable "#kick" || isServer

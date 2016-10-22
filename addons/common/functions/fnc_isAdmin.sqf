/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Checks if unit is admin
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Is admin <BOOLEAN>
 */

params [["_unit", KGE_Player, [objNull]]];

_unit getVariable ["KGE_Admin", false] || serverCommandAvailable "#kick" || isServer

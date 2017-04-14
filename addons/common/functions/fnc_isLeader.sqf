/*
 * Author: nikolauska
 *
 * Check if unit is leader of group
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 * Boolean
 */

params ["_unit"];

_unit == leader (group _unit)

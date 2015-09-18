/*
 * Author: nikolauska
 *
 * Check if unit is alive (Not used to check if player is in spectator!)
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 * Boolean
 */

params ["_unit"];

(!isNull _unit && {alive _unit})

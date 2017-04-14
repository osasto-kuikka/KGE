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

params [["_unit", objNull, [objNull]];

[_unit] call FUNC(isAlive) && {_unit isEqualTo leader (group _unit)}

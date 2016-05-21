/*
 * Author: nikolauska
 *
 * Check if unit is alive
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 * Boolean
 */

#include "script_component.hpp"

params [
    ["_unit", KGE_Player, [objNull]]
];

_unit getVariable [QEGVAR(respawn,alive), true]

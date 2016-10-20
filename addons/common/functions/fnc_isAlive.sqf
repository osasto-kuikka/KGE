/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Check if unit is alive.
 * If kge respawn is in use, that check will be used also
 *
 * Argument:
 * 0: Unit <OBJECT>
 *
 * Return value:
 * Is alive <BOOLEAN>
 */

#include "script_component.hpp"

params [["_unit", KGE_Player, [objNull]]];

private _alive = _unit call CBA_fnc_isAlive;

if ("kge_respawn" call FUNC(classExists)) then {
  _alive = _unit getVariable [QEGVAR(respawn,alive), true]
};

_alive

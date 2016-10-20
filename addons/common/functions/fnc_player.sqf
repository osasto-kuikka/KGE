/*
 * Author:
 * Nikolauska
 *
 * Description
 * Returns the player or curator controlled unit.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Object
 */

#include "script_component.hpp"

KGE_DEPRECATED(QFUNC(player),"1.2.0","CBA_fnc_currentUnit");

missionNamespace getVariable ["bis_fnc_moduleRemoteControl_unit", player]

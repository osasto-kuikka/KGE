/*
 * Author: nikolauska
 *
 * Activate zeus for client
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params [["_unit", KGE_Player]];

[QGVAR(activateEvent), [_unit]] call cba_fnc_globalEvent;

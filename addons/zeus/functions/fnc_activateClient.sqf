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

if (  !(KGE_Player call EFUNC(common,isAlive)) ||
      !(KGE_Player call EFUNC(common,isAdmin)) ) exitWith {};

[QGVAR(activateEvent), KGE_Player] call cba_fnc_globalEvent;

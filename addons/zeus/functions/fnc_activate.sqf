/*
 * Author: nikolauska
 *
 * Activate zeus module for local player
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

if ( !(KGE_player call EFUNC(common,isAlive)) || !(KGE_player call EFUNC(common,isAdmin) ) exitWith {};

[QGVAR(activateEvent), KGE_player] call cba_fnc_globalEvent;

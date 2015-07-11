/*
 * Author: nikolauska
 *
 * When player respawns
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

["KGE_onRespawn", []] call cba_fnc_localEvent;

KGE_player setPos GVAR(respawnPos);
KGE_player enableSimulation true;
KGE_player hideObjectGlobal false;

GVAR(animationLock) = false;
/*
 * Author: nikolauska
 *
 * When player is killed
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

["KGE_onKilled", []] call cba_fnc_localEvent;

KGE_player setPos GVAR(killedPos);
KGE_player enableSimulation false;
KGE_player hideObjectGlobal true;

GVAR(animationLock) = true;
call FUNC(animationLock);


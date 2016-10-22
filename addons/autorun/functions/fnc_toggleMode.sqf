/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Changes autorun mode
 *
 * Arguments:
 * None
 *
 * Return:
 * None
 */

#include "script_component.hpp"

// If autorun is not started then exit
if !(GVAR(isAutoRunActive)) exitWith {};

GVAR(lastMode) = nil;

if(GVAR(autoRunMode) isEqualTo WALK) exitWith { GVAR(autoRunMode) = JOG };
if(GVAR(autoRunMode) isEqualTo JOG) exitWith { GVAR(autoRunMode) = SPRINT };
if(GVAR(autoRunMode) isEqualTo SPRINT) exitWith { GVAR(autoRunMode) = WALK };

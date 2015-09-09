/*
 * Author: nikolauska
 *
 * Changes autorun mode
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

// If autorun is not started, start it
if(GVAR(isAutoRunActive) isEqualTo false) exitWith { GVAR(isAutoRunActive) = true };

if(GVAR(autoRunMode) isEqualTo WALK) exitWith { GVAR(autoRunMode) = JOG };
if(GVAR(autoRunMode) isEqualTo JOG) exitWith { GVAR(autoRunMode) = SPRINT };
if(GVAR(autoRunMode) isEqualTo SPRINT) exitWith { GVAR(autoRunMode) = WALK };

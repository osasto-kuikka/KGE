/*
 * Author: nikolauska
 *
 * Toggles autorun on and off
 *
 * Argument:
 * 0: Unit <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

GVAR(isAutoRunActive) = !GVAR(isAutoRunActive);

if !(GVAR(isAutoRunActive)) exitWith {
    KGE_LOGINFO("Autorun stopped");

    KGE_Player switchMove "";
    GVAR(lastMode) = nil;
};

KGE_LOGINFO("Autorun started");

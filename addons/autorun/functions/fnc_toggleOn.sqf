/*
 * Author:
 * Nikolauska
 *
 * Description
 * Toggles autorun on and off
 *
 * Arguments:
 * None
 *
 * Return:
 * None
 */

#include "script_component.hpp"

GVAR(isAutoRunActive) = !GVAR(isAutoRunActive);

if !(GVAR(isAutoRunActive)) exitWith {
    KGE_LOGINFO("Autorun stopped");

    KGE_Player switchMove "";
    GVAR(lastMode) = nil;
};

KGE_LOGINFO("Autorun started");

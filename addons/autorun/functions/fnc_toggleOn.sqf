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

#include "script_component.hpp"

GVAR(isAutoRunActive) = !GVAR(isAutoRunActive);

if !(GVAR(isAutoRunActive)) exitWith {
	[GVAR(autorunLoop)] call CBA_fnc_removePerFrameHandler;

	KGE_LOGINFO("Autorun stopped");

	KGE_Player switchMove "";
	GVAR(lastMode) = nil;
} else {
	// Autorun loop
	GVAR(autorunLoop) = [{
		if !(call FUNC(canAutoRun)) exitWith {
			FUNC(toggleOn);
		};

		private _animation = GVAR(autoRunMode) call FUNC(getAnimation);
		KGE_Player playMoveNow _animation;
	}, 1, []] call CBA_fnc_addPerFrameHandler;

	KGE_LOGINFO("Autorun started");
};


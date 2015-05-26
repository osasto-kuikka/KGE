#include "script_component.hpp";

GVAR(forceExit) = false;

99999 cutText ["", "BLACK FADED"];

[{
	99999 cutText ["", "BLACK IN", 2];
	2 fadeSound 1;

	_tracking = if (!isNil QGVAR(trackingArray)) then {2} else {0};

	["Init", [true, _tracking]] FUNC(events);
}, [], 1, 0.5] call EFUNC(common, execDelayed);
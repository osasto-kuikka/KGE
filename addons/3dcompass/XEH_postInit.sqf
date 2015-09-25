#include "script_component.hpp"

["KGE_vehicleStatusChanged", {
	params ["_status"];

	if(_status == 2 && {(vehicle KGE_Player) isKindOf "Helicopter"}) then {
		// Add compass
		GVAR(pfh) = [{
			call FUNC(draw);
		}, 0, []] call CBA_fnc_addPerFrameHandler;
	} else {
		// Remove compass if running
		if !(isNil QGVAR(pfh)) then {
			[GVAR(pfh)] call cba_fnc_removePerFrameHandler;
			GVAR(pfh) = nil;
		};
	};
}] call cba_fnc_addEventHandler;

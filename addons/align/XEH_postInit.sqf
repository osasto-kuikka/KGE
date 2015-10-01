#include "script_component.hpp"

// If player is looking through scope add shaking
[{
	GVAR(shaking) = cameraView isEqualTo "GUNNER" && {alive KGE_Player} && {(vehicle KGE_Player) isEqualTo KGE_Player} && {cameraOn isEqualTo KGE_Player};
}, 0, []] call CBA_fnc_addPerFrameHandler;

// Add shaking effect when looking through scope
[{
	if !(GVAR(shaking)) exitWith { GVAR(align) = 0; };

	private ["_intensity"];

	if(GVAR(align) < GVAR(align_max)) exitWith {
		_intensity = 3 * (getFatigue KGE_Player);
		addCamshake
		[
			(GVAR(align_max) - GVAR(align)),
			2.6 + _intensity,
			1.2
		];
		GVAR(align) = (GVAR(align) + 0.10) min GVAR(align_max);
	};

	_intensity = 0.2 * (getFatigue KGE_Player);
	addCamshake [0.22 + _intensity, 0.7, 0.83];

}, 0.2, []] call CBA_fnc_addPerFrameHandler;

KGE_LOGINFO("Align Module Initialized.");

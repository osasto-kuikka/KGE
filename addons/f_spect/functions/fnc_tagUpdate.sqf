#include "script_component.hpp"

[{
	_tagList = [];
	_camera = GVAR(cameras) select GVAR(cameraIdx);
	{
		if(_x call EFUNC(core, getSide) in GVAR(allowedSides) && { (_x distance _camera) < 600 }) then {
			PUSH(_tagList, _x);
		};
	} forEach allUnits;

	GVAR(tagList) = _tagList;
}, 1, []] call cba_fnc_addPerFrameHandler;
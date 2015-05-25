#include "script_component.hpp"

[{			
	// Follow target with small map			
	_map = _disp displayctrl IDC_MAP;
	ctrlMapAnimClear _map;
	if (GVAR(cameras) select KEGs_cameraIdx == GVAR(camFree)) then {
		// Center on free camera position
		_map ctrlMapAnimAdd[0.3, KEGsMinimapZoom, [getPos KEGscam_free  select 0, getPos KEGscam_free  select 1,0]];			
	} else {
		// Center on target
		_map ctrlMapAnimAdd[0.3, KEGsMinimapZoom, visiblePosition GVAR(target)];
	};
	ctrlMapAnimCommit _map;					

	// Check if target changed and center main map
	if(KEGs_tgtIdx != KEGs_lastTgt) then {
		_map = _disp displayctrl IDC_MAPFULL;
		ctrlMapAnimClear _map;
		_map ctrlMapAnimAdd [0.2, 1.0, visiblePosition (deathcam select KEGs_tgtIdx)];
		ctrlMapAnimCommit _map;			
	};

	// Update playerlist if needed
	_newAliveCount = count(call EFUNC(respawn, getAliveUnits));
	if(GVAR(aliveCount) != _newAliveCount)) then {
		GVAR(aliveCount) = _newAliveCount;

		call FUNC(refreshPlayerList);
	};

	// Update tag list if needed
	_newUnitCount = call FUNC(markerUpdate);
	if(GVAR(unitCount) != _newUnitCount) then {
		GVAR(unitCount) = _newUnitCount;

		call FUNC(tagUpdate);
	}
}, 0.5, []] call cba_fnc_addPerFrameHandler;
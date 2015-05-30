#include "script_component.hpp";

if (!GVAR(alwaysTracking)) then {
	GVAR(trackingArray) = nil;
	GVAR(trackingLast) = nil;
};

GVAR(cam) cameraEffect ["terminate", "back"];
camUseNVG false;
false SetCamUseTi 0;
camDestroy GVAR(cam);

GVAR(forceExit) = true;
		
GVAR(noEscape) = nil;
GVAR(alwaysTracking) = nil;
GVAR(cam) = nil;
GVAR(LMB) = nil;
GVAR(RMB) = nil;
GVAR(vector) = nil;
GVAR(fov) = nil;
GVAR(vision) = nil;
GVAR(moveScale) = nil;
GVAR(cameraOn) = nil;
GVAR(focus) = nil;
GVAR(lock) = nil;
GVAR(targets) = nil;
GVAR(attach) = nil;
GVAR(unit) = nil;
GVAR(unitCount) = nil;
GVAR(deadList) = nil;
GVAR(mouseBusy) = nil;
GVAR(displayMarkers) = nil;
GVAR(keys) = nil;
GVAR(listLast) = nil;
GVAR(accTime) = nil;

_display = findDisplay 46;

removeMissionEventHandler ["draw3D", GVAR(draw3d)]; 		
_display displayRemoveEventHandler ["keyDown", GVAR(eh_key1)];
_display displayRemoveEventHandler ["keyUp", GVAR(eh_key2)];
_display displayRemoveEventHandler ["mouseButtonDown", GVAR(eh_key3)];
_display displayRemoveEventHandler ["mouseButtonUp", GVAR(eh_key4)];
_display displayRemoveEventHandler ["mouseZChanged", GVAR(eh_key5)];
_display displayRemoveEventHandler ["mouseMoving", GVAR(eh_key6)];
_display displayRemoveEventHandler ["mouseHolding", GVAR(eh_key7)];
GVAR(eh_key1) = nil;
GVAR(eh_key2) = nil;
GVAR(eh_key3) = nil;
GVAR(eh_key4) = nil;
GVAR(eh_key5) = nil;
GVAR(eh_key6) = nil;
GVAR(eh_key7) = nil;

_layers = GETMVAR(BIS_fnc_rscLayer_list, []);

for "_i" from 1 to (count _layers - 1) step 2 do {
	(_layers select _i) cutText ["", "Plain"];
};
		
if (!isMultiplayer) then {setAccTime 1};
KGE_player switchCamera "Internal";
/*
 * Author: Kegetys, Ollem, nikolauska
 *
 * Starts KGE spectator script
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

disableSerialization;

GVAR(allowedSides_West) 		= GETMVAR(allowedSides_West, [west, east, independent, civilian]);
GVAR(allowedSides_East) 		= GETMVAR(allowedSides_East, [west, east, independent, civilian]);
GVAR(allowedSides_Independent)  = GETMVAR(allowedSides_Independent, [west, east, independent, civilian]);
GVAR(allowedSides_Civilian) 	= GETMVAR(allowedSides_Civilian, [west, east, independent, civilian]);

// Get allowed side for player
GVAR(allowedSides) = (KGE_Player call EFUNC(core, getSide)) call {
	if(_this == west) exitWith {GVAR(allowedSides_West)};
	if(_this == east) exitWith {GVAR(allowedSides_East)};
	if(_this == independent) exitWith {GVAR(allowedSides_Independent)};
	if(_this == civilian) exitWith {GVAR(allowedSides_Civilian)};
};

GVAR(currentCameraView) = "";
GVAR(target) 			= KGE_PlayerOld;
GVAR(targetName) 		= GVAR(Target) call EFUNC(core, getName);

GVAR(autoTarget)		= GVAR(target); 
GVAR(autoTargetOrig)	= GVAR(target);

GVAR(mouseButtons)		= [false, false];
GVAR(mouseCoord)		= [0, 0];
GVAR(mouseLastCoord)	= [0, 0];
GVAR(pitchBank)			= [0, 0];

GVAR(useNVG)			= false;
GVAR(tags)				= false;
GVAR(aiFilter)			= false;
GVAR(deadFilter)		= false;
GVAR(combatActionfilter)= false;
GVAR(1stGunner)			= false;

GVAR(markerNames)		= false;
GVAR(markerType)		= 1;
GVAR(markerSize)		= 1.0;
GVAR(minimapZoom)		= 0.5;
GVAR(select)			= 0;
GVAR(currSelectIndex)	= 0;

GVAR(camDistance)		= 5;
GVAR(camZoom)			= 0.976;
GVAR(camVision)			= 0;
GVAR(camFreePitch)		= -45;
GVAR(camSelLast) 		= 0;
GVAR(camPos)	 		= [0,0,0];
GVAR(camSpeedX)	 		= 0;
GVAR(camSpeedY)	 		= 0;
GVAR(tBase)	 	 		= 0.1;

GVAR(aliveCount)		= count(call EFUNC(respawn, getAliveUnits));
GVAR(tagSources)		= [];
GVAR(playerList)		= [];

GVAR(origviewDistance)	= viewDistance;
GVAR(tempViewDistance)	= (2 * GVAR(origviewDistance)) min 10000 max 4000;
setViewDistance GVAR(tempViewDistance);

// Create dialog & assign keyboard handler
createDialog "KEGsRscSpectate";
_disp = (findDisplay IDC_MAIN);
_disp displaySetEventHandler["KeyDown", "[""KeyDown"",_this] call spectate_events"];
_disp displaySetEventHandler["KeyUp", "[""KeyUp"",_this] call spectate_events"];

// hide menus by default
["ToggleCameraMenu",0] call FUNC(eventHandler);
["ToggleTargetMenu",0] call FUNC(eventHandler);
["ToggleHelp",0] call FUNC(eventHandler);
["ToggleMap",0] call FUNC(eventHandler);


// "Beginning, hide map and minimap";
ctrlShow[IDC_MAP, false];

_modeltoWorld = GVAR(target) modelToWorld [0,0,0];
_pos = [(_modeltoWorld select 0)-1+random 2, (_modeltoWorld select 1)-1+random 2, 2];
_targetPos = [(_modeltoWorld select 0), (_modeltoWorld select 1), 1];

GVAR(camTarget) = "camera" camCreate _targetPos; // "Dummy" target camera for smooth transitions
GVAR(camChase) = "camera" camCreate _targetPos;
GVAR(camLockOn) = "camera" camCreate _targetPos;
GVAR(cam1stPerson) = "camera" camCreate _targetPos;
GVAR(camFree) = "camera" camCreate (GVAR(target) modelToWorld [0,-25,25]);
GVAR(camFullMap) = "camera" camCreate _pos; // Full map view camera

GVAR(camChase) camSetTarget GVAR(camTarget);
GVAR(camLockOn) camSetTarget GVAR(camTarget);
GVAR(camFree) setDir (getDir GVAR(target));
[GVAR(camFree), GVAR(camFreePitch), 0] call BIS_fnc_setPitchBank;

//--- Create Cam Marker
createMarkerLocal [QGVAR(camMarker), getPos GVAR(camFree)];
QGVAR(camMarker) setMarkerTypeLocal "mil_start";
QGVAR(camMarker) setMarkerColorLocal "colorpink";
QGVAR(camMarker) setMarkerSizeLocal [.75,.75];

GVAR(cameras) 	  = [GVAR(camLockOn), GVAR(camChase), GVAR(cam1stPerson), GVAR(camFree)];
GVAR(cameraNames) = ["Lock-on", "Chase", "1st-Person", "Free"];
GVAR(cameraIdx)   = 0;
GVAR(tgtIdx) 	  = 0;
GVAR(camSelLast)  = 0;

// Add cameras to listbox
lbClear IDC_MENUCAM;
{ lbAdd[IDC_MENUCAM, _x] } forEach GVAR(cameraNames);

// Add separator & toggles
GVAR(lbSeparator) = lbAdd[IDC_MENUCAM, "---"];
lbSetColor[IDC_MENUCAM, GVAR(lbSeparator), [0.5, 0.5, 0.5, 0.5]];

GVAR(lbToggleTags) 				 = lbAdd[IDC_MENUCAM, "Unit tags"];
//GVAR(lbToggleTagsStat) 			 = lbAdd[IDC_MENUCAM, "Combat status tags"];
GVAR(lbToggleAiFilter) 			 = lbAdd[IDC_MENUCAM, "Filter AI"];
GVAR(lbToggleDeadFilter) 		 = lbAdd[IDC_MENUCAM, "Filter Unknown/Dead"];
GVAR(lbToggleCombatActionFilter) = lbAdd[IDC_MENUCAM, "Combat Action Focus"];

showCinemaBorder false;
lbClear IDC_MENUTGT;

// Set all keys
if(isNil QGVAR(keys)) then {
	private ["_DIKcodes", "_DIKlast"];
    GVAR(keys) = [];
    _DIKcodes = true call bis_fnc_keyCode;
    _DIKlast = _DIKcodes select (count _DIKcodes - 1);
    for "_k" from 0 to (_DIKlast - 1) do {
        GVAR(keys) set [_k,false];
    };
};

[QGVAR(mapClickEH), "onMapSingleClick", {
	["MapClick", _pos] call FUNC(eventHandler);
}] call BIS_fnc_addStackedEventHandler

// Spawn thread to display help reminder after a few seconds
[{
	if(dialog) then {
		cutText["\n\n\n\n\nPress F1 for help","PLAIN DOWN", 0.75];
	};
}, [], 3, 1] call EFUNC(core, execDelayed);


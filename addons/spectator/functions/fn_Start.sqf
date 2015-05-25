
/******************************************************************************/
// API Settings

KGE_Spectator_AllowFreeCam = missionNamespace getVariable ["KGE_Spectator_AllowFreeCam", true];
KGE_Spectator_AllowThirdPerson = missionNamespace getVariable ["KGE_Spectator_AllowThirdPerson", true];
KGE_Spectator_AllowTags = missionNamespace getVariable ["KGE_Spectator_AllowTags", true];
KGE_Spectator_AllowAI = missionNamespace getVariable ["KGE_Spectator_AllowAI", true];
KGE_Spectator_AllowMarkers = missionNamespace getVariable ["KGE_Spectator_AllowMarkers", true];
KGE_Spectator_AllowTracers = missionNamespace getVariable ["KGE_Spectator_AllowTracers", true];
KGE_Spectator_AllowMap = missionNamespace getVariable ["KGE_Spectator_AllowMap", true];

/******************************************************************************/
// Variables
#include "macros.hpp"

// Controls
KGE_Spectator_controls = [
    KGE_Spectator_HELPFRAME,
    KGE_Spectator_HELPBACK,
    KGE_Spectator_MOUSEHANDLER,
    KGE_Spectator_UNITLIST,
    KGE_Spectator_MODESCOMBO,
    KGE_Spectator_SPECTEXT,
    KGE_Spectator_SPECHELP,
    KGE_Spectator_HELPCANCEL,
    //KGE_Spectator_MINIMAP,
    //KGE_Spectator_FULLMAP,
    KGE_Spectator_BUTTIONFILTER,
    KGE_Spectator_BUTTIONTAGS,
    //KGE_Spectator_BUTTIONTAGSNAME,
    //KGE_Spectator_BUTTIONFIRSTPERSON,
    KGE_Spectator_DIVIDER];

// Arrays
KGE_Spectator_listUnits = []; // listed player on side
KGE_Spectator_Frame_Units = []; // units that are drawn every frame

// Modes
//KGE_Spectator_mode = 3;

// Misc
KGE_Spectator_playersOnly = if(KGE_Spectator_AllowAI) then {false} else {true};
KGE_Spectator_hideUI = false;
KGE_Spectator_toggleTags = true;
KGE_Spectator_forcedExit = false;
KGE_Spectator_Side = [KGE_Player] call KGE_Core_fnc_GetSide;
KGE_Spectator_NextUpdate = 0;
KGE_Spectator_Tags_AllowUnitChange = true;
KGE_Spectator_TagFadeDist = 500;

// Zoom
KGE_Spectator_fovZoom = 1.2;
KGE_Spectator_MaxZoom = 4;
KGE_Spectator_map_zoom = 0.5;
KGE_Spectator_zoom = 3;

// Colors
KGE_Spectator_blufor_color = missionNameSpace getVariable ["KGE_Spectator_blufor_color", [BLUFOR] call bis_fnc_sideColor];
KGE_Spectator_opfor_color = missionNameSpace getVariable ["KGE_Spectator_opfor_color", [opfor] call bis_fnc_sideColor];
KGE_Spectator_indep_color = missionNameSpace getVariable ["KGE_Spectator_indep_color", [independent] call bis_fnc_sideColor];
KGE_Spectator_civ_color = missionNameSpace getVariable ["KGE_Spectator_civ_color", [civilian] call bis_fnc_sideColor];
KGE_Spectator_empty_color = missionNameSpace getVariable ["KGE_Spectator_empty_color", [sideUnknown] call bis_fnc_sideColor];

/******************************************************************************/
// Mouse and Buttons

KGE_Spectator_MouseButton = [false,false];
KGE_Spectator_RMBclick = [0, 0];
KGE_Spectator_LMBclick = [0, 0];
KGE_Spectator_PitchBank = [0, 0];

// Set all keys
if(isNil "KGE_Spectator_keys") then {
    KGE_Spectator_keys = [];
    _DIKcodes = true call bis_fnc_keyCode;
    _DIKlast = _DIKcodes select (count _DIKcodes - 1);
    for "_k" from 0 to (_DIKlast - 1) do {
        KGE_Spectator_keys set [_k,false];
    };
};

/******************************************************************************/
// UI

// create the UI
createDialog "KGE_Spectator_Dialog";

// Create help text
_KGE_Spectator_helptext = "<t color='#EAA724'><br/>" +
    localize "STR_Spectator_Dialog_Help_CameraPan" + "<br />" +
    localize "STR_Spectator_Dialog_Help_Zoom" + "<br />" +
    localize "STR_Spectator_Dialog_Help_FovZoom" + "<br /><br />" +
    localize "STR_Spectator_Dialog_Help_Window" + "<br />" +
    //localize "STR_Spectator_Dialog_Help_Map" + "<br />" +
    //localize "STR_Spectator_Dialog_Help_Tracers" + "<br />" +
    //localize "STR_Spectator_Dialog_Help_Freecam" + "<br /><br />" +
    localize "STR_Spectator_Dialog_Help_Close" + "</t>";

((findDisplay 9228) displayCtrl 1310) ctrlSetStructuredText parseText _KGE_Spectator_helptext;

missionNameSpace setVariable ["KGE_Spectator_HelpText_shown", true];

/******************************************************************************/
// Camera

// create the camera.
KGE_Spectator_camera = "camera" camCreate [position KGE_PlayerOld select 0,position KGE_PlayerOld select 1,3];

// Set up cameras
KGE_Spectator_camera cameraEffect ["internal","back"];
//KGE_Spectator_camera camSetFov 1.2;
cameraEffectEnableHUD true;
showCinemaBorder false;
KGE_Spectator_camera camCommit 0;

/******************************************************************************/
// Update vision modes
[true, false, false, false] call KGE_Spectator_fnc_ReloadModes;
lbSetCurSel [2101,0];

/******************************************************************************/
// Start update loop
[] call KGE_Spectator_fnc_UpdateValues;

/******************************************************************************/
// Start tag loop
[] call KGE_Spectator_fnc_DrawFrame;


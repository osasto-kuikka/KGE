// Hide player
KGE_Player hideObjectGlobal true;

// Get marker
_marker = "";
switch ([KGE_Player] call KGE_Core_fnc_GetSide) do {
	case WEST: {_marker = missionNamespace getVariable ["KGE_Respawn_DeadMarker_Blufor", ""]};
	case EAST: {_marker = missionNamespace getVariable ["KGE_Respawn_DeadMarker_Opfor", ""]};
	case INDEPENDENT: {_marker = missionNamespace getVariable ["KGE_Respawn_DeadMarker_Independent", ""]};
	case CIVILIAN: {_marker = missionNamespace getVariable ["KGE_Respawn_DeadMarker_Civilian", ""]};
};

// if marker exist then teleport player to there
if(getMarkerType _marker != "") then {
	[KGE_Player, (getMarkerPos _marker)] call KGE_Teleport_fnc_Teleport;
} else {
	["KGE_Respawn_fnc_Dead", "ERROR", localize "STR_Respawn_Marker_NotFound_Dead"] call KGE_Debug_fnc_AddLog;
};

// Set respawn amount to maximum respawn amount
KGE_Player setVariable ["KGE_Respawn_RespawnAmount", KGE_Respawn_MaximumRespawns, true];

// Set player unable to use TFAR radio
if(["task_force_radio"] call KGE_Core_fnc_ClassExists) then {
	//KGE_Player setVariable ['tf_unable_to_use_radio', true];
	[KGE_Player, true] call TFAR_fnc_forceSpectator;
};

// Set ACRE spectator
if(["acre_main"] call KGE_Core_fnc_ClassExists) then {
	[true] call acre_api_fnc_setSpectator;
};

// Set player dead
[KGE_Player, "Dead"] call KGE_Core_fnc_SetState;

// Disable player movement
[] call KGE_Respawn_fnc_AnimationLoop;

// Set player indestructable
KGE_Player allowDamage false;

// Start spectator
[] call KGE_Spectator_fnc_Start;
//[] call CSSA3_fnc_Initialize;



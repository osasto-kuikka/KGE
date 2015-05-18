_forced = [_this, 0, false, [false]] call BIS_fnc_param;

// If player is force spawned then set respawn amount to 0
if(_forced) then {
	KGE_Player setVariable ["KGE_Respawn_RespawnAmount", 0, true];

	_marker = "";
	switch ([KGE_Player] call KGE_Core_fnc_GetSide) do {
		case WEST: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Blufor", ""]};
		case EAST: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Opfor", ""]};
		case INDEPENDENT: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Independent;", ""]};
		case CIVILIAN: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Civilian", ""]};
	};

	// Move player to spawn marker
	if(getMarkerType _marker != "") then {
		[KGE_Player, (getMarkerPos _marker), 5] call KGE_Teleport_fnc_Teleport;
	} else {
		["KGE_Respawn_fnc_Spawn", "ERROR", localize "STR_Respawn_Marker_NotFound_Spawn"] call KGE_Debug_fnc_AddLog;
	};
} else {
	KGE_Player setVariable ["KGE_Respawn_RespawnAmount", ((KGE_Player getVariable "KGE_Respawn_RespawnAmount") + 1), true];
};

// Show player
KGE_Player hideObjectGlobal false;

// Allow TFAR radio usage
if(["task_force_radio"] call KGE_Core_fnc_ClassExists) then {
	//KGE_Player setVariable ['tf_unable_to_use_radio', false];
	[KGE_Player, false] call TFAR_fnc_forceSpectator;
};

// Remove ACRE spectator
if(["acre_main"] call KGE_Core_fnc_ClassExists) then {
	[false] call acre_api_fnc_setSpectator;
};

// Set player alive
[KGE_Player, true] call KGE_Core_fnc_SetAlive;

// Exit spectator
[] call KGE_Spectator_fnc_ForceExit;
//[] call CSSA3_fnc_forceExit;

// Allow player damage
KGE_Player allowDamage true;



private ["_markerName", "_marker"];

// Friendly fire part here
if(KGE_Respawn_showFriendlyFire AND {([_this select 0] call KGE_Core_fnc_GetSide) isEqualTo ([_this select 1] call KGE_Core_fnc_GetSide)}) then {
	// Friedly fire message here
};

// Generate respawn marker text from object name 
_markerName = format ["respawn_%1", vehicleVarName (_this select 0)];

// Create marker if not already created
if(getMarkerType _markerName == "") then {
	createMarkerLocal [_markerName, getPos (_this select 0)];
	_markerName setMarkerShapeLocal "ICON";
	_markerName setMarkerTypeLocal "DOT";
	_markerName setMarkerAlphaLocal 1;
} else {
	_markerName setMarkerPosLocal (getPos (_this select 0));
};

_marker = "";
if(KGE_Respawn_MaximumRespawns != -1 AND
	{((KGE_Player getVariable "KGE_Respawn_RespawnAmount") >= KGE_Respawn_MaximumRespawns OR !([KGE_Player] call KGE_Core_fnc_isAlive))}) then {

	// Set marker to player position
	_markerName setMarkerPosLocal (getPos (_this select 0));
} else {
	// Get saved respawn marker position
	switch ([KGE_Player] call KGE_Core_fnc_GetSide) do {
		case WEST: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Blufor", ""]};
		case EAST: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Opfor", ""]};
		case INDEPENDENT: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Independent;", ""]};
		case CIVILIAN: {_marker = missionNamespace getVariable ["KGE_Respawn_SpawnMarker_Civilian", ""]};
	};
};

// Set respawn marker position
if(getMarkerType _marker != "") then {
	private ["_pos", "_dist", "_dir"];
	_pos = getMarkerPos _marker;
	_dist = random 10;
	_dir = random 360;

	_markerName setMarkerPosLocal [(_pos select 0) + (sin _dir) * _dist, (_pos select 1) + (cos _dir) * _dist, (_pos select 2)];
} else {
	["KGE_Respawn_fnc_KilledEH", "ERROR", localize "STR_Respawn_Marker_NotFound_Dead"] call KGE_Debug_fnc_AddLog;
};

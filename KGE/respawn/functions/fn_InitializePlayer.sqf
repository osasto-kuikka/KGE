waitUntil {!isNil "KGE_Player"};

KGE_Respawn_Initializedplayer = true;
KGE_Respawn_MaximumRespawns = missionNamespace getVariable ["KGE_Respawn_MaximumRespawns", 0];

// if respawn amount is less than -1 notify on invalid value
if(KGE_Respawn_MaximumRespawns <= -1) exitWith {["KGE_Respawn_fnc_Init", "ERROR", format[localize "STR_Respawn_Amount_ValueNotAllowed", KGE_Respawn_MaximumRespawns]] call KGE_Debug_fnc_AddLog};

if(missionNamespace getVariable ["KGE_JIP", false]) then {
	// For JIP player
	if !([KGE_Player] call KGE_Core_fnc_isAlive) then {
		// Set player dead
		[true] call KGE_Respawn_fnc_Dead;
	} else {
		// Save player respawn amount and list index
		KGE_Player setVariable ["KGE_Respawn_RespawnAmount", KGE_Player getVariable ["KGE_Respawn_RespawnAmount", 0]];
	};
} else {
	// Non-JIP players

	// Save player respawn amount and list index
	KGE_Player setVariable ["KGE_Respawn_RespawnAmount", 0];
};

// Add Respawn EH
KGE_Respawn_RespawnEHID = KGE_Player addEventHandler ["Respawn", {_this call KGE_Respawn_fnc_RespawnEH}];
KGE_Respawn_KilledEHID = KGE_Player addEventHandler ["Killed", {_this call KGE_Respawn_fnc_KilledEH}];
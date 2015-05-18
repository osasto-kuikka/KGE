if(KGE_Respawn_MaximumRespawns != -1 AND
	{((KGE_Player getVariable "KGE_Respawn_RespawnAmount") >= KGE_Respawn_MaximumRespawns OR !([KGE_Player] call KGE_Core_fnc_isAlive))}) then {

	// Set player dead
	[{
		[false] call KGE_Respawn_fnc_Dead;
	},[], 0.1, 0, true] call KGE_Core_fnc_ExecDelayed;

} else {

	// Spawn player
	[{
		[false] call KGE_Respawn_fnc_Spawn;
	},[], 0.1, 0, true] call KGE_Core_fnc_ExecDelayed;
};

// Remove dead body
_this call KGE_Respawn_fnc_RemoveBody;
// Player is dead
if(!([KGE_Player] call KGE_Core_fnc_isAlive)) exitWith {Hint localize "STR_Respawn_Left_Dead"};

// Player has unlimited respawns
if(KGE_Respawn_MaximumRespawns == -1) exitWith {Hint localize "STR_Respawn_Left_Unlimited"};

// Player has limited respawns left
Hint format[localize "STR_Respawn_Left_Amount", (KGE_Respawn_MaximumRespawns - (KGE_Player getVariable "KGE_Respawn_RespawnAmount"))];



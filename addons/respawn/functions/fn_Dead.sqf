private ["_pos"];

// Hide player
KGE_Player hideObjectGlobal true;

// Get land or sea position
_pos = getPosATL KGE_Player;
if(surfaceIsWater _pos) then {getPosASL KGE_Player};

// Set 10 to upwards
_pos set [2, (_pos select 2) + 10];

// Teleport and lock player there
[KGE_Player, _pos, 0] call KGE_Teleport_fnc_Teleport;
KGE_Player enableSimulationGlobal false;

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
[KGE_Player, false] call KGE_Core_fnc_SetAlive;

// Disable player movement
//[] call KGE_Respawn_fnc_AnimationLoop;

// Set player indestructable
KGE_Player allowDamage false;

// Start spectator
[] call KGE_Spectator_fnc_Start;
//[] call CSSA3_fnc_Initialize;



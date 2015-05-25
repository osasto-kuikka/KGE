class KGE_RespawnInit_Module: Module_F
{
	scope = 2;
	displayName = "Respawn";
	category = "KGE";
	function = "KGE_Respawn_fnc_Module";
	functionPriority = 0;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class MaximumRespawns
		{
			displayName = $STR_Respawn_Module_RespawnAmount_Name;
			description = $STR_Respawn_Module_RespawnAmount_Description;
			typeName = "NUMBER";
			defaultValue = 0;
		};
		class DeadplayerMarkerBlufor
		{
			displayName = $STR_Respawn_Module_BluforMarker_Dead_Name;
			description = $STR_Respawn_Module_BluforMarker_Dead_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class SpawnplayerMarkerBlufor
		{
			displayName = $STR_Respawn_Module_BluforMarker_Spawn_Name;
			description = $STR_Respawn_Module_BluforMarker_Spawn_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class DeadplayerMarkerOpfor
		{
			displayName = $STR_Respawn_Module_OpforMarker_Dead_Name;
			description = $STR_Respawn_Module_OpforMarker_Dead_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class SpawnplayerMarkerOpfor
		{
			displayName = $STR_Respawn_Module_OpforMarker_Spawn_Name;
			description = $STR_Respawn_Module_OpforMarker_Spawn_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class DeadplayerMarkerIndependent
		{
			displayName = $STR_Respawn_Module_IndependentMarker_Dead_Name;
			description = $STR_Respawn_Module_IndependentMarker_Dead_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class SpawnplayerMarkerIndependent
		{
			displayName = $STR_Respawn_Module_IndependentMarker_Spawn_Name;
			description = $STR_Respawn_Module_IndependentMarker_Spawn_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class DeadplayerMarkerCivilian
		{
			displayName = $STR_Respawn_Module_CivilianMarker_Dead_Name;
			description = $STR_Respawn_Module_CivilianMarker_Dead_Description;
			typeName = "STRING";
			defaultValue = "";
		};
		class SpawnplayerMarkerCivilian
		{
			displayName = $STR_Respawn_Module_CivilianMarker_Spawn_Name;
			description = $STR_Respawn_Module_CivilianMarker_Spawn_Description;
			typeName = "STRING";
			defaultValue = "";
		};
	};
	class ModuleDescription
	{
		description = $STR_Respawn_Module_Description;
		sync[] = {};
	};
};
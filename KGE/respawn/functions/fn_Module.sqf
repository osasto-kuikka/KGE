// Initialize Respawn
KGE_Respawn_Initialized = true;

// Get information from module
_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_moduleName = typeOf _logic;
_cfg = (ConfigFile >> "CfgVehicles" >> _moduleName >> "Arguments");
if (isClass _cfg) then {
	KGE_Respawn_MaximumRespawns = 			[_logic getVariable (ConfigName (_cfg select 0))] call BIS_fnc_parseNumber;
	KGE_Respawn_DeadMarker_Blufor = 		format["%1",(_logic getVariable (ConfigName (_cfg select 1)))];
	KGE_Respawn_SpawnMarker_Blufor = 		format["%1",(_logic getVariable (ConfigName (_cfg select 2)))];
	KGE_Respawn_DeadMarker_Opfor = 			format["%1",(_logic getVariable (ConfigName (_cfg select 3)))];
	KGE_Respawn_SpawnMarker_Opfor = 		format["%1",(_logic getVariable (ConfigName (_cfg select 4)))];
	KGE_Respawn_DeadMarker_Independent = 	format["%1",(_logic getVariable (ConfigName (_cfg select 5)))];
	KGE_Respawn_SpawnMarker_Independent = 	format["%1",(_logic getVariable (ConfigName (_cfg select 6)))];
	KGE_Respawn_DeadMarker_Civilian = 		format["%1",(_logic getVariable (ConfigName (_cfg select 7)))];
	KGE_Respawn_SpawnMarker_Civilian = 		format["%1",(_logic getVariable (ConfigName (_cfg select 8)))];
};

// Send values to all players
publicVariable "KGE_Respawn_MaximumRespawns";
publicVariable "KGE_Respawn_DeadMarker_Blufor";
publicVariable "KGE_Respawn_SpawnMarker_Blufor";
publicVariable "KGE_Respawn_DeadMarker_Opfor";
publicVariable "KGE_Respawn_SpawnMarker_Opfor";
publicVariable "KGE_Respawn_DeadpMarker_Independent";
publicVariable "KGE_Respawn_SpawnMarker_Independent";
publicVariable "KGE_Respawn_DeadMarker_Civilian";
publicVariable "KGE_Respawn_SpawnMarker_Civilian";
publicVariable "KGE_Respawn_Initialized";

_fnc_deleteDisconnected = {
    [{
    	_unit = (_this select 0) select 0;
    	if (!alive _unit) then {
            hideBody _unit;
        };
	}, _this, 3, 1, true] call KGE_Core_fnc_ExecDelayed;
    false
};

addMissionEventHandler ["HandleDisconnect", _fnc_deleteDisconnected];
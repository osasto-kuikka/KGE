/*
 * Author: nikolauska
 *
 * Returns player alive if KGE_Respawn is used.
 *
 * Argument:
 * 0: Unit, player name, Side, Array of units (OBJECT, STRING, SIDE, ARRAY)
 *
 * Return value:
 * Nothing
 */

private ["_unit"];

if(missionNamespace getVariable ["KGE_Respawn_Initializedplayer", false]) then {
	_unit = [_this, 0, objNull, [objNull, WEST, "", []]] call BIS_fnc_param;

	switch(typeName _unit) do {
		case "OBJECT": 	{
			if(!isNull _unit) then {
				if(!([_unit] call KGE_Core_fnc_isAlive)) then {
					if(local _unit) then {
						[true] spawn KGE_Respawn_fnc_Spawn;
					} else {
						[[true],"KGE_Respawn_fnc_Spawn", _unit] call KGE_Core_fnc_MP;
					};
				};
			} else {
				["KGE_Respawn_fnc_ReturnALive", "ERROR", localize "STR_Respawn_NullValueGiven"] call KGE_Debug_fnc_AddLog;
			};
		};

		case "STRING": {
			_unit = [_unit] call KGE_Respawn_fnc_GetUnitFromName;

			[_unit] call KGE_Respawn_fnc_ReturnAlive;
		};

		case "SIDE": {
			{
				[_x] call KGE_Respawn_fnc_ReturnAlive;
			} forEach ([[_unit]] call KGE_Core_fnc_GetDeadPlayers);
		};

		case "ARRAY": {
			{
				[_x] call KGE_Respawn_fnc_ReturnAlive;
			} forEach _unit;
		};
	};
} else {
	["KGE_Respawn_fnc_ReturnAlive", "ERROR", localize "STR_Respawn_RespawnNotStarted"] call KGE_Debug_fnc_AddLog;
};

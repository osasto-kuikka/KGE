/*
 * Author: nikolauska
 *
 * Sets KGE_Player dead if KGE_Respawn is used.
 *
 * Argument:
 * 0: Unit, KGE_Player name, Side (OBJECT, STRING, SIDE)
 *
 * Return value:
 * Nothing
 */
private ["_unit"];

if(!isNil "KGE_Respawn_Initializedplayer") then {
	_unit = [_this, 0, objNull, [objNull, WEST, "", []]] call BIS_fnc_param;

	switch(typeName _unit) do {
		case "OBJECT": 	{
			if(!isNull _unit) then {
				if([_unit] call KGE_Core_fnc_isAlive) then {
					if(local _unit) then {
						[true] spawn KGE_Respawn_fnc_Dead;
					} else {
						[[true],"KGE_Respawn_fnc_Dead", _unit] call KGE_Core_fnc_MP;
					};
				};
			} else {
				["KGE_Respawn_fnc_SetDead", "ERROR", localize "STR_Respawn_NullValueGiven"] call KGE_Debug_fnc_AddLog;
			};
		};

		case "STRING": 	{
			_unit = [_unit] call KGE_Respawn_fnc_GetUnitFromName;

			[_unit] call KGE_Respawn_fnc_SetDead;
		};

		case "SIDE": 	{
			{
				[_x] call KGE_Respawn_fnc_SetDead;
			} forEach ([[_unit]] call KGE_Core_fnc_GetAlivePlayers);
		};

		case "ARRAY": 	{
			{
				[_x] call KGE_Respawn_fnc_ReturnAlive;
			} forEach _unit;
		};
	};
} else {
	["KGE_Respawn_fnc_SetDead", "ERROR", localize "STR_Respawn_RespawnNotStarted"] call KGE_Debug_fnc_AddLog;
};

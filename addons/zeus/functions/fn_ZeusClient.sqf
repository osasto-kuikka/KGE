if (hasInterface) then {
	if (isNil "KGE_Zeus_CuratorModule") exitWith {["KGE_Zeus_fnc_ZeusClient", "ERROR", localize "STR_Zeus_NotFound_Module"] call KGE_Debug_fnc_AddLog;};

	[[KGE_Player, true], "KGE_Zeus_fnc_ZeusServer", 1] call KGE_Core_fnc_MP;

	Hint localize "STR_Zeus_Activated";
};

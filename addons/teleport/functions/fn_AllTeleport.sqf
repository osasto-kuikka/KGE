private ["_type", "_unitToTP", "_groupLeader"];

_type = [_this, 0, 3, [0]] call BIS_fnc_param;

switch (_type) do {
	case 0: {
		{
			[_x, KGE_Player] call KGE_Teleport_fnc_Teleport;
		} forEach ([] call KGE_Core_fnc_GetAlivePlayers);
	};
	case 1: {
		_unitToTP = [];
		{
			_groupLeader = [_x] call KGE_Core_fnc_GetGroupLeader;

			if(isPlayer _groupLeader) then {_unitToTP pushBack [_groupLeader, _x]};
		} forEach allGroups;

		{
			_groupLeader = _x select 0;
			_selectedGroup = _x select 1;

			{
				[_x, _groupLeader] call KGE_Teleport_fnc_Teleport;
			} forEach (units _selectedGroup);
		} forEach _unitToTP;
	};
	case 2: {
		_seh = [] call KGE_Teleport_fnc_MapClickPos;
		[{
			_seh = (_this select 0) select 0;
			if(!isNil "KGE_Teleport_MapClickPos") then {
				[_seh, "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

				{
					[_x, KGE_Teleport_MapClickPos] call KGE_Teleport_fnc_Teleport;
				} forEach ([] call KGE_Core_fnc_GetAlivePlayers);

				KGE_Teleport_MapClickPos = nil;

				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
		}, 0, [_seh]] call CBA_fnc_addPerFrameHandler;
	};

	default {
		["KGE_UI_fnc_AllTeleport", "ERROR", localize "STR_Teleport_TypeError"] call KGE_Debug_fnc_AddLog;
	};
};


private ["_type", "_groupLeader"];

_type = [_this, 0, -1, [0]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};

switch (_type) do {
	case 0: {
		[_unit, KGE_Player] call KGE_Teleport_fnc_Teleport;
	};
	case 1: {
		_groupLeader = [_unit] call KGE_Core_fnc_GetGroupLeader;
		[_unit, _groupLeader] call KGE_Teleport_fnc_Teleport;
	};
	case 2: {
		_seh = [] call KGE_Teleport_fnc_MapClickPos;
		[{
			private ["_seh", "_unitTP"];

			_seh = (_this select 0) select 0;
			_unitTP = (_this select 0) select 1;
			if(!isNil "KGE_Teleport_MapClickPos") then {
				[_seh, "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

				[_unitTP, KGE_Teleport_MapClickPos] call KGE_Teleport_fnc_Teleport;

				KGE_Teleport_MapClickPos = nil;

				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
		}, 0, [_seh, _unit]] call CBA_fnc_addPerFrameHandler;
	};

	default {
		["KGE_UI_fnc_SingleTeleport", "ERROR", localize "STR_Teleport_TypeError"] call KGE_Debug_fnc_AddLog;
	};
};
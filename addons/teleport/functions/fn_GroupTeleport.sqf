private ["_type", "_unit"];

_type = [_this, 0, 3, [0]] call BIS_fnc_param;
_unit = _this select 1;

switch (_type) do {
	case 0: {
		{
			[_x, KGE_Player] call KGE_Teleport_fnc_Teleport;
		} forEach (units (group _unit));
	};
	case 1: {
		{
			[_x, _unit] call KGE_Teleport_fnc_Teleport;
		} forEach (units (group _unit));
	};
	case 2: {
		_seh = [] call KGE_Teleport_fnc_MapClickPos;
		[{
			_seh = (_this select 0) select 0;
			_unit = (_this select 0) select 1;

			if(!isNil "KGE_Teleport_MapClickPos") then {
				[_seh, "onMapSingleClick"] call BIS_fnc_removeStackedEventHandler;

				{
					[_x, KGE_Teleport_MapClickPos] call KGE_Teleport_fnc_Teleport;
				} forEach (units (group _unit));

				KGE_Teleport_MapClickPos = nil;

				[_this select 1] call CBA_fnc_removePerFrameHandler;
			};
		}, 0, [_seh, _unit]] call CBA_fnc_addPerFrameHandler;
	};

	default {
		["KGE_UI_fnc_GroupTeleport", "ERROR", localize "STR_Teleport_TypeError"] call KGE_Debug_fnc_AddLog;
	};
};
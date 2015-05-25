private ["_type", "_typeUnits", "_menuArray", "_confirmText", "_action"];

_type = _this select 0;
_typeUnits = _this select 1;

_menuArray = [];

_confirmText = "";
_action = {};

switch (_typeUnits) do {
	case "SINGLE": {
		private ["_menuArrayRJ", "_menuArrayUnit", "_isLeader", "_isAdmin", "_unitName", "_leaderName"];

		_menuArrayRJ = [];
		_menuArrayUnit = [];

		{
			_isLeader = [_x] call KGE_Core_fnc_isLeader;
			_unitName = [_x] call KGE_Core_fnc_GetName;

			_action = compile format["[%1, %2] call KGE_Teleport_fnc_SingleTeleport", _type, _x];

			if(_x isEqualTo KGE_Player AND {_type != 0}) then {
				_menuArray pushBack [format["%1", _unitName], _action, _confirmText];
			} else {
				if(_isLeader AND {_type != 1}) then {
					_menuArrayRJ pushBack [format["%1", _unitName], _action, _confirmText];
				} else {
					_leaderName = [[_x] call KGE_Core_fnc_GetGroupLeader] call KGE_Core_fnc_GetName;
					_menuArrayUnit pushBack [format["%1", _unitName], _action, _confirmText];
				};
			};
		} forEach ([] call KGE_Core_fnc_GetAlivePlayers);

		// Add group leaders and units to main menu list
		_menuArray = _menuArray + _menuArrayRJ + _menuArrayUnit;

		if(count _menuArray != 0) then {
			[localize "STR_Teleport_TeleportPlayer_Header", _menuArray] call KGE_UI_fnc_OpenTemporaryMenu;
		};
	};

	case "GROUP": {
		private ["_leaderUnit", "_unitName"];

		{
			_leaderUnit = [_x] call KGE_Core_fnc_GetGroupLeader;

			if(isPlayer _leaderUnit) then {
				_unitName = [_leaderUnit] call KGE_Core_fnc_GetName;

				_action = compile format["[%1, %2] call KGE_Teleport_fnc_GroupTeleport", _type, _leaderUnit];

				_menuArray pushBack [format[localize "STR_Teleport_TeleportGroup_Interaction", _unitName], _action, _confirmText];
			};
		} forEach allGroups;

		if(count _menuArray != 0) then {
			[localize "STR_Teleport_TeleportGroup_Header", _menuArray] call KGE_UI_fnc_OpenTemporaryMenu;
		};
	};
};


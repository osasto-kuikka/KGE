private ["_menuArray", "_action", "_menuArrayRJ", "_menuArrayUnit", "_isLeader", "_isAdmin", "_unitName", "_leaderName"];

_menuArray = [];

_menuArrayRJ = [];
_menuArrayUnit = [];

{
	_unitName = [_x] call KGE_Core_fnc_GetName;

	_action = compile format["[%1] call KGE_Respawn_fnc_ReturnAlive", _x];

	_menuArray pushBack [_unitName, _action, ""];
} forEach ([] call KGE_Core_fnc_GetDeadPlayers);


{
	_menuArray pushBack _x;
} forEach _menuArrayUnit;

if(count _menuArray != 0) then {
	[localize "STR_Respawn_ReturnAliveSingle_Header", _menuArray] call KGE_UI_fnc_OpenTemporaryMenu;
};



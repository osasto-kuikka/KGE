private ["_Id", "_menu", "_menuID"];

_Id = [_this, 0, "", [""]] call BIS_fnc_param;

_menu = [];
{
	_menuID = _x select 2;

	if(_menuID == _Id) exitWith {_menu =_x};

} forEach KGE_UI_Menu;

if(count _menu != 0) then {
	KGE_UI_Menu = KGE_UI_Menu - _menu;
} else {
	["KGE_UI_fnc_DeleteMenu", "ERROR", format[localize "STR_UI_NotFound_MenuID", _Id]] call KGE_Debug_fnc_AddLog;
};
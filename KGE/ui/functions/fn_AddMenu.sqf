private ["_id", "_text", "_exists", "_menuID"];

_id = [_this, 0, "", [""]] call BIS_fnc_param;
_text = [_this, 1, "", [""]] call BIS_fnc_param;

_exists = false;
if(isNil "KGE_UI_Menu") then {
	KGE_UI_Menu = [];
} else {
	{
		_menuID = _x select 0;
		if(_menuID == _id) exitWith {_exists = true};
	} forEach KGE_UI_Menu;
};

if(!_exists) then {
	KGE_UI_Menu pushBack [_id, _text, []];
} else {
	["KGE_UI_fnc_AddMenu", "ERROR", format[localize "STR_UI_Exists_MenuID", _id]] call KGE_Debug_fnc_AddLog;
};





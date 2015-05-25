private ["_id", "_text", "_action", "_needsAdmin", "_needsVariable", "_confirmationMessage", "_indexText", "_menuID", "_menuInteractionArray", "_array"];

if(isNil "KGE_UI_Menu") exitWith {["KGE_UI_fnc_Addinteraction", "ERROR", localize "STR_UI_NotFound_Menu"] call KGE_Debug_fnc_AddLog;};

_id = [_this, 0, "", [""]] call BIS_fnc_param;
_text = [_this, 1, "", [""]] call BIS_fnc_param;
_action = [_this, 2, "", ["", {}]] call BIS_fnc_param;
_needsAdmin = [_this, 3, false, [true]] call BIS_fnc_param;
_needsVariable = [_this, 4, "", [""]] call BIS_fnc_param;
_confirmationMessage = [_this, 5, "", [""]] call BIS_fnc_param;


_array = [_text, _action, _needsAdmin, _needsVariable, _confirmationMessage];

_indexText = "";
{
	_menuID = _x select 0;
	_menuInteractionArray = _x select 2;
	if(_id == _menuID) exitWith {
		_indexText = format["%1%2%3",_menuID, count _menuInteractionArray, _forEachIndex];
		_array pushBack _indexText;
		_menuInteractionArray pushBack _array;
	};
} forEach KGE_UI_Menu;

if(_indexText == "") then {
	["KGE_UI_fnc_Addinteraction", "ERROR", format[localize "STR_UI_NotFound_MenuID", _id]] call KGE_Debug_fnc_AddLog;
};

_indexText

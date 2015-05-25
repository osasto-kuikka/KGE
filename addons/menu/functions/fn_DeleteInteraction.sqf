private ["_Id", "_interaction", "_menu", "_interactions", "_interactionID", "_menuInteractions"];

_Id = [_this, 0, "", [""]] call BIS_fnc_param;

_interaction = [];
_menu = [];
{
	_menu = _x;
	_interactions = _x select 1;
	{
		_interactionID = _x select 5;
		if(_interactionID == _Id) exitWith {_interaction = _x};
	} forEach _interactions;

} forEach KGE_UI_Menu;

if(count _interaction != 0) then {
	_menuInteractions = _menu select 2;

	_menuInteractions = _menuInteractions - _interaction;
} else {
	["KGE_UI_fnc_DeleteInteraction", "ERROR", format[localize "STR_UI_NotFound_MenuID", _Id]] call KGE_Debug_fnc_AddLog;
}

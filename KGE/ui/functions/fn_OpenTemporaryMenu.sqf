private ["_menuHeader", "_array", "_index"];

_menuHeader = [_this, 0, "", [""]] call BIS_fnc_param;
_array = [_this, 1, [], [[]]] call BIS_fnc_param; // ["button text", "command" OR {command}, "Confirm message"]

// Old menu system
if (dialog) then { closeDialog 0; };

createDialog "KGE_GUI_Menu";
call KGE_UI_fnc_EmptyMenu;

ctrlShow [5133, true];
ctrlShow [5134, true];

ctrlSetText [5134, _menuHeader];

if(count _array != 0) then {
	{
		_index = lbAdd [5133, _x select 0];
		lbSetData [5133, _index, format["%1",[_x select 1, _x select 2]]];
	} forEach _array;
} else {
	Hint localize "STR_UI_Empty_Menu";
};

// New menu system
/*
// Add header text
//["header", 0, _menuHeader] call KGE_UI_fnc_UIHandler;

if(count _array != 0) then {
	KGE_UI_Buttons = [];

	{
		["add", _forEachIndex, [(_x select 0), (_x select 1), (_x select 2)]] call KGE_UI_fnc_UIHandler;
	} forEach _array;
} else {
	Hint localize "STR_UI_Empty_Menu";
};

["open"] call KGE_UI_fnc_UIHandler;
*/
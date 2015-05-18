private ["_id", "_menu", "_menuID", "_needAdmin", "_needVariable", "_hasVariable", "_hasRights", "_index"];

_id = [_this, 0, "", [""]] call BIS_fnc_param;

_menu = [];
{
	_menuID = _x select 0;
	if(_menuID == _id) exitWith {_menu =_x};
} forEach KGE_UI_Menu;

if(count _menu != 0) then {

	KGE_UI_Buttons = [];

	// Add header text
	["header", 0, _menu select 1] call KGE_UI_fnc_UIHandler;

	// Loop through all passible UI values
	_number = 0;
	{
		_text = [_x, 0, "", [""]] call BIS_fnc_paramIn;
		_code = [_x, 1, {}, [{}]] call BIS_fnc_paramIn;
		_needAdmin = [_x, 2, false, [false]] call BIS_fnc_paramIn;
		_needVariable = [_x, 3, "", [""]] call BIS_fnc_paramIn;
		_confirmation = [_x, 4, "", [""]] call BIS_fnc_paramIn;

		_hasVariable = false;
		_hasRights = false;

		if(_needVariable == "") then {
			_hasVariable = true;
		} else {
			if(missionNamespace getVariable [_needVariable, false]) then {
				_hasVariable = true;
			};
		};

		if([] call KGE_Core_fnc_IsAdmin) then {
			_hasRights = true;
		} else {
			if(!_needAdmin) then {
				_hasRights = true;
			};
		};

		if(_hasVariable AND {_hasRights}) then {
			["add", _number, [_text, _code, _confirmation]] call KGE_UI_fnc_UIHandler;
			_number = _number + 1;
		};

	} forEach (_menu select 2);

	["open"] call KGE_UI_fnc_UIHandler;

	/*
	if (dialog) then { closeDialog 0; };

	createDialog "KGE_GUI_Menu";
	call KGE_UI_fnc_EmptyMenu;

	ctrlShow [5124, true];
	ctrlShow [5125, true];

	ctrlSetText [5125, _menu select 1];


	{
		_needAdmin = _x select 2;
		_needVariable = _x select 3;
		_hasVariable = false;
		_hasRights = false;

		if(_needVariable == "") then {
			_hasVariable = true;
		} else {
			if(missionNamespace getVariable [_needVariable, false]) then {
				_hasVariable = true;
			};
		};

		if([] call KGE_Core_fnc_IsAdmin) then {
			_hasRights = true;
		} else {
			if(!_needAdmin) then {
				_hasRights = true;
			};
		};

		if(_hasVariable AND {_hasRights}) then {
			_index = lbAdd [5124, _x select 0];
			lbSetData [5124, _index, format["%1",[_x select 1, _x select 4]]];
		};
	} forEach (_menu select 2);
	*/
} else {
	["KGE_UI_fnc_OpenMenu", "ERROR", format[localize "STR_UI_NotFound_MenuID", _id]] call KGE_Debug_fnc_AddLog;
};
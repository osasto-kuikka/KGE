private ["_selectedEntry", "_selectedEntryData", "_selectedEntryDataArray", "_action", "_confirmation", "_code"];

_selectedEntry = lbCurSel 5133;
_selectedEntryData = lbData [5133, _selectedEntry];

if (!isNil "_selectedEntryData") then {

	closeDialog 0;

	_selectedEntryDataArray = call compile _selectedEntryData;
	_action = _selectedEntryDataArray select 0;
	_confirmation = _selectedEntryDataArray select 1;
	_code = {};

	if(typeName _action == "STRING") then {
		_code = compile _action;
	} else {
		if(typeName _action == "CODE") then {
			_code = _action;
		};
	};

	if(_confirmation == "") then {
		call _code;
	} else {
		if([_confirmation] call KGE_UI_fnc_Confirmation) then {
			call _code;
		};
	};
};

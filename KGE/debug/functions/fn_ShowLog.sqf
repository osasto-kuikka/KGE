_returnMessage = _this select 0;
_returnArrayString = _this select 1;

if(_returnMessage == "OK") then {
	_KGE_Debug_Log = call compile _returnArrayString;

	_LogTextAll = "";
	{

		_Script = _x select 0;
		_Type = _x select 1;
		_logText = _x select 2;

		_color = "";
		switch (_Type) do {
			case "ERROR": {_color = "#FF0000"};
			case "WARNING": {_color = "#FFFF00"};
			default {_color = "#FFFFFF"};
		};

		_LogTextAll = _LogTextAll + format["<font color='%1'>[%2][%3] %4</font><br/><br/>", _color, _Type, _Script, _logText];
	} forEach _KGE_Debug_Log;

	// Add Diary Subject
	if(!(KGE_Player diarySubjectExists "KGE_debug")) then {KGE_Player createDiarySubject ["KGE_debug", "KGE DEBUG"]};
	if(isNil "KGE_Debug_LogIteration") then {KGE_Debug_LogIteration = 0};

	KGE_Debug_LogIteration = KGE_Debug_LogIteration + 1;

	KGE_Player createDiaryRecord ["KGE_debug", [format["LOG - %1",KGE_Debug_LogIteration], _LogTextAll]];

	hint localize "STR_Debug_LogAdded";
};

if(_returnMessage == "Empty") then {
	hint localize "STR_Debug_LogEmpty";
};

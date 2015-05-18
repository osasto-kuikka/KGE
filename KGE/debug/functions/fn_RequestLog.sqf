if(isServer) then {
	_returnUnit = _this select 0;
	_returnMessage = "OK";

	if(isNil "KGE_Debug_LogArray") then {
		KGE_Debug_LogArray = [];
	};

	if(count KGE_Debug_LogArray == 0) then {
		_returnMessage = "Empty";
	};

	_string = format["%1", KGE_Debug_LogArray];

	if(hasInterface) then {
		[_returnMessage, _string] call KGE_Debug_fnc_ShowLog;
	} else {
		[[_returnMessage, _string], "KGE_Debug_fnc_ShowLog", _returnUnit] call KGE_Core_fnc_MP;
	};
} else {
	[[KGE_Player], "KGE_Debug_fnc_RequestLog", 1] call KGE_Core_fnc_MP;
};


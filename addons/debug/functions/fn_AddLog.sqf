_Script = _this select 0;
_Type = _this select 1;
_Text = _this select 2;

if(isServer) then {
	if(isNil "KGE_Debug_LogArray") then {
		KGE_Debug_LogArray = [];
	};

	KGE_Debug_LogArray pushBack [_Script, _Type, _Text];
} else {
	[[_Script, _Type, _Text], "KGE_Debug_fnc_AddLog", 1] call KGE_Core_fnc_MP;

	hint localize "STR_Debug_NewLog";
};




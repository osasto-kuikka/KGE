_hostage = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

if(isNull _hostage OR isNull _caller) exitWith {};


_hostage setVariable ["KGE_Hostage_captured", true, true];

[_hostage, _caller] call KGE_Core_fnc_JoinGroup;

["Panttivanki turvattu!"] call KGE_Core_fnc_Hint;

// [[_hostage], "KGE_Hostage_RemoveAction"] call KGE_Core_fnc_MP;
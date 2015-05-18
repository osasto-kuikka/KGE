_hostage = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _hostage) exitWith {};

[_hostage] call KGE_Core_fnc_JoinGroup;

_hostage setVariable ["KGE_Hostage_secured", true, true];

titleText ["Panttivanki turvattu!", "PLAIN"];
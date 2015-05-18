_hostage = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _hostage) exitWith {};

if !(_hostage getVariable ["KGE_Hostage_secured", false]) then {
	[_hostage] call KGE_Core_fnc_JoinGroup;

	[[_hostage], "KGE_Hostage_RemoveAction"] call KGE_Core_fnc_MP;

	titleText ["Panttivanki kuoli!", "PLAIN"];
};
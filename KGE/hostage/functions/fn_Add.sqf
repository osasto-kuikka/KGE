_hostage = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

if(isNull _hostage OR !alive _hostage) exitWith {};

if(isNil "KGE_Hostage_Action") then {KGE_Hostage_Action = []};

if(isServer) then {
	_hostage setVariable ["KGE_Hostage_captured", false, true];
	_hostage setVariable ["KGE_Hostage_secured", false, true];
};

if(hasInterface) then {
	if !(_hostage getVariable ["KGE_Hostage_captured", false]) then {
		KGE_Hostage_Action pushBack [_hostage, _hostage addaction [format["<t color=""#0000FF"">%1</t>", "Turvaa Panttivanki"], { _this call KGE_Hostage_fnc_Capture }]];
	};
};
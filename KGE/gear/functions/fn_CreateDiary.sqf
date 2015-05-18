private ["_dialogText"];

_dialogText = "";
if((KGE_Player getVariable "KGE_Gear_DialogCount") == 0) then {
	_dialogText = (localize "STR_Gear_InitNotification" + "<br/><br/>");
};

{
	_dialogText = _dialogText + ([_x, _forEachIndex + 1] call KGE_Gear_fnc_GetUnitGear);
} forEach (units (group KGE_Player));

player createDiaryRecord ["KGE_Gear", [format [localize "STR_Gear_DiaryRecord", (KGE_Player getVariable "KGE_Gear_DialogCount")], _dialogText]];

KGE_Player setVariable ["KGE_Gear_DialogCount", (KGE_Player getVariable "KGE_Gear_DialogCount") + 1];
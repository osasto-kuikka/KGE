private ["_toHint", "_title", "_teamrosterText", "_groupText"];

_toHint = [_this, 0, false, [false]] call BIS_fnc_param;
_teamrosterText = "";

// Loop throug all units and add everybody you have access to see to _teamrosterText
{
	// If unit is marked skippable then skip it
	if (!(_x getVariable ["KGE_TeamRoster_Skip", false])) then {
		_groupText = [_x, _toHint] call KGE_TeamRoster_fnc_GetPlayerEntry;
		_teamrosterText = _teamrosterText + _groupText;
	};

} forEach ([] call KGE_Core_fnc_GetAlivePlayers);

// Show hint if _toHint is true, else add to map screen and update iteration number
if(_toHint) then {
	Hint parseText _teamrosterText;
} else {
	_title = format[localize "STR_TeamRoster_Diary", side (group KGE_Player), (KGE_Player getVariable "KGE_TeamRoster_Iteration")];

	KGE_Player createDiaryRecord ["roster", [_title, _teamrosterText]];
	KGE_Player setVariable ["KGE_TeamRoster_Iteration", (KGE_Player getVariable "KGE_TeamRoster_Iteration") + 1];
};


private ["_unit", "_toHint", "_returnString", "_unitName", "_unitDesc", "_unitRank"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_toHint = [_this, 1, false, [false]] call BIS_fnc_param;
_returnString = "";

// If unit is null then don't add any text
if(isNull _unit) exitWith {_returnString};
if !([_unit] call KGE_Core_fnc_isAlive) exitWith {_returnString};

// If unit is leader then add groupID if groupID is set to be shown
if ([_unit] call KGE_Core_fnc_isLeader) then {
	if (!_toHint) then {_returnString = "<br/>" + (format["%1%2", (group _unit), " - "])}
	else {_returnString = "<br/>"};
} else {
	//If map screen message is asked then add indent for not leader unit
	if(!_toHint) then {
		_returnString = _returnString + "	";
	};
};

// Get unit profile name and game name
_unitName = [_unit] call KGE_Core_fnc_GetName;
_unitDesc = str(_unit);

// Get unit rank
_unitRank = switch (rankId _unit) do {
				case 0: {(localize "STR_TeamRoster_Rank_Private" + " ")};
				case 1: {(localize "STR_TeamRoster_Rank_Corporal" + " ")};
				case 2: {(localize "STR_TeamRoster_Rank_Sergeant" + " ")};
				case 3: {(localize "STR_TeamRoster_Rank_Lieutenant" + " ")};
				case 4: {(localize "STR_TeamRoster_Rank_Captain" + " ")};
				case 5: {(localize "STR_TeamRoster_Rank_Major" + " ")};
				case 6: {(localize "STR_TeamRoster_Rank_Colonel" + " ")};
				default {" "};
			};

// If unit game name is empty then add player
if (_unitDesc == "") then {
	_unitDesc = "Player";
} else {
	// Doing some edits to the player's description
	_unitDesc = ([_unitDesc, "_"] call CBA_fnc_split) select 0; // All text before the first char
	_unitDesc = [_unitDesc, "69", " "] call CBA_fnc_replace;
};

// Add whole text to return string
_returnString = format["%1%2%3 (%4)<br/>",_returnString, _unitRank, _unitName, _unitDesc]; // "Alpha Squad - Sgt. Crackman (Squad Leader)" or "    Pvt. Crackman (Machinegunner)"

// Return text
_returnString
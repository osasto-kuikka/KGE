/*
 * Author: nikolauska
 *
 * Get all playable units (works on single and multiplayer)
 *
 * Argument:
 *
 *
 * Return value:
 * Array
 */

private ["_allUnits", "_playerUnits"];

_side = [_this, 0, [WEST, EAST, INDEPENDENT, CIVILIAN], [[], WEST]] call BIS_fnc_param;
_onlyPlayers = [_this, 1, true, [true]] call BIS_fnc_param;

// Get all playable units
_allUnits = if(isMultiplayer) then {playableUnits} else {switchableUnits};
_playerUnits = [];

if(_onlyPlayers) then {
	// Remove AI players from list
	{
		if(isPlayer _x) then {
			if(typeName _side == "SIDE" AND {([_x] call KGE_Core_fnc_GetSide) isEqualTo _side}) then {
				_playerUnits pushBack _x;
			};
			if(typeName _side == "ARRAY" AND {([_x] call KGE_Core_fnc_GetSide) in _side}) then {
				_playerUnits pushBack _x;
			};
		};
	} forEach _allUnits;
} else {
	_playerUnits = _allUnits;
};

// Return filtered playableUnits
_playerUnits
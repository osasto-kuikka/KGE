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

private ["_side", "_onlyPlayers", "_playerUnits"];

_side = [_this, 0, [WEST, EAST, INDEPENDENT, CIVILIAN], [[], WEST]] call BIS_fnc_param;

// Get all playable units
_playerUnits = [];

{
	if(isPlayer _x) then {
		if(typeName _side == "SIDE" AND {([_x] call KGE_Core_fnc_GetSide) isEqualTo _side}) then {
			_playerUnits pushBack _x;
		};
		if(typeName _side == "ARRAY" AND {([_x] call KGE_Core_fnc_GetSide) in _side}) then {
			_playerUnits pushBack _x;
		};
	};
} forEach (call cba_fnc_players);

// Return filtered playableUnits
_playerUnits
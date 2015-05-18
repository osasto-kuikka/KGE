/*
 * Author: nikolauska
 *
 * Get array of all alive players (Can be defined what side listed units should be)
 *
 * Argument:
 * 0: Sides, side or group (ARRAY, SIDE, GROUP)
 *
 * Return value:
 * Array
 */

private["_side", "_deadList"];

_value = [_this, 0, [WEST, EAST, INDEPENDENT, CIVILIAN], [[], WEST, grpNull]] call BIS_fnc_param;

_deadList = [];

switch(typeName _value) do {
	case "ARRAY": {
		{
			if(([_x] call KGE_Core_fnc_GetSide) in _value) then {
				if(!([_x] call KGE_Core_fnc_isAlive)) then {_deadList pushBack _x};
			};
		} forEach ([] call KGE_Core_fnc_GetAllPlayers);
	};
	case "GROUP": {
		{
			if(!([_x] call KGE_Core_fnc_isAlive)) then {_deadList pushBack _x};
		} forEach (units _value);
	};
	case "SIDE": {
		{
			if(isPlayer _x) then {
				if(([_x] call KGE_Core_fnc_GetSide) isEqualTo _value) then {
					if(!([_x] call KGE_Core_fnc_isAlive)) then {_deadList pushBack _x};
				};
			};
		} forEach ([] call KGE_Core_fnc_GetAllPlayers);
	};
};

_deadList
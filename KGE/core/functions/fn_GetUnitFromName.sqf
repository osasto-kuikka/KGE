/*
 * Author: nikolauska
 *
 * Search unit object from player name given. Return null if not found
 *
 * Argument:
 * 0: Player name (String)
 *
 * Return value:
 * Object
 */
_playerName = _this select 0;
_unit = objNull;

try {
	{
		if(isPlayer _x) then {
			if(toUpper _playerName ==  toUpper ([_x] call KGE_Core_fnc_GetName)) then {
				throw _x;
			};
		};
	} ForEach ([] call KGE_Core_GetAllPlayers);
} catch {_unit = _exception};

_unit
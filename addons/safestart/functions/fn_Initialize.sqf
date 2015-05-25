/*
 * Author: nikolauska
 *
 * Initializes Safestart for specific sides
 *
 * Argument:
 * 0: Sides (Array, Side)
 *
 * Return value:
 *
 */

private ["_sides"];

_sides = [_this, 0, [WEST, EAST, INDEPENDENT, CIVILIAN], [[], WEST]] call BIS_fnc_param;

if(isServer) then
{
	if(WEST in _sides) then {KGE_SafeStart_West = true; publicVariable "KGE_SafeStart_West"};
	if(EAST in _sides) then {KGE_SafeStart_East = true; publicVariable "KGE_SafeStart_East"};
	if(INDEPENDENT in _sides) then {KGE_SafeStart_Independent = true; publicVariable "KGE_SafeStart_Independent"};
	if(CIVILIAN in _sides) then {KGE_SafeStart_Civilian = true; publicVariable "KGE_SafeStart_Civilian"};

	KGE_SafeStart_Initialized = true; publicVariable "KGE_SafeStart_Initialized";
};

if(hasInterface) then {

	[{
		// Check if side has safe start
		_isSafeStart = call {
			_side = [KGE_Player] call KGE_Core_fnc_GetSide;
			if(_side isEqualTo WEST) exitWith {!isNil "KGE_SafeStart_West"};
			if(_side isEqualTo EAST) exitWith {!isNil "KGE_SafeStart_East"};
			if(_side isEqualTo INDEPENDENT) exitWith {!isNil "KGE_SafeStart_Independent"};
			if(_side isEqualTo CIVILIAN) exitWith {!isNil "KGE_SafeStart_Civilian"};
		};

		// If player side is not on safestart then don't start message loop
		if (!_isSafeStart) exitWith {};

		[true] call KGE_SafeStart_fnc_Safety;

		// Message loop
		[{
			private ["_isSafeStart"];

			// Check if side has safe start
			_isSafeStart = call {
				_side = [KGE_Player] call KGE_Core_fnc_GetSide;
				if(_side isEqualTo WEST) exitWith {!isNil "KGE_SafeStart_West"};
				if(_side isEqualTo EAST) exitWith {!isNil "KGE_SafeStart_East"};
				if(_side isEqualTo INDEPENDENT) exitWith {!isNil "KGE_SafeStart_Independent"};
				if(_side isEqualTo CIVILIAN) exitWith {!isNil "KGE_SafeStart_Civilian"};
			};

			if(_isSafeStart) then {
				titleText ["Safestart käynnissä! Odota pelin alkua...", "PLAIN"];
			} else {
				titleText ["Peli käynnistyy..", "PLAIN"];
				[false] call KGE_SafeStart_fnc_Safety;
				[_this select 1] call CBA_fnc_addPerFrameHandler;
			};
		}, 1, 0] call CBA_fnc_addPerFrameHandler;

	}, [], 2, 1] call KGE_Core_fnc_ExecDelayed;
}


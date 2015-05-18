/*
 * Author: nikolauska
 *
 * Remove safestart on client side
 *
 * Argument:
 * 0: Sides (Array, Side)
 *
 * Return value:
 *
 */

_sides = [_this, 0, [WEST, EAST, INDEPENDENT, CIVILIAN], [[], WEST]] call BIS_fnc_param;

if(WEST in _sides OR _sides == WEST) then {KGE_SafeStart_West = nil};
if(EAST in _sides OR _sides == EAST) then {KGE_SafeStart_East = nil};
if(INDEPENDENT in _sides OR _sides == INDEPENDENT) then {KGE_SafeStart_Independent = nil};
if(CIVILIAN in _sides OR _sides == CIVILIAN) then {KGE_SafeStart_Civilian = nil};

try {
	if(!isNil "KGE_SafeStart_West") then {throw true};
	if(!isNil "KGE_SafeStart_East") then {throw true};
	if(!isNil "KGE_SafeStart_Independent") then {throw true};
	if(!isNil "KGE_SafeStart_Civilian") then {throw true};
	throw false
} catch {
	if(!_exception) then {
		KGE_SafeStart_Initialized = false;
	};	
};

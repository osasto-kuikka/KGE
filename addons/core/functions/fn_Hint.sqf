/*
 * Author: nikolauska
 *
 * Show hint message. Used for KGE_Core_fnc_MP
 *
 * Argument:
 * 0: Message (String)
 * 1: Silent hint (Bool)
 *
 * Return value:
 * none
 */

_message = [_this, 0, "", [""]] call BIS_fnc_param;
_silent = [_this, 1, false, [false]] call BIS_fnc_param;

if(_silent) then {
	hintSilent _message;
} else {
	hint _message;
};

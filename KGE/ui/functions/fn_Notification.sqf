/*
 * Author: nikolauska
 *
 * Shows notification on screen
 *
 * Argument:
 * 0: Message (String)
 * 1: Header (String) (Currently only allowed header is generic and it's put there automatically)
 *
 * Return value:
 *
 */

private ["_header", "_message"];

_message = [_this, 0, "", [""]] call BIS_fnc_param;
_header = [_this, 1, "Generic", [""]] call BIS_fnc_param;

[_header,[_message]] call BIS_fnc_showNotification;
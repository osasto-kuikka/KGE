/*
 * Author: nikolauska
 *
 * Sends remove safestart for all clients
 *
 * Argument:
 * 0: Sides (Array, Side)
 *
 * Return value:
 *
 */

_sides = [_this, 0, [WEST, EAST, INDEPENDENT, CIVILIAN], [[], WEST]] call BIS_fnc_param;

[_sides, "KGE_SafeStart_fnc_RemoveClient"] call KGE_Core_fnc_MP;
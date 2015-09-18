/*
 * Author: nikolauska
 *
 * When player is stuck on animation this script will unstuck player
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

private ["_pos", "_dir", "_fixer"];

_pos = (getpos KGE_player);
_dir = (getdir KGE_player);

_fixer = "B_Quadbike_01_F" createVehicleLocal (KGE_player modelToWorld [0,-10,0]);
KGE_player moveincargo _fixer;
KGE_player action ["eject", vehicle KGE_player];
deletevehicle _fixer;
KGE_player setpos _pos;
KGE_player setdir _dir;

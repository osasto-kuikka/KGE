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

private ["_pos", "_dir", "_fixer"];

_pos = (getpos KGE_Player);
_dir = (getdir KGE_Player);

_fixer = "B_Quadbike_01_F" createVehicleLocal (KGE_Player modelToWorld [0,-10,0]);
KGE_Player moveincargo _fixer;
KGE_Player action ["eject", vehicle KGE_Player];
deletevehicle _fixer;
KGE_Player setpos _pos;
KGE_Player setdir _dir; 
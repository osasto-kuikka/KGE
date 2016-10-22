/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Get player animation based on weapon and autorun mode
 *
 * Argument:
 * 0: Mode <STRING>
 *
 * Return:
 * Animation <STRING>
 */

#include "script_component.hpp"

params ["_mode"];

private _weap = currentWeapon KGE_Player;

if(_mode == SPRINT) exitWith {
  if(_weap == "")                         exitWith {"amovpercmevasnonwnondf"};
  if(_weap == handgunWeapon KGE_Player)   exitWith {"amovpercmevaslowwpstdf"};
  if(_weap == primaryWeapon KGE_Player)   exitWith {"amovpercmevaslowwrfldf"};
  if(_weap == secondaryWeapon KGE_Player) exitWith {"amovpercmevaslowwlnrdf"};
  if(_weap == binocular KGE_Player)       exitWith {"amovpercmevasnonwbindf"};
};
if(_mode == WALK) exitWith {
  if(_weap == "")                         exitWith {"amovpercmwlksnonwnondf"};
  if(_weap == handgunWeapon KGE_Player)   exitWith {"amovpercmwlkslowwpstdf"};
  if(_weap == primaryWeapon KGE_Player)   exitWith {"amovpercmwlkslowwrfldf"};
  if(_weap == secondaryWeapon KGE_Player) exitWith {"amovpercmwlksraswlnrdf"};
  if(_weap == binocular KGE_Player)       exitWith {"amovpercmwlksoptwbindf"};
};
if(_mode == JOG) exitWith {
  if(_weap == "")                         exitWith {"amovpercmrunsnonwnondf"};
  if(_weap == handgunWeapon KGE_Player)   exitWith {"amovpercmrunslowwpstdf"};
  if(_weap == primaryWeapon KGE_Player)   exitWith {"amovpercmrunslowwrfldf"};
  if(_weap == secondaryWeapon KGE_Player) exitWith {"amovpercmrunsraswlnrdf"};
  if(_weap == binocular KGE_Player)       exitWith {"amovpercmrunsnonwbindf"};
};

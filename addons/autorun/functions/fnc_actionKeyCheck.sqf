/*
 * Author: nikolauska
 *
 * Check if disabling actionkey has been pressed
 *
 * Argument:
 * 1: Keycode <NUMBER>
 *
 * Return:
 * None
 */

#include "script_component.hpp"

params ["", "_keycode"];

if !(GVAR(isAutoRunActive)) exitWith {};

{
  params ["_action"];

  if(_keyCode in actionKeys _action) exitWith {
    GVAR(isAutoRunActive) = false;

    if(_action == "MoveUp") then { _action = "PlayerCrouch"; };
    if(_action == "MoveDown") then { _action = "PlayerProne"; };

    KGE_Player playActionNow _action;
  };
} forEach GVAR(disablingActions);


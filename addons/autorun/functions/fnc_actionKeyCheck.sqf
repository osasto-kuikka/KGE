/*
 * Author: nikolauska
 *
 * Check if disabling actionkey has been pressed
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "script_component.hpp"

params ["_control", "_keycode"];

if !(GVAR(isAutoRunActive)) exitWith {};

{
    if(_keyCode in actionKeys _x) exitWith {
        GVAR(isAutoRunActive) = false;
        //KGE_Player switchMove "";

        KGE_LOGINFO("Autorun stopped");

        [{
            params ["_action"];

            if(_action == "MoveUp") then {
                    _action = "PlayerCrouch";
            };
            if(_action == "MoveDown") then {
                    _action = "PlayerProne";
            };

            KGE_Player playActionNow _action;
        }, [_x], 0.01] call EFUNC(common,waitUntil);

    };
} forEach GVAR(disablingActions);

#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// Autorun loop
[{
    if !(GVAR(isAutoRunActive) || !(call FUNC(canAutoRun))) exitWith {};

    private ["_animation"];
    _animation = GVAR(autoRunMode) call FUNC(getAnimation);

    KGE_Player playMoveNow _animation;
}, 0.02, []] call CBA_fnc_addPerFrameHandler;

// Start spectator if killed unit is player and add given unit to blacklist
["KGE_onKilled", {
    params ["_unit"];

    if(_unit isEqualTo KGE_Player) then {
        GVAR(alive) = false;
    };
}] call cba_fnc_addEventHandler;

// Stop spectator if respawning unit is player and remove unit from blacklist
["KGE_onRespawn", {
    params ["_unit"];

    if(_unit isEqualTo KGE_Player) then {
        GVAR(alive) = true;
    };
}] call cba_fnc_addEventHandler;


["KGE Autorun","kge_autorun_toggle", "Starts and stops autorun", {call FUNC(toggleOn); true}, {true}, [DIK_C, [false, true, false]]] call CBA_fnc_addKeybind;
["KGE Autorun","kge_autorun_mode", "Change autorun mode", {call FUNC(toggleMode); true}, {true}, [DIK_B, [false, true, false]]] call CBA_fnc_addKeybind;

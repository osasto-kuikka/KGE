#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

["KGE","kge_autorun_toggle", "Starts and stops autorun", {call FUNC(toggleOn); true}, {true}, [DIK_C, [false, true, false]], false] call CBA_fnc_addKeybind;
["KGE","kge_autorun_mode", "Change autorun mode", {call FUNC(toggleMode); true}, {true}, [DIK_B, [false, true, false]], false] call CBA_fnc_addKeybind;

[{
    (findDisplay 46) displayAddEventHandler ["KeyDown", {_this call FUNC(actionKeyCheck); false}];
}, [], {!(isNull (findDisplay 46))}] call EFUNC(common,waitUntil);

// Disable autorun when teleported
[QEGVAR(teleport,onTeleport), {
    GVAR(isAutoRunActive) = false;
    KGE_Player playMoveNow "";
}] call CBA_fnc_addEventHandler;

["ace_common_forceWalk", {
  params ["_unit", "_set"];

  if(local _unit) then {
    GVAR(forceWalk) = _set;
  };
}] call CBA_fnc_addEventHandler;

KGE_LOGINFO("Autorun Module Initialized.");

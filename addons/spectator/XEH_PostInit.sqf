#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// Start spectator if killed unit is player and add given unit to blacklist
["KGE_onKilled", {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = false;
        [true] call FUNC(setSpectator);
    } else {
        call FUNC(updateUnits);
    };
}] call cba_fnc_addEventHandler;

// Stop spectator if respawning unit is player and remove unit from blacklist
["KGE_onRespawn", {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = true;
        [false] call FUNC(setSpectator);
    } else {
        call FUNC(updateUnits);
    };
}] call cba_fnc_addEventHandler;

["KGE Spectator","kge_spectator_start", "Starts spectator", {[true] call FUNC(setSpectator); true}, {true}, [59, [false, false, false]]] call CBA_fnc_addKeybind;

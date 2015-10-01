#include "script_component.hpp"
#include "\a3\editor_f\Data\Scripts\dikCodes.h"

// Start spectator if killed unit is player and add given unit to blacklist
[QEGVAR(respawn,onKilled), {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = false;
        [true, _unit] call FUNC(setSpectator);
    } else {
        call FUNC(updateUnits);
    };
}] call AFUNC(common,addEventHandler);

// Stop spectator if respawning unit is player and remove unit from blacklist
[QEGVAR(respawn,onRespawn), {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = true;
        [false, _unit] call FUNC(setSpectator);
    } else {
        call FUNC(updateUnits);
    };
}] call AFUNC(common,addEventHandler);

["KGE","kge_spectator_start", "Starts spectator", {[true] call FUNC(setSpectator); true}, {true}, [59, [false, false, false]]] call CBA_fnc_addKeybind;

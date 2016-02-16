#include "script_component.hpp"

// Should prevent unending spectator on mission end
addMissionEventHandler ["Ended",{ [false] call FUNC(setSpectator) }];

// Start spectator if killed unit is player and add given unit to blacklist
[QEGVAR(respawn,onKilled), {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = false;
        //[true] call FUNC(setSpectator);
        titleText ["You're dead! Press 'Open Spectator' button (default F1) to open spectator!", "PLAIN"];
    } else {
        [] call FUNC(updateUnits);
    };
}] call AFUNC(common,addEventHandler);

// Stop spectator if respawning unit is player and remove unit from blacklist
[QEGVAR(respawn,onRespawn), {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = true;
        [false] call FUNC(setSpectator);
    } else {
        [] call FUNC(updateUnits);
    };
}] call AFUNC(common,addEventHandler);

["KGE","kge_spectator_start", "Open Spectator", {[true] call FUNC(setSpectator); true}, {true}, [59, [false, false, false]]] call CBA_fnc_addKeybind;

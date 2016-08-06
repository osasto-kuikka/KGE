#include "script_component.hpp"

// Start spectator if killed unit is player and add given unit to blacklist
[QEGVAR(respawn,onKilled), {
    params ["_unit"];

    if(local _unit) then {
        GVAR(alive) = false;
        titleText ["You're dead! Press 'Open Spectator' button (default F1) to open spectator!", "PLAIN"];
    };

    // Add unit to blacklist so it's not visible in spectator list
    [[_unit],true] call ace_spectator_fnc_updateUnits;
}] call CBA_fnc_addEventHandler;

// Stop spectator if respawning unit is player and remove unit from blacklist
[QEGVAR(respawn,onRespawn), {
    params ["_unit"];

    // If local, exit spectator and set alive status to true
    if(local _unit) then {
        GVAR(alive) = true;
        [false] call ace_spectator_fnc_setSpectator;
    };

    // Remove unit from blacklist manually and refresh unit list
    ace_spectator_unitBlacklist = ace_spectator_unitBlacklist - [_unit];
    [] call ace_spectator_fnc_updateUnits;
}] call CBA_fnc_addEventHandler;

["KGE","kge_spectator_start", "Open Spectator", {
  // Start only when kge_spectator_alive is false
  if !(GVAR(alive)) then {
    [true, false] call ace_spectator_fnc_setSpectator;
  };

  true
}, {true}, [59, [false, false, false]]] call CBA_fnc_addKeybind;

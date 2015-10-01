/*
 * Author: SilentSpike
 * Sets local client to the given spectator state (virtually)
 * To physically handle a spectator see ace_spectator_fnc_stageSpectator
 *
 * Client will be able to communicate in ACRE/TFAR as appropriate
 * The spectator interface will be opened/closed
 *
 * Arguments:
 * 0: Spectator state of local client <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [true] call ace_spectator_fnc_setSpectator
 *
 * Public: Yes
 */

#include "..\script_component.hpp"

params [
    ["_set",true,[true]],
    ["_unit",objNull,[objNull]]
];

if(_set && {GVAR(alive)}) exitWith {};

// Only clients can be spectators
if !(hasInterface) exitWith {};

// Exit if no change
if (_set isEqualTo GVAR(isSet)) exitwith {};

// Waituntil player is no longer is menu to prevent crashing
if !(isNull(findDisplay 49)) then {
    [{
        [_set] call FUNC(setSpectator);
    }, [], 0, {isNull(findDisplay 49)}]
};

if (_set) then {
    KGE_LOGINFO("Spectator started");

    // Initalize camera variables
    GVAR(camBoom) = 0;
    GVAR(camDolly) = [0,0];
    GVAR(camGun) = false;

    // Initalize display variables
    GVAR(ctrlKey) = false;
    GVAR(heldKeys) = [];
    GVAR(heldKeys) resize 255;
    GVAR(mouse) = [false,false];
    GVAR(mousePos) = [0.5,0.5];
    GVAR(treeSel) = objNull;

    // Update units before opening to support pre-set camera unit
    [] call FUNC(updateUnits);

    // Initalize the camera view
    GVAR(camera) = "Camera" camCreate (ASLtoATL (getPosASL _unit));
    [] call FUNC(transitionCamera);

    // Close map and clear radio
    openMap [false,false];
    clearRadio;

    // Disable BI damage effects
    BIS_fnc_feedback_allowPP = false;

    // Close any open dialogs
    while {dialog} do {
        closeDialog 0;
    };

    // Create the display
    (findDisplay 46) createDisplay QGVAR(interface);

    // Cache and disable nametag settings
    if (["ace_nametags"] call EFUNC(common,classExists)) then {
        GVAR(nametagSettingCache) = [ace_nametags_showPlayerNames, ace_nametags_showNamesForAI];
        EGVAR(nametags,showPlayerNames) = 0;
        EGVAR(nametags,showNamesForAI) = false;
    };
} else {
    KGE_LOGINFO("Spectator closed");

    // Close any open dialogs (could be interrupts)
    while {dialog} do {
        closeDialog 0;
    };

    // Kill the display
    (findDisplay 12249) closeDisplay 0;

    // Terminate camera
    GVAR(camera) cameraEffect ["terminate", "back"];
    camDestroy GVAR(camera);

    clearRadio;

    // Return to player view
    player switchCamera "internal";

    // Enable BI damage effects
    BIS_fnc_feedback_allowPP = true;

    // Cleanup camera variables
    GVAR(camera) = nil;
    GVAR(camBoom) = nil;
    GVAR(camDolly) = nil;
    GVAR(camGun) = nil;

    // Cleanup display variables
    GVAR(ctrlKey) = nil;
    GVAR(heldKeys) = nil;
    GVAR(mouse) = nil;
    GVAR(mousePos) = nil;
    GVAR(treeSel) = nil;

    if !(isNil QGVAR(camAgent)) then {
        deleteVehicle GVAR(camAgent);
        GVAR(camAgent) = nil;
    };

    // Reset nametag settings
    if (["ace_nametags"] call EFUNC(common,classExists)) then {
        ace_nametags_showPlayerNames = GVAR(nametagSettingCache) select 0;
        ace_nametags_showNamesForAI = GVAR(nametagSettingCache) select 1;
        GVAR(nametagSettingCache) = nil;
    };
};

// Reset interruptions
GVAR(interrupts) = [];

// Mark spectator state for reference
GVAR(isSet) = _set;

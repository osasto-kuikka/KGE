/*
 * Author: nikolauska
 *
 * Replace liked items for target unit
 *
 * Argument:
 * 0: Config path <Config>
 * 1: Loadout target <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

params ["_configPath", "_loadoutTarget"];
private ["_class", "_parents"];

removeAllAssignedItems _loadoutTarget;
removeHeadgear _loadoutTarget;

{
    local _fixed = _x call FUNC(fixer);
    // Workaround since linkedItems contains other items than the vest. isKindOf makes sure only the vest is applied.
    // Items other than a vest will still remove the vest item from the player as per addVest specification.
    _class = [_fixed] call BIS_fnc_classWeapon;
    _parents = [_class, true] call BIS_fnc_returnParents;
    if("Vest_Camo_Base" in _parents || "Vest_NoCamo_Base" in _parents) then {
        _loadoutTarget addVest _fixed;
    } else {
        _loadoutTarget linkItem _fixed;
    };
} forEach getArray (_configPath);

["connectId", "onPlayerConnected", { 
    // Run code you need when first player joins
    [] execVM "scripts.sqf";

    ["connectId", "onPlayerConnected"] call BIS_fnc_removeStackedEventHandler;
}] call BIS_fnc_addStackedEventHandler;

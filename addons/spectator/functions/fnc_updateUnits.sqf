/*
 * Author: SilentSpike
 * Adds units to spectator whitelist/blacklist and refreshes the filter units
 *
 * Arguments:
 * 0: Units to add to the whitelist <ARRAY>
 * 1: Use blacklist <BOOL> <OPTIONAL>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [allUnits,true] call ace_spectator_fnc_updateUnits
 *
 * Public: Yes
 */

#include "..\script_component.hpp"

// Function only matters on player clients
if !(hasInterface) exitWith {};

private ["_sides","_cond","_filteredUnits","_filteredGroups"];

// Filter units and append to list
_filteredUnits = [];
{
    if (
        (_x call EFUNC(common,isAlive)) &&
        {_x getVariable ["KGE_alive", true]} &&
        {(side _x) in GVAR(availableSides)}
    ) then {
        _filteredUnits pushBack _x;
    };
} forEach allUnits;

// Cache icons and colour for drawing
_filteredGroups = [];
{
    // Intentionally re-applied to units in case their status changes
    _x call FUNC(cacheUnitInfo);
    _filteredGroups pushBack (group _x);
} forEach _filteredUnits;

// Replace previous lists entirely (removes any no longer valid)
GVAR(unitList) = _filteredUnits arrayIntersect _filteredUnits;
GVAR(groupList) = _filteredGroups arrayIntersect _filteredGroups;

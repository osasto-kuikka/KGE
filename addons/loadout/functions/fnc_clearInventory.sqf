/*
 * Author: nikolauska
 *
 * Clear inventory from unit
 *
 * Argument:
 * 0: Target to clear cargo <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp";

if !(isServer) exitWith {};

params ["_unit"];

removeAllWeapons _unit;
removeAllItems _unit;
removeAllAssignedItems _unit;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
removeGoggles _unit;

KGE_LOGINFO_1("Inventory cleared for %1",_unit);

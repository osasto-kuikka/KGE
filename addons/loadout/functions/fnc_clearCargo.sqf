/*
 * Author: nikolauska
 *
 * Clear cargo from objects
 *
 * Argument:
 * 0: Target to clear cargo <Object>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp"

if !(isServer) exitWith {};

params ["_cargo"];

clearMagazineCargoGlobal _cargo;
clearWeaponCargo _cargo;
clearItemCargoGlobal _cargo;
clearBackpackCargoGlobal _cargo;

KGE_LOGINFO_1("Cargo cleared for %1",_cargo);

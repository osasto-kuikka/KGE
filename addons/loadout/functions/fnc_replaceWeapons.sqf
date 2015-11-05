/*
 * Author: nikolauska
 *
 * Replace weapons for target unit
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

_loadoutTarget removeWeapon (primaryWeapon _loadoutTarget);
_loadoutTarget removeWeapon (secondaryWeapon _loadoutTarget);
_loadoutTarget removeWeapon (handgunWeapon _loadoutTarget);

// Workaround for that "hgun_P07_F" which doesn't get removed with removeWeapon
if (handgunWeapon _loadoutTarget == "hgun_P07_F") then {
	_loadoutTarget addWeapon "hgun_Pistol_heavy_01_F";
  	_loadoutTarget removeWeapon "hgun_Pistol_heavy_01_F";
  	_loadoutTarget removeMagazine "16Rnd_9x21_Mag";
  	_loadoutTarget removeMagazine "16Rnd_9x21_Mag";
};

{ _loadoutTarget addWeapon (_x call FUNC(fixer)); } forEach getArray (_configPath);

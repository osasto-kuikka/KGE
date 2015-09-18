/*
 * Author: nikolauska
 *
 * Filter loadout to add to target unit
 *
 * Argument:
 * 0: Respawn status <String>
 *
 * Return value:
 *
 */

#include "..\script_component.hpp";

private ["_handgunBackup", "_handgunMagazineBackup"];
params ["_configPath", "_loadoutTarget"];

// ========================================== Arsenal =============================================
// This is being done first, so it can be overwritten at a later time, when it is needed.
if ( [_configPath, "linkedItems"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "linkedItems", _loadoutTarget] call FUNC(replaceLinkedItems);
};


// ======================================== Containers ============================================
// Uniform
if ( [_configPath, "uniform"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "uniform", _loadoutTarget] call FUNC(replaceUniform);
};

// Vest
if ( [_configPath, "vest"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "vest", _loadoutTarget] call FUNC(replaceVest);
};

// Backpack
if ( [_configPath, "backpack"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "backpack", _loadoutTarget] call FUNC(replaceBackpack);
};


// ==================================== Items & Magazines =========================================
// Items
if ( [_configPath, "items"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "items", _loadoutTarget] call FUNC(replaceItems);
};

// Magazines
if ( [_configPath, "magazines"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "magazines", _loadoutTarget] call FUNC(replaceMagazines);
};

// Sorted items
// Uniform items & magazines
if ( [_configPath, "addItemsToUniform"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "addItemsToUniform", _loadoutTarget] call FUNC(addItemsToUniform);
};

// Vest items & magazines
if ( [_configPath, "addItemsToVest"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "addItemsToVest", _loadoutTarget] call FUNC(addItemsToVest);
};

// Backpack items & magazines
if ( [_configPath, "addItemsToBackpack"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "addItemsToBackpack", _loadoutTarget] call FUNC(addItemsToBackpack);
};

// Unsorted items
// Added items
if ( [_configPath, "addItems"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "addItems", _loadoutTarget] call FUNC(addItems);
};

// Added magazines
if ( [_configPath, "addMagazines"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "addMagazines", _loadoutTarget] call FUNC(addMagazines);
};


// ========================================= Weapons ==============================================
// Arsenal weapons
if ( [_configPath, "weapons"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "weapons", _loadoutTarget] call FUNC(replaceWeapons);
};

// Workaround to prevent weapon switching when replacing the primary weapon, remove pistol first, add it later after the primary weapon was changed
// Second workaround because for some reason "hgun_P07_F" cannot be removed via removeWeapon
// Instead add a placeholder handgun that can immediately be removed again now ( somehow this works )
_handgunBackup = handgunWeapon _loadoutTarget;
_handgunMagazineBackup = handgunMagazine _loadoutTarget;

if (handgunWeapon _loadoutTarget == "hgun_P07_F") then {
  _loadoutTarget addWeapon "hgun_Pistol_heavy_01_F";
  _loadoutTarget removeWeapon "hgun_Pistol_heavy_01_F";
  _loadoutTarget removeMagazine "16Rnd_9x21_Mag";
  _loadoutTarget removeMagazine "16Rnd_9x21_Mag";
} else {
  _loadoutTarget removeWeapon (handgunWeapon _loadoutTarget);
};

// Primary weapon
if ( [_configPath, "primaryWeapon"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "primaryWeapon", _loadoutTarget] call FUNC(replacePrimaryWeapon);
};

// Launcher
if ( [_configPath, "secondaryWeapon"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "secondaryWeapon", _loadoutTarget] call FUNC(replaceSecondaryWeapon);
};

// Sidearm
if ( [_configPath, "handgunWeapon"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "handgunWeapon", _loadoutTarget] call FUNC(replaceHandgunWeapon);
} else {
  // Add handgun back to complete the workaround above
  // Complete retard shit here, but basically it is required to replace the default handgun with something else, as neither adding nor removing it works
  // That's why you get a different pistol here
  if(_handgunBackup == "hgun_P07_F") then {
    // We're only adding extra magazines if they were not removed under the magazine category above, for consistency sake.
    // ie. If someone replaced all magazines already, they'd have to add them manually.
    if( !( [_configPath, "magazines"] call FUNC(isConfigEntry) )) then {
      _loadoutTarget addMagazine "11Rnd_45ACP_Mag";
      _loadoutTarget addMagazine "11Rnd_45ACP_Mag";
    };
    _loadoutTarget addMagazine "11Rnd_45ACP_Mag";
    _loadoutTarget addWeapon "hgun_Pistol_heavy_01_F";
  } else {
    _loadoutTarget addMagazine (_handgunMagazineBackup select 0);
    _loadoutTarget addWeapon _handgunBackup;
  };
};


// ======================================= Attachments ============================================
// Primary weapon attachments
if ( [_configPath, "primaryWeaponAttachments"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "primaryWeaponAttachments", _loadoutTarget] call FUNC(replacePrimaryAttachments);
};

// Secondary weapon attachments
if ( [_configPath, "secondaryWeaponAttachments"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "secondaryWeaponAttachments", _loadoutTarget] call FUNC(replaceSecondaryAttachments);
};

// Handgun weapon attachments
if ( [_configPath, "handgunWeaponAttachments"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "handgunWeaponAttachments", _loadoutTarget] call FUNC(replaceHandgunAttachments);
};


// ======================================= Linked Items ===========================================
// Headgear
if ( [_configPath, "headgear"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "headgear", _loadoutTarget] call FUNC(replaceHeadgear);
};

// Goggles ( No, this is NOT Night Vision Goggles )
if ( [_configPath, "goggles"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "goggles", _loadoutTarget] call FUNC(replaceGoggles);
};

// Nightvision goggles
if ( [_configPath, "nvgoggles"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "nvgoggles", _loadoutTarget] call FUNC(replaceNVGoggles);
};

// Binoculars
if ( [_configPath, "binoculars"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "binoculars", _loadoutTarget] call FUNC(replaceBinoculars);
};

// Map
if ( [_configPath, "map"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "map", _loadoutTarget] call FUNC(replaceMap);
};

// GPS
if ( [_configPath, "gps"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "gps", _loadoutTarget] call FUNC(replaceGPS);
};

// Compass
if ( [_configPath, "compass"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "compass", _loadoutTarget] call FUNC(replaceCompass);
};

// Watch
if ( [_configPath, "watch"] call FUNC(isConfigEntry) ) then {
  [_configPath >> "watch", _loadoutTarget] call FUNC(replaceWatch);
};

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
params ["_config", "_unit"];

// This is being done first, so it can be overwritten at a later time, when it is needed.
if ( [_config, "linkedItems"] call FUNC(isConfigEntry) ) then {
    [_config >> "linkedItems", _unit] call FUNC(replaceLinkedItems);
};

// Uniform
if ( [_config, "uniform"] call FUNC(isConfigEntry) ) then {
    [_config >> "uniform", _unit] call FUNC(replaceUniform);
};

// Vest
if ( [_config, "vest"] call FUNC(isConfigEntry) ) then {
    [_config >> "vest", _unit] call FUNC(replaceVest);
};

// Backpack
if ( [_config, "backpack"] call FUNC(isConfigEntry) ) then {
    [_config >> "backpack", _unit] call FUNC(replaceBackpack);
};

// Items
if ( [_config, "items"] call FUNC(isConfigEntry) ) then {
    [_config >> "items", _unit] call FUNC(replaceItems);
};

// Magazines
if ( [_config, "magazines"] call FUNC(isConfigEntry) ) then {
    [_config >> "magazines", _unit] call FUNC(replaceMagazines);
};

// Uniform items & magazines
if ( [_config, "addItemsToUniform"] call FUNC(isConfigEntry) ) then {
    [_config >> "addItemsToUniform", _unit] call FUNC(addItemsToUniform);
};

// Vest items & magazines
if ( [_config, "addItemsToVest"] call FUNC(isConfigEntry) ) then {
    [_config >> "addItemsToVest", _unit] call FUNC(addItemsToVest);
};

// Backpack items & magazines
if ( [_config, "addItemsToBackpack"] call FUNC(isConfigEntry) ) then {
    [_config >> "addItemsToBackpack", _unit] call FUNC(addItemsToBackpack);
};

// Added items
if ( [_config, "addItems"] call FUNC(isConfigEntry) ) then {
    [_config >> "addItems", _unit] call FUNC(addItems);
};

// Added magazines
if ( [_config, "addMagazines"] call FUNC(isConfigEntry) ) then {
    [_config >> "addMagazines", _unit] call FUNC(addMagazines);
};


// Arsenal weapons
if ( [_config, "weapons"] call FUNC(isConfigEntry) ) then {
    [_config >> "weapons", _unit] call FUNC(replaceWeapons);
};

// Workaround to prevent weapon switching when replacing the primary weapon, remove pistol first, add it later after the primary weapon was changed
// Second workaround because for some reason "hgun_P07_F" cannot be removed via removeWeapon
_handgunBackup = handgunWeapon _unit;
_handgunMagazineBackup = handgunMagazine _unit;

if (handgunWeapon _unit == "hgun_P07_F") then {
    _unit addWeapon "hgun_Pistol_heavy_01_F";
    _unit removeWeapon "hgun_Pistol_heavy_01_F";
    _unit removeMagazine "16Rnd_9x21_Mag";
    _unit removeMagazine "16Rnd_9x21_Mag";
} else {
    _unit removeWeapon (handgunWeapon _unit);
};

// Primary weapon
if ( [_config, "primaryWeapon"] call FUNC(isConfigEntry) ) then {
  [_config >> "primaryWeapon", _unit] call FUNC(replacePrimaryWeapon);
};

// Launcher
if ( [_config, "secondaryWeapon"] call FUNC(isConfigEntry) ) then {
    [_config >> "secondaryWeapon", _unit] call FUNC(replaceSecondaryWeapon);
};

// Sidearm
if ( [_config, "handgunWeapon"] call FUNC(isConfigEntry) ) then {
    [_config >> "handgunWeapon", _unit] call FUNC(replaceHandgunWeapon);
} else {
    // Add handgun back to complete the workaround above
    if(_handgunBackup == "hgun_P07_F") then {
        if !( [_config, "magazines"] call FUNC(isConfigEntry) ) then {
            _unit addMagazine "11Rnd_45ACP_Mag";
            _unit addMagazine "11Rnd_45ACP_Mag";
        };

        _unit addMagazine "11Rnd_45ACP_Mag";
        _unit addWeapon "hgun_Pistol_heavy_01_F";
    } else {
        _unit addMagazine (_handgunMagazineBackup select 0);
        _unit addWeapon _handgunBackup;
    };
};

// Primary weapon attachments
if ( [_config, "primaryWeaponAttachments"] call FUNC(isConfigEntry) ) then {
    [_config >> "primaryWeaponAttachments", _unit] call FUNC(replacePrimaryAttachments);
};

// Secondary weapon attachments
if ( [_config, "secondaryWeaponAttachments"] call FUNC(isConfigEntry) ) then {
    [_config >> "secondaryWeaponAttachments", _unit] call FUNC(replaceSecondaryAttachments);
};

// Handgun weapon attachments
if ( [_config, "handgunWeaponAttachments"] call FUNC(isConfigEntry) ) then {
    [_config >> "handgunWeaponAttachments", _unit] call FUNC(replaceHandgunAttachments);
};

// Headgear
if ( [_config, "headgear"] call FUNC(isConfigEntry) ) then {
    [_config >> "headgear", _unit] call FUNC(replaceHeadgear);
};

// Goggles ( No, this is NOT Night Vision Goggles )
if ( [_config, "goggles"] call FUNC(isConfigEntry) ) then {
    [_config >> "goggles", _unit] call FUNC(replaceGoggles);
};

// Nightvision goggles
if ( [_config, "nvgoggles"] call FUNC(isConfigEntry) ) then {
    [_config >> "nvgoggles", _unit] call FUNC(replaceNVGoggles);
};

// Binoculars
if ( [_config, "binoculars"] call FUNC(isConfigEntry) ) then {
    [_config >> "binoculars", _unit] call FUNC(replaceBinoculars);
};

// Map
if ( [_config, "map"] call FUNC(isConfigEntry) ) then {
    [_config >> "map", _unit] call FUNC(replaceMap);
};

// GPS
if ( [_config, "gps"] call FUNC(isConfigEntry) ) then {
    [_config >> "gps", _unit] call FUNC(replaceGPS);
};

// Compass
if ( [_config, "compass"] call FUNC(isConfigEntry) ) then {
    [_config >> "compass", _unit] call FUNC(replaceCompass);
};

// Watch
if ( [_config, "watch"] call FUNC(isConfigEntry) ) then {
    [_config >> "watch", _unit] call FUNC(replaceWatch);
};

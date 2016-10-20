/*
 * Author:
 * Nikolauska
 *
 * Description:
 * Compares version numbers of PBOs and DLLs.
 *
 * Arguments:
 * None
 *
 * Return:
 * None
 */

#include "script_component.hpp"

private _version = getText (configFile >> "CfgPatches" >>
                                          "kge_main" >> "versionStr");

KGE_LOGINFO_1("KGE is version %1",_version);

private _cfgPatches = configFile >> "CfgPatches";
private _addons = "true" configClasses _cfgPatches;
_addons = [_addons, {toLower configName _this}] call FUNC(map);
_addons = [_addons, {_x find "kge_" == 0}] call FUNC(filter);

{
  params ["_addon"]
  private _addonVersion = getText (_cfgPatches >> _addon >> "versionStr")

  if (_addonVersion != _version) then {
    private _errorMsg = format ["File %1.pbo is outdated.", _x];
    ["Outdated addon", _errorMsg] call FUNC(errorMessage);
  };
} forEach _addons;

// Check server version/addons
if (isMultiplayer) then {
  if (isServer) then {
    // Send servers version of KGE to all clients
    GVAR(ServerVersion) = _version;
    GVAR(ServerAddons) = _addons;
    publicVariable QGVAR(ServerVersion);
    publicVariable QGVAR(ServerAddons);
  } else {
    // clients have to wait for the variables
    [
      {
        params ["_version", "_addons"];

        if (_version != GVAR(ServerVersion)) then {
          private _msg = format ["Server: %1, Client: %2.",
                                 GVAR(ServerVersion), _version];
          ["Version mismatch", _msg] call FUNC(errorMessage);
        };

        _addons = _addons - GVAR(ServerAddons);
        if !(_addons isEqualTo []) then {
          private _msg = format ["Client has extra addons: %1.", _addons];
          ["Addon mismatch", _msg] call FUNC(errorMessage);
        };
      },
      [_version,_addons],
      {!(isNil QGVAR(ServerVersion)) && {!(isNil QGVAR(ServerAddons))}}
    ] call FUNC(waitUntil);
  };
};

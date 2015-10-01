/*
 * Author: nikolauska
 *
 * Compares version numbers of PBOs and DLLs.
 *
 * Argument:
 * None.
 *
 * Return value:
 * None.
 */
#include "..\script_component.hpp"

private "_version";
_version = getText (configFile >> "CfgPatches" >> "kge_main" >> "versionStr");

diag_log text format ["[KGE]: KGE is version %1.", _version];

private "_addons";
_addons = "true" configClasses (configFile >> "CfgPatches");//
_addons = [_addons, {toLower configName _this}] call FUNC(map);//
_addons = [_addons, {_this find "kge_" == 0}] call FUNC(filter);

{
    if (getText (configFile >> "CfgPatches" >> _x >> "versionStr") != _version) then {
        private "_errorMsg";
        _errorMsg = format ["File %1.pbo is outdated.", _x];

        diag_log text format ["[KGE] ERROR: %1", _errorMsg];
        if(isServer) then {
            ["KGE_SystemChatEvent", [format ["[KGE] Server: %1", _errorMsg]]] call AFUNC(common,globalEvent);
        } else {
            ["KGE_SystemChatEvent", [format ["[KGE] %1: %2", (KGE_Player call FUNC(getName)), _errorMsg]]] call AFUNC(common,globalEvent);
        };


        if (hasInterface) then {
            ["[KGE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
        };
    };
} forEach _addons;

///////////////
// check server version/addons
///////////////
if (isMultiplayer) then {
    if (isServer) then {
        // send servers version of KGE to all clients
        GVAR(ServerVersion) = _version;
        GVAR(ServerAddons) = _addons;
        publicVariable QGVAR(ServerVersion);
        publicVariable QGVAR(ServerAddons);
    } else {
        // clients have to wait for the variables
        [{
            params ["_params", "_pfh"];
            _params params ["_version", "_addons"];

            if (_version != GVAR(ServerVersion)) then {
                private "_errorMsg";
                _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), _version];

                diag_log text format ["[KGE] ERROR: %1", _errorMsg];
                ["KGE_SystemChatEvent", [format ["[KGE] %1: %2", (KGE_Player call FUNC(getName)), _errorMsg]]] call AFUNC(common,globalEvent);

                if (hasInterface) then {
                    ["[KGE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            _addons = _addons - GVAR(ServerAddons);
            if !(_addons isEqualTo []) then {
                _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.",_addons];

                diag_log text format ["[KGE] ERROR: %1", _errorMsg];
                ["KGE_SystemChatEvent", [format ["[KGE] %1: %2", (KGE_Player call FUNC(getName)), _errorMsg]]] call AFUNC(common,globalEvent);

                if (hasInterface) then {
                    ["[KGE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

        }, [_version,_addons], {!(isNil QGVAR(ServerVersion)) && {!(isNil QGVAR(ServerAddons))}}] call FUNC(waitUntil);
    };
};

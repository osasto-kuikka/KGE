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
#include "script_component.hpp"

private _version = getText (configFile >> "CfgPatches" >> "kge_main" >> "versionStr");

KGE_LOGINFO_1("KGE is version %1",_version);

private _addons = "true" configClasses (configFile >> "CfgPatches");//
_addons = [_addons, {toLower configName _this}] call FUNC(map);//
_addons = [_addons, {_x find "kge_" == 0}] call FUNC(filter);

{
    if (getText (configFile >> "CfgPatches" >> _x >> "versionStr") != _version) then {
        private _errorMsg = format ["File %1.pbo is outdated.", _x];
        KGE_LOGERROR(_errorMsg);

        if(isServer) then {
            ["systemChatEvent", [format ["[KGE] Server: %1", _errorMsg]]] call CBA_fnc_globalEvent;
        } else {
            ["systemChatEvent", [format ["[KGE] %1: %2", (KGE_Player call FUNC(getName)), _errorMsg]]] call CBA_fnc_globalEvent;
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
            params ["_version", "_addons"];

            if (_version != GVAR(ServerVersion)) then {
                private _errorMsg = format ["Client/Server Version Mismatch. Server: %1, Client: %2.", GVAR(ServerVersion), _version];

                KGE_LOGERROR(_errorMsg);
                ["systemChatEvent", [format ["[KGE] %1: %2", (KGE_Player call FUNC(getName)), _errorMsg]]] call CBA_fnc_globalEvent;

                if (hasInterface) then {
                    ["[KGE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

            _addons = _addons - GVAR(ServerAddons);
            if !(_addons isEqualTo []) then {
                private _errorMsg = format ["Client/Server Addon Mismatch. Client has extra addons: %1.",_addons];

                KGE_LOGERROR(_errorMsg);
                ["systemChatEvent", [format ["[KGE] %1: %2", (KGE_Player call FUNC(getName)), _errorMsg]]] call CBA_fnc_globalEvent;

                if (hasInterface) then {
                    ["[KGE] ERROR", _errorMsg, {findDisplay 46 closeDisplay 0}] call FUNC(errorMessage);
                };
            };

        }, [_version,_addons], {!(isNil QGVAR(ServerVersion)) && {!(isNil QGVAR(ServerAddons))}}] call FUNC(waitUntil);
    };
};

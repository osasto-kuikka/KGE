/*
 * Author: nikolauska
 *
 * Create zeus module on mission start
 *
 * Argument:
 *
 * Return value:
 *
 */

#include "\z\kge\addons\zeus\script_component.hpp"

GVAR(sideLogic) = createCenter sideLogic;

GVAR(curatorModule) = (createGroup KGE_Zeus_SideLogic) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
GVAR(curatorModule) setVariable ["Addons",3,true];

// Add all addons to zeus
private _addons = [];
private _cfgPatches = configFile >> "cfgpatches";
for "_i" from 0 to (count _cfgPatches - 1) do {
    private _class = _cfgPatches select _i;

    if (isclass _class) then {
        _addons pushBack (configName _class);
    };
};
//_addons call BIS_fnc_activateAddons;
GVAR(curatorModule) addcuratoraddons _addons;

KGE_LOGINFO("Zeus module added");

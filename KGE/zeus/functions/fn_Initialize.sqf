// Make sure a side logic exists, if not create it
if (isNil "KGE_Zeus_SideLogic") then {
	KGE_Zeus_SideLogic = createCenter sideLogic;
	publicVariable "KGE_Zeus_SideLogic";
};

if(isNil "KGE_Zeus_CuratorModule") then {
	// Create a new curator logic
	KGE_Zeus_CuratorModule = (createGroup KGE_Zeus_SideLogic) createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
	publicVariable "KGE_Zeus_CuratorModule";
};

KGE_Zeus_CuratorModule setVariable ["Addons",3,true];

// Add all addons to zeus
_cfgPatches = configfile >> "cfgpatches";
for "_i" from 0 to (count _cfgPatches - 1) do {
	_class = _cfgPatches select _i;
	if (isclass _class) then {_addons pushBack (configname _class);};
};
_addons call bis_fnc_activateaddons;

// Enable addons to the curator
KGE_Zeus_CuratorModule addcuratoraddons _addons;
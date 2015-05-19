// For server
if(isServer) then {
	// Get KGE version from cfgPatches
	_version = getText (configFile >> "CfgPatches" >> "KGE" >> "version");

	["KGE_Core_remoteFnc_Server", {
		_this call KGE_Core_fnc_MP;
	}] call cba_fnc_addEventHandler;

	// Save KGE server version and send it to players
	KGE_Version = _version;
	publicVariable "KGE_Version";

	// Start AI caching and remove
	[] call KGE_Cache_fnc_Initialize;

	// Initialize zeus module
	[] call KGE_Zeus_fnc_Initialize;
};

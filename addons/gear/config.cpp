#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_main"};
        authors[] = {"nikolauska"};
        VERSION_CONFIG;
    };
};

#include "config_eventhandlers.hpp"

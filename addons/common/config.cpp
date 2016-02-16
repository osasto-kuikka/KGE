#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_main", "ace_common"};
        author[] = {"nikolauska"};
        authorUrl = "https://github.com/nikolauska/";
        VERSION_CONFIG;
    };
};

#include "config_eventhandlers.hpp"

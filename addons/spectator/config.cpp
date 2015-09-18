#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_common"};
        author[] = {"F3 Project","Head","SilentSpike","voiper", "nikolauska"};
        authorUrl = "https://github.com/nikolauska";
        VERSION_CONFIG;
    };
};

#include "config_eventhandlers.hpp"
#include "ui\interface.hpp"

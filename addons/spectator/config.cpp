#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common","kge_common"};
        author[] = {"F3 Project","Head","SilentSpike","voiper", "nikolauska"};
        authorUrl = "https://github.com/acemod";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
//#include "CfgEden.hpp"
#include "UI\interface.hpp"

#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_common"};
        author[] = {"nikolauska"};
        authorUrl = "https://gitlab.com/osasto-kuikka/kge";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

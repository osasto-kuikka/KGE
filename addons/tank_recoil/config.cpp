#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_common"};
        author = "Osasto Kuikka";
        authors[] = {"nikolauska"};
        url = "https://github.com/osasto-kuikka/KGE";
        VERSION_CONFIG;
    };
};

#include "config_eventhandlers.hpp"

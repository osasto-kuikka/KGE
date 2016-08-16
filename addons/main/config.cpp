#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"extended_eventhandlers", "CBA_UI", "CBA_XEH", "CBA_XEH_A3", "ace_main"};
        authors[] = {"nikolauska"};
        versionDesc = "K.G.E.";
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@KGE";
        name = "Core - Kuikka Game Enhancer";
        picture = "A3\Ui_f\data\Logos\arma3_expansion_alpha_ca";
        hidePicture = "true";
        hideName = "true";
        actionName = "Website";
        action = "https://gitlab.com/osasto-kuikka/KGE";
        description = "KGE public git repository";
    };
};

class CfgSettings {
    class CBA {
        class Versioning {
            class PREFIX {
                level = DEFAULT_VERSIONING_LEVEL;
                handler = "kge_common_fnc_mismatch";
                class Dependencies {
                    CBA[]={"cba_main", {1,0,0}, "true"};
                    XEH[]={"cba_xeh", {1,0,0}, "true"};
                };
            };
        };
        /*
    class Registry {
    class PREFIX {
        removed[] = {};
    };
    };
 */
    };
};

#include "module_config.hpp"

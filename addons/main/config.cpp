#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = "Osasto Kuikka";
        authors[] = {"nikolauska"};
        url = "https://github.com/osasto-kuikka/KGE";
        VERSION_CONFIG;
    };
};

class CfgMods {
    class PREFIX {
        dir = "@kge";
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
            class KGE {
                class dependencies {
                    //KGE will hard exit if this is missing
                    CBA[] = {"cba_main", REQUIRED_CBA_VERSION, "(true)"};
                };
            };
        };
    };
};

#include "module_config.hpp"

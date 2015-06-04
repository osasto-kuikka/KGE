#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"kge_common"};
        author[] = {"nikolauska"};
        authorUrl = "https://github.com/nikolauska/";
        VERSION_CONFIG;
    };
};

class RscText;
class RscDisplayChat {
    class controls {
        delete Line;
        delete Background;
        class CA_Background: RscText {
            colorBackground[] = {0.5,0.5,0.5,0.33}; // chat entry field
        };
    };
};

class RscChatListDefault {
    colorBackground[] = {0,0,0,0.5}; // chat background
    colorMessageProtocol[] = {0.85,0.85,0.85,1}; // chat text
};
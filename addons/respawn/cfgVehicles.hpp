class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits;
    };
    class KGE_respawnInit: Module_F {
        scope = 2;
        displayName = CSTRING(moduleInit_DisplayName);
        category = "KGE";
        function = QUOTE(DFUNC(moduleInit));
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        author = "nikolauska";
        class Arguments {
            class amount {
                displayName = CSTRING(amount_DisplayName);
                description = CSTRING(amount_Description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(moduleInit_Description);
            sync[] = {};
        };
    };
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            #include "ACE_SelfActions.hpp"
        };
    };
};

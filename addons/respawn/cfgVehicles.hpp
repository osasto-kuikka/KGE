class CfgVehicles {
	class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits {
        };
    };
    class KGE_Module;
    class KGE_respawnInit: KGE_Module {
        scope = 2;
        displayName = CSTRING(moduleInit_DisplayName);
        icon = ""
        category = "KGE";
        function = QUOTE(DFUNC(moduleInit));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "nikolauska";
        class Arguments {
            class amount {
                displayName = CSTRING(amount_DisplayName);
                description = CSTRING(amount_Description);
                typeName = "NUMBER";
                defaultValue = 0;
            };
            class position {
                displayName = CSTRING(type_DisplayName);
                description = CSTRING(type_Description);
                typeName = "NUMBER";
                class values {
                    class base {
                        name = CSTRING(type_base);
                        value = 0;
                        default = 1;
                    };
                    class custom {
                        name = CSTRING(type_custom);
                        value = 1;                  
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(moduleInit_Description);
            sync[] = {};
        };
    };
    class KGE_respawnPos: KGE_Module {
        scope = 2;
        displayName = CSTRING(modulePos_DisplayName);
        icon = ""
        category = "KGE";
        function = QUOTE(DFUNC(modulePos));
        functionPriority = 1;
        isGlobal = 1;
        isTriggerActivated = 0;
        author = "nikolauska";
        class Arguments {
            class side {
                displayName = CSTRING(side_DisplayName);
                description = CSTRING(side_Description);
                typeName = "NUMBER";
                class values {
                    class all {
                        name = CSTRING(side_all);
                        value = 0;
                        default = 1;
                    };
                    class blufor {
                        name = CSTRING(side_blufor);
                        value = 1;                  
                    };
                    class opfor {
                        name = CSTRING(side_opfor);
                        value = 2;                  
                    };
                    class independent {
                        name = CSTRING(side_independent);
                        value = 3;                  
                    };
                    class civilian {
                        name = CSTRING(side_civilian);
                        value = 4;                  
                    };
                };
            };
        };
        class ModuleDescription {
            description = CSTRING(modulePos_Description);
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

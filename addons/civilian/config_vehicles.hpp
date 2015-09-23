class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits;
    };
    class KGE_civilianInit: Module_F {
        scope = 2;
        displayName = "Civilian";
        category = "KGE";
        function = QUOTE(DFUNC(module));
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        author = "nikolauska";
        class Arguments {
            class amount {
                displayName = "Max Amount";
                description = "How many civilian units can simultaneously be on map. Try to keep this to a minimum to prevent lag";
                typeName = "NUMBER";
                defaultValue = "20";
            };
            class minDist {
                displayName = "Minimum Distance";
                description = "Minimun distance civlian will spawn from player";
                typeName = "NUMBER";
                defaultValue = "1000";
            };
            class maxDist {
                displayName = "Maximum Distance";
                description = "Maximum distance civilians can be from player before deletion";
                typeName = "NUMBER";
                defaultValue = "2500";
            };
        };
        class ModuleDescription {
            description = "This module enables KGE civilians";
            sync[] = {};
        };
    };
};

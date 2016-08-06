class CfgVehicles {
    class Logic;
    class Module_F: Logic {
        class ArgumentsBaseUnits;
    };
    class KGE_respawnInit: Module_F {
        scope = 2;
        displayName = "Respawn";
        category = "KGE";
        function = QUOTE(DFUNC(moduleInit));
        functionPriority = 1;
        isGlobal = 0;
        isTriggerActivated = 0;
        author = "nikolauska";
        class Arguments {
            class amount {
                displayName = "Amount";
                description = "How many times player can respawn before spectator (-1 unlimited respawns)";
                typeName = "NUMBER";
                defaultValue = "0";
            };
            class respawn_west {
                displayName = "Respawn Blufor";
                description = "Respawn marker for blufor";
                typeName = "TEXT";
                defaultValue = "";
            };
            class respawn_east {
                displayName = "Respawn Opfor";
                description = "Respawn marker for opfor";
                typeName = "TEXT";
                defaultValue = "";
            };
            class respawn_independent {
                displayName = "Respawn Guerrila";
                description = "Respawn marker for guerrila";
                typeName = "TEXT";
                defaultValue = "";
            };
            class respawn_civilian {
                displayName = "Respawn Civilian";
                description = "Respawn marker for civilians";
                typeName = "TEXT";
                defaultValue = "";
            };
            class death_west {
                displayName = "Death Blufor";
                description = "Death marker for blufor";
                typeName = "TEXT";
                defaultValue = "";
            };
            class death_east {
                displayName = "Death Opfor";
                description = "Death marker for opfor";
                typeName = "TEXT";
                defaultValue = "";
            };
            class death_independent {
                displayName = "Death Guerrila";
                description = "Death marker for guerrila";
                typeName = "TEXT";
                defaultValue = "";
            };
            class death_civilian {
                displayName = "Death Civilian";
                description = "Death marker for civilians";
                typeName = "TEXT";
                defaultValue = "";
            };
        };
        class ModuleDescription {
            description = "This module enables KGE respawn";
            sync[] = {};
        };
    };

    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            #include "ACE_selfActions.hpp"
        };
    };
};

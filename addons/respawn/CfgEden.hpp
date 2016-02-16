class Cfg3DEN {
    class Mission {
        class KGE_Settings {
            class AttributeCategories {
                class ADDON {
                    displayName = "Respawn";
                    collapsed = 0;
                    class Attributes {
                        class GVAR(active_eden) {
                            property = QGVAR(active_eden);
                            displayName = "Activate";
                            tooltip = "Use KGE Respawn in this mission";
                            typeName = "BOOL";
                            defaultValue = "false";
                            control = "Checkbox";
                            expression = "%s = _value";
                            validate = "number";
                        };
                        class GVAR(max_killed_eden) {
                            property = QGVAR(max_killed_eden);
                            displayName = "Max Killed Amount";
                            tooltip = "How many times player can respawn before spectator (-1 unlimited respawns)";
                            typeName = "NUMBER";
                            defaultValue = "0";
                            control = "Edit";
                            expression = "%s = _value";
                            validate = "number";
                        };
                        class GVAR(respawn_west_eden) {
                            property = QGVAR(respawn_west_eden);
                            displayName = "Respawn Blufor";
                            tooltip = "Respawn marker for blufor";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(respawn_east_eden) {
                            property = QGVAR(respawn_east_eden);
                            displayName = "Respawn Opfor";
                            tooltip = "Respawn marker for opfor";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(respawn_independent_eden) {
                            property = QGVAR(respawn_independent_eden);
                            displayName = "Respawn Guerrila";
                            tooltip = "Respawn marker for guerrila";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(respawn_civilian_eden) {
                            property = QGVAR(respawn_civilian_eden);
                            displayName = "Respawn Civilian";
                            tooltip = "Respawn marker for civilians";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(death_west_eden) {
                            property = QGVAR(death_west_eden);
                            displayName = "Death Blufor";
                            tooltip = "Death marker for blufor";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(death_east_eden) {
                            property = QGVAR(death_east_eden);
                            displayName = "Death Opfor";
                            tooltip = "Death marker for opfor";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(death_independent_eden) {
                            property = QGVAR(death_independent_eden);
                            displayName = "Death Guerrila";
                            tooltip = "Death marker for guerrila";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                        class GVAR(death_civilian_eden) {
                            property = QGVAR(death_civilian_eden);
                            displayName = "Death Civilian";
                            tooltip = "Death marker for civilians";
                            typeName = "TEXT";
                            defaultValue = "";
                            control = "Edit";
                            expression = "%s = _value";
                        };
                    };
                };
            };
        };
    };
};

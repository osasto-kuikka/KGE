class Combo;

class Cfg3DEN {
    class Mission {
        class KGE_Settings {
            class AttributeCategories {
                class ADDON {
                    displayName = "Spectator";
                    collapsed = 0;
                    class Attributes {
                        class GVAR(filterUnits_eden) {
                            displayName = CSTRING(units_DisplayName);
                            tooltip = CSTRING(units_Description);
                            typeName = "NUMBER";
                            defaultValue = "";
                            control = "Combo";
                            expression = "%s = _value";
                            class Value: Combo {
	                            class Items {
                                    class none {
                                        text = CSTRING(units_none);
                                        data = 0;
                                    };
                                    class players {
                                        text = CSTRING(units_players);
                                        data = 1;
                                    };
                                    class playable {
                                        text = CSTRING(units_playable);
                                        data = 2;
                                    };
                                    class all  {
                                        text = CSTRING(units_all);
                                        data = 3;
                                        default = 1;
                                    };
	                            };
                            };
                        };
                        class GVAR(filterSides_eden) {
                            displayName = CSTRING(sides_DisplayName);
                            tooltip = CSTRING(sides_Description);
                            typeName = "NUMBER";
                            defaultValue = "";
                            control = "Combo";
                            expression = "%s = _value";
                            class Value: Combo {
	                            class Items {
                                    class player {
                                        text = CSTRING(sides_player);
                                        data = 0;
                                    };
                                    class friendly {
                                        text = CSTRING(sides_friendly);
                                        data = 1;
                                    };
                                    class hostile {
                                        text = CSTRING(sides_hostile);
                                        data = 2;
                                    };
                                    class all  {
                                        text = CSTRING(sides_all);
                                        data = 3;
                                        default = 1;
                                    };
	                            };
                            };
                        };
                        class GVAR(restrictModes_eden) {
                            displayName = CSTRING(modes_DisplayName);
                            tooltip = CSTRING(modes_Description);
                            typeName = "NUMBER";
                            defaultValue = "";
                            control = "Combo";
                            expression = "%s = _value";
                            class Value: Combo {
	                            class Items {
                                    class all {
                                        text = CSTRING(modes_all);
                                        data = 0;
                                        default = 1;
                                    };
                                    class unit {
                                        text = CSTRING(modes_unit);
                                        data = 1;
                                    };
                                    class free {
                                        text = CSTRING(modes_free);
                                        data = 2;
                                    };
                                    class internal  {
                                        text = CSTRING(modes_internal);
                                        data = 3;
                                    };
                                    class external  {
                                        text = CSTRING(modes_external);
                                        data = 4;
                                    };
	                            };
                            };
                        };
                        class GVAR(restrictVisions_eden) {
                            displayName = CSTRING(visions_DisplayName);
                            tooltip = CSTRING(visions_Description);
                            typeName = "NUMBER";
                            defaultValue = "";
                            control = "Combo";
                            expression = "%s = _value";
                            class Value: Combo {
	                            class Items {
                                    class all {
                                        text = CSTRING(modes_all);
                                        data = 0;
                                        default = 1;
                                    };
                                    class nv {
                                        text = CSTRING(visions_nv);
                                        data = 1;
                                    };
                                    class ti {
                                        text = CSTRING(visions_ti);
                                        data = 2;
                                    };
                                    class none  {
                                        text = "$STR_Special_None";
                                        data = 3;
                                    };
	                            };
                            };
                        };
                    };
                };
            };
        };
    };
};

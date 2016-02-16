class Cfg3DEN {
    class Mission {
        class KGE_Settings {
            displayName = "KGE Settings";
        };
    };
};

class ctrlMenuStrip;

class Display3DEN {
    class Controls {
        class MenuStrip: ctrlMenuStrip {
            class Items {
                class Attributes {
                    items[] += {KGE_Settings};
                };
                class KGE_Settings {
                    text = "KGE Settings";
                    action = "edit3DENMissionAttributes 'KGE_Settings'";
                    picture = "z\kge\addons\main\kuikka.paa";
                };
            };
        };
    };
};

class Extended_PreInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_preInit));
        disableModuload = true;
    };
};

class Extended_PostInit_EventHandlers {
    class ADDON {
        init = QUOTE(call COMPILE_FILE(XEH_postInit));
        disableModuload = true;
    };
};

class Extended_Respawn_EventHandlers {
    class CAManBase {
        class GVAR(respawn) {
            respawn = QUOTE(call FUNC(activate));
        };
    };
};
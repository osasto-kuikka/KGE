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

class Extended_GetIn_EventHandlers {
    class Tank {
        class GVAR(gunner) {
            init = QUOTE((_this select 3) call FUNC(addEvent));
        };
    };
};
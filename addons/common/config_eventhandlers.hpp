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

class Extended_InitPost_EventHandlers {
    class All {
        class GVAR(setName) {
            init = QUOTE(if (local (_this select 0)) then {(_this select 0) call FUNC(setName)};);
        };
    };
};

class Extended_Respawn_EventHandlers {
    class All {
        class GVAR(setName) {
            respawn = QUOTE(if (local (_this select 0)) then {(_this select 0) call FUNC(setName)};);
        };
    };
};

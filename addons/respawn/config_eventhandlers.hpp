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
    class CAmanBase {
        class GVAR(init) {
            init = QUOTE(if (local (_this select 0)) then {[ARR_2((_this select 0),QUOTE(QUOTE(init))] call FUNC(eventHandlers)};);
        };
    };
};

class Extended_Killed_EventHandlers {
    class CAManBase {
        class GVAR(killed) {
            killed = QUOTE(if (local (_this select 0)) then {[ARR_2((_this select 0),QUOTE(QUOTE(killed))] call FUNC(eventHandlers)};);
        };
    };
};


class Extended_Respawn_EventHandlers {
    class CAManBase {
        class GVAR(respawn) {
            respawn = QUOTE(if (local (_this select 0)) then {[ARR_2((_this select 0),QUOTE(QUOTE(respawn))] call FUNC(eventHandlers)};);
        };
    };
};

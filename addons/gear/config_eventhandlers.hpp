class Extended_PreInit_EventHandlers {
    class ADDON {
        clientInit = QUOTE( call COMPILE_FILE(XEH_preInit) );
    };
};

class Extended_InitPost_EventHandlers {
    class ADDON {
        clientInit = QUOTE(call COMPILE_FILE(XEH_initPost));
    };
};

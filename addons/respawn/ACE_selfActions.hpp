class KGE_Respawn {
    displayName = CSTRING(button_respawn);
    exceptions[] = {};
    statement = "";
    condition = QUOTE(call EFUNC(common,isAdmin));

    class ReturnAlive {
        displayName = CSTRING(button_returnAlive);
        condition = "true";
        statement = "";

        class all {
            displayName = CSTRING(button_returnAlive_all);
            condition = "true";
            statement = QUOTE(QUOTE(QGVAR(returnAliveEvent)) call CFUNC(globalEvent));
        };

        class single {
            displayName = CSTRING(button_returnAlive_single);
            condition = "true";
            statement = QUOTE(QUOTE(QUOTE(respawn)) call FUNC(listMenuHandler));
        };
    };

    class kill {
        displayName = CSTRING(button_kill);
        condition = "true";
        statement = "";

        class all {
            displayName = CSTRING(button_returnAlive_all);
            condition = "true";
            statement = QUOTE(QUOTE(QGVAR(killEvent)) call cba_fnc_globalEvent);
        };

        class single {
            displayName = CSTRING(button_returnAlive_single);
            condition = "true";
            statement = QUOTE(QUOTE(QUOTE(kill)) call FUNC(listMenuHandler));
        };
    };
};

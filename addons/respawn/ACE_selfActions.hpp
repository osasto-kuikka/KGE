class KGE {
	displayName = CSTRING(button_respawn);
    hotkey = "k";
    exceptions[] = {};
    statement = "";
    condition = QUOTE(call EFUNC(common,isAdmin));
    icon = "";

    class ReturnAlive {
        displayName = CSTRING(button_returnAlive);
        condition = "true"
        statement = "";
        icon = "";

        class all {
	        displayName = CSTRING(button_returnAlive_all);
	        condition = "true"
	        statement = "";
	        icon = "";
	    };

	    class single {
	        displayName = CSTRING(button_returnAlive_single);
	        condition = "true"
	        statement = QUOTE(QUOTE(QUOTE(respawn)) call FUNC(listMenuHandler));;
	        icon = "";
	    };
    };

    class kill {
        displayName = CSTRING(button_kill);
        condition = "true"
        statement = "";
        icon = "";

        class all {
	        displayName = CSTRING(button_returnAlive_all);
	        condition = "true"
	        statement = "";
	        icon = "";
	    };

	    class single {
	        displayName = CSTRING(button_returnAlive_single);
	        condition = "true"
	        statement = QUOTE(QUOTE(QUOTE(kill)) call FUNC(listMenuHandler));
	        icon = "";
	    };
    };
};
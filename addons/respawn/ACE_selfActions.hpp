class KGE_Menu {
    displayName = "KGE";
    icon = "";
    exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
    condition = QUOTE(call DEFUNC(common,isAdmin));
    statement = "";

    class KGE_Respawn_ReturnAlive {
        displayName = "Return alive";
        icon = "";
        exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
        condition = QUOTE(GVAR(active) && {count (call FUNC(getAllDead)) != 0});
        statement = "";

        class KGE_Respawn_ReturnAlive_All {
            displayName = "All";
            icon = "";
            exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
            condition = "true";
            statement = QUOTE(_this call DFUNC(respawnAll));
        };

        class KGE_Respawn_ReturnAlive_Single {
            displayName = "Single";
            icon = "";
            exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
            condition = "true";
            statement = "";
            insertChildren = QUOTE(_this call DFUNC(addActionsRespawn));
        };
    };

    class KGE_Respawn_Kill {
        displayName = "Kill";
        icon = "";
        exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
        condition = QUOTE(GVAR(active));
        statement = "";

        class KGE_Respawn_Kill_All {
            displayName = "All";
            icon = "";
            exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
            condition = "true";
            statement = QUOTE(_this call DFUNC(killAll));
        };

        class KGE_Respawn_Kill_Single {
            displayName = "Single";
            icon = "";
            exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
            condition = "true";
            statement = "";
            insertChildren = QUOTE(_this call DFUNC(addActionsKill));
        };
    };
};

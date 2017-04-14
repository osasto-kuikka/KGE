class KGE_Menu {
	displayName = "KGE";
	exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
	icon = "";
	statement = "";
	condition = QUOTE(call DEFUNC(common,isAdmin));

	class KGE_Teleport {
		displayName = "Teleport";
		icon = "";
		exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
		condition = "true";
		statement = "";

		class KGE_Teleport_All {
			displayName = "All";
			icon = "";
			exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
			condition = "true";
			statement = "";

			class KGE_Teleport_All_Me {
				displayName = "My Position";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = "true";
				statement = QUOTE(call DFUNC(teleportAllMe));
			};

			class KGE_Teleport_All_Map {
				displayName = "Map Position";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = "true";
				statement = QUOTE(call DFUNC(teleportAllMap));
			};
		};

		class KGE_Teleport_Single {
			displayName = "Single";
			icon = "";
			exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
			condition = "true";
			statement = "";

			class KGE_Teleport_Single_Me {
				displayName = "My Position";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = "true";
				statement = "";
				insertChildren = QUOTE(_this call DFUNC(addSingleActionsMe));
			};

			class KGE_Teleport_Single_Map {
				displayName = "Map Position";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = "true";
				statement = "";
				insertChildren = QUOTE(_this call DFUNC(addSingleActionsMap));
			};
		};

		class KGE_Teleport_Respawn {
			displayName = "Last Respawned";
			icon = "";
			exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
			condition = QUOTE(count GVAR(respawned) != 0);
			statement = "";

			class KGE_Teleport_Respawn_All {
				displayName = "All";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = "true";
				statement = "";

				class KGE_Teleport_Respawn_All_Me {
					displayName = "My Position";
					icon = "";
					exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
					condition = "true";
					statement = QUOTE(call DFUNC(teleportRespawnMe));
				};

				class KGE_Teleport_Respawn_All_Map {
					displayName = "Map Position";
					icon = "";
					exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
					condition = "true";
					statement = QUOTE(call DFUNC(teleportRespawnMap));
				};
			};

			class KGE_Teleport_Respawn_Single {
				displayName = "Single";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = "true";
				statement = "";

				class KGE_Teleport_Respawn_Single_Me {
					displayName = "My Position";
					icon = "";
					exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
					condition = "true";
					statement = "";
					insertChildren = QUOTE(_this call DFUNC(addRespawnActionsMe));
				};

				class KGE_Teleport_Respawn_Single_Map {
					displayName = "Map Position";
					icon = "";
					exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
					condition = "true";
					statement = "";
					insertChildren = QUOTE(_this call DFUNC(addRespawnActionsMap));
				};
			};
		};
	};
};

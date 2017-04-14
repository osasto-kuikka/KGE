class CfgVehicles {
	class Man;
	class CAManBase: Man {
		class ACE_SelfActions {
			class KGE_Menu {
				displayName = "KGE";
				icon = "";
				exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
				condition = QUOTE(call DEFUNC(common,isAdmin));
				statement = "";

				class KGE_Zeus_Activate {
					displayName = "Activate Zeus";
					icon = "";
					exceptions[] = {"isNotInside", "isNotSitting", "isNotOnLadder", "isNotSwimming"};
					condition = "true";
					statement = QUOTE([ARR_2(KGE_Player,true)] call FUNC(activateClient));
				};
			};
		};
	};
};

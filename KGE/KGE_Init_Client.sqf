// Only for players
if(hasInterface) then {

	// Get KGE version from cfgPatches
	_version = getText (configFile >> "CfgPatches" >> "KGE" >> "version");

	["KGE_Core_remoteFnc_Client", {
		(_this select 1) call KGE_Core_fnc_MP;
	}] call cba_fnc_addEventHandler;

	// New CBA keybinding for KGE
	["KGE", "KGE_Menu", ["Avaa KGE Valikko", "Avaa KGE:n käyttöliittymän"], {
		["KGE_Main"] call KGE_UI_fnc_OpenMenu;
	}, {}, [51, [false, false, false]]] call cba_fnc_addKeybind;

	["KGE", "KGE_Spectator", ["Spektaattori", "Avaa KGE:n spektaattorin jos pelaaja on kuollut"], {
		if(!([KGE_Player] call KGE_Core_fnc_isAlive)) then {
			[] call KGE_Spectator_fnc_Start;
			//[] call CSSA3_fnc_Initialize;
		};
	}, {}, [59, [false, false, false]]] call cba_fnc_addKeybind;

	["KGE", "KGE_Stamina", ["Stamina Visualisointi", "Näyttää, tai piilottaa KGE:n stamina palkin"], {
		[] call KGE_StaminaBar_fnc_onKeyPress;
	}, {}, [60, [false, false, false]]] call cba_fnc_addKeybind;

	// Set KGE_Player and name
	KGE_Player = player;
	KGE_PlayerOld = player;
	[KGE_Player] call KGE_Core_fnc_SetName;

	// If player state has not been set then add it
	if(isNil (format["KGE_Core_Alive_%1", [_unit] call KGE_Core_fnc_GetName])) then {
		[KGE_Player, true] call KGE_Core_fnc_SetAlive;
	};

	// If unit has no varname then add it
	if(vehicleVarName KGE_Player == "") then {
		KGE_Player setVehicleVarName ([([KGE_Player] call KGE_Core_fnc_GetName), " ", ""] call CBA_fnc_replace);
	};

	// Initialize different KGE stuff
	[] call KGE_TeamRoster_fnc_Initialize;
	[] call KGE_Gear_fnc_Initialize;
	[] call KGE_StaminaBar_fnc_Initialize;
	[] call KGE_UI_fnc_Initialize;

	// Remove radio chatter and mission saving
	enableRadio false;
	0 fadeRadio 0;
	enableSentences false;
	KGE_Player disableConversation true;
	enableSaving [false, false];

	// Save player version and server version
	KGE_Player setVariable ["KGE_Version", _version, true];
	KGE_Version = missionNamespace getVariable ["KGE_Version", "0"];

	// Check if player version is same than server version
	if !(KGE_Version isEqualTo _version) then {
		KGE_Player globalChat format[localize "STR_Core_Init_VersionError", ([KGE_Player] call KGE_Core_fnc_GetName), _version, KGE_Version];
	};

	if(["ace_interaction"] call KGE_Core_fnc_ClassExists && {["ST_STHud"] call KGE_Core_fnc_ClassExists}) then {
		// Set player fire team
		KGE_Player setVariable ["KGE_Core_assignedFireTeam", "MAIN"];

		// Player info change (ACE)
		[{
			// If unit changes then change KGE_Player (Sh)
			if !(KGE_Player isEqualTo (missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player])) then {
				KGE_PlayerOld = KGE_Player; // Save KGE_Player to KGE_PlayerOld
				KGE_Player = missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player];
			};

			// If rating goes below 0 then return it to zero
			if ((rating KGE_Player) < 0) then {
				KGE_Player addRating (0 - (rating KGE_Player));
			};

			// If players fireream changes then change it in ACE
			_team = KGE_Player getVariable ["ST_STHud_assignedTeam", "MAIN"];
			if !(KGE_Player getVariable ["KGE_Core_assignedFireTeam", "MAIN"] isEqualTo _team) then {
				KGE_Player setVariable ["KGE_Core_assignedFireTeam", _team];

				// Check if ACE fire team differs and update if needed
				if !(KGE_Player getVariable ["ace_interaction_assignedFireTeam", "MAIN"] isEqualTo _team) then {
					[KGE_Player, _team] call ACE_Interaction_fnc_joinTeam;
				};
			};
		}, 0, []] call CBA_fnc_addPerFrameHandler;

	} else {

		// Player info change
		[{
			// If unit changes then change KGE_Player
			if !(KGE_Player isEqualTo (missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player])) then {
				KGE_PlayerOld = KGE_Player; // Save KGE_Player to KGE_PlayerOld
				KGE_Player = missionNamespace getVariable ["BIS_fnc_moduleRemoteControl_unit", player];
			};

			// If rating goes below 0 then return it to zero
			if ((rating KGE_Player) < 0) then {
				KGE_Player addRating (0 - (rating KGE_Player));
			};
		}, 0, []] call CBA_fnc_addPerFrameHandler;
	};


	[{
		// If KGE respawn has been initialized then initialize it on player
		if(missionNameSpace getVariable ["KGE_Respawn_Initialized", false] AND {!(missionNameSpace getVariable ["KGE_Respawn_Initializedplayer", false])}) then {
			[] call KGE_Respawn_fnc_Initializeplayer;
		};

		// If KGE safestart is initialized then initialize it on player
		if(missionNameSpace getVariable ["KGE_SafeStart_Initialized", false] AND {!(missionNameSpace getVariable ["KGE_SafeStart_InitializedPlayer", false])}) then {
			[] call KGE_SafeStart_fnc_Initialize;
		};
	}, [], 2, 1, true] call KGE_Core_fnc_ExecDelayed;

};
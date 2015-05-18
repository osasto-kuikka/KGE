if(!isNil "KGE_Spectator_forcedExit" AND {!KGE_Spectator_forcedExit}) then {
	closeDialog 1;

	// Force exit on all scripts
	KGE_Spectator_forcedExit = true;

	//Remove tags
	//["KGE_Spectator_Frame","onEachFrame"] call bis_fnc_removeStackedEventHandler;

	// Hide GUI
	call KGE_Spectator_fnc_ToggleGUI;

	// Return camera to player
	KGE_Spectator_camera cameraEffect ["terminate","back"];
	camDestroy KGE_Spectator_camera;
	KGE_Player SwitchCamera "Internal";
};


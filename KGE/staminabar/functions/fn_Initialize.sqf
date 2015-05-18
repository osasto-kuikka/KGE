if (isNil "KGE_StaminaBar_Enabled") then {KGE_StaminaBar_Enabled = true;};

disableSerialization;

57705 cutRsc ["KGE_StaminaBar_Visualizer", "PLAIN"];

KGE_StaminaBar_PFH = [{

	[] call KGE_StaminaBar_fnc_Draw;

}, 0.5, []] call cba_fnc_addPerFrameHandler;
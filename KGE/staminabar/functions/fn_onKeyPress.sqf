KGE_StaminaBar_Enabled = !KGE_StaminaBar_Enabled;

if(KGE_StaminaBar_Enabled) then {
	[] call KGE_StaminaBar_fnc_Initialize;
} else {
	if(!isNil "KGE_StaminaBar_PFH") then {
		[KGE_StaminaBar_PFH] call cba_fnc_removePerFrameHandler;
	};
	57705 cutText ["", "PLAIN"];
};


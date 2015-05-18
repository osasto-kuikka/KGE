[{
	if !((animationState KGE_player) isEqualTo "HubSpectator_stand") then {
		// Switch player animation to lock movement
		KGE_Player playMove "HubSpectator_stand";
	};

	if ([KGE_Player] call KGE_Core_fnc_isAlive) then {
		// Free player from animation lock
		KGE_Player switchMove "AmovPercMstpSlowWrflDnon";

		// Delete this PFH
    	[_this select 1] call CBA_fnc_removePerFrameHandler;
	};
}, 1, []] call CBA_fnc_addPerFrameHandler;

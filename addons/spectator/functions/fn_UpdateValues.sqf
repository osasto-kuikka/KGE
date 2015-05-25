[{
	// Exit if forced
	if(KGE_Spectator_forcedExit) then {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
	};

	// Get all framelist groups
	_groupListFrame = [];
	_groupList = [];
	{
		_side = side _x;
		if({[_x] call KGE_Core_fnc_isAlive && {(KGE_Spectator_camera distance _x) < (KGE_Spectator_TagFadeDist)}} count (units _x) > 0) then {_groupListFrame pushBack _x};
		if({[_x] call KGE_Core_fnc_isAlive && {_side isEqualTo KGE_Spectator_Side}} count (units _x) > 0) then {_groupList pushBack _x};
	} forEach allGroups;

	// Update frame units list after 0.1 seconds
	[{
		private ["_list"];

		_list = [];

		{
			{
				if([_x] call KGE_Core_fnc_isAlive && {(KGE_Spectator_camera distance _x) < (KGE_Spectator_TagFadeDist * 1.5)}) then {_list pushBack _x};
			} forEach (units _x);
		} forEach (_this select 0);

		// Add frame units
		KGE_Spectator_Frame_Group = _list;
	}, [_groupListFrame], 0.1, 0.05, true] call KGE_Core_fnc_ExecDelayed;
	
	
	// Update frame units list after 0.2 seconds
	[{
		private ["_unitList", "_index"];

		// Genarate side list
		_unitList = [];
		{
			_unitList pushBack _x;

			{
				if([_x] call KGE_Core_fnc_isAlive) then {_unitList pushBack _x};
			} forEach (units _x);
		} forEach (_this select 0);

		KGE_Spectator_listUnits = _unitList;

		// Clear listbox
		lbClear 2100;
		{

			// If type is group hten add group
			if (typeName _x isEqualTo "GROUP") then {
				// Add group to list
				_index = lbAdd [2100, toString(toArray(groupID _x) - [45])];

				// Set side color
				lbSetColor [2100,_index,[side _x,false] call BIS_fnc_sideColor];
			} else {
				// Add player to list
				lbAdd [2100, ("	" + ([_x] call KGE_Core_fnc_GetName))];
			};
		} forEach _unitList;
	}, [_groupList], 0.2, 0.1, true] call KGE_Core_fnc_ExecDelayed;
	

	// OLD CODE
	/*
	{
		_tempUnitList = [];
		_side = side _x;

		{
			// Add only alive units
			if([_x] call KGE_Core_fnc_isAlive) then {
				if(isPlayer _x AND {_side isEqualTo KGE_Spectator_Side}) then {
					// Add player to list updated every frame and spectating list
					if((KGE_Spectator_camera distance _x) < (KGE_Spectator_TagFadeDist * 1.5)) then {_temp_KGE_Spectator_Frame_Units pushBack _x};				
					_tempUnitList pushBack _x;
				} else {
					if(KGE_Spectator_AllowAI AND {!KGE_Spectator_playersOnly}) then {
						// Add AI to list updated every frame
	                    if((KGE_Spectator_camera distance _x) < (KGE_Spectator_TagFadeDist * 1.5)) then {_temp_KGE_Spectator_Frame_Units pushBack _x};	

	                    // Add only same side AI to spectating list (less clutter this way)
	                    if(_side isEqualTo KGE_Spectator_Side) then {
	                    	_tempUnitList pushBack _x;
	                    };
	                };
				};
			};
		} forEach units _x;

		// Add group and units to list if there are alive units in list
		if(count _tempUnitList != 0) then {_KGE_Spectator_SpectablePlayers pushBack _x; _KGE_Spectator_SpectablePlayers = _KGE_Spectator_SpectablePlayers + _tempUnitList;};
	} forEach allGroups;
	*/
	/********************************************************************************/
	// Check if spectating list and unitlist differs
	/*
	if !(_KGE_Spectator_SpectablePlayers isEqualTo KGE_Spectator_listUnits) then {
		_listBox =  2100;

		// Empty listUnits
		KGE_Spectator_listUnits = [];

		// Clear listbox
		lbClear _listBox;

		{
			// Add group or unit to list
			KGE_Spectator_listUnits pushBack _x;

			// If type is group hten add group
			if (typeName _x isEqualTo "GROUP") then {
				// Add group to list
				_index = lbAdd [_listBox, toString(toArray(groupID _x) - [45])];

				// Set side color
				lbSetColor [_listBox,_index,[side _x,false] call BIS_fnc_sideColor];
			} else {
				// Add player to list
				lbAdd [_listBox, ("	" + ([_x] call KGE_Core_fnc_GetName))];
			};

		} forEach _KGE_Spectator_SpectablePlayers;
	};
	*/
	/********************************************************************************/

	// Wait till all tags have been drawn to update list
	//waitUntil {KGE_Spectator_Tags_AllowUnitChange OR KGE_Spectator_forcedExit};
	//KGE_Spectator_Frame_Units = [];
	//KGE_Spectator_Frame_Units = +_temp_KGE_Spectator_Frame_Units;
}, 0.3, 0.1] call CBA_fnc_addPerFrameHandler;
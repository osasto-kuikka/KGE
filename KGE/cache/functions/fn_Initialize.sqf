
KGE_Cache_BodyRemovalTime = missionNameSpace getVariable ["KGE_AI_BodyRemovalTime", 180];
KGE_Cache_BodyRemovalDistance = missionNameSpace getVariable ["KGE_AI_BodyRemovalDistance", 300];

[{
	{
		_canRemoveGroup = true;

		{
			if([_x] call KGE_Core_fnc_isAlive) then {
				_canRemoveGroup = false;
			} else {
				if([_x] call KGE_Cache_fnc_CachingCheck) then {
					deleteVehicle _x;
				};
			}
		} forEach (units _x);

		if(_canRemoveGroup) then {_x = grpNull};
	} forEach allGroups;
}, 1, []] call CBA_fnc_addPerFrameHandler;
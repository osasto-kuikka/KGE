_unit = _this select 0;

{
	_unit = (_this select 0) select 0;

	if([_unit] call KGE_Cache_fnc_CachingCheck) then {
		deleteVehicle _unit;

		[_this select 1] call CBA_fnc_removePerFrameHandler;
	};

}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
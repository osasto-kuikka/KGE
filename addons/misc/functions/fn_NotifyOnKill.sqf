/*
 * Author: nikolauska
 *
 * Notifies admin on players when unit is killed
 *
 * Argument:
 * 0: units (Side, Object, Array of objects)
 * 1: Only Admin ()
 *
 * Example:
 * [0.5] call KGE_Misc_fnc_BreathFog;
 * 
 * Return value:
 * 
 */

private ["_units", "_onlyAdmin"];

_units = [_this, 0, CIVILIAN, [[], WEST, objNull]] call BIS_fnc_param;
_onlyAdmin = [_this, 1, objNull, [objNull, []]] call BIS_fnc_param;

if(isServer) then {
	// Create sides array if not created
	if(isNil "KGE_Misc_NOF_Sides") then {
		KGE_Misc_NOFEH_Sides = [0,0,0,0];
		publicVariable "KGE_Misc_NOFEH_Sides";
	};

	// Add cba eventhandler only once
	if(isNil "KGE_Misc_NOFEH_Server") then {
		KGE_Misc_NOFEH_Server = true;

		["KGE_Misc_NOF_EH_Server",
		{
			private ["_unit", "_adminOnly"];
			_unit = _this select 0;
			_adminOnly = _this select 1;

			switch (side (group _unit)) do {
				case WEST: {KGE_Misc_NOFEH_Sides set [0, (KGE_Misc_NOFEH_Sides select 0) + 1]};
				case EAST: {KGE_Misc_NOFEH_Sides set [1, (KGE_Misc_NOFEH_Sides select 1) + 1]};
				case INDEPENDENT: {KGE_Misc_NOFEH_Sides set [2, (KGE_Misc_NOFEH_Sides select 2) + 1]};
				case CIVILIAN: {KGE_Misc_NOFEH_Sides set [3, (KGE_Misc_NOFEH_Sides select 3) + 1]};
			};
			publicVariable "KGE_Misc_NOFEH_Sides";

			["KGE_Misc_NOF_EH_Client", [_unit, _adminOnly]] call cba_fnc_globalEvent;

		}] call cba_fnc_addEventHandler;
	};

	switch (typeName _units) do {
		case "ARRAY": {
			{
				//call compile format["%1 addEventHandler ['killed', {['KGE_Misc_NOF_EH_Server', [%1, %2]] call cba_fnc_globalEvent}]", _x, _onlyAdmin];
				_x addEventHandler ['killed', {['KGE_Misc_NOF_EH_Server', [(_this select 0), _onlyAdmin]] call cba_fnc_globalEvent}];
			} forEach _units;
		};
		case "SIDE": {
			{
				if(side (group _x) == _units) then {
					_x addEventHandler ['killed', {['KGE_Misc_NOF_EH_Server', [(_this select 0), _onlyAdmin]] call cba_fnc_globalEvent}];
				}				
			} forEach allUnits;
		};
		case "OBJECT": {
			//call compile format["%1 addEventHandler ['killed', {['KGE_Misc_NOF_EH_Server', [%1, %2]] call cba_fnc_globalEvent}]", _units, _onlyAdmin];
			_x addEventHandler ['killed', {['KGE_Misc_NOF_EH_Server', [(_this select 0), _onlyAdmin]] call cba_fnc_globalEvent}];
		};
	};
};

if(hasInterface) then {
	if(isNil "KGE_Misc_NOFEH") then {
		KGE_Misc_NOFEH = true;

		["KGE_Misc_NOF_EH_Client",
		{
			private ["_unit", "_adminOnly", "_sideDeadAmount"];
			_unit = _this select 0;
			_adminOnly = _this select 1;

			// if only admin defined and player is not admin then exit
			if (_adminOnly && {!(call KGE_Core_fnc_isAdmin)}) exitWith {};

			_unitSide = side (group _unit);

			_sideDeadAmount = switch (_unitSide) do {
				case WEST: {KGE_Misc_NOFEH_Sides select 0};
				case EAST: {KGE_Misc_NOFEH_Sides select 1};
				case INDEPENDENT: {KGE_Misc_NOFEH_Sides select 2};
				case CIVILIAN: {KGE_Misc_NOFEH_Sides select 3};
			};
			
			hint parseText format["<t align='center'>Kuollut<br/><br/>Unit: %1<br/>Side: %2<br/>Side Kuolemat: %3</t>", _unit, _unitSide, _sideDeadAmount];
		}] call cba_fnc_addEventHandler;
	};
}
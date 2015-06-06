/*
 * Author: nikolauska
 *
 * Handles server request events
 *
 * Argument:
 *
 * Return value:
 * 
 */

#include "script_component.hpp"

EXPLODE_2_PVT(_this,_unit,_event);

if(isNil QGVAR(savedStatus)) then {
	GVAR(savedStatus) = [];
};

private ["_name"];
_name = _unit call EFUNC(common,getName);

switch (_event) do {
	// Player initialization
	case "bisInit": {
		private ["_exists"];
		_exists = false;
		{
			EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

			if(_savedName isEqualTo _name) exitWith {
				_exists = true;
				[QGVAR(clientEvent), [_unit, _savedStatus]] call cba_fnc_whereLocalEvent;
			};
			true
		} count GVAR(savedStatus)

		if(!_exists) then {
			GVAR(savedStatus) pushBack [_name, 0, "alive"];
		};
	};

	// Player killed
	case "bisKilled": {
		private ["_savedIndex", "_newSavedArray"];
		_savedIndex = -1;
		_newSavedArray = [];
		{
			EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

			if(_savedName isEqualTo _name) exitWith {
				_savedIndex = _forEachIndex;
				INC(_savedKilled);

				if(_savedKilled >= GVAR(maxKilled)) then {
					_savedStatus = "killed";
				};

				_newSavedArray = [_savedName, _savedKilled, _savedStatus];
			};
		} forEach GVAR(savedStatus)

		GVAR(savedStatus) set [_savedIndex, _newSavedArray];
	};	

	// Player respawned
	case "bisRespawn": {
		{
			EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

			if(_savedName isEqualTo _name) exitWith {
				[QGVAR(clientEvent), [_unit, _savedStatus]] call cba_fnc_whereLocalEvent;
			};
		} forEach GVAR(savedStatus)
	};

	// Force killed
	case "kgeKilled": {
		private ["_savedIndex", "_newSavedArray"];
		_savedIndex = -1;
		_newSavedArray = [];
		{
			EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

			if(_savedName isEqualTo _name) exitWith {
				_savedIndex = _forEachIndex;
				_newSavedArray = [_savedName, _savedKilled, "killed"];
			};
		} forEach GVAR(savedStatus)

		GVAR(savedStatus) set [_savedIndex, _newSavedArray];
		[QGVAR(clientEvent), [_unit, "killed"]] call cba_fnc_whereLocalEvent;
	};

	// Force respawn
	case "kgeRespawn": {
		private ["_savedIndex", "_newSavedArray"];
		_savedIndex = -1;
		_newSavedArray = [];
		{
			EXPLODE_3_PVT(_x,_savedName,_savedKilled,_savedStatus);

			if(_savedName isEqualTo _name) exitWith {
				_savedIndex = _forEachIndex;
				_newSavedArray = [_savedName, _savedKilled, "alive"];
			};
		} forEach GVAR(savedStatus)

		GVAR(savedStatus) set [_savedIndex, _newSavedArray];
		[QGVAR(clientEvent), [_unit, "respawn"]] call cba_fnc_whereLocalEvent;
	};
};
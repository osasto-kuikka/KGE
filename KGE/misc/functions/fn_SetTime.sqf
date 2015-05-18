/*
 * Author: nikolauska
 *
 * Sets time for players. NOTE this is run on server!
 *
 * Argument:
 * 0: Time value (Scalar)
 *
 * Time values:
 * 0: Dawn
 * 1: Early Morning
 * 2: Morning
 * 3: Noon
 * 4: Afternoon
 * 5: Evening
 * 6: Dusk
 * 7: Night
 *
 * Return value:
 *
 */

if !(isServer) exitWith {};

private ["_timeOfDay","_year","_month","_day","_hour","_minute","_transition"];

_timeOfDay = [_this, 0, 0, [0]] call BIS_fnc_param;

_date = date;
_year = _date select 0;
_month = _date select 1;
_day = _date select 2;
_hour = _date select 3;
_minute = _date select 4;

switch (_timeOfDay) do {
	// Dawn
	case 0: {
		_hour = 4;
		_minute = 50;
	};

	// Early Morning
	case 1: {
		_hour = 5;
		_minute = 20;
	};

	// Morning
	case 2: {
		_hour = 9;
		_minute = 20;
	};

	// Noon
	case 3: {
		_hour = 12;
		_minute = 00;
	};

	// Afternoon
	case 4: {
		_hour = 15;
		_minute = 30;
	};

	// Evening
	case 5: {
		_hour = 18;
		_minute = 40;
	};

	// Dusk
	case 6: {
		_hour = 19;
		_minute = 10;
	};

	// Night
	case 7: {
		_hour = 0;
		_minute = 0;
	};
};

_transition = false;
if (time > 0) then {
	_transition = true;

	if (date select 3 > _hour) then {_day = _day + 1};
	if (_day > 31) then {_day = 1; _month = _month + 1};
	if (_month > 12) then {_month = 1; _year = _year + 1};
};

_date = [_year,_month,_day,_hour,_minute];

[_date,true,_transition] call BIS_fnc_setDate;



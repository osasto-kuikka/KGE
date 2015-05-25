/*
 * Author: nikolauska
 *
 * Sets fog for player. Can be directly defined with array of numbers or with number using basic values given below 
 *
 * Argument:
 * 0: Fog value (Number, Array)
 * 1: Transition time (Number)
 *
 * Fog values:
 * 0: None
 * 1: Light
 * 2: Heavy
 * 3: Low Elevation Fog
 * 4: Med Elevation Fog
 * 5: High Elevation Fog
 * 6: Very High Elevation Fog
 *
 * Example:
 * [0, 1] call KGE_Misc_fnc_SetFog;
 * [[0.4, 0.5, 1], 1] call KGE_Misc_fnc_SetFog;
 *
 * Return value:
 *
 */

private ["_fog", "transition", "_strength", "_decay", "_base"];

_fog = [_this, 0, 0, [0, []]] call BIS_fnc_param;
_transition = [_this, 1, 0, [0]] call BIS_fnc_param;

_strength = 0;
_decay = 0;
_base = 0;

if(typeName _fog == "SCALAR") then {
	switch (_fog) do {
		// None
		case 0: {
			_strength = 0;
			_decay = 0;
			_base = 0;
		};

		// Light
		case 1: {
			_strength = 0.2;
			_decay = 0;
			_base = 0;
		};

		// Heavy
		case 2: {
			_strength = 0.4;
			_decay = 0;
			_base = 0;
		};

		// Low Elevation Fog
		case 3: {
			_strength = 0.45;
			_decay = 0.07;
			_base = 1;
		};

		// Med Elevation Fog
		case 4: {
			_strength = 0.35;
			_decay = 0.05;
			_base = 50;
		};

		// High Elevation Fog
		case 5: {
			_strength = 0.15;
			_decay = 0.04;
			_base = 100;
		};

		// Very High Elevation Fog
		case 6: {
			_strength = 0.1;
			_decay = 0.01;
			_base = 200;
		};
	};
} else {
	_strength = [_fog, 0, 0, [0]] call BIS_fnc_paramIn;
	_decay = [_fog, 1, 0, [0]] call BIS_fnc_paramIn;
	_base = [_fog, 2, 0, [0]] call BIS_fnc_paramIn;
};


_transition setFog [_strength,_decay,_base];



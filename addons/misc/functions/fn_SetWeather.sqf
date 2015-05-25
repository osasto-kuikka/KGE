/*
 * Author: nikolauska
 *
 * Set weather for player
 *
 * Argument:
 * 0: Weather value (Scalar)
 * 0: Transition time (Scalar)
 *
 * Weather values:
 * 0: Clear (Calm)
 * 1: Clear (Light Winds)
 * 2: Clear (Strong Winds)
 * 3: Overcast (Calm)
 * 4: Overcast (Light Winds)
 * 5: Overcast (Strong Winds)
 * 6: Rain (Light Winds)
 * 7: Rain (Strong Winds)
 * 8: Storm
 *
 * Return value:
 *
 */

private ["_weather","_Overcast","_Rain","_Rainbow","_Lightnings","_WindStr","_WindGusts","_Waves","_Humidity"];

_weather = [_this, 0, 0, [0]] call BIS_fnc_param;
_transition = [_this, 1, 0, [0]] call BIS_fnc_param;

_Overcast = 0;
_Rain = 0;
_Rainbow = 0;
_Lightnings = 0;
_WindStr = 0;
_WindGusts = 0;
_Waves = 0;
_Humidity = 0;

switch (_weather) do {

	// Clear (Calm)
	case 0: {
		_Overcast = 0;
		_Rain = 0;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0;
		_WindGusts = 0;
		_Waves = 0;
		_Humidity = 0;
	};

	// Clear (Light Winds)
	case 1: {
		_Overcast = 0.01;
		_Rain = 0;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0.25;
		_WindGusts = 0.5;
		_Waves = 0.25;
		_Humidity = 0;
	};

	// Clear (Strong Winds)
	case 2: {
		_Overcast = 0.1;
		_Rain = 0;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0.75;
		_WindGusts = 1;
		_Waves = 0.75;
		_Humidity = 0;
	};

	// Overcast (Calm)
	case 3: {
		_Overcast = 0.7;
		_Rain = 0;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0;
		_WindGusts = 0;
		_Waves = 0.1;
		_Humidity = 0.1;
	};

	// Overcast (Light Winds)
	case 4: {
		_Overcast = 0.6;
		_Rain = 0;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0.25;
		_WindGusts = 0.5;
		_Waves = 0.25;
		_Humidity = 0.2;
	};

	// Overcast (Strong Winds)
	case 5: {
		_Overcast = 0.8;
		_Rain = 0;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0.75;
		_WindGusts = 1;
		_Waves = 0.75;
		_Humidity = 0.2;
	};

	// Rain (Light Winds)
	case 6: {
		_Overcast = 0.8;
		_Rain = 1;
		_Rainbow = 0.1;
		_Lightnings = 0;
		_WindStr = 0.25;
		_WindGusts = 0.5;
		_Waves = 0.75;
		_Humidity = 0.9;
	};

	// Rain (Strong Winds)
	case 7: {
		_Overcast = 0.9;
		_Rain = 1;
		_Rainbow = 0;
		_Lightnings = 0;
		_WindStr = 0.75;
		_WindGusts = 1;
		_Waves = 0.75;
		_Humidity = 0.9;
	};

	// Storm
	case 8: {
		_Overcast = 1;
		_Rain = 1;
		_Rainbow = 0;
		_Lightnings = 1;
		_WindStr = 1;
		_WindGusts = 1;
		_Waves = 1;
		_Humidity = 1;
	};
};

_transition setOvercast  _Overcast;
_transition setRain _Rain;
_transition setRainbow _Rainbow;
_transition setWindStr  _WindStr;
_transition setWindForce _WindGusts;
_transition setWaves _Waves;
_transition setLightnings _Lightnings;

if (_transition == 0) then {
	forceWeatherChange;
};

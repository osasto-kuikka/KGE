/*
 * Author: nikolauska
 *
 * Add all units on map breathing fog (doesn't work for JIP players)
 *
 * Argument:
 * 0: intensity (Number)
 *
 * Example:
 * [0.5] call KGE_Misc_fnc_BreathFog;
 * 
 * Return value:
 * 
 */

private ["_intensity"];
_intensity = _this select 0; //intensity of fog (0 to 1)

{
	[{
		private ["_unit", "_density"];

		_unit = (_this select 0) select 0;
		_density = (_this select 0) select 1;

		if(isNull _unit OR !alive _unit) exitWith {
			[_this select 1] call cba_fnc_removePerFrameHandler;
		};

		_source = "logic" createVehicleLocal (getPos _unit);
		_fog = "#particlesource" createVehicleLocal getPos _source;
		_fog setParticleParams [["\a3\data_f\ParticleEffects\Universal\Universal", 16, 12, 13,0],
			"", 
			"Billboard", 
			0.5, 
			0.5, 
			[0,0,0],
			[0, 0.2, -0.2], 
			1, 1.275,	1, 0.2, 
			[0, 0.2,0], 
			[[1,1,1, _int], [1,1,1, 0.01], [1,1,1, 0]], 
			[1000], 
			1, 
			0.04, 
			"", 
			"", 
			_source
		];
		_fog setParticleRandom [2, [0, 0, 0], [0.25, 0.25, 0.25], 0, 0.5, [0, 0, 0, 0.1], 0, 0, 10];
		_fog setDropInterval _density;

		_source attachto [_unit,[0,0.15,0], "neck"]; // get fog to come out of player mouth

		[{
			deletevehicle (_this select 0);
		}, _source, 0.5, 0.1, true] call KGE_Core_fnc_ExecDelayed;
	}, 2, [_x, _int]] call cba_fnc_addPerFrameHandler;
} forEach allUnits;

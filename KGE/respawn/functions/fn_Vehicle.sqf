/* ----------------------------------------------------------------------------------------------------

File: fn_vehRespawn.sqf

Author: Iceman77

Description:
	- Monitor a vehicle and "respawn" it if it's destroyed or abandoned
	- Can be used on vehicles
	- Set vehicle init upon respawn (optional)
	- Store and keep the vehicle's variable name automatically

Parameter(s):
	- _this select 0: < OBJECT > - VEHICLE
	- _this select 1: < NUMBER > - ABANDONED DELAY IN SECONDS
	- _this select 2: < NUMBER > - DESTROYED DELAY IN SECONDS
	- _this select 3: < CODE > - FUNCTION THE VEHICLE CALLS UPON RESPAWN (OPTIONAL)

Usage (Vehicle init Line):
	_nul = [ this, 120, 60, LVR_fnc_hunterInit ] spawn LVR_fnc_vehRespawn << have the vehicle call the custom LVR Function upon respawn (see functions.hpp && fn_hunterInit.sqf)
	_nul = [this, 20, 10, {_this setVehicleAmmo 0;  _this setDammage 0.5;}] spawn LVR_fnc_vehRespawn; << Run code directly on the vehicle upon respawn
	_nul = [ this, 120, 60 ] spawn LVR_fnc_vehRespawn; << Default usage

---------------------------------------------------------------------------------------------------- */


// SERVER CODE
if ( ! ( isServer ) ) exitWith {};

// SET SCOPE OF LOCAL VARIABLES
private ["_veh","_abandonDelay","_destroyedDelay","_vehInit","_vehName","_vehDir","_vehPos","_vehtype","_abandoned","_dead"];

// PASSED ARGUMENTS ( OBJECT, ABANDONED DELAY, DESTROYED DELAY )
_veh = 			 [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_destroyedDelay =[_this, 1, 60, [0]] call BIS_fnc_param;
_abandonDelay =  [_this, 2, 60, [0]] call BIS_fnc_param;
_vehInit =       [_this, 3, {}, [{}] ] call BIS_fnc_param;

if(isNull _veh) exitWith {};

_vehName =  vehicleVarName _veh;
_vehDir = 	getDir _veh;
_vehPos = 	getPos _veh;
_vehtype = 	typeOf _veh;


KGE_Respawn_Vehicle_Abandoned = {
	( ( alive (_this select 0) ) && { ( canMove (_this select 0) ) && { { ( alive _x ) } count ( crew (_this select 0) ) == 0 } } )
};

KGE_Respawn_Vehicle_Dead = {
	( !( alive (_this select 0)) || !( canMove (_this select 0) ) )
};

// Player info change (AGM)
[{
	_args = _this select 0;

	_veh = 	_args select 0;
	_destroyedDelay = _args select 1;
	_abandonDelay = _args select 2;
	_vehInit = _args select 3;
	_vehName = _args select 4;
	_vehDir = _args select 5;
	_vehPos = _args select 6;
	_vehtype = _args select 7;

	// Set Vehicle abandoned timer up if abandoned
	if([_veh] call KGE_Respawn_Vehicle_Abandoned AND { _veh distance _vehPos > 10 }) then {
		_veh setVariable ["KGE_Respawn_Vehicle_AbandonedTimer", (_veh getVariable ["KGE_Respawn_Vehicle_AbandonedTimer", 0]) + 1]
	};

	// Set Vehicle dead timer up if destroyed
	if([_veh] call KGE_Respawn_Vehicle_Dead) then {
		_veh setVariable ["KGE_Respawn_Vehicle_DeadTimer", (_veh getVariable ["KGE_Respawn_Vehicle_DeadTimer", 0]) + 1]
	};

	// Check if dead timer is bigger than destroyed delay
	if((_veh getVariable ["KGE_Respawn_Vehicle_AbandonedTimer", 0]) >= _abandonDelay || (_veh getVariable ["KGE_Respawn_Vehicle_DeadTimer", 0]) >= _destroyedDelay) then {
		deleteVehicle _veh;

		_veh = createVehicle [ _vehtype, _vehPos, [], 0, "CAN_COLLIDE" ];
		_veh setPos [ ( _vehPos select 0 ), ( _vehPos select 1 ), 0 ];
		_veh setDir _vehDir;
		_veh call _vehInit;
		if (_vehName != "") then {
			missionNamespace setVariable [_vehName, _veh];
			publicVariable _vehName;
		};

		_veh setVariable ["KGE_Respawn_Vehicle_AbandonedTimer", 0];
		_veh setVariable ["KGE_Respawn_Vehicle_DeadTimer", 0];
	};
}, 1, [_veh, _destroyedDelay, _abandonDelay, _vehInit, _vehName, _vehDir, _vehPos, _vehtype]] call CBA_fnc_addPerFrameHandler;
#include "script_component.hpp"

[{
	if(GVAR(exitSpectator)) exitWith {
		[_this select 1] call cba_fnc_removePerFrameHandler;
	}

	private ["_actionCam", "_targetPos", "_targetDir", "_comSpeed", "_foo", "_dist", "_z"];

	// if target is null then refreh player list and select first
	if ( (isNull GVAR(target)) ) exitWith {
		call FUNC(refreshPlayerList);

		GVAR(target) = deathCam select 0;
	};

	_actionCam = false;
	if(	GVAR(CombatActionFilter) &&
		{ (diag_tickTime > GVAR(nexAutoTargetTime)) } && 
		{ !(GVAR(autoTarget) isEqualTo GVAR(target)) }
		{ (alive GVAR(autoTarget) } &&
		{ ( !GVAR(aiFilter) || isPlayer GVAR(autoTarget) ) }) then {

		GVAR(target) = GVAR(autoTarget);
		GVAR(nexAutoTargetTime) = diag_tickTime + (random 10 max 4 min 6);
		false call FUNC(playerMenuHandler);

		if(GVAR(cameras) select GVAR(cameraIdx) == GVAR(cam1stPerson)) then {
			call FUNC(cameraMenuHandler);
		};

		_actionCam = true;
	};

	if ( !(isNull GVAR(target)) && { (alive GVAR(target)) } ) then {
		_targetPos = (vehicle GVAR(target) modelToWorld [0,0,0]);
		_targetDir = (getDir GVAR(target));
		_comSpeed = ((1.0 - ((speed vehicle GVAR(target)) / 70))/3) max 0.1;	

		switch ( stance _KEGs_target ) do
		{
			case "STAND": {
				_foo = 2.10;
			};
			case "CROUCH": {
				_foo = 1.50;
			};
			case "PRONE": {
				_foo = 0.5;
			};
			default {
				_foo = 2.6;
			};
		};

		if ( _actionCam ) then { GVAR(camLockOn) setDir _targetDir};
				
		// If distance is greater that 650 to target then don't set speed	
		if( (vehicle GVAR(target)) distance KEGscam_target > 650 ) then { _comSpeed = 0; };

		//Set dummy cam location
		GVAR(camTarget) camSetPos [(_KEGs_targetPos select 0), (_KEGs_targetPos select 1), (_KEGs_targetPos select 2)+(_foo*0.7)];			
		GVAR(camTarget) camCommit _comSpeed; // /2;
				
		// Lockon camera, user rotates camera around target	
		_dist = (-(2*(0.3 max 5)));
		_z = sin(GVAR(angle) select 1)*(2*(0.3 max 5));
		GVAR(camLockOn) camSetRelPos [
				(sin(GVAR(angle) select 0)*_dist)*cos(GVAR(angle) select 1), 
				(cos(GVAR(angle) select 0)*_dist)*cos(GVAR(angle) select 1),
				_z];
		GVAR(camLockOn) camCommit _comSpeed;

		// Chase Camera
		GVAR(camChase) setDir _targetDir;
		GVAR(camChase) camSetRelPos[sin(_targetDir)*(-(2*5)), cos(_targetDir)*(-(2*5)), 0.6*abs 5];
		GVAR(camChase) camCommit _comSpeed;

		// Free camera
		if (GVAR(cameras) select GVAR(cameraIdx) isEqualTo GVAR(camFree)) then {
			GVAR(camMarker) setMarkerPosLocal position GVAR(camFree);
			GVAR(camMarker) setMarkerDirLocal direction GVAR(camFree);
		};
				
		{_x camSetFov GVAR(camZoom)} foreach GVAR(cameras);	
	};
}, 1, []] call cba_fnc_addPerFrameHandler;
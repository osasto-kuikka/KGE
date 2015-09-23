/* 	The main routine for spawning the civilians
/*
/*	Param0: Max. civilians
/* 	Param1: Min. spawndistance
/* 	Param2: Max. distance to players
*/
	
waitUntil {time > 2}; // Initial waiting
if (isNil "L_civs_debug") then {L_civs_debug = 0};

L_civs_maxCivs		  = _this select 0;
L_civs_mindDist		  = _this select 1;
L_civs_maxDist		  = _this select 2;
L_civs_currentCivs 	  = 0;
L_civs_allInBlacklist = false;

[] spawn L_fnc_civs_trackPlayers;

// private Variables
private ["_spawnPos","_type","_civ","_civ2","_car","_sleepTime"];
_sleepTime = 1;
	
//////////////////////////////////////////////////////////////////////////////////////////////
// Sorry for the bad commenting :( Lazy
for "_i" from 0 to 1 step 0 do { // Infinite Loop
	waitUntil {sleep 2; L_civs_currentCivs < L_civs_maxCivs};
	while {L_civs_currentCivs < L_civs_maxCivs} do {
		_sleepTime = 1;
		_spawnPos 	= [(getPosATL (allPlayers call BIS_fnc_selectRandom)), (L_civs_mindDist + (random (L_civs_maxDist - L_civs_mindDist)))] call L_fnc_civs_randomPos;
		_spawnPos	= [_spawnPos, 250] call L_fnc_civs_getRoadPos;
		if ([_spawnPos] call L_fnc_civs_distanceCheck) then {
			if ([_spawnPos] call L_fnc_civs_blackListCheck) then {
				_civ = [_spawnPos] call L_fnc_civs_civSpawn;
				_car = [_spawnPos] call L_fnc_civs_carSpawn;
				_civ moveinDriver _car;
				_civ allowDamage true;
				[_civ, _car] spawn L_fnc_civs_addWayPoints;
				[_civ, _car] spawn L_fnc_civs_civCheck;
			};
		};
		if (L_civs_allInBlacklist) then {
			_sleepTime = 7;
		};
		sleep _sleepTime;
		if (L_civs_debug >= 1 && L_civs_debug != 3) then {hintSilent format ["All players in blacklist: %1 \n sleepTime: %2 \n Current Civs: %3", L_civs_allInBlacklist, _sleepTime, L_civs_currentCivs]};
	};
};
/*	Spawns a civilian of a random type
/*
/*	Param0: Spawn Position
*/

private ["_spawnPos","_type","_grp","_civ"];
_spawnPos 	= _this select 0;
_type 		= L_civs_civClasses call BIS_fnc_selectRandom;
_grp 		= createGroup civilian;
_civ 		= _grp createUnit [_type, _spawnPos,[],0,""];

_civ allowDamage false;
_civ setBehaviour "safe";					
_civ setSkill 0;	// Set skill to 0, saves performance :)

L_civs_currentCivs = L_civs_currentCivs + 1;
[_civ] joinSilent grpNull;
deleteGroup _grp;
if (L_civs_debug == 2) then {hintSilent format ["Spawned a civilian \n Class: %1 \n Position: %2",_type,_spawnPos]};
_civ;
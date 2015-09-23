/*
 * Author: nikolauska
 *
 * Creates civilian and car for him
 *
 * Argument:
 *
 * Return value:
 */

#include "..\script_component.hpp"

params ["_spawnPos"];

private ["_typeMan", "_civ"];
_typeMan = [GVAR(civMen)] call EFUNC(common,selectRandom) select 0;
_civ     = createAgent [_typeMan, _spawnPos,[],0,""];

_civ allowDamage false;
_civ disableAI "FSM";
_civ setBehaviour "CARELESS";
_civ setSkill 0; // Set skill to 0, saves performance :)

INC(GVAR(currentAmount));

private ["_typeCar", "_car", "_roadlist"];
_typeCar  = [GVAR(civCar)] call EFUNC(common,selectRandom) select 0;
_car 	  = _typeCar createVehicle _spawnPos;
_roadList = _spawnPos nearRoads 10;

if (count _roadlist >= 2) then {
    private ["_connects", "_connected"];
	_connects	= roadsConnectedTo (_roadList select 0);
	_connected 	= _connects select 0;

	_car setDir ([(_roadList select 0), _connected] call BIS_fnc_DirTo);
};

//_car allowCrewInImmobile true;

_civ moveinDriver _car;
_civ allowDamage true;

private ["_pos"];
_pos = [(getPosATL _car), 5500] call EFUNC(common,randomPosition);
_civ setVariable [QGVAR(movePos), _pos];
_civ setDestination [_pos, "LEADER PLANNED", true];

[_civ, _car] call FUNC(civLoop);

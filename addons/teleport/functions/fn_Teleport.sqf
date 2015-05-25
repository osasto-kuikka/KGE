private ["_unit", "_targetUnit"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_targetUnit = [_this, 1, objNull, [objNull, []]] call BIS_fnc_param;
_distance = [_this, 2, 10, [0]] call BIS_fnc_param;

// Jos arvot ovat null niin poistu
if(isNull _unit) exitWith {["KGE_Teleport_fnc_Teleport", "ERROR", "Siirrettävä unit on NULL!"] call KGE_Debug_fnc_AddLog;};

// Jos pelaaja on locaali niin älä teleporttaa
if(_unit isEqualTo _targetUnit) exitWith {};

// Jos arvo on array niin teleporttaa annettuun paikkaa
if(typeName _targetUnit == "ARRAY") exitWith {
	if(count _targetUnit == 3) then {
		private ["_dist", "_dir"];
		_dist = random _distance;
		_dir = random 360;

		_unit setPos [(_targetUnit select 0) + (sin _dir) * _dist, (_targetUnit select 1) + (cos _dir) * _dist, (_targetUnit select 2)];
	} else {
		["KGE_Teleport_fnc_Teleport", "ERROR", "Virheellinen position array!"] call KGE_Debug_fnc_AddLog;
	};
};

// Jos arvot ovat null niin poistu
if(isNull _targetUnit) exitWith {["KGE_Teleport_fnc_Teleport", "ERROR", "Kohde unit on NULL!"] call KGE_Debug_fnc_AddLog;};

waitUntil {
	(vehicle _targetUnit == _targetUnit) OR ((vehicle _targetUnit) emptyPositions "cargo" != 0)
};


if (vehicle _targetUnit == _targetUnit) then {
	private ["_targetPos", "_targetDir"];

	// Jos ryhmänjohtaja ei ole ajoneuvossa niin teleporttaa hänen taakseen
	_targetPos = getPosASL _targetUnit;
	_targetDir = getDir _targetUnit;
	_unit setPosASL [
					(_targetPos select 0) + (3 * sin (_targetDir - 180)),
					(_targetPos select 1) + (3 * cos (_targetDir - 180)),
					0
					];
} else {
	// Jos ryhmänjohtaja on ajoneuvossa niin teleporttaa ajoneuvon sisälle
	_unit moveInCargo vehicle _targetUnit;
};
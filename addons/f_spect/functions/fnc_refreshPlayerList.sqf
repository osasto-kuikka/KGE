#include "script_component.hpp"

private ["_unit", "_name"];

// Clear and re-fill targets listbox
lbClear IDC_MENUTGT;

_deatList = call EFUNC(respawn, getDeadUnits);
GVAR(playerList) = [];

for "_idx" from 0 to ((count _deatList)-1) do {
	_unit = _deatList select _idx;
	_name = _unit call EFUNC(core, getName);
		
	_OriginalSide = _unit call EFUNC(core, getSide); 

	if(_unit isEqualTo GVAR(target)) then {GVAR(tgtIdx) = _idx};

	if (_OriginalSide in KEGsShownSides && _unit call EFUNC(respawn, isAlive)) then {				
		if (!GVAR(aiFilter) || (isPlayer _unit)) then {
			_index = lbAdd[IDC_MENUTGT, _name];					
			lbSetValue[IDC_MENUTGT, _i, _idx]; // Value used to id unit

			PUSH(GVAR(playerList), _unit);
					
			(_OriginalSide) call {
				if(_this == west) exitWith {lbSetColor[IDC_MENUTGT, _i, [0.8,0.8,1,1]]};
				if(_this == east) exitWith {lbSetColor[IDC_MENUTGT, _i, [1,0.8,0.8,1]]};
				if(_this == resistance) exitWith {lbSetColor[IDC_MENUTGT, _i, [0.8,1,0.8,1]]};
				if(_this == civilian) exitWith {lbSetColor[IDC_MENUTGT, _i, [1,1,1,1]]};
			};	
		};
	};	
};

IDC_MENUTGT lbSetCurSel GVAR(tgtIdx);

#include "script_component.hpp"

private ["_marker"];

{	
	_marker = _x GETVAR_SYS(marker, "");
	if(_marker == "") then {
		_marker = createMarkerLocal[format[QGVAR(marker_%1), _x], (getPos _x) ];
		_marker setMarkerTypeLocal "mil_dot";			
		_marker setMarkerSizeLocal [0.4, 0.4];
		_marker setMarkerTextLocal (_x call EFUNC(core, getName));

		_x SETVAR_SYS(GVAR(_marker), _marker);
	} else {
		_marker setMarkerPosLocal (getPos _x);
		_marker setMarkerTextLocal (_x call EFUNC(core, getName));
	};
					
	(_x call EFUNC(core, getSide)) call {
		if(_this == west) exitWith {_marker setMarkerColorLocal "ColorBlue"};
		if(_this == east) exitWith {_marker setMarkerColorLocal "ColorRed"};
		if(_this == resistance) exitWith {_marker setMarkerColorLocal "ColorGreen"};
		if(_this == civilian) exitWith {_marker setMarkerColorLocal "ColorWhite"};
	};

	true									
} count allUnits
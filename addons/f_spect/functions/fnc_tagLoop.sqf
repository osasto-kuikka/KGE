#include "script_component.hpp"

[{
	if(!GVAR(toggleTags)) exitWith {};

	// Exit if forced
	if(GVAR(forcedExit)) exitWith {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
	};

	private ["_iconColour", "_nameText", "_pos", "_distance", "_coef", "_icon"];

	{
		_iconColour = (_x call EFUNC(core, getSide)) call {
				if(_this == west) exitWith {[0.8,0.8,1,1]};
				if(_this == east) exitWith {[1,0.8,0.8,1]};
				if(_this == resistance) exitWith {[0.8,1,0.8,1]};
				if(_this == civilian) exitWith {[1,1,1,1]};
		};

		_nameText = [_x] call KGE_Core_fnc_GetName;

		_pos = visiblePositionASL _x;
		_pos set [2, (_x modelToWorld [0,0,2.3]) select 2];
		_distance = _pos distance KGE_Spectator_camera;
		_coef = linearconversion [20,KGE_Spectator_TagFadeDist,_distance,1,0,true];
		_icon = ["\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\whitedot_ca.paa",_iconColour,_pos, (0.4 * _coef), (0.4 * _coef) ,0,_nameText,0, ((0.16 / (_distance max 0.01)) * 2) min 0.08];
		drawicon3d _icon;
	} forEach GVAR(tagList);
}, 0, 0] call CBA_fnc_addPerFrameHandler;

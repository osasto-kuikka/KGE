[{
	if(!KGE_Spectator_toggleTags && {!KGE_Spectator_AllowTags}) exitWith {};

	// Exit if forced
	if(KGE_Spectator_forcedExit) then {
		[_this select 1] call CBA_fnc_removePerFrameHandler;
	};

	private ["_iconColour", "_nameText", "_pos", "_distance", "_coef", "_icon"];

	{
		_iconColour = call {
			if (side _x == west) exitWith {KGE_Spectator_blufor_color};
			if (side _x == east) exitWith {KGE_Spectator_opfor_color};
			if (side _x == independent) exitWith {KGE_Spectator_indep_color};
			if (side _x == civilian) exitWith {KGE_Spectator_civ_color};
			KGE_Spectator_empty_color
		};

		_nameText = [_x] call KGE_Core_fnc_GetName;

		_pos = visiblePositionASL _x;
		_pos set [2, (_x modelToWorld [0,0,2.3]) select 2];
		_distance = _pos distance KGE_Spectator_camera;
		_coef = linearconversion [20,KGE_Spectator_TagFadeDist,_distance,1,0,true];
		_icon = ["\A3\ui_f\data\IGUI\RscIngameUI\RscUnitInfoAirRTDFull\whitedot_ca.paa",_iconColour,_pos, (0.4 * _coef), (0.4 * _coef) ,0,_nameText,0, ((0.16 / (_distance max 0.01)) * 2) min 0.08];
		drawicon3d _icon;
	} forEach KGE_Spectator_Frame_Units;
}, 0, 0] call CBA_fnc_addPerFrameHandler;

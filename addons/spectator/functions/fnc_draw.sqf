#include "script_component.hpp"

GVAR(draw3d) = addMissionEventHandler ["Draw3D", {
	_cam = GVAR(cam);		
	_overlay = GETUVAR(GVAR(dlg_overlay),objNull);
	_compass = GETUVAR(GVAR(rsc_compass),objNull);
	_status = GETUVAR(GVAR(rsc_status),objNull);
	_map = GETUVAR(GVAR(dlg_map),objNull);
			
	if (!isNull _map) exitWith {};
			
	if (GVAR(displayMarkers) > 0) then {
			
		_topIcon = [];
		_scale = safeZoneH / 100;
		_list = allUnits;
		_list append GVAR(deadList);
		_textMax = (1.5 * _scale);
		_textMin = 6 * _scale;
		_iconMax = (30 * _scale);
		_iconMin = (120 * _scale);
				
		{
			_unit = _x;
			_draw = _unit GETVAR_SYS(GVAR(draw),[false]);
			EXPLODE_5_PVT(_draw,_canDraw,_name,_side,_icon,_colour);
			
			if(isNil "_colour") then {
				_colour = [1, 1, 1, 0.9];
			};

			if (_canDraw) then {
					
				_veh = vehicle _unit;
				_inVeh = (_veh != _unit);
				_cmdr = if (_inVeh && (_unit == ((crew _veh) select 0))) then {true} else {false};
						
				_toPos = if (_inVeh && _cmdr) then {_veh} else {_unit};
				_pos = if (surfaceIsWater getPos _toPos) then {getPosASLVisual _toPos} else {getPosATLVisual _toPos};
						
				if (count (worldToScreen _pos) > 0) then {
					_iconSize = 0;
							
					_text = "";
					_textSize = 0;

					_pos set [2, (_pos select 2) + 3];
					_dist = (_cam distance _pos) + 0.1;
					_distScaled = _scale / sqrt(_dist);
							
					_iconScale = 300 * _distScaled;
					_iconSize = _iconScale max _iconMax min _iconMin;
							
					_showText = (_dist < 2000 && GVAR(displayMarkers) >= 2);
					if (_showText) then {
						_textScale = 10 * _distScaled;
						_textSize = _textScale max _textMax min _textMin;
					};
							
					if (_inVeh) then {
						if (_cmdr) then {
							_icon = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Icon");
							_text = if (_showText) then {
								"[" + (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")) + "] " + _name
							} else {""};
							_pos set [2, (_pos select 2) + 3];
						} else {
							_iconSize = 0;
							_text = if (_showText) then {_name} else {""};
							_textSize = if (_dist < 25) then {_textSize / 1.5} else {0};
						};
					} else {
						_text = if (_showText) then {_name} else {""};
					};
							
					if (GVAR(displayMarkers) > 2) then {
						_text = _text + " [" + str ceil(_dist) + "]";
					};
							
					if (_unit == GVAR(unit)) exitWith {
						_topIcon = [_icon, [1,1,0,1], _pos, _iconSize, _iconSize, 0, _text, 2, _textSize, "PuristaBold", "CENTER", true];
					};
							
					drawIcon3D [_icon, _colour, _pos, _iconSize, _iconSize, 0, _text, 2, _textSize, "PuristaMedium"];
				};
			};
		} forEach _list;
				
		if ((count _topIcon > 0) && GVAR(cameraOn)) then {drawIcon3D _topIcon};
				
		if (GVAR(displayMarkers) > 2) then {
				
			_iconSize = (20 * _size) max _scale min _min;
			_mines = allMines;
				
			{
				_pos = getPos _x;
				_dist = (_cam distance _pos) + 0.1;
				_distScaled = _scale / sqrt(_dist);
							
				_iconScale = 300 * _distScaled;
				_iconSize = _iconScale max _iconMax min _iconMin;
						
				_textSize = 0;
				_showText = (_dist < 2000 && GVAR(displayMarkers) >= 2);
				if (_showText) then {
					_textScale = 10 * _distScaled;
					_textSize = _textScale max _textMax min _textMin;
				};
							
				_name = switch (typeOf _x) do {	
					case "APERSTripMine_Wire_Ammo": {"Tripwire Mine"};
					case "APERSBoundingMine_Range_Ammo": {"Bounding Mine"};
					case "ClaymoreDirectionalMine_Remote_Ammo";
					case "ClaymoreDirectionalMine_Remote_Ammo_Scripted": {"Claymore Mine"};
					case "DemoCharge_Remote_Ammo";
					case "DemoCharge_Remote_Ammo_Scripted": {"Demo Charge"};
					case "SatchelCharge_Remote_Ammo";
					case "SatchelCharge_Remote_Ammo_Scripted": {"Satchel Charge"};
					case "APERSMine_Range_Ammo": {"APERS Mine"};
					case "ATMine_Range_Ammo": {"AT Mine"};
					case "SLAMDirectionalMine_Wire_Ammo": {"SLAM"};
				};
						
				drawIcon3D ["\A3\ui_f\data\map\markers\military\triangle_CA.paa", [1,1,0,1], getPos _x, _iconSize, _iconSize, 0, _name, 1, _textSize, "PuristaMedium"];
			} forEach _mines;
		};
	};
			
	if (!isNull _compass) then {
		_cam = GVAR(cam);
		_unit = GVAR(unit);

		_Q1 = _compass displayCtrl 1;
		_Q2 = _compass displayCtrl 2;
		_Q3 = _compass displayCtrl 3;
		_Q4 = _compass displayCtrl 4;
		_qOrder = [];

		_RESUNITS_X = safeZoneW / 100;
		_CENTRE = safeZoneX + safeZoneW / 2;
		_COMPASS_W = _RESUNITS_X * 20;
		_COMPASS_H = _COMPASS_W / 15;
		_COMPASS_X = _CENTRE - _COMPASS_W / 2;
		_y = safeZoneY;
		_ARC_W = _COMPASS_W / 2;
		_degUnit = _COMPASS_W / 180;

		_dir = if (GVAR(cameraOn)) then {getDir _cam} else {getDir _unit};
		_angleFromCentre = _dir - floor(_dir / 90) * 90;
		_leftEdgePos = _angleFromCentre * _degUnit;

		_positions = [
			[_CENTRE - _leftEdgePos - _ARC_W, _y],
			[_CENTRE - _leftEdgePos, _y],
			[_CENTRE - _leftEdgePos + _ARC_W, _y],
			[0, _y - 1]
		];

		switch (true) do {
			case ((_dir >= 0) && (_dir < 90)): {_qOrder = [_Q4, _Q1, _Q2, _Q3]};
			case ((_dir >= 90) && (_dir < 180)): {_qOrder = [_Q1, _Q2, _Q3, _Q4]};
			case ((_dir >= 180) && (_dir < 270)): {_qOrder = [_Q2, _Q3, _Q4, _Q1]};
			case (_dir >= 270): {_qOrder = [_Q3, _Q4, _Q1, _Q2]};
		};

		{
			_x ctrlSetPosition (_positions select _forEachIndex);
			_x ctrlCommit 0;
		} forEach _qOrder;
	};

	if (!isNull _status) then {
		_speedText = (str ([GVAR(moveScale), 4] call BIS_fnc_cutDecimals)) + "v";
		(_status displayCtrl 0) ctrlSetText _speedText;
		_name = "";
		_colour = [1,1,1,1];
		if (!isNull GVAR(unit)) then {
			_arr = GVAR(unit) getVariable "vip_asp_draw";
			_name = _arr select 1;
			_colour = _arr select 4;
			_colour set [3, 1];
		};
		(_status displayCtrl 1) ctrlSetText _name;
		(_status displayCtrl 1) ctrlSetTextColor _colour;
		_mode = if (GVAR(cameraOn)) then {
			if (isNull GVAR(attach)) then {"FREE"} else {"ATTACH"};
		} else {
			if (cameraView == "INTERNAL") then {"FIRST"} else {"THIRD"};
		};
		(_status displayCtrl 2) ctrlSetText _mode;
			
		_timeText = [dayTime] call BIS_fnc_timeToString;
		(_status displayCtrl 3) ctrlSetText _timeText;
			
		_fovText = (str ([GVAR(fov), 3] call BIS_fnc_cutDecimals)) + "a";
		(_status displayCtrl 4) ctrlSetText _fovText;
			
		_timeAccText = (str ([GVAR(accTime), 4] call BIS_fnc_cutDecimals)) + "x";
		(_status displayCtrl 5) ctrlSetText _timeAccText;
			
		_focusDist = [GVAR(focus) select 0, 1] call BIS_fnc_cutDecimals;
		_focusBlur = GVAR(focus) select 1;
			
		_focusText = if (_focusDist == -1 && _focusBlur == 1) then {"Auto"} else {if (_focusDist < 0) then {toString [8734]} else {str _focusDist + "m"}};
		(_status displayCtrl 6) ctrlSetText _focusText;
	};
}];

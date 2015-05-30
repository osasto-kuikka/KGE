#include "script_component.hpp"

PARAMS_1(_map);

_zoom = ctrlMapScale _map;
_scale = 5 * safeZoneH / 100;
_size = _scale / _zoom;
_min = 300 * _scale;
_textSize = (1/4 * _size) max (_scale / 2) min (_scale / 1.5);

if (GVAR(displayMarkers) > 0) then {
	_topIcon = [];
	_list = allUnits;
	_list append GVAR(deadList);
	{
		_unit = _x;
		_drawArray = _unit GETVAR_SYS(GVAR(draw), []);

		EXPLODE_4_PVT(_drawArray,_draw,_name,_side,_icon,_colour)
					
		if (_draw) then {			
			_veh = vehicle _unit;
			_inVeh = (_veh != _unit);
			if (_inVeh && !(_unit == ((crew _veh) select 0))) exitWith {};
						
			_toPos = if (_inVeh) then {_veh} else {_unit};
			_pos = getPosVisual _toPos;
			_dir = getDir _toPos;
						
			_icon = "";
			_iconSize = 0;
			_iconText = "";

			if (_inVeh) then {
				_icon = getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "Icon");
				_iconSize = (50 * _size) max _scale min (_min * 2);
				_iconText = "[" + (getText (configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName")) + "] " + _name;
			} else {
				_icon = _draw select 3;
				_iconSize = (50 * _size) max _scale min _min;
				_iconText = _name;
			};
						
			if (GVAR(displayMarkers) < 2) then {_iconText = ""};
						
			if (_unit == GVAR(unit)) exitWith {_topIcon = [_icon, [1,1,0,1], _pos, _iconSize, _iconSize, _dir, _iconText, 1, _textSize, "PuristaBold", "RIGHT"]};
						
			_map drawIcon [_icon, _colour, _pos, _iconSize, _iconSize, _dir, _iconText, 1, _textSize, "PuristaMedium", "RIGHT"];
		};
	} forEach _list;
				
	if (count _topIcon > 0) then {_map drawIcon _topIcon};
				
	if (GVAR(displayMarkers) > 2) then {
				
		_iconSize = (20 * _size) max _scale min _min;
		_mines = allMines;
				
		{
			_name = call {
				if((typeOf _x) == "APERSTripMine_Wire_Ammo") 					  exitWith {"Tripwire Mine"};
				if((typeOf _x) == "APERSBoundingMine_Range_Ammo") 				  exitWith {"Bounding Mine"};
				if((typeOf _x) == "ClaymoreDirectionalMine_Remote_Ammo") 		  exitWith {"Claymore Mine"};
				if((typeOf _x) == "ClaymoreDirectionalMine_Remote_Ammo_Scripted") exitWith {"Claymore Mine"};
				if((typeOf _x) == "DemoCharge_Remote_Ammo") 					  exitWith {"Demo Charge"};
				if((typeOf _x) == "DemoCharge_Remote_Ammo_Scripted") 			  exitWith {"Demo Charge"};
				if((typeOf _x) == "SatchelCharge_Remote_Ammo") 					  exitWith {"Satchel Charge"};
				if((typeOf _x) == "SatchelCharge_Remote_Ammo_Scripted") 		  exitWith {"Satchel Charge"};
				if((typeOf _x) == "APERSMine_Range_Ammo") 						  exitWith {"APERS Mine"};
				if((typeOf _x) == "ATMine_Range_Ammo") 							  exitWith {"AT Mine"};
				if((typeOf _x) == "SLAMDirectionalMine_Wire_Ammo") 				  exitWith {"SLAM"};
			};
						
			_map drawIcon ["\A3\ui_f\data\map\markers\military\triangle_CA.paa", [1,1,0,1], getPos _x, _iconSize, _iconSize, getDir _x, _name, 1, _textSize / 2, "PuristaMedium"];
		} forEach _mines;
					
		{
			EXPLODE_2_PVT(_x,_unit,_positions);

			_draw = _unit GETVAR_SYS(GVAR(draw),[]);
			if (count _draw > 1) then {
				_colour = _draw select 4;
				if (!GVAR(cameraOn) && {_unit == GVAR(unit)}) then {
					_colour = [1,1,0,1];
				};
				_count = count _positions;

				if (_count > 1) then {
					{
						if (_forEachIndex > 0 && {_forEachIndex < _count}) then {
							_pos1 = _x;
							_pos2 = _positions select (_forEachIndex - 1);
							_map drawLine [_pos1, _pos2, _colour];
						};
					} forEach _positions;
				};
							
				if (alive _unit) then {_map drawLine [_positions select (_count - 1), getPosVisual _unit, _colour]};
			};
		} forEach GVAR(trackingArray);
	};
};
			
if (GVAR(cameraOn)) then {
	_map drawIcon ["\A3\ui_f\data\gui\Rsc\RscDisplayMissionEditor\iconcamera_ca.paa", [1,1,1,1], getPos GVAR(cam), 500 * _scale, 500 * _scale, getDir GVAR(cam), "", 0, 0, "PuristaMedium"];
};
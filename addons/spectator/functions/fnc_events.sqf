/*
	Author: voiper, derived from code by Karel Moricky

	Description: Spectator camera and UI, based on Splendid camera.
	
	Parameters (Init):
		0: Bool; whether camera is permanent (set to true for permadeath spectator; false for singleplayer photography sessions)
		1: Scalar; unit path tracking mode; 0 for none; 1 for temporary (while camera is active); 2 for always on
		2: Array (optional); PosASL for initial camera position (by default, camera spawns next to KGE_Player; with this, you can make a swanky establishing shot)
		
	Example:
		//camera isn't permanent, tracking is on while camera is on, with custom establishing shot positiion
		["Init", [false, 1, [3200, 1200, 50]]] call FUNC(events);

	Returns:
	None.
*/

#include "script_component.hpp"

#define DIK_ESCAPE          0x01
#define DIK_1               0x02
#define DIK_2               0x03
#define DIK_3               0x04
#define DIK_4               0x05
#define DIK_5               0x06
#define DIK_6               0x07
#define DIK_7               0x08
#define DIK_8               0x09
#define DIK_9               0x0A
#define DIK_0               0x0B
#define DIK_MINUS           0x0C    /* - on main keyboard */
#define DIK_EQUALS          0x0D
#define DIK_BACKSPACE       0x0E    /* backspace */
#define DIK_LBRACKET        0x1A    /* [ */
#define DIK_RBRACKET        0x1B    /* ] */
#define DIK_BACKSLASH       0x2B    /* \ */
#define DIK_TAB             0x0F
#define DIK_Q               0x10
#define DIK_W               0x11
#define DIK_E               0x12
#define DIK_R               0x13
#define DIK_T               0x14
#define DIK_Y               0x15
#define DIK_U               0x16
#define DIK_I               0x17
#define DIK_O               0x18
#define DIK_P               0x19
#define DIK_LBRACKET        0x1A
#define DIK_RBRACKET        0x1B
#define DIK_RETURN          0x1C    /* Enter on main keyboard */
#define DIK_LCONTROL        0x1D
#define DIK_A               0x1E
#define DIK_S               0x1F
#define DIK_D               0x20
#define DIK_F               0x21
#define DIK_G               0x22
#define DIK_H               0x23
#define DIK_J               0x24
#define DIK_K               0x25
#define DIK_L               0x26
#define DIK_SEMICOLON       0x27
#define DIK_APOSTROPHE      0x28
#define DIK_GRAVE           0x29    /* accent grave */
#define DIK_LSHIFT          0x2A
#define DIK_BACKSLASH       0x2B
#define DIK_Z               0x2C
#define DIK_X               0x2D
#define DIK_C               0x2E
#define DIK_V               0x2F
#define DIK_B               0x30
#define DIK_N               0x31
#define DIK_M               0x32
#define DIK_COMMA           0x33
#define DIK_PERIOD          0x34    /* . on main keyboard */
#define DIK_SLASH           0x35    /* / on main keyboard */
#define DIK_RSHIFT          0x36
#define DIK_MULTIPLY        0x37    /* * on numeric keypad */
#define DIK_LMENU           0x38    /* left Alt */
#define DIK_SPACE           0x39
#define DIK_CAPITAL         0x3A
#define DIK_F1              0x3B
#define DIK_F2              0x3C
#define DIK_F3              0x3D
#define DIK_F4              0x3E
#define DIK_F5              0x3F
#define DIK_F6              0x40
#define DIK_F7              0x41
#define DIK_F8              0x42
#define DIK_F9              0x43
#define DIK_F10             0x44
#define DIK_F11             0x57
#define DIK_F12             0x58
#define DIK_NUMLOCK         0x45
#define DIK_SCROLL          0x46    /* Scroll Lock */
#define DIK_NUMPAD7         0x47
#define DIK_NUMPAD8         0x48
#define DIK_NUMPAD9         0x49
#define DIK_SUBTRACT        0x4A    /* - on numeric keypad */
#define DIK_NUMPAD4         0x4B
#define DIK_NUMPAD5         0x4C
#define DIK_NUMPAD6         0x4D
#define DIK_ADD             0x4E    /* + on numeric keypad */
#define DIK_NUMPAD1         0x4F
#define DIK_NUMPAD2         0x50
#define DIK_NUMPAD3         0x51
#define DIK_NUMPAD0         0x52
#define DIK_DECIMAL         0x53    /* . on numeric keypad */
#define DIK_NUMPADENTER     0x9C    /* Enter on numeric keypad */
#define DIK_NUMPADDIVIDE    0xB5    /* / on numeric keypad */
#define DIK_NUMPADMULTIPLY  0x37        /* * on numeric keypad */
#define DIK_END             0xCF    /* End on arrow keypad */
#define DIK_PRIOR           0xC9    /* PgUp on arrow keypad */
#define DIK_DELETE          0xD3    /* Delete on arrow keypad */
#define DIK_LEFT            0xCB    /* LeftArrow on arrow keypad */
#define DIK_RIGHT           0xCD    /* RightArrow on arrow keypad */
#define DIK_UP              0xC8    /* UpArrow on arrow keypad */
#define DIK_DOWN            0xD0    /* DownArrow on arrow keypad */

disableSerialization;

EXPLODE_2_PVT(_this,_mode,_param);

switch _mode do {
	case "Mouse": {
		_mapOn = uiNamespace getVariable QGVAR(dlg_map);
		if (!isNull _mapOn) exitWith {};
		
		_keys = GVAR(keys);
		_cam = GVAR(cam);
		_dir = GVAR(vector) select 0;
		_pitch = GVAR(vector) select 1;
		_bank = GVAR(vector) select 2;
		_camPos = getPosASL _cam;
		_coef = (GVAR(moveScale) * (((getPosATL _cam) select 2) / 2)) min 15 max 0.001;
		
		_move = {
			_inPos = _this;
			if (_inPos select 2 > 20000) then {_inPos set [2, 20000]};
			_obj = GVAR(attach);
			if !(isNull _obj) then {
				if ((GVAR(lock) select 0) < 0) then {
					_modelPos = _obj worldToModel (ASLtoATL _inPos);
					_cam attachTo [_obj, _modelPos];
				};
			} else {
				_cam setPosASL _inPos;
			};
		};
		
		if (GVAR(LMB) || GVAR(RMB)) then {
			if (GVAR(mouseBusy)) exitWith {};
			_mX = (_param select 1) * (GVAR(accTime) max 0.05);
			_mY = (_param select 2) * (GVAR(accTime) max 0.05);

			if (GVAR(RMB)) then {

				_dX = _mX;
				_dY = -_mY;
				
				_camPos = [_camPos, _dY, getDir _cam] call BIS_fnc_relPos;
				_camPos = [_camPos, _dX, getDir _cam + 90] call BIS_fnc_relPos;
				
				_camPos call _move;

			} else {
				if (GVAR(lock) select 0 > -1) exitWith {};
				_dX = _mX / 50 * 180 * GVAR(fov);
				_dY = -_mY / 50 * 180 * GVAR(fov);

				if (_keys select DIK_LCONTROL) then {
					_pitch = (_pitch + _dY) max -180 min 180;
					_bank = (_bank + _dX) max -181 min 181;
					if (_bank <= -181) then {_bank = 180} else {if (_bank >= 181) then {_bank = -180}};
				} else {
					_dir = _dir + _dX;
					_pitch = (_pitch + _dY) max -90 min 90;
				};
				GVAR(vector) = [_dir, _pitch, _bank];
				[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
			};
		};		

		_camMove = {
			EXPLODE_3_PVT(_this,_dX,_dY,_dZ);
			_pos = getPosASL _cam;
			_moveDir = (getDir _cam) + (_dX * 90);
			_camPos = [
				(_pos select 0) + ((sin (_moveDir)) * _coef * _dY),
				(_pos select 1) + ((cos (_moveDir)) * _coef * _dY),
				(_pos select 2) + _dZ * _coef / 1.5
			];
			_camPos set [2, (_camPos select 2) max (getTerrainHeightASL _camPos + 0.1)]; //for some reason, cameras reports 10cm higher than they actually are (without visual change for those 10cm)

			_camPos call _move;
		};
		
		_camRotate = {
			if ((GVAR(lock) select 0) > -1) exitWith {};
			_dX = (_this select 0) * GVAR(fov);
			_dY = (_this select 1) * GVAR(fov);
			_pitch = ((GVAR(vector) select 1) + _dY) max -90 min 90;
			_bank = GVAR(vector) select 2;
			_dir = _dir + _dX;
			GVAR(vector) = [_dir, _pitch, _bank];
			[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
		};
		
		_camBank = {
			if ((GVAR(lock) select 0) > -1) exitWith {};
			_dZ = _this select 0;
			_pitch = GVAR(vector) select 1;
			_bank = ((GVAR(vector) select 2) + _dZ) max -181 min 181;
			if (_bank == -181) then {_bank = 180} else {if (_bank == 181) then {_bank = -180}};
			GVAR(vector) = [_dir, _pitch, _bank];
			[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
		};

		if (_keys select DIK_W) then {[0,1,0] call _camMove};
		if (_keys select DIK_S) then {[0,-1,0] call _camMove};
		if (_keys select DIK_A) then {[-1,1,0] call _camMove};
		if (_keys select DIK_D) then {[1,1,0] call _camMove};

		if (_keys select DIK_Q) then {[0,0,1] call _camMove};
		if (_keys select DIK_Z) then {[0,0,-1] call _camMove};

		if (_keys select DIK_NUMPAD1) then {[-1,-1,0] call _camRotate};
		if (_keys select DIK_NUMPAD2) then {[+0,-1,0] call _camRotate};
		if (_keys select DIK_NUMPAD3) then {[+1,-1,0] call _camRotate};
		if (_keys select DIK_NUMPAD4) then {[-1,+0,0] call _camRotate};
		if (_keys select DIK_NUMPAD6) then {[+1,+0,0] call _camRotate};
		if (_keys select DIK_NUMPAD7) then {[-1,+1,0] call _camRotate};
		if (_keys select DIK_NUMPAD8) then {[+0,+1,0] call _camRotate};
		if (_keys select DIK_NUMPAD9) then {[+1,+1,0] call _camRotate};
		if (_keys select DIK_NUMPADDIVIDE) then {[-1] call _camBank};
		if (_keys select DIK_NUMPADMULTIPLY) then {[+1] call _camBank};

		if (_keys select DIK_ADD) then {
			GVAR(fov) = GVAR(fov) - (GVAR(fov) / 50) max 0.01;
			_cam camPrepareFOV GVAR(fov);
			_cam camCommitPrepared 0;
		};
		if (_keys select DIK_SUBTRACT) then {
			GVAR(fov) = GVAR(fov) + (GVAR(fov) / 50) min 2;
			_cam camPrepareFOV GVAR(fov);
			_cam camCommitPrepared 0;
		};
		
		if (_keys select DIK_NUMPADENTER) then {
			GVAR(fov) = 0.7;
			_cam camPrepareFOV GVAR(fov);
			_cam camCommitPrepared 0;
		};
		
		if (_keys select DIK_MINUS) then {
			_cur = GVAR(focus) select 0;
			if (_cur < 0) then {_cur = 1};
			_cur = _cur - (_cur / 25) max 0.25;
			GVAR(focus) = [_cur, 1.5];
			_cam camSetFocus GVAR(focus);
			_cam camCommit 0;
		};
		
		if (_keys select DIK_EQUALS) then {
			_cur = GVAR(focus) select 0;
			if (_cur < 0) then {_cur = 1};
			_cur = _cur + (_cur / 25) min 5000;
			GVAR(focus) = [_cur, 1.5];
			_cam camSetFocus GVAR(focus);
			_cam camCommit 0;
		};
		
		if (_keys select DIK_LBRACKET)then {
			if (!isMultiplayer) then {
				_cur = GVAR(accTime);
				_cur = _cur - (_cur / 25) max 0;
				GVAR(accTime) = _cur;
				setAccTime GVAR(accTime);
			};
		};
		
		if (_keys select DIK_RBRACKET)then {
			if (!isMultiplayer) then {
				_cur = GVAR(accTime);
				_cur = _cur + (_cur / 25) min 4;
				GVAR(accTime) = _cur;
				setAccTime GVAR(accTime);
			};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonDown": {
		_mapOn = uiNamespace getVariable QGVAR(dlg_map);
		if (!isNull _mapOn) exitWith {};

		_button = _param select 1;
		_mX = _param select 2;
		_mY = _param select 3;
		_shift = _param select 4;
		_ctrl = _param select 5;
		_alt = _param select 6;

		switch (_button) do {
			case 0: {GVAR(LMB) = true};
			case 1: {GVAR(RMB) = true};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseButtonUp": {
		_mapOn = uiNamespace getVariable QGVAR(dlg_map);
		if (!isNull _mapOn) exitWith {};
		
		_button = _param select 1;
		switch (_button) do {
			case 0: {GVAR(LMB) = false};
			case 1: {GVAR(RMB) = false};
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MouseZChanged": {
		_mapOn = uiNamespace getVariable QGVAR(dlg_map);
		if (!isNull _mapOn) exitWith {};
		
		_diff = _param select 1;
		if (_diff > 0) then {
			GVAR(moveScale) = GVAR(moveScale) + (GVAR(moveScale) / 10) min 5;
		} else {
			GVAR(moveScale) = GVAR(moveScale) - (GVAR(moveScale) / 10) max 0.001;
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyDown": {
		EXPLODE_5_PVT(_param,_null,_key,_shift,_ctrl,_alt);
		_return = false;

		GVAR(keys) set [_key, true];

		_cam = GVAR(cam);
		_camOn = GVAR(cameraOn);
		_unit = GVAR(unit);
		_lock = GVAR(lock) select 0;

		_camPos = [getPos _cam, GVAR(vector), GVAR(fov), GVAR(focus)];
		
		_camSaveSpot = {
			EXPLODE_1_PVT(_this,_num);
			if (!isNull GVAR(attach)) then {
				_vector = _camPos select 1;
				_dir = _vector select 0;
				_vector set [0, _dir - (getDir GVAR(attach))];
				_camPos set [1, _vector];
			};
			GVAR(savedSpots) set [_num, _camPos];		
		};
		
		_camLoadSpot = {
			EXPLODE_1_PVT(_this,_num);
			_arr = GVAR(savedSpots) select _num;
			if (count (_arr) > 0) then {
				if (!_camOn) then {["Camera", ["Free"]] call FUNC(events);};
				call _detach;
				_cam setPos (_arr select 0);
				_vector = _arr select 1;
				[_cam, _vector] call BIS_fnc_setObjectRotation;
				_cam camPrepareFOV (_arr select 2);
				_cam camPrepareFocus (_arr select 3);
				_cam camCommitPrepared 0;
				GVAR(vector) = _vector;
			};	
		};
		
		_camSaveUnit = {
			EXPLODE_1_PVT(_this,_num);
			if (!isNull _unit) then {GVAR(savedUnits) set [_num, [_unit]]};
		};
		
		_camLoadUnit = {
			EXPLODE_1_PVT(_this,_num);
			_arr = GVAR(savedUnits) select _num;
			if (count (_arr) > 0) then {
				_unit = _arr select 0;
				if (_lock > -1) then {["Camera", ["Lock"]] call FUNC(events)};
				if (GVAR(unit) == _unit) then {
					call _detach;
					if (_camOn) then {
						["Camera", ["Third"]] call FUNC(events);
					} else {
						["Camera", ["SwitchUnit"]] call FUNC(events);
					};
				} else {
				
					GVAR(unit) = _unit;
					if ((GVAR(lock) select 0) > -1) then {["Camera", ["Lock"]] call FUNC(events)};
					if (!_camOn) then {
						call _detach;
						["Camera", ["SwitchUnit"]] call FUNC(events);
					};
				};
			};	
		};
		
		_detach = {
			if (!isNull GVAR(attach)) then {
				["Camera", ["Attach"]] call FUNC(events);
			};
		};
		
		switch (_key) do {

			case (DIK_F1):  {if (_ctrl) then {[0]  call _camSaveSpot} else {[0]  call _camLoadSpot}; _return = true};
			case (DIK_F2):  {if (_ctrl) then {[1]  call _camSaveSpot} else {[1]  call _camLoadSpot}; _return = true};
			case (DIK_F3):  {if (_ctrl) then {[2]  call _camSaveSpot} else {[2]  call _camLoadSpot}; _return = true};
			case (DIK_F4):  {if (_ctrl) then {[3]  call _camSaveSpot} else {[3]  call _camLoadSpot}; _return = true};
			case (DIK_F5):  {if (_ctrl) then {[4]  call _camSaveSpot} else {[4]  call _camLoadSpot}; _return = true};
			case (DIK_F6):  {if (_ctrl) then {[5]  call _camSaveSpot} else {[5]  call _camLoadSpot}; _return = true};
			case (DIK_F7):  {if (_ctrl) then {[6]  call _camSaveSpot} else {[6]  call _camLoadSpot}; _return = true};
			case (DIK_F8):  {if (_ctrl) then {[7]  call _camSaveSpot} else {[7]  call _camLoadSpot}; _return = true};
			case (DIK_F9):  {if (_ctrl) then {[8]  call _camSaveSpot} else {[8]  call _camLoadSpot}; _return = true};
			case (DIK_F10): {if (_ctrl) then {[9]  call _camSaveSpot} else {[9]  call _camLoadSpot}; _return = true};
			case (DIK_F11): {if (_ctrl) then {[10] call _camSaveSpot} else {[10] call _camLoadSpot}; _return = true};
			case (DIK_F12): {if (_ctrl) then {[11] call _camSaveSpot} else {[11] call _camLoadSpot}; _return = true};

			case (DIK_1): {if (_ctrl) then {[0] call _camSaveUnit} else {[0] call _camLoadUnit}; _return = true};
			case (DIK_2): {if (_ctrl) then {[1] call _camSaveUnit} else {[1] call _camLoadUnit}; _return = true};
			case (DIK_3): {if (_ctrl) then {[2] call _camSaveUnit} else {[2] call _camLoadUnit}; _return = true};
			case (DIK_4): {if (_ctrl) then {[3] call _camSaveUnit} else {[3] call _camLoadUnit}; _return = true};
			case (DIK_5): {if (_ctrl) then {[4] call _camSaveUnit} else {[4] call _camLoadUnit}; _return = true};
			case (DIK_6): {if (_ctrl) then {[5] call _camSaveUnit} else {[5] call _camLoadUnit}; _return = true};
			case (DIK_7): {if (_ctrl) then {[6] call _camSaveUnit} else {[6] call _camLoadUnit}; _return = true};
			case (DIK_8): {if (_ctrl) then {[7] call _camSaveUnit} else {[7] call _camLoadUnit}; _return = true};
			case (DIK_9): {if (_ctrl) then {[8] call _camSaveUnit} else {[8] call _camLoadUnit}; _return = true};
			case (DIK_0): {if (_ctrl) then {[9] call _camSaveUnit} else {[9] call _camLoadUnit}; _return = true};
			
			case (DIK_NUMPAD5): {
				_dir = getDir _cam;
				if (!isNull GVAR(attach)) then {_dir = _dir - getDir GVAR(attach)};
				GVAR(vector) =  [_dir, 0, 0];
				[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
				GVAR(fov) = 0.7;
				_cam camPrepareFOV GVAR(fov);
				_cam camCommitPrepared 0;
			};
			
			case (DIK_NUMPADENTER): {_return = true};
			
			case (DIK_NUMPAD0): {_return = true};
			
			case (DIK_BACKSPACE): {
				GVAR(focus) = if (!_shift) then {
					[-1, 1];
				} else {
					[-1, -1];
				};
				_cam camPrepareFocus GVAR(focus);
				_cam camCommitPrepared 0;
				_return = true;
			};
			
			case (DIK_BACKSLASH): {
				if (!isMultiplayer) then {
					GVAR(accTime) = 1;
					setAccTime GVAR(accTime);
				};
			};
			
			case (DIK_GRAVE): {_return = true};
			
			case (DIK_SPACE): {
				if (!_camOn) exitWith {};
				if (_ctrl) then {
					["Camera", ["Attach"]] call FUNC(events);
				} else {
					["Camera", ["Lock"]] call FUNC(events);
				};
			};
			
			case (DIK_LEFT): {
				["Camera", ["NewUnit", -1]] call FUNC(events)
			};
			
			case (DIK_RIGHT): {
				["Camera", ["NewUnit", 1]] call FUNC(events)
			};
			
			case (DIK_UP): {
				if (isNull GVAR(unit)) exitWith {};
				if (_lock > -1) then {["Camera", ["Lock"]] call FUNC(events)};
				call _detach;
				if (_camOn) then {
					["Camera", ["Third"]] call FUNC(events);
				} else {
					if (cameraView == "EXTERNAL") then {
						["Camera", ["First"]] call FUNC(events);
					};
				};
			};
			
			case (DIK_DOWN): {
				if (isNull GVAR(unit)) exitWith {};
				if (_lock > -1) then {["Camera", ["Lock"]] call FUNC(events)};
				call _detach;
				if (!_camOn) then {
					if (cameraView == "INTERNAL" || cameraView == "GUNNER") then {
						["Camera", ["Third"]] call FUNC(events);
					} else {
						["Camera", ["Free"]] call FUNC(events);
					};
				};
			};
			
			case (DIK_T): {
				GVAR(displayMarkers) = GVAR(displayMarkers) + 1;
				if (GVAR(displayMarkers) > 3) then {GVAR(displayMarkers) = 0};
				if (GVAR(displayMarkers) == 0) then {clearRadio};
			};
			
			case (DIK_U): {
				_map = uiNameSpace getVariable [QGVAR(dlg_map), findDisplay 12202];
				if (!isNull _map) exitWith {};
			
				_overlay = uiNamespace getVariable [QGVAR(dlg_overlay), findDisplay 12200];
				if (isNull _overlay) then {
					createDialog QGVAR(dlg_overlay);
				} else {
					closeDialog 0;
				};
			};
			
			case (DIK_X): {
				_layer = [QGVAR(rsc_crosshair)] call BIS_fnc_rscLayer;
				_xhair = uiNamespace getVariable QGVAR(rsc_crosshair);
				if (isNull _xhair) then {
					_layer cutRsc [QGVAR(rsc_crosshair), "PLAIN", 0, true];
					["CrosshairColour"] call FUNC(events);
				} else {
					_layer cutText ["", "PLAIN"];
				};
			};
			
			case (DIK_C): {
				_layer = [QGVAR(rsc_compass)] call BIS_fnc_rscLayer;
				if (isNull (uiNamespace getVariable QGVAR(rsc_compass))) then {
					_layer cutRsc [QGVAR(rsc_compass), "PLAIN", 0, true];
				} else {
					_layer cutText ["", "PLAIN"];
				};
			};

			case (DIK_V): {
				_layer = [QGVAR(rsc_status)] call BIS_fnc_rscLayer;
				if (isNull (uiNamespace getVariable QGVAR(rsc_status))) then {
					_layer cutRsc [QGVAR(rsc_status), "PLAIN", 0, true];
				} else {
					_layer cutText ["", "PLAIN"];
				};
			};
				
			case (DIK_G): {
				_vd = uiNamespace getVariable [QGVAR(dlg_vd), findDisplay 12201];
				if (isNull _vd) then {createDialog QGVAR(dlg_vd)};
			};
			
			case (DIK_H): {
				_layer = [QGVAR(rsc_help)] call BIS_fnc_rscLayer;
				if (isNull (uiNamespace getVariable QGVAR(rsc_help))) then {
					_layer cutRsc [QGVAR(rsc_help), "PLAIN", 0, true];
				} else {
					_layer cutText ["", "PLAIN"];
				};					
			};
			
			case (DIK_M): {
				_map = uiNameSpace getVariable [QGVAR(dlg_map), findDisplay 12202];
				if (isNull _map) then {
					createDialog QGVAR(dlg_map);
				} else {
					closeDialog 0;
				};
			};

			case (DIK_N): {
				GVAR(vision) = GVAR(vision) + 1;
				if (GVAR(vision) > 4) then {GVAR(vision) = 0};
				switch (GVAR(vision)) do {
					case 0: {
						camUseNVG false;
						false SetCamUseTi 0;
					};
					case 1: {
						camUseNVG true;
						false SetCamUseTi 0;
					};
					case 2: {
						camUseNVG false;
						true SetCamUseTi 0;
					};
					case 3: {
						camUseNVG false;
						true SetCamUseTi 1;
					};
					
					case 4: {
						camUseNVG false;
						true SetCamUseTi 4;
					};
				};
			};

			case (DIK_ESCAPE): {
				if (!GVAR(noEscape)) then {
					_return = true;
					_param spawn {
						disableSerialization;
						_display = _this select 0;
						_message = ["Do you want to exit camera mode?", "KGE Spectator", nil, true, _display] call BIS_fnc_guiMessage;
						if (_message) then {call FUNC(forceExit)};
					};
				};
			};
			default {};
		};
		
		_return
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "KeyUp": {
		GVAR(keys) set [_param select 1, false];
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Camera": {
	
		_mode = _param select 0;
		
		_cam = GVAR(cam);
		_camOn = GVAR(cameraOn);
		_unit = GVAR(unit);
		_lock = GVAR(lock) select 0;
		_camPos = [getPos _cam, GVAR(vector), GVAR(fov), GVAR(focus)];

		_findTarget = {
		
			_ret = [];
			_screenPos = screenToWorld [0.5,0.5];
			_camPosASL = getPosASL _cam;
			_camPosReal = getPos _cam;
			_endPosASL = [_screenPos select 0, _screenPos select 1, getTerrainHeightASL _screenPos];
			_endPosReal = if (surfaceIsWater _endPosASL) then {_endPosASL} else {ASLtoATL _endPosASL};
			_objs = lineIntersectsWith [_camPosASL, _endPosASL, objNull, objNull, true];
			
			if (count _objs > 0) then { //if vehicle/object found
				_obj = _objs select (count _objs - 1);
				_ret = _obj;
			} else { //check for units near endpoint instead
				_units = allUnits;
				if (count _units > 0) then {
					_nearestUnit = _units select 0;		
					{if (_endPosReal distance _x < _endPosReal distance _nearestUnit) then {_nearestUnit = _x}} forEach _units;
					_intersect = [_nearestUnit, "FIRE"] intersect [_camPosReal, _endPosReal];
					if (count (_intersect) > 0) then {
						_ret = _nearestUnit;
					} else { //check for units near camera instead
						_nearestUnit = _units select 0;
						{if (_cam distance _x < _cam distance _nearestUnit) then {_nearestUnit = _x}} forEach _units;
						_intersect = [_nearestUnit, "FIRE"] intersect [_camPosReal, _endPosReal];
						if (count _intersect > 0) then {
							_ret = _nearestUnit;
						} else { //if nothing else, point at ground position
							_ret = _endPosReal;
						};
					};
				};				
			};
			_ret
		};
		
		switch (_mode) do {
		
			case "Free": {
				GVAR(cameraOn) = true;
				detach _cam;
				KGE_Player switchCamera "Internal";
				_cam cameraEffect ["Internal", "Back"];
				cameraEffectEnableHUD true;
				_dir = getDir _unit;
				_pos = [_unit, -5, _dir] call BIS_fnc_relPos;
				_pos set [2, ((getPos _unit) select 2) + 2];
				_cam setPos _pos;
				GVAR(vector) set [0, _dir];
				[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
			};
			
			case "First": {
				if (GVAR(unit) == KGE_Player) exitWith {};
				GVAR(cameraOn) = false;
				_cam attachTo [vehicle _unit, [0,0.1,0]];
				_cam cameraEffect ["Terminate", "Back"];
				if (vehicle _unit != _unit) then {
					vehicle _unit switchCamera "Internal"
				} else {
					_unit switchCamera "Internal";
				};
			};
			
			case "Third": {
				if (GVAR(unit) == KGE_Player) exitWith {};
				GVAR(cameraOn) = false;
				_cam attachTo [vehicle _unit, [0,0.1,0]];
				_cam cameraEffect ["Terminate", "Back"];
				if (vehicle _unit != _unit) then {
					vehicle _unit switchCamera "External"
				} else {
					_unit switchCamera "External";
				};
			};
			
			case "NewUnit": {
			
				_increment = _param select 1;
				if (count allUnits > 0) then {
					_allUnits = allUnits;
					{
						if !((_x getVariable "vip_asp_draw") select 0) then {_allUnits deleteAt _forEachIndex};
					} forEach allUnits;
					
					_count = count _allUnits;
					_index = _allUnits find _unit;
					_index = _index + _increment;
					if (_index < 0) then {_index = _count - 1};
					if (_index > (_count - 1)) then {_index = 0};
					
					GVAR(unit) = _allUnits select _index;
					if (!_camOn) then {["Camera", ["SwitchUnit"]] call FUNC(events)};
				};		
			};
			
			case "SwitchUnit": {
				if (cameraView == "INTERNAL" || cameraView == "GUNNER") then {
					["Camera", ["First"]] call FUNC(events);
				} else {
					["Camera", ["Third"]] call FUNC(events);
				};
			};
			
			case "Lock": {
				if (_lock < 0) then {
		
					_target = call _findTarget;
					
					if (typeName _target == "OBJECT") then {
						GVAR(lock) = [1, _target];
					} else {
						if (count _target > 0) then {
							GVAR(lock) = [1, _target];
						};
					};
					
					_cam camPrepareTarget (GVAR(lock) select 1);
					_cam camCommitPrepared 0;
					["CrosshairColour"] call FUNC(events);
				} else {
					_dir = getDir _cam;
					_pitchBank = _cam call BIS_fnc_getPitchBank;
					GVAR(lock) = [-1];
					_cam cameraEffect ["Terminate", "Back"];
					camDestroy _cam;
					_cam = "camera" camCreate (_camPos select 0);
					[_cam, _camPos select 1] call BIS_fnc_setObjectRotation;
					_cam camPrepareFOV (_camPos select 2);
					_cam camPrepareFocus GVAR(focus);
					_cam camCommitPrepared 0;
					_cam cameraEffect ["Internal", "Back"];
					cameraEffectEnableHUD true;
					GVAR(cam) = _cam;
					_obj = GVAR(attach);
					if !(isNull _obj) then {
						_modelPos = _obj worldToModel (_camPos select 0);
						_cam attachTo [_obj, _modelPos];
						_dir = _dir - getDir _obj;
					};
					GVAR(vector) = [_dir, _pitchBank select 0, 0];
					[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
					["CrosshairColour"] call FUNC(events);				
				};
			};
			
			case "Attach": {
				_dir = getDir _cam;
				_pitchBank = _cam call BIS_fnc_getPitchBank;
				if (isNull GVAR(attach)) then {
					_target = call _findTarget;
					if (typeName _target == "OBJECT" && _target isKindOf "AllVehicles") then {
						_dir = _dir - getDir _target;
						_cam attachTo [_target];
						GVAR(attach) = _target;
						["CrosshairColour"] call FUNC(events);
					};
				} else {
					detach _cam;
					GVAR(attach) = objNull;
					["CrosshairColour"] call FUNC(events);
				};
				GVAR(vector) = [_dir, _pitchBank select 0, _pitchBank select 1];
				[_cam, GVAR(vector)] call BIS_fnc_setObjectRotation;
			};
		};
		
		["CrosshairColour"] call FUNC(events);
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "CrosshairColour": {
	
		_xhair = uiNamespace getVariable QGVAR(rsc_crosshair);
		if (!isNull _xhair) then {
			_colour = if ((GVAR(lock) select 0) > -1) then {[1,0,0,0.8]} else {
				if (!isNull GVAR(attach)) then {[1,1,0,0.8]} else {[1,1,1,0.8]};
			};
			(_xhair displayCtrl 0) ctrlSetTextColor _colour;
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "OverlayList": {
		private ["_ctrl"];
		_overlay = _param;
		_ctrl = _overlay displayCtrl 0;
		_count = _ctrl tvCount [];
		for "_i" from 0 to _count do {
			_ctrl tvDelete [_x];
		};
		
		GVAR(overlayClose) = false;
		
		_ctrl tvAdd [[], "Opfor"];
		_ctrl tvAdd [[], "Blufor"];
		_ctrl tvAdd [[], "Indfor"];
		_ctrl tvAdd [[], "Civilian"];
		
		_unitList = [];
		
		{
			_units = units _x;
			private ["_groupNum"];
			{
				if (_x GETVAR_SYS(GVAR(listed), false)) then {
					_arr = _x GETVAR_SYS(GVAR(draw), []);
					if (_arr select 0) then {
						_name = _arr select 1;
						_side = _arr select 2;
						_icon = _arr select 3;
						_picture = "\a3\ui_f\data\map\VehicleIcons\" + _icon + "_ca.paa";
						_treeIndex = [];
						_unitList pushBack _x;
						
						if (_forEachIndex == 0) then {
							_groupNum = _ctrl tvAdd [[_side], _name];
							_treeIndex = [_side, _groupNum];
						} else {
							_num = _ctrl tvAdd [[_side, _groupNum], _name];
							_treeIndex = [_side, _groupNum, _num];
						};

						_ctrl tvSetPicture [_treeIndex, _picture];
						_ctrl tvSetData [_treeIndex, [_x] call FUNC(objectVar)];
						_unitList pushBack _treeIndex;
					};
				};
			} forEach _units;
		} forEach allGroups;
		
		if (!isNull GVAR(unit)) then {
			_treeIndex = _unitList select ((_unitList find GVAR(unit)) + 1);
			_ctrl tvSetCurSel _treeIndex;
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "OverlaySelect": {
	
		_ctrl = _param select 0;
		_selection = _param select 1;
		if (count _selection < 2) exitWith {};
		
		_str = _ctrl tvData _selection;
		_unit = missionNamespace getVariable _str;
		GVAR(unit) = _unit;
		if (GVAR(cameraOn)) then {
			["Camera", ["Third"]] call FUNC(events);
		} else {
			["Camera", ["SwitchUnit"]] call FUNC(events);
		};
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "Status": {
	
		_display = _param;
		_speedText = (str ([GVAR(moveScale), 4] call BIS_fnc_cutDecimals)) + "v";
		(_display displayCtrl 0) ctrlSetText _speedText;
		_name = "";
		_colour = [1,1,1,1];
		if (!isNull GVAR(unit)) then {
			_arr = GVAR(unit) getVariable "vip_asp_draw";
			_name = _arr select 1;
			_colour = _arr select 4;
			_colour set [3, 1];
		};
		(_display displayCtrl 1) ctrlSetText _name;
		(_display displayCtrl 1) ctrlSetTextColor _colour;
		_mode = if (GVAR(cameraOn)) then {
			if (isNull GVAR(attach)) then {"FREE"} else {"ATTACH"};
		} else {
			if (cameraView == "INTERNAL") then {"FIRST"} else {"THIRD"};
		};
		(_display displayCtrl 2) ctrlSetText _mode;
		
		_timeText = [dayTime] call BIS_fnc_timeToString;
		(_display displayCtrl 3) ctrlSetText _timeText;
		
		_fovText = (str ([GVAR(fov), 3] call BIS_fnc_cutDecimals)) + "a";
		(_display displayCtrl 4) ctrlSetText _fovText;
		
		_timeAccText = (str ([GVAR(accTime), 4] call BIS_fnc_cutDecimals)) + "x";
		(_display displayCtrl 5) ctrlSetText _timeAccText;
		
		_focusDist = [GVAR(focus) select 0, 1] call BIS_fnc_cutDecimals;
		_focusBlur = GVAR(focus) select 1;
		
		_focusText = if (_focusDist == -1 && _focusBlur == 1) then {"Auto"} else {if (_focusDist < 0) then {toString [8734]} else {str _focusDist + "m"}};
		(_display displayCtrl 6) ctrlSetText _focusText;
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "ViewDistance": {
		_dialog = if (count _param > 1) then {ctrlParent (_param select 0)} else {_param select 0};
		_dist = if (count _param > 1) then {_param select 1} else {-1};
		_text = _dialog displayCtrl 1;
		_slider = _dialog displayCtrl 2;
		
		if (_dist < 0) then {
			_slider slidersetRange [1000,20000];
			_slider sliderSetSpeed [1000,1000,1000];
			_slider sliderSetPosition viewDistance;
		} else {
			setViewDistance _dist;
		};

		_text ctrlSetText str viewDistance;
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapInit": {

		_map = _param displayCtrl 1;

		if (isNil QGVAR(mapPos)) then {
			GVAR(mapPos) = [(GVAR(respawnPos) select 0) / 2, (GVAR(respawnPos) select 1) / 2];
		};

		if (isNil QGVAR(mapZoom)) then {
			GVAR(mapZoom) = 0.75;
		};

		_map ctrlMapAnimAdd [0, GVAR(mapZoom), QGVAR(mapPos)];
		ctrlMapAnimCommit _map;
		setMousePosition [0.5, 0.5];

		_map ctrlAddEventHandler ["Draw", {_this call FUNC(mapDraw)}];
		_map ctrlAddEventHandler ["MouseButtonDblClick", {['MapClick', _this] call FUNC(events)}];	
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapClose": {
		_map = _param displayCtrl 1;
		GVAR(mapPos) = _map ctrlMapScreenToWorld [0.5,0.5];
		GVAR(mapZoom) = ctrlMapScale _map;
	};

	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapClick": {
		_map = _param select 0;
		_button = _param select 1;
		_shift = _param select 4;
		_mapPos = _map ctrlMapScreenToWorld [_param select 2, _param select 3];

		if (_shift) then {
			if (GVAR(cameraOn)) then {
				_dir = [getPos GVAR(cam), _mapPos] call BIS_fnc_dirTo;
				GVAR(vector) set [0, _dir];
				[GVAR(cam), GVAR(vector)] call BIS_fnc_setObjectRotation;				
			};
		} else {
		
			_newUnit = objNull;
		
			_scale = ctrlMapScale _map;
			_radius = _scale * 250;
			_units = nearestObjects [_mapPos, ["CAManBase"], _radius];
			_vehs = nearestObjects [_mapPos, ["LandVehicle", "Air"], _radius];
			
			if (count _units > 0) then {
				{
					if ((_x getVariable "vip_asp_draw") select 0) exitWith {
						_newUnit = _units select _forEachIndex;
					};
				} forEach _units;
			};
			
			if (isNull _newUnit) then {
				if (count _vehs > 0) then {
					{
						if (!isNull _newUnit) exitWith {};
						_crew = crew _x;
						if (count _crew > 0) then {
							{
								if ((_x getVariable "vip_asp_draw") select 0) exitWith {
									_newUnit = _crew select _forEachIndex;
								};
							} forEach _crew;
						};
					} forEach _vehs;
				};			
			};
			
			if (!isNull _newUnit) then {
				GVAR(unit) = _newUnit;
				if (GVAR(cameraOn)) then {
					["Camera", ["Third"]] call FUNC(events);
				} else {
					if (cameraView == "EXTERNAL") then {
						["Camera", ["Third"]] call FUNC(events);
					} else {
						["Camera", ["First"]] call FUNC(events);
					};
				};
			} else {
			
				if (!GVAR(cameraOn)) then {
					["Camera", ["Free"]] call FUNC(events);
				};
				_mapPos set [2, 10];
				GVAR(cam) setPosATL _mapPos;
			};
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "MapKeyDown": {
		EXPLODE_5_PVT(_param,_null,_key,_shift,_ctrl,_alt)
		_return = false;
	
		switch (_key) do {
			case (DIK_DELETE): {_return = true};
		};
		
		_return
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "UnitKilled": {
		_unit = _param select 0;
		_killer = _param select 1;
		_arr = _unit getVariable "vip_asp_draw";
		_colour = _arr select 4;
		{_colour set [_forEachIndex, _x / 2.5]} forEach _colour;
		_colour set [3, 0.8];
		_arr set [4, _colour];
		_unit setVariable ["vip_asp_draw", _arr];
		GVAR(deadList) pushBack _unit;

		if (!isNull _killer) then {
			if (GVAR(displayMarkers) > 2) then {
				_text = if (_killer == _unit) then {
					format ["%1 died", name _unit]
				} else {
					format ["%2 killed %1", name _unit, name _killer]
				};
				systemChat _text;
			};
		};
		
		if (_unit == GVAR(unit) && !GVAR(cameraOn)) then {
			["Camera", ["Free"]] call FUNC(events);
			GVAR(unit) = objNull;
		};
		
		if (!isNil "GVAR(trackingArray)") then {
			_pos = getPos _unit;
			_pos resize 2;
			_index = -1;
			{if ((_x select 0) == _unit) then {_index = _forEachIndex}} forEach GVAR(trackingArray);
			_unitArray = GVAR(trackingArray) select _index;
			_trackingArray = _unitArray select 1;
			_trackingArray pushBack _pos;
			_unitArray set [1, _trackingArray];
			GVAR(trackingArray) set [_index, _unitArray];
		};
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "UnitRespawn": {
		_unit = _param select 0;
		_unit setVariable ["vip_asp_listed", false];
	};
	
	///////////////////////////////////////////////////////////////////////////////////////////
	case "Help": {
		
		_dialog = _param;
	
		_c1Action = parseText "<t align='left'>
		<t underline='true'>Camera:</t><br />
		<br />
		Move<br />
		Pitch, Yaw<br />
		Roll<br />
		Slide<br />
		Speed Multiplier<br />
		Camera Mode<br />
		Track Pos or Object<br />
		Lock to Object<br />
		Save Pos<br />
		Recall Pos<br />
		Optic Mode<br />
		Focus<br />
		Autofocus<br />
		No Focus<br />
		Pitch and Yaw<br />
		Roll<br />
		Zoom<br />
		Reset Zoom<br />
		</t>
		";

		_c1Control = parseText "<t align='left'>
		<br />
		<br />
		W, A, S, D<br />
		LMB + Mouse<br />
		Ctrl + LMB + Mouse<br />
		RMB + Mouse<br />
		MouseWheel Up, Down<br />
		Arrow Up, Down<br />
		Space<br />
		Ctrl + Space<br />
		Ctrl + F1...F12<br />
		F1...F12<br />
		N<br />
		Keyboard - and +<br />
		Backspace<br />
		Shift + Backspace<br />
		Numpad 1...9<br />
		Numpad / and *<br />
		Numpad - and +<br />
		Numpad Enter<br />
		</t>
		";

		_c2Action = parseText "<t align='left'>
		<t underline='true'>Units:</t><br />
		<br />
		Cycle Unit<br />
		Save Unit<br />
		Recall Unit<br />
		Unit List<br />
		<br />
		<t underline='true'>Display:</t><br />
		<br />
		Toggle Crosshair<br />
		Toggle Compass<br />
		Toggle Status<br />
		View Distance Dialog<br />
		Cycle Marker Mode<br />
		Toggle Help<br />
		</t>
		";

		_c2Control = parseText "<t align='left'>
		<br />
		<br />
		Arrow Left, Right<br />
		Ctrl + 1...10<br />
		1...10<br />
		U<br />
		<br />
		<br />
		<br />
		X<br />
		C<br />
		V<br />
		G<br />
		T<br />
		H<br />
		</t>
		";

		if (!isMultiplayer) then {

		_add1 = parseText "<t align='left'>
		<br />
		<t underline='true'>Time:</t><br />
		<br />
		Faster, Slower<br />
		Reset
		</t>
		";

		_add2 = parseText "<t align='left'>
		<br />
		<br />
		<br />
		[ and ]<br />
		\<br />
		</t>
		";

			_c2Action = composeText [_c2Action, _add1];
			_c2Control = composeText [_c2Control, _add2];
		};
	
		(_dialog displayCtrl 1) ctrlSetStructuredText _c1Action;
		(_dialog displayCtrl 2) ctrlSetStructuredText _c1Control;
		(_dialog displayCtrl 3) ctrlSetStructuredText _c2Action;
		(_dialog displayCtrl 4) ctrlSetStructuredText _c2Control;
	};
};
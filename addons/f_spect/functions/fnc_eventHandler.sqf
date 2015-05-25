// "for Spectating Script";
// "Handles events such as keyboard keypresses";
// "by Kegetys <kegetys [?t] dnainternet.net>";

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
#define DIK_BACK            0x0E    /* backspace */
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
#define DIK_OEM_102         0x56    /* < > | on UK/Germany keyboards */
#define DIK_F11             0x57
#define DIK_NUMPADENTER     0x9C    /* Enter on numeric keypad */

#include "script_component.hpp"

EXPLODE_2_PVT(_this, _type, _param);

_UI = [IDC_CAMERA, IDC_TARGET, IDC_NAME, IDC_MENUCAM, IDC_MENUTGT, IDC_MENUCAMB, IDC_MENUTGTB, IDC_BG1, IDC_BG2, IDC_TITLE, IDC_HELP];

switch (_type) do
{
	// "User clicked map, find nearest unit";
	case "MapClick":
	{
		if (GVAR(camera) select GVAR(cameraIdx) == GVAR(freeCam)) then {	
			EXPLODE_2_PVT(_param, _x, _y);

			GVAR(freeCam) setpos [_x, _y, (getPosATL GVAR(freeCam)) select 2];

			QGVAR(camMarker) setmarkerposlocal position GVAR(freeCam);
			QGVAR(camMarker) setmarkerdirlocal direction GVAR(freeCam);

			if(ctrlVisible IDC_MAPFULL) then
			{
				ctrlShow[IDC_MAPFULL, false];
				ctrlShow[IDC_MAPFULLBG, false];
				0.5 fadeSound 0.5;
				ctrlShow[IDC_MAP, true];
			};
		} else {
			private ["_newCamTarget"];

			_newCamTarget = (nearestObjects [_param, ["CAManBase", "Air", "Car", "Tank"], 200]) select 0;

			if ( !( isNull _newCamTarget ) && { ( vehicle _newCamTarget == _newCamTarget ) } ) then {
				_newCamTarget = (crew _newCamTarget) select 0;
			};

			if ( !( isNull _newCamTarget ) && { !((GVAR(playerList) find _newCamTarget) == -1) } ) then
			{
				GVAR(tgtIdx) = GVAR(playerList) find _newCamTarget;

				GVAR(target) = _newCamTarget;

				GVAR(freeCam) setPosATL (GVAR(target) modelToWorld [0,-50,((getPosATL GVAR(freeCam)) select 2)]);
				GVAR(freeCam) setDir (getDir GVAR(target));
				[
					GVAR(freeCam),
					GVAR(pitchBank) select 0,
					0
				] call bis_fnc_setpitchbank;

				QGVAR(camMarker) setmarkerposlocal position GVAR(freeCam);
				QGVAR(camMarker) setmarkerdirlocal direction GVAR(freeCam);

				// adjust target name bottom left
				false spawn PlayerMenuHandler;

				GVAR(autoTarget) = GVAR(target);

				if(ctrlVisible IDC_MAPFULL) then
				{
					ctrlShow[IDC_MAPFULL, false];
					ctrlShow[IDC_MAPFULLBG, false];
					0.5 fadeSound 0.5;
					ctrlShow[IDC_MAP, true];
				};
			};
		};
	};

	case "KeyDown":
	{
		EXPLODE_1_PVT(_param, _key);

		// Set key
        GVAR(keys) set [_key,true];
	};

	// "Key up - process keypress";
	case "KeyUp":
	{
		EXPLODE_1_PVT(_param, _key);

		// Set key
        GVAR(keys) set [_key, false];

		switch(_key) do
		{
			case DIK_D: {
				// D
				if (GVAR(camera) select GVAR(cameraIdx) != GVAR(freeCam)) then {
					//Previous target
					GVAR(tgtIdx) = ( GVAR(tgtIdx) + 1 );
					if ( GVAR(tgtIdx) > ((count GVAR(playerList)) - 1 ) ) then { GVAR(tgtIdx) = 0 };

					GVAR(target) = GVAR(playerList) select GVAR(tgtIdx);

					// Skip dead AI/players if filter has been enabled
					while { ( KEGsDeadFilter ) && !( alive GVAR(target)) } do
					{
						GVAR(tgtIdx) = ( GVAR(tgtIdx) + 1 );
						if ( GVAR(tgtIdx) > ((count GVAR(playerList)) - 1 ) ) then { GVAR(tgtIdx) = 0 };
						GVAR(target) = GVAR(playerList) select GVAR(tgtIdx);
					};

					// Skip AI if filter has been enabled
					while { ( KEGsAIfilter ) && !( isPlayer KEGs_target) } do
					{
						GVAR(tgtIdx) = ( GVAR(tgtIdx) + 1 );
						if ( GVAR(tgtIdx) > ((count GVAR(playerList)) - 1 ) ) then { GVAR(tgtIdx) = 0 };
						GVAR(target) = GVAR(playerList) select GVAR(tgtIdx);
					};

					false call FUNC(playerMenuHandler);

					if((GVAR(cameras) select GVAR(cameraIdx)) == GVAR(cam1stPerson)) then {
						call FUNC(cameraMenuHandler);
					};

					GVAR(autoTarget) = GVAR(target);

					GVAR(freeCam)e setPosATL (GVAR(target) modelToWorld [0,-50,((getPosATL GVAR(freeCam)) select 2)]);
					GVAR(freeCam) setDir (getDir GVAR(target));
					[
						GVAR(freeCam),
						GVAR(pitchBank) select 0,
						0
					] call bis_fnc_setpitchbank;
				};
			};
			case DIK_A: {
				// A
				if (GVAR(camera) select GVAR(cameraIdx) != GVAR(freeCam)) then {
					//Previous target
					GVAR(tgtIdx) = ( GVAR(tgtIdx) - 1 );
					if ( GVAR(tgtIdx) < 0 ) then { GVAR(tgtIdx) =  ((count GVAR(playerList)) - 1 ) };

					GVAR(target) = GVAR(playerList) select GVAR(tgtIdx);

					// Skip dead AI/players if filter has been enabled
					while { ( KEGsDeadFilter ) && !( alive GVAR(target)) } do
					{
						GVAR(tgtIdx) = ( GVAR(tgtIdx) - 1 );
						if ( GVAR(tgtIdx) < 0 ) then { GVAR(tgtIdx) =  ((count GVAR(playerList)) - 1 ) };
						GVAR(target) = GVAR(playerList) select GVAR(tgtIdx);
					};

					// Skip AI if filter has been enabled
					while { ( KEGsAIfilter ) && !( isPlayer KEGs_target) } do
					{
						GVAR(tgtIdx) = ( GVAR(tgtIdx) - 1 );
						if ( GVAR(tgtIdx) > ((count GVAR(playerList)) - 1 ) ) then { GVAR(tgtIdx) = ((count GVAR(playerList)) - 1 ) };
						GVAR(target) = GVAR(playerList) select GVAR(tgtIdx);
					};

					false call FUNC(playerMenuHandler);

					if((GVAR(cameras) select GVAR(cameraIdx)) == GVAR(cam1stPerson)) then
					{
						call FUNC(cameraMenuHandler);
					};

					GVAR(autoTarget) = GVAR(target);

					GVAR(freeCam)e setPosATL (GVAR(target) modelToWorld [0,-50,((getPosATL GVAR(freeCam)) select 2)]);
					GVAR(freeCam) setDir (getDir GVAR(target));
					[
						GVAR(freeCam),
						GVAR(pitchBank) select 0,
						0
					] call bis_fnc_setpitchbank;
				};
			};

			case DIK_C: {
				// "C = Next camera";
				GVAR(cameraIdx) = GVAR(cameraIdx) + 1;
				GVAR(cameraIdx) = GVAR(cameraIdx) % (count GVAR(cameras));
				["Specta_Events"] call CameraMenuHandler;
			};

			case DIK_T: {
				// "T = Toggle tags";
				GVAR(tags) = !GVAR(tags);
				if(!GVAR(tags)) then {
					lbSetColor[IDC_MENUCAM, GVAR(lbToggleTags), [1,1,1,0.33]];
				} else {
					lbSetColor[IDC_MENUCAM, GVAR(lbToggleTags), [1, 0.5, 0, 1]];
				};
			};

			case DIK_F: {
				// "F = Toggle filter";
				GVAR(aiFilter) = !GVAR(aiFilter);
				call FUNC(refreshPlayerList);
			};

			case DIK_V: {
				// "V = Toggle viewdistance";
				if ( viewDistance >  GVAR(origviewDistance) ) then {
					if (GVAR(keys) select DIK_RALT || GVAR(keys) select DIK_LALT) then {
						if ( viewDistance == GVAR(tempViewDistance) ) then {
							setViewDistance GVAR(origviewDistance);
						} else {
							setViewDistance GVAR(tempViewDistance);
						};
					} else {
						if (GVAR(keys) select DIK_RCONTROL || GVAR(keys) select DIK_LCONTROL) then {
							setViewDistance 20000;
						} else {
							setViewDistance GVAR(origviewDistance);
						};
					};
				} else {
					if (GVAR(keys) select DIK_RALT || GVAR(keys) select DIK_LALT) then {
						setViewDistance (( 4 * GVAR(origviewDistance)) max 9000 min 14000);
					} else {
						setViewDistance GVAR(tempViewDistance);
					};
				};
			};

			case DIK_SPACE: {
				//"Space - toggle 1stperson/gunner";
				if(GVAR(cameras) select GVAR(cameraIdx) == GVAR(cam1stPerson)) then {
					GVAR(1stGunner) = !GVAR(1stGunner);
				};
				[] spawn CameraMenuHandler;
			};

			// "Direct camera change with number keys";
			case DIK_1: {
				GVAR(cameraIdx) = 0;
				lbSetCurSel[IDC_MENUCAM, GVAR(cameraIdx)];
				ctrlSetText[IDC_CAMERA, format["Camera: %1", GVAR(cameraNames) select GVAR(cameraIdx)]];
				["Specta_Events"] spawn CameraMenuHandler;
			};

			case DIK_2: {
				GVAR(cameraIdx) = 1;
				lbSetCurSel[IDC_MENUCAM, GVAR(cameraIdx)];
				ctrlSetText[IDC_CAMERA, format["Camera: %1", GVAR(cameraNames) select GVAR(cameraIdx)]];
				["Specta_Events"] spawn CameraMenuHandler;
			};

			case DIK_3: {
				GVAR(cameraIdx) = 2;
				lbSetCurSel[IDC_MENUCAM, GVAR(cameraIdx)];
				ctrlSetText[IDC_CAMERA, format["Camera: %1", GVAR(cameraNames) select GVAR(cameraIdx)]];
				["Specta_Events"] spawn CameraMenuHandler;
			};

			case DIK_4: {
				GVAR(cameraIdx) = 3;
				lbSetCurSel[IDC_MENUCAM, GVAR(cameraIdx)];
				ctrlSetText[IDC_CAMERA, format["Camera: %1", GVAR(cameraNames) select GVAR(cameraIdx)]];
				["Specta_Events"] spawn CameraMenuHandler;
			};

			// "Toggle NVG or map text type";
			case DIK_N: {
				if(ctrlVisible IDC_MAPFULL) then {
					GVAR(markerType) = GVAR(markerType) + 1;
					if(GVAR(markerType) > 2) then {GVAR(markerType) = 0;};
				} else {
					KEGs_camera_vision = KEGs_camera_vision + 1;
					KEGs_camera_vision = KEGs_camera_vision % 4;

					switch (KEGs_camera_vision) do {
						case 0: {
							camusenvg false;
							false SetCamUseTi 0;
						};
						case 1: {
							camusenvg true;
							false SetCamUseTi 0;
						};
						case 2: {
							camusenvg false;
							true SetCamUseTi 0;
						};
						case 3: {
							camusenvg false;
							true SetCamUseTi 1;
						};
					};
				};
			};

			case DIK_M: {["ToggleMap",0] call spectate_events;};
			case DIK_TAB: {["ToggleUI",0] call spectate_events;};
			case DIK_F1: {["ToggleHelp",0] call spectate_events;};

			// "Numpad + / -";
			case DIK_ADD: {if(KEGsMarkerSize < 1.7) then {KEGsMarkerSize = KEGsMarkerSize * 1.15}};
			case DIK_SUBTRACT: {if(KEGsMarkerSize > 0.7) then {KEGsMarkerSize = KEGsMarkerSize * (1/1.15)}};
		};
	};

	// "Mouse events";
	case "Mouse":
	{
		EXPLODE_2_PVT(_param, _x, _y);

		GVAR(mouseCoords) = [_x, _y];

		if(GVAR(camera) select GVAR(cameraIdx) == GVAR(freeCam)) then {
			//If freecam is selected (Freecam movement).
			if(GVAR(mouseButton) select 1) then {

				EXPLODE_2_PVT(GVAR(RMBclick), _defX, _defY);
				private ["_dX", "_dY", "_pitch"]        

	            _dX = (_mX - _defX) * 180;
	            _dY = -(_mY - _defY) * 180;

	            _pitch = GVAR(pitchBank) select 0;

	            GVAR(freeCam) setdir (direction GVAR(freeCam) + _dX);
	            _pitch = (_pitch + _dY) max -90 min +90;

	            [
	                GVAR(freeCam),
	                _pitch,
	                0
	            ] call bis_fnc_setpitchbank;

	            KGE_Spectator_RMBclick = [_mX,_defY];
	        };

	        // Do movement here to make it smoother
	        _coef = 0.4;
	        if (GVAR(keys) select DIK_RSHIFT || GVAR(keys) select DIK_LSHIFT) then {_coef = _coef * 6;};

	        if (GVAR(keys) select DIK_W) then {[0,1,0,_coef] call FUNC(cameraMove)};
	        if (GVAR(keys) select DIK_S) then {[0,-1,0,_coef] call FUNC(cameraMove)};
	        if (GVAR(keys) select DIK_A) then {[-1,1,0,_coef] call FUNC(cameraMove)};
	        if (GVAR(keys) select DIK_D) then {[1,1,0,_coef] call FUNC(cameraMove)};
	        if (GVAR(keys) select DIK_Q) then {[0,0,1,_coef] call FUNC(cameraMove)};
	        if (GVAR(keys) select DIK_Z) then {[0,0,-1,_coef] call FUNC(cameraMove)};
		};	
	};

	case "MouseButtonDown":
	{
		EXPLODE_3_PVT(_param, _button, _x, _y);

        // Save button state
        GVAR(mouseButton) set [_button,true];

        if(_button == 1) then {
            // Save mouse click RMB position
            GVAR(RMBclick) = [_x, _y];
        } else {
            // Save mouse click LMB position
            GVAR(LMBclick) = [_x, _y];
        };

        // Save camera pitch
        if(GVAR(camera) select GVAR(cameraIdx) == GVAR(freeCam)) then {
        	GVAR(pitchBank) = GVAR(freeCam) call BIS_fnc_getPitchBank;
        };    
	};

	case "MouseButtonUp":
	{
		EXPLODE_3_PVT(_param, _button, _x, _y);

        // Save button state
        GVAR(mouseButton) set [_button, false];

        if(_button == 1) then {
            // Save mouse click RMB position
            GVAR(RMBclick) = [0, 0];
        } else {
            // Save mouse click LMB position
            GVAR(LMBclick) = [0, 0];
        };

        // Save camera pitch
        if(GVAR(camera) select GVAR(cameraIdx) == GVAR(freeCam)) then {
        	GVAR(pitchBank) = GVAR(freeCam) call BIS_fnc_getPitchBank;
        };
	};

	case "MouseZChanged":
	{
		//player globalChat format ["CAMERA: [%1] - [%2]", KEGs_cameraNames select KEGs_cameraIdx, KEGs_cameraIdx];

		if(GVAR(camera) select GVAR(cameraIdx) == GVAR(freeCam)) then {
			_camVector = vectordir GVAR(freeCam);

			_coef = 2;
			if (GVAR(keys) select DIK_RCONTROL || GVAR(keys) select DIK_LCONTROL) then {_coef = 50}; //press left ctrl key to turbo speed
			if (GVAR(keys) select DIK_RALT || GVAR(keys) select DIK_LALT) then {_coef = 10}; //press left alt key to increase speed

			_dZ = (( _this select 1 ) select 1 ) * _coef;
			_vX = (_camVector select 0) * _dZ;
			_vY = (_camVector select 1) * _dZ;
			_vZ = 0;

			_camPos = getPosASL GVAR(freeCam);
			_camPosL_z = (getPosATL GVAR(freeCam)) select 2;
			_camPos = [
				(_camPos select 0) + _vX,
				(_camPos select 1) + _vY,
				(_camPos select 2) + _vZ
			];
			_camPos set [2,(getTerrainHeightASL _camPos) + _camPosL_z];
			GVAR(freeCam) setPosASL _camPos;
		};
	};

	case "MouseZChangedminimap": {
		GVAR(minimapZoom) = ( GVAR(minimapZoom) - ((_param select 1)*0.025) ) min 0.75 max 0.01;
	};

	case "ToggleCameraMenu": {
		// "hide/unhide camera menu";
		if(ctrlVisible IDC_MENUCAM) then {
			ctrlShow[IDC_MENUCAM, false];
			ctrlShow[IDC_MENUCAMB, false];
		} else {
			ctrlShow[IDC_MENUCAM, true];
			ctrlShow[IDC_MENUCAMB, true];
		};
	};

	case "ToggleTargetMenu": {
		// "hide/unhide targets menu";
		if(ctrlVisible IDC_MENUTGT) then {
			ctrlShow[IDC_MENUTGT, false];
			ctrlShow[IDC_MENUTGTB, false];
		} else {
			ctrlShow[IDC_MENUTGT, true];
			ctrlShow[IDC_MENUTGTB, true];
		};
	};

	case "ToggleUI": {
		// "hide/unhide UI";
		if(ctrlVisible IDC_NAME) then {
			{ctrlShow[_x, false]} foreach _UI;
		} else {
			{ctrlShow[_x, true]} foreach _UI;
			ctrlShow[IDC_HELP, false];
			ctrlShow[IDC_MENUTGT, false];
			ctrlShow[IDC_MENUTGTB, false];
			ctrlShow[IDC_MENUCAM, false];
			ctrlShow[IDC_MENUCAMB, false];
		};
	};

	case "ToggleHelp": {
		// "hide/unhide Help text";
		if(ctrlVisible IDC_HELP) then {
			ctrlShow[IDC_HELP, false];
		} else {
			ctrlShow[IDC_HELP, true];
		};
	};

	case "ToggleMap": {
		// "hide/unhide Map";
		if(ctrlVisible IDC_MAP and ctrlVisible IDC_MAPFULL) then {
			// "Beginning, hide both";
			ctrlShow[IDC_MAP, false];
			ctrlShow[IDC_MAPFULL, false];
			ctrlShow[IDC_MAPFULLBG, false];
		};

		if(ctrlVisible IDC_MAP) then {
			ctrlShow[IDC_MAP, false];
			ctrlShow[IDC_MAPFULL, true];
			ctrlShow[IDC_MAPFULLBG, true];
			KEGsMarkerNames = true;
			KEGsSoundVolume = soundVolume;
			0.5 fadeSound 0.2;
		} else {
			KEGsMarkerNames = false;
			if(ctrlVisible IDC_MAPFULL) then {
				ctrlShow[IDC_MAPFULL, false];
				ctrlShow[IDC_MAPFULLBG, false];
				0.5 fadeSound KEGsSoundVolume;
			} else {
				ctrlShow[IDC_MAP, true];
			};
		};
	};

	// "Toggle particlesource tags";
	case "ToggleTags": {
		GVAR(toggleTags) = !GVAR(toggleTags)
	};

	default {
		hint "Unknown event";
	};
};

false

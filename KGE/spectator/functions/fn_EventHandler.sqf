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

_type = _this select 0;
_args = _this select 1;
switch (_type) do {
    /******************************************************************************/
    // handles the mouse.
    case "Mouse": {
        if(KGE_Spectator_MouseButton select 1) then {
            _mX = _args select 1;
            _mY = _args select 2;

            //If freecam is selected (Freecam movement).
            _defX = KGE_Spectator_RMBclick select 0;
            _defY = KGE_Spectator_RMBclick select 1;

            _dX = (_mX - _defX) * 180;
            _dY = -(_mY - _defY) * 180;

            _pitchbank = KGE_Spectator_PitchBank;
            _pitch = _pitchbank select 0;

            KGE_Spectator_camera setdir (direction KGE_Spectator_camera + _dX);
            _pitch = (_pitch + _dY) max -90 min +90;

            [
                KGE_Spectator_camera,
                _pitch,
                0
            ] call bis_fnc_setpitchbank;

            KGE_Spectator_RMBclick = [_mX,_defY];
        };

        // Do movement here to make it smoother
        _coef = 0.4;
        if (KGE_Spectator_keys select DIK_RSHIFT OR KGE_Spectator_keys select DIK_LSHIFT) then {_coef = _coef * 6;};

        if (KGE_Spectator_keys select DIK_W) then {[0,1,0,_coef] call KGE_Spectator_fnc_CameraMove;};
        if (KGE_Spectator_keys select DIK_S) then {[0,-1,0,_coef] call KGE_Spectator_fnc_CameraMove;};
        if (KGE_Spectator_keys select DIK_A) then {[-1,1,0,_coef] call KGE_Spectator_fnc_CameraMove;};
        if (KGE_Spectator_keys select DIK_D) then {[1,1,0,_coef] call KGE_Spectator_fnc_CameraMove;};
        if (KGE_Spectator_keys select DIK_Q) then {[0,0,1,_coef] call KGE_Spectator_fnc_CameraMove;};
        if (KGE_Spectator_keys select DIK_Z) then {[0,0,-1,_coef] call KGE_Spectator_fnc_CameraMove;};
    };

    case "MouseButtonDown": {
        _button = _args select 1;
        _mX = _args select 2;
        _mY = _args select 3;

        // Save button state
        KGE_Spectator_MouseButton set [_button,true];

        if(_button == 1) then {
            // Save mouse click RMB position
            KGE_Spectator_RMBclick = [_mX, _mY];
        } else {
            // Save mouse click LMB position
            KGE_Spectator_LMBclick = [_mX, _mY];
        };

        // Save camera pitch
        KGE_Spectator_PitchBank = KGE_Spectator_camera call BIS_fnc_getPitchBank;
    };

    case "MouseButtonUp": {
        _button = _args select 1;

        // Save button state
        KGE_Spectator_MouseButton set [_button,false];

        if(_button == 1) then {
            // Save mouse RMB position
            KGE_Spectator_RMBclick = [0, 0];
        } else {
            // Save mouse LMB position
            KGE_Spectator_LMBclick = [0, 0];

        };

        // Save camera pitch
        KGE_Spectator_PitchBank = KGE_Spectator_camera call BIS_fnc_getPitchBank;
    };

    case "MouseZChanged": {
        if(KGE_Spectator_keys select DIK_LCONTROL) then {
            KGE_Spectator_zoom = (KGE_Spectator_zoom - ((_args select 1)*KGE_Spectator_zoom/5)) max 0.1 min KGE_Spectator_MaxZoom;
        } else {
            KGE_Spectator_fovZoom = ((KGE_Spectator_fovZoom - ((_args select 1)*KGE_Spectator_fovZoom/5)) max 0.1) min 1;
        };

    };

    /******************************************************************************/
    // handles dropboxes
    case "LBListSelChanged": {
        // Change current target when player list slection is changed
        if(count KGE_Spectator_listUnits > (_args select 1)) then {

            _unit = KGE_Spectator_listUnits select (_args select 1);

            if(!isnil "_unit") then {

                // When selected list unit is group then select group leader
                if(typeName _unit == "GROUP") then {_unit = leader _unit};

                KGE_Spectator_curTarget = _unit;

                _pos = getPosASL _unit;
                _x = _pos select 0;
                _y = _pos select 1;
                _z = (_pos select 2) + 10;
                KGE_Spectator_camera setPosASL [_x,_y,(_z max ((getTerrainHeightASL [_x,_y])+1))];
            };
        };
    };
    case "LBListSelChanged_modes": {
        // Update modes
        switch (_args select 1) do {
            case KGE_Spectator_lb_toggleNormal: {[true, false, false, false] call KGE_Spectator_fnc_ReloadModes};
            case KGE_Spectator_lb_toggletiNVIndex: {[false, true, false, false] call KGE_Spectator_fnc_ReloadModes};
            case KGE_Spectator_lb_toggletiBHIndex: {[false, false, true, false] call KGE_Spectator_fnc_ReloadModes};
            case KGE_Spectator_lb_toggletiWHIndex: {[false, false, false, true] call KGE_Spectator_fnc_ReloadModes};
        };
    };

    /******************************************************************************/
    // handles keys
    case "KeyDown": {
        _key = _args select 1;

        if(!isNull (findDisplay 49)) exitWith {if(_key == 1) then {true}};

        // Set key
        KGE_Spectator_keys set [_key,true];

        switch (_key) do {
            case DIK_ADD: { // Zoom in
                KGE_Spectator_zoom = (KGE_Spectator_zoom - 1) max 0.3;
            };
            case DIK_SUBTRACT: { // Zoom out
                KGE_Spectator_zoom = (KGE_Spectator_zoom + 1) min KGE_Spectator_MaxZoom;
            };
            // Hide UI
            case DIK_U: {
                KGE_Spectator_hideUI = !KGE_Spectator_hideUI;
                [] call KGE_Spectator_fnc_ToggleGUI;
            };
            // Change NV mode
            case DIK_N: {
                _index = (lbCurSel 2101)+1;
                if(_index >= (lbSize 2101 )) then { _index = 0};
                lbSetCurSel [2101,_index];
            };
            //  Show help
            case DIK_H: {
                ctrlShow [1315, !ctrlVisible 1315];
                ctrlShow [1310, !ctrlVisible 1310];
                ctrlShow [1300, !ctrlVisible 1300];
                ctrlShow [1305, !ctrlVisible 1305];
            };

            // Used incase there is error on unloading display
            case DIK_ESCAPE: {
                [] call KGE_Spectator_fnc_ForceExit;
            };
        };
    };

    case "KeyUp": {
        if(!isNull (findDisplay 49)) exitWith {};
        _key = _args select 1;

        // Set key
        KGE_Spectator_keys set [_key, false];
    };
};


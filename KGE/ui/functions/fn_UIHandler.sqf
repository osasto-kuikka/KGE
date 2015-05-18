_type = [_this, 0, "", [""]] call BIS_fnc_param;
_number = [_this, 1, 0, [0]] call BIS_fnc_param;
_args = [_this, 2, [], [[], "" ,0]] call BIS_fnc_param;

if(isNil "KGE_UI_Buttons") then {KGE_UI_Buttons = []};

switch (_type) do {
	case "add": {
		if(typeName _args == "ARRAY") then {
			_text = [_args, 0, "", [""]] call BIS_fnc_paramIn;
			_command = [_args, 1, {}, [{}]] call BIS_fnc_paramIn;
			_confirmation = [_args, 2, "", [""]] call BIS_fnc_paramIn;

			KGE_UI_Buttons set [_number, [_text, _command, _confirmation]];
		};
	};

	case "header": {
		if(typeName _args == "STRING") then {
			KGE_UI_Header = _args;
		} else {
			KGE_UI_Header = "";
		};
	};

	case "open": {
		if (dialog) then { closeDialog 0; };

		createDialog "KGE_UI_Dialog";

		["empty"] call KGE_UI_fnc_UIHandler;

		ctrlShow [5120, true];

		if(count KGE_UI_Buttons > 10) then {
			_pages = ((10 - (count KGE_UI_Buttons % 10)) + count KGE_UI_Buttons) / 10;
			ctrlSetText [5120, format["%1 %2/%3",KGE_UI_Header, (_number + 1), _pages]];

			for "_i" from 0 to 9 do {
				_controlID = 5122 + _i;

				_index = _i + (_number * 10);
				_singleMenu = [KGE_UI_Buttons, _index, [], [[]]] call BIS_fnc_paramIn;
				if(count _singleMenu != 0) then {
					_text = [_singleMenu, 0, "", [""]] call BIS_fnc_paramIn;

					// Show and add button text
					ctrlShow [_controlID, true];
					ctrlSetText [_controlID, _text];
					buttonSetAction [_controlID, format["['pressed', %1] call KGE_UI_fnc_UIHandler", _index]];
				};
			};

			if(_number != 0) then {
				// Show and add button text
				ctrlShow [5121, true];
				ctrlSetText [5121, "Edellinen Sivu"];
				buttonSetAction [5121, format["['open', %1] call KGE_UI_fnc_UIHandler", (_number - 1)]];
			};

			if((_number + 1) != _pages) then {
				// Show and add button text
				ctrlShow [5132, true];
				ctrlSetText [5132, "Seuraava Sivu"];
				buttonSetAction [5132, format["['open', %1] call KGE_UI_fnc_UIHandler", (_number + 1)]];
			};
		} else {
			ctrlSetText [5120, KGE_UI_Header];

			// Loop through all possible UI values
			for "_i" from 0 to 9 do {
				_controlID = 5122 + _i;

				_singleMenu = [KGE_UI_Buttons, _i, [], [[]]] call BIS_fnc_paramIn;
				if(count _singleMenu != 0) then {
					_text = [_singleMenu, 0, "", [""]] call BIS_fnc_paramIn;

					// Show and add button text
					ctrlShow [_controlID, true];
					ctrlSetText [_controlID, _text];
					buttonSetAction [_controlID, format["['pressed', %1] call KGE_UI_fnc_UIHandler", _i]];
				};
			};
		};
	};

	case "empty": {
		ctrlShow [5120, false];
		ctrlSetText [5120, ""];

		for "_i" from 1 to 12 do {
			_controlID = 5120 + _i;

			// Hide and empty text
			ctrlShow [_controlID, false];
			ctrlSetText [_controlID, ""];
			buttonSetAction [_controlID, ""]
		};
	};

	case "pressed": {
		if (dialog) then { closeDialog 0; };


		// Get code and confirmation from button list
		_code = [KGE_UI_Buttons select _number, 1, {}, [{}, ""]] call BIS_fnc_paramIn;
		_confirmation = [KGE_UI_Buttons select _number, 2, "", [""]] call BIS_fnc_paramIn;

		// Empty menu
		KGE_UI_Buttons = [];
		KGE_UI_Header = "";

		if(_confirmation == "") then {
			if(typeName _code == "CODE") then {
				call _code;
			} else {
				call compile _code;
			};
		} else {
			if([_confirmation] call KGE_UI_fnc_Confirmation) then {
				if(typeName _code == "CODE") then {
					call _code;
				} else {
					call compile _code;
				};
			};
		};
	};
};
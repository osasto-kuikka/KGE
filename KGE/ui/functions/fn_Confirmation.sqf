private ["_message", "_answer"];

_message = [_this, 0, "", [""]] call BIS_fnc_param;

// Poistettu käytöstä, koska BIS gui viesti kusee
_answer = true; //[_message] call BIS_fnc_guiMessage;

_answer
#include "..\script_component.hpp"

if !(mapOpen) exitWith {};

params ["_player", "_name", "_posX", "_posY"];
private ["_index"];

_index = -1;
{
    _x params ["_playerArray", "_nameArray"];

    if(_player isEqualTo _playerArray || _name isEqualTo _nameArray) exitWith {
        _index = _foreachindex;
    };

    true
} count GVAR(drawList);

// remove player from list
if(_posX isEqualTo -1 && {_posY isEqualTo -1}) exitWith {
    if(_index != -1) then {
        GVAR(drawList) deleteAt _index;
    };
};

// Add or update player info
if(_index != -1) then {
    GVAR(drawList) set [_index, _this];
} else {
    GVAR(drawList) pushBack _this;
};

#include "script_component.hpp";

private ["_unit", "_pos", "_index", "_unitArray", "_trackingArray", "_latestIndex", "_latestPos", "_diffX", "_diffY"];

{
    _unit = _x;

    if (_unit distance GVAR(respawnPos) > 200) then {
            
        _pos = getPos _unit;
        _pos resize 2;
                
        _index = -1;
        
        {if ((_x select 0) == _unit) then {_index = _forEachIndex}} forEach GVAR(trackingArray);

        if (_index == -1) exitWith {GVAR(trackingArray) pushBack [_unit, [_pos]]};

        _unitArray = GVAR(trackingArray) select _index;
        _trackingArray = _unitArray select 1;
        _latestIndex = (count _trackingArray) - 1;
        _latestPos = _trackingArray select _latestIndex;
        _diffX = abs((_latestPos select 0) - (_pos select 0));
        _diffY = abs((_latestPos select 1) - (_pos select 1));
        if !((_diffX < 20) && (_diffY < 20)) then {
            _trackingArray pushBack _pos;        
            _unitArray set [1, _trackingArray];
            GVAR(trackingArray) set [_index, _unitArray];
        };
    };
    true
} count allUnits;
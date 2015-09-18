#include "..\script_component.hpp"

// If draw event has not been deleted for dome reason, delete it here
if !(isNil QGVAR(MapGestures)) then {
    (findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw",GVAR(MapGestures)];
    GVAR(MapGestures) = nil
};

GVAR(MapGestures) = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["Draw", {
    // Map closed, remove draw event
    if (!GVAR(mapOpen)) exitWith {
        (findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["Draw",GVAR(MapGestures)];
        GVAR(MapGestures) = nil
    };

    // Nothing to draw so exit for this frame
    if (count GVAR(drawList) == 0) exitWith {};

    // loop through all send draw events
    {
        _x params ["_player", "_name", "_posX", "_posY"];
        _pos = [_posX, _posY, 0];

        _grpname = groupID (group _player);

        _alpha = .7;
        if (_player call EFUNC(common,isLeader)) then {_alpha = .95};

        _color = [1,.78,0,_alpha];

        (_this select 0) drawIcon ["\a3\ui_f\data\gui\cfg\Hints\icon_text\group_1_ca.paa", _color, _pos, 55, 55, 0, "", 1, 0.030,"PuristaBold","left"];
        //(_this select 0) drawIcon ["#(argb,8,8,3)color(0,0,0,0)", [.2,.2,.2,.3], _pos, 20, 20, 0, _name, 0, 0.030,"PuristaBold","left"];

        true;
    } count GVAR(drawList);
}];

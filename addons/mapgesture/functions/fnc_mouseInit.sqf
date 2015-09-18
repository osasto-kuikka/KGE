#include "..\script_component.hpp"

// MouseMoving EH.
if !(isNil QGVAR(MouseMoveHandler)) then {(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["MouseMoving",GVAR(MouseMoveHandler)]; GVAR(MouseMoveHandler) = nil;};
GVAR(MouseMoveHandler) = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["MouseMoving", {
  params ["_control", "_posX", "_posY"];

  if (GVAR(Transmit)) then {
      [_posX,_posY] call FUNC(send);
  };
}];

// MouseDown EH
if !(isNil QGVAR(MouseDown)) then {(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["MouseButtonDown",GVAR(MouseDown)]; GVAR(MouseDown)= nil;};
GVAR(MouseDown) = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["MouseButtonDown", {
    params ["_control", "_button", "_posX", "_posY"];
    GVAR(Transmit) = true;
    [_posX,_posY] call FUNC(send);
}];

// MouseUp EH
if !(isNil QGVAR(MouseUp)) then {(findDisplay 12 displayCtrl 51) ctrlRemoveEventHandler ["MouseButtonUp", GVAR(MouseUp)]; GVAR(MouseUp) = nil;};
GVAR(MouseUp) = findDisplay 12 displayCtrl 51 ctrlAddEventHandler ["MouseButtonUp", {
    GVAR(Transmit) = false;
    [-1,-1] call FUNC(send);
}];

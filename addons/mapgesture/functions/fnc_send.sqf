#include "..\script_component.hpp"

params ["_posX", "_posY"];

private ["_nameSane", "_near"];
_nameSane = [KGE_Player call EFUNC(common,getName)] call EFUNC(common,sanitizeString);

_near = (position KGE_Player) nearEntities [["CAMAnBase"], GVAR(MaxRange)];
_near = _near + (crew vehicle KGE_Player);
_near = _near - [KGE_Player];

{
    [QGVAR(receiveEvent), [_x, _nameSane, _posX, _posY]] call cba_fnc_whereLocalEvent;
} forEach _nearDudes;

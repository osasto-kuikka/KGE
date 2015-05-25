private ["_range","_objects","_aPos","_dPos","_xPos","_dir","_dst", "_side"];
_aPos = [_this, 0, objNull, [objNull, []]] call BIS_fnc_param;
_dPos = [_this, 1, objNull, [objNull, []]] call BIS_fnc_param;
_range = [_this, 2, 50, [0]] call BIS_fnc_param;
_side = [_this, 3, [WEST, EAST, INDEPENDENT, CIVILIAN], [[]]] call BIS_fnc_param;

if(typeName _aPos == "OBJECT") then {
    if(isNull _aPos) exitWith {};
    _aPos = getpos _aPos;
};
if(typeName _dPos == "OBJECT") then {
    if(isNull _dPos) exitWith {};
    _dPos = getpos _dPos;
};

if(isServer) then {
  _objects = nearestobjects [_aPos,[],_range];
  _objects = _objects - ([] call KGE_Core_fnc_GetAllPlayers);

  {
    _xPos = getpos _x;
    _dir = ((_xPos select 0) - (_aPos select 0)) atan2 ((_xPos select 1) - (_aPos select 1));
    _dst = _aPos distance _xPos;

    [_x, [((_dPos select 0) + (_dst * sin _dir)), ((_dPos select 1) + (_dst * cos _dir)), 0]] call KGE_Teleport_fnc_Teleport;
  } foreach _objects;
};

if(hasInterface) then {
  if(([KGE_Player] call KGE_Core_fnc_GetSide) in _side) then {
    [KGE_Player, [(_dPos select 0), (_dPos select 1), 0]] call KGE_Teleport_fnc_Teleport;
  };
};

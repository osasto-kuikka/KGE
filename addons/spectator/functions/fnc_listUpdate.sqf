#include "script_component.hpp";

private ["_overlay", "_allUnitsCount", "_unitsToList"]

_overlay = GETUVAR(dlg_overlay);

_allUnitsCount = count allUnits;
if (_allUnitsCount != GVAR(unitCount)) then {
	GVAR(unitCount) = _allUnitsCount;
	_unitsToList = [];

	{
		if !(_x GETVAR_SYS(listed, false)) then {
			PUSH(_unitsToList, _x);
		};
		true
	} count allUnits;
			
	if (count _unitsToList > 0) then {
		{
			_x setVariable ["vip_asp_listed", true];
			_x call FUNC(objectVar);
						
			if (_x distance GVAR(respawnPos) > 200) then {
				_name = name _x;
				_side = [_x] call EFUNC(common, getSide);
				_icon = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "Icon");
				_colour = [_side] call FUNC(sideColor);
				_x setVariable ["vip_asp_draw", [true, _name, _side, _icon, _colour]];
			} else {
				_x setVariable ["vip_asp_draw", [false]]
			};
						
			_x addEventHandler ["Killed", {["UnitKilled", _this] call FUNC(events)}];
			_x addEventHandler ["Respawn", {["UnitRespawn", _this] call FUNC(events)}];
		} forEach _unitsToList;
	};
	//overlay list
	if (!isNull _overlay) then {["OverlayList", _overlay] call FUNC(events)};
};
#include "script_component.hpp"

[{
	private ["_overlay", "_allUnitsCount", "_unitsToList"];

	if(GVAR(forceExit)) exitWith {
		[_this select 1] call cba_fnc_removePerFrameHandler;
	};

	_overlay = GETUVAR(dlg_overlay,objNull);

	_allUnitsCount = count allUnits;
	if (_allUnitsCount != GVAR(unitCount)) then {
		GVAR(unitCount) = _allUnitsCount;
		_unitsToList = [];

		{
			if !(_x GETVAR_SYS(GVAR(listed), false)) then {
				PUSH(_unitsToList,_x);
			};
			true
		} count allUnits;
				
		if (count _unitsToList > 0) then {
			{
				_x SETVAR_SYS(GVAR(listed),true);
				_x call FUNC(objectVar);
							
				if (_x distance GVAR(respawnPos) > 200) then {
					_name = name _x;//_x call EFUNC(common,getName);
					_side = side (group _x);//_x call EFUNC(common,getSide);
					_icon = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "Icon");
					_color = _side call BIS_fnc_sideColor;//call FUNC(sideColor);
					_x setvariable [QGVAR(draw),[true,_name,_side,_icon,_color]];
				} else {
					_x SETVAR_SYS(GVAR(draw),[false]);
				};
							
				_x addEventHandler ["Killed", {["UnitKilled", _this] call FUNC(events)}];
				_x addEventHandler ["Respawn", {["UnitRespawn", _this] call FUNC(events)}];
			} forEach _unitsToList;
		};
		//overlay list
		if (!isNull _overlay) then {["OverlayList", _overlay] call FUNC(events)};
	};
}, 2, []] call cba_fnc_addPerFrameHandler;
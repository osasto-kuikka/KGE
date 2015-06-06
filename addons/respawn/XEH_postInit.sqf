#include "script_component.hpp"

if(isServer) exitWith {
	[QGVAR(serverEvent), {_this call FUNC(serverRequest)}] call cba_fnc_addEventHandler;
};

[QGVAR(clientEvent), {_this call FUNC(serverAnswer)}] call cba_fnc_addEventHandler;

["KGE_playerChanged", {
	EXPLODE_2_PVT(_this,_newPlayer,_oldPlayer);

	_pos = getPosATL _oldPlayer;
	if(surfaceIsWater _pos) then {_pos getPosASL _oldPlayer};

	_pos set [2, 20];
	GVAR(killedPos) = _pos;
}] call cba_fnc_addEventHandler;
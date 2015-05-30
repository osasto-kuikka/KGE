#include "script_component.hpp"

// Starts spectator when player status is changed to dead on kge respawn
["playerStatusChanged", {
	if((_this select 1) == "dead") then {
		call FUNC(start);
	};
}] call cba_fnc_addEventHandler;
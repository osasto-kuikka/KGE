#include "script_component.hpp"

ADDON = false;

#include "cache/functions.sqf"
#include "debug/functions.sqf"
#include "gear/functions.sqf"
#include "menu/functions.sqf"
#include "misc/functions.sqf"
#include "respawn/functions.sqf"
#include "safestart/functions.sqf"
#include "spectator/functions.sqf"
#include "staminabar/functions.sqf"
#include "teamroster/functions.sqf"
#include "menu/functions.sqf"
#include "teleport/functions.sqf"
#include "zeus/functions.sqf"

KGE_Player = player;
KGE_PlayerOld = player;

if (hasInterface) then {
    // PFH to update the AES_player variable
	if(MOD_ACE_COMMON) then {
		["playerChanged", {
			KGE_PlayerOld = (_this select 0);
			KGE_Player = (_this select 1);

			SETUVAR(QGVAR(KGE_Player), KGE_Player];
		}] call ace_common_fnc_addEventHandler;
	} else {
		[{
	        if !(KGE_Player isEqualTo (call FUNC(player))) then {
	            KGE_PlayerOld = AES_Player;	            
	            KGE_Player = call FUNC(player);
	            
	            SETUVAR(QGVAR(KGE_Player), KGE_Player];
	        };
	    }, 0, []] call cba_fnc_addPerFrameHandler;
	};
};

ADDON = true;
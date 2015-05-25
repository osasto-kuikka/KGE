#include "script_component.hpp"

ADDON = false;

PREP(classExists);
PREP(getName);
PREP(getPlayableUnits);
PREP(isAdmin);
PREP(isAlive);
PREP(player);
PREP(setName);
PREP(waitAndExecute);

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
	            KGE_PlayerOld = KGE_Player;	            
	            KGE_Player = call FUNC(player);
	            
	            SETUVAR(QGVAR(KGE_Player), KGE_Player];
	        };
	    }, 0, []] call cba_fnc_addPerFrameHandler;
	};
};


    
};

ADDON = true;
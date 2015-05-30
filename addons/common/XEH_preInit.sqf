#include "script_component.hpp"

ADDON = false;

PREP(classExists);
PREP(execDelayed);
PREP(fixHeadbug);
PREP(getName);
PREP(getSide);
PREP(isAdmin);
PREP(isAlive);
PREP(player);
PREP(setName);

KGE_player = player;
KGE_playerOld = player;

if (hasInterface) then {   
	// Update KGE_Player manually
	[{ 
		if !(KGE_player isEqualTo (call FUNC(player))) then {
	       	KGE_playerOld = KGE_player;	            
	        KGE_player = call FUNC(player);
	            
	        SETUVAR(KGE_player, KGE_player];
	    }; 
	}, 0, []] call cba_fnc_addPerFrameHandler;
};

ADDON = true;
#include "macros.hpp"
_forbiddenControls = [KGE_Spectator_MOUSEHANDLER,KGE_Spectator_SPECHELP,KGE_Spectator_HELPCANCEL,KGE_Spectator_SPECHELP,KGE_Spectator_HELPFRAME,KGE_Spectator_HELPBACK];
{
	if(KGE_Spectator_forcedExit) then {
		ctrlShow [_x, false];
	} else {
		if(!(_x in _forbiddenControls)) then {
			ctrlShow [_x,!KGE_Spectator_hideUI];
		};
	};
} foreach KGE_Spectator_controls;
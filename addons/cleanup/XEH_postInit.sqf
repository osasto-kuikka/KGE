#include "script_component.hpp"


[{
	call FUNC(deadCheck);
}, 1, []] call CBA_fnc_addPerFrameHandler;

[{
	call FUNC(emptyCheck);
}, 1, []] call CBA_fnc_addPerFrameHandler;

[{
	call FUNC(groupCheck);
}, 0.1, []] call CBA_fnc_addPerFrameHandler;

#include "script_component.hpp"

if((vehicle _this) GETVAR_SYS(GVAR(firedEventAdded),false)) exitWith {};

(vehicle _this) SETVAR_SYS(GVAR(firedEventAdded),true);

(vehicle _this) setvariable [QGVAR(firedEvent), (vehicle _this) addEventHandler ["Fired", {_this call FUNC(firedEvent)}]];
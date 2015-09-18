#include "script_component.hpp"

if (!hasInterface) exitWith {};

if (isNil QGVAR(MaxRange))  then {GVAR(MaxRange) = 7};
if (isNil QGVAR(Transmit))  then {GVAR(Transmit) = false};

if (isNil QGVAR(GroupColors_Red))        then {GVAR(GroupColors_Red)        = ["ASL", "AV", "A1", "A2", "A3", "A4","DSL", "DV", "D1", "D2", "D3", "D4","GSL", "GV", "G1", "G2", "G3", "G4"]};
if (isNil QGVAR(GroupColors_Green))      then {GVAR(GroupColors_Green)      = ["CSL", "CV", "C1", "C2", "C3", "C4","FSL", "FV", "F1", "F2", "F3", "F4","ISL", "IV", "I1", "I2", "I3", "I4"]};
if (isNil QGVAR(GroupColors_Blue))       then {GVAR(GroupColors_Blue)       = ["BSL", "BV", "B1", "B2", "B3", "B4","ESL", "EV", "E1", "E2", "E3", "E4","HSL", "HV", "H1", "H2", "H3", "H4"]};
if (isNil QGVAR(GroupColors_Yellow))     then {GVAR(GroupColors_Yellow)     = ["CoyHQ", "CoyV","PltHQ", "PV","PltHQ2", "P2V","PltHQ3", "P3V"]};
if (isNil QGVAR(GroupColors_DarkYellow)) then {GVAR(GroupColors_DarkYellow) = ["WSL", "WV","MMG1", "MMG2", "MMG3","MAT1", "MAT2", "MAT3","HMG1", "HMG2", "HMG3","HAT1", "HAT2", "HAT3"]};

[QGVAR(receiveEvent), {
  _this call FUNC(receive)
}] call cba_fnc_addLocalEventHandler;

["KGE_mapOpen", {
    params ["_open"];

    if(_open) then {
        call FUNC(mouseInit);
        call FUNC(drawLoop);
        GVAR(mapOpen) = true;
    } else {
        [-1,-1] call FUNC(send);
        GVAR(mapOpen) = false;
    };
}] call cba_fnc_addEventHandler;

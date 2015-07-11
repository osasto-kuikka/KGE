#include "script_component.hpp"

if (isNull (findDisplay 46)) exitWith {
    [{
        if(isNull (findDisplay 46)) exitWith {};    

        call FUNC(start);

        [_pfh] call cba_fnc_removePerFrameHandler;
    }, 0.1, []] call cba_fnc_addPerFrameHandler;        
};

GVAR(forceExit) = false;
GVAR(noEscape) = false;
GVAR(alwaysTracking) = true;

if (isNil QGVAR(trackingArray)) then {[true] call FUNC(tracking)};

if (isNil QGVAR(respawnPos)) then {
    _mapSize = (configFile >> "CfgWorlds" >> worldName >> "mapSize");
    _worldEdge = if (isNumber _mapSize) then {getNumber _mapSize} else {32768};
    GVAR(respawnPos) = [_worldEdge, _worldEdge];
};


//camera
_camPos = if (!isNil QGVAR(startingPos)) then {
    GVAR(startingPos)
} else {
    if (!GVAR(noEscape)) then {
        getPos cameraOn
    } else {
        [(GVAR(respawnPos) select 0) / 2, (GVAR(respawnPos) select 0) / 2, 0]
    };
};
_camPos set [2, (_camPos select 2) + 2];
_cam = GETMVAR(GVAR(cam),QUOTE(camera) camCreate _camPos);
_cam cameraEffect ["internal", "back"];
_cam camSetFocus [-1, -1];
_cam camCommit 0;
showCinemaBorder false;
cameraEffectEnableHUD true;
setViewDistance 3000;
        
//variables
GVAR(cam) = _cam;
GVAR(LMB) = false;
GVAR(RMB) = false;        
GVAR(vector) = [0,0,0];
GVAR(fov) = 0.7;
GVAR(vision) = 0;
GVAR(moveScale) = 0.1;
GVAR(cameraOn) = true;
GVAR(focus) = [-1, -1];
GVAR(lock) = [-1];
GVAR(targets) = [];
GVAR(attach) = objNull;
GVAR(unit) = KGE_playerOld;
GVAR(unitCount) = 0;
GVAR(deadList) = [];
GVAR(mouseBusy) = false;
GVAR(displayMarkers) = 3;
GVAR(listLast) = false;
GVAR(accTime) = 1;
        
if (isNil QGVAR(savedSpots)) then {
    GVAR(savedSpots) = [];
    for "_i" from 0 to 11 do {GVAR(savedSpots) set [_i, []]};
};
        
if (isNil QGVAR(savedUnits)) then {
    GVAR(savedUnits) = [];
    for "_i" from 0 to 9 do {GVAR(savedUnits) set [_i, []]};
};
        
GVAR(keys) = [];
_DIKcodes = true call BIS_fnc_keyCode;
_DIKlast = _DIKcodes select (count _DIKcodes - 1);
for "_i" from 0 to (_DIKlast - 1) do {
    GVAR(keys) set [_i, false];
};

_display = findDisplay 46;

addMissionEventHandler ["Ended", {if (!isNil QGVAR(cam)) then {call FUNC(forceExit)}}];
GVAR(eh_key1) = _display displayAddEventHandler ["keyDown", {['KeyDown', _this] call FUNC(events)}];
GVAR(eh_key2) = _display displayAddEventHandler ["keyUp", {['KeyUp', _this] call FUNC(events)}];
GVAR(eh_key3) = _display displayAddEventHandler ["mouseButtonDown", {['MouseButtonDown', _this] call FUNC(events)}];
GVAR(eh_key4) = _display displayAddEventHandler ["mouseButtonUp", {['MouseButtonUp', _this] call FUNC(events)}];
GVAR(eh_key5) = _display displayAddEventHandler ["mouseZChanged", {['MouseZChanged', _this] call FUNC(events)}];
GVAR(eh_key6) = _display displayAddEventHandler ["mouseMoving", {['Mouse', _this] call FUNC(events)}];
GVAR(eh_key7) = _display displayAddEventHandler ["mouseHolding", {['Mouse', _this] call FUNC(events)}];

//remove mission layer
_displayMission = [] call (GETUVAR(BIS_fnc_displayMission,{}));
_control = _displayMission displayCtrl 11400;
_control ctrlSetFade 1;
_control ctrlCommit 0;

//kill layers
cutText ["", "Plain"];
titleText ["", "Plain"];
_layers = GETMVAR(BIS_fnc_rscLayer_list, []);

for "_i" from 1 to (count _layers - 1) step 2 do {
    (_layers select _i) cutText ["", "Plain"];
};
        
//crosshair
_layer = [QGVAR(rsc_crosshair)] call BIS_fnc_rscLayer;
_layer cutRsc [QGVAR(rsc_crosshair), "PLAIN", 2, true];
        
//compass
_layer = [QGVAR(rsc_compass)] call BIS_fnc_rscLayer;
_layer cutRsc [QGVAR(rsc_compass), "PLAIN", 2, true];
        
//status
_layer = [QGVAR(rsc_status)] call BIS_fnc_rscLayer;
_layer cutRsc [QGVAR(rsc_status), "PLAIN", 2, true];
        
//help
_layer = [QGVAR(rsc_help)] call BIS_fnc_rscLayer;
preloadTitleRsc [QGVAR(rsc_help), "PLAIN", 0, true];

call FUNC(listUpdate);
call FUNC(draw);
        
//apply marker settings for units already dead
{
    _name = _x call EFUNC(common,getName);
    _side = _x call EFUNC(common,getSide);
    _icon = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "Icon");
    _colour = _side call FUNC(sideColor);
    _x setVariable [QGVAR(draw), [true, _name, _side, _icon, _colour]];
    ["UnitKilled", [_x, objNull]] call FUNC(events);
} forEach allDead;
        
["Press H for Controls", 0, 1] spawn BIS_fnc_dynamicText;
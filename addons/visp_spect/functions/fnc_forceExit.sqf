if (isClass (configFile >> "CfgPatches" >> "uo_main")) then {
	_uohud = vip_asp_var_cl_UOHUD;
	a3_nameHUD_enabled = _uohud;
	vip_asp_var_cl_UOHUD = nil;
};
		
if (!vip_asp_var_cl_alwaysTracking) then {
	[false] call vip_asp_fnc_cl_tracking;
};

_cam = vip_asp_obj_cl_cam;
_cam cameraEffect ["terminate", "back"];
camUseNVG false;
false SetCamUseTi 0;
camDestroy _cam;
clearRadio;
		
vip_asp_var_cl_noEscape = nil;
vip_asp_var_cl_alwaysTracking = nil;
vip_asp_obj_cl_cam = nil;
vip_asp_var_cl_LMB = nil;
vip_asp_var_cl_RMB = nil;
vip_asp_var_cl_vector = nil;
vip_asp_var_cl_fov = nil;
vip_asp_var_cl_vision = nil;
vip_asp_var_cl_moveScale = nil;
vip_asp_var_cl_cameraOn = nil;
vip_asp_var_cl_focus = nil;
vip_asp_var_cl_lock = nil;
vip_asp_var_cl_targets = nil;
vip_asp_var_cl_attach = nil;
vip_asp_var_cl_unit = nil;
vip_asp_var_cl_unitCount = nil;
vip_asp_var_cl_deadList = nil;
vip_asp_var_cl_mouseBusy = nil;
vip_asp_var_cl_displayMarkers = nil;
vip_asp_var_cl_keys = nil;
vip_asp_fnc_cl_sideColour = nil;
vip_asp_var_cl_eh_listLast = nil;
vip_asp_var_cl_accTime = nil;

_display = findDisplay 46;
		
removeMissionEventhandler ["Draw3D", vip_asp_eh_draw3D];
_display displayRemoveEventHandler ["keyDown", vip_asp_eh_key1];
_display displayRemoveEventHandler ["keyUp", vip_asp_eh_key2];
_display displayRemoveEventHandler ["mouseButtonDown", vip_asp_eh_key3];
_display displayRemoveEventHandler ["mouseButtonUp", vip_asp_eh_key4];
_display displayRemoveEventHandler ["mouseZChanged", vip_asp_eh_key5];
_display displayRemoveEventHandler ["mouseMoving", vip_asp_eh_key6];
_display displayRemoveEventHandler ["mouseHolding", vip_asp_eh_key7];
vip_asp_eh_draw3D = nil;
vip_asp_eh_key1 = nil;
vip_asp_eh_key2 = nil;
vip_asp_eh_key3 = nil;
vip_asp_eh_key4 = nil;
vip_asp_eh_key5 = nil;
vip_asp_eh_key6 = nil;
vip_asp_eh_key7 = nil;

_layers = missionNamespace getVariable ["BIS_fnc_rscLayer_list",[]];

for "_i" from 1 to (count _layers - 1) step 2 do {
	(_layers select _i) cutText ["", "Plain"];
};
		
if (!isMultiplayer) then {setAccTime 1};
player switchCamera "Internal";
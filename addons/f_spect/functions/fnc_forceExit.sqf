closeDialog "KEGsRscSpectate";

// Dialog closed with esc key
titleText["","BLACK IN", 0.5];

// Destroy cameras
camDestroy KEGscam_target;
camDestroy KEGscam_fullmap;
camDestroy KEGscam_free;
{camDestroy _x} foreach KEGs_cameras;

// Delete markers
{
	_marker = _x GETVAR_SYS(marker, "");
	if(_marker != "") then {
		deletemarkerlocal _x
	};	
} foreach allUnits;	 
deletemarkerlocal QGVAR(camMarker);

//Restore viewDistance
setViewDistance GVAR(origviewDistance);

[QGVAR(mapClickEH), "onMapSingleClick"] call BIS_fnc_removeStackedEventhandler;

// Return player view
KGE_Player switchCamera "INTERNAL";
KGE_Player cameraEffect ["terminate","FRONT"];
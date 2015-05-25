#include "script_component.hpp"

// ----------------------------------------------------------------------------------------------------------------------------------------------------
// Check for listbox selections
if(KEGs_camSelLast != lbCurSel KEGs_cLBCameras) then {
	switch(lbCurSel KEGs_cLBCameras) do {
		case GVAR(lbToggleTags): {
			GVAR(tags) = !GVAR(tags);
		};
		case GVAR(lbToggleAiFilter): {
			GVAR(aiFilter) = !GVAR(aiFilter);
		};
		case GVAR(lbToggleDeadFilter): {
			GVAR(deadFilter) = !GVAR(deadFilter);
		};
		case GVAR(lbToggleCombatActionFilter): {
			GVAR(combatActionfilter) = !GVAR(combatActionfilter);
		};
	};

	GVAR(cameraIdx) = KEGs_camSelLast;
	KEGs_camSelLast = lbCurSel KEGs_cLBCameras;		
};
	
lbSetCurSel[IDC_MENUCAM, GVAR(cameraIdx)];	// reset camera mode selection in the listbox to the new or current camera mode
	
// Check limits
if(GVAR(cameraIdx) < 0) then {GVAR(cameraIdx) = 0};
if(GVAR(cameraIdx) >= count GVAR(cameras)) then {GVAR(cameraIdx) = (count GVAR(cameras))-1;};
	
// If not in First Person mode rest camera
if !( (GVAR(cameras) select GVAR(cameraIdx)) == GVAR(cam1stPerson) )  then { 
	(GVAR(cameras) select GVAR(cameraIdx)) cameraEffect["internal", "BACK"]; // CHECK IF NEEDED !!!
};

// ----------------------------------------------------------------------------------------------------------------------------------------------------
	// Set toggle text color for camera menu		
		
	if(KEGsTags) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTags, [1, 0.5, 0, 1]]} 
	else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTags, [1,1,1,0.33]]};			

	if(KEGsTagsStat) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTagsStat, [1, 0.5, 0, 1]]} 
	else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleTagsStat, [1,1,1,0.33]]};			
	
	if(KEGsAIfilter) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleAiFilter, [1, 0.5, 0, 1]]} 
	else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleAiFilter, [1,1,1,0.33]]};			

	if(KEGsDeadFilter) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleDeadFilter, [1, 0.5, 0, 1]]} 
	else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleDeadFilter, [1,1,1,0.33]]};	
	
	if(KEGsCombatActionFilter) then {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleCombatActionFilter, [1, 0.5, 0, 1]]} 
	else {lbSetColor[KEGs_cLBCameras, KEGs_cLbToggleCombatActionFilter, [1,1,1,0.33]]};
	
// ----------------------------------------------------------------------------------------------------------------------------------------------------
	// Toggle 1st Person view
	if((KEGs_cameras select KEGs_cameraIdx) == KEGscam_1stperson) then 
	{
		// 1st person view
		VM_CurrentCameraView = cameraView; // Save the current CameraView
		//player globalChat ("Camera View: "+ str(VM_CurrentCameraView) );	
		
		if ( (KEGs1stGunner) && !(VM_CurrentCameraView == "GUNNER") ) then 
		{
			(vehicle KEGs_target) switchCamera "GUNNER";
			//player globalchat "switchCamera 'GUNNER'";
		}
		else 
		{
			(vehicle KEGs_target) switchCamera "INTERNAL";
			//player globalchat "switchCamera 'INTERNAL'";
		};
		//player globalchat Format ["**Handler CameraView is currently %1",cameraView];
		 (vehicle KEGs_target) cameraEffect ["terminate","BACK"]; 
		 (vehicle KEGs_target) camcommit 0;
	};


ctrlSetText[IDC_CAMERA, format["Camera: %1", KEGs_cameraNames select KEGs_cameraIdx]];	
KEGs_camSelLast = lbCurSel KEGs_cLBCameras; 

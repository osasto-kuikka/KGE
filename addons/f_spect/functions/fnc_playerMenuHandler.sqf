#include "script_component.hpp"

private ["_Source", "_debugPlayer", "_cName", "_cCamera", "_idx", "_found", "_role", "_name", "_ccName", "_disp", "_mode", "_KEGs_target"]; 

if ( _this ) then 
{
	/****************************************   PLAYER MENU HANDLING ***************************************************/

	if(lbCurSel IDC_MENUTGT > lbSize IDC_MENUTGT) then {
		lbSetCurSel[IDC_MENUTGT, lbSize IDC_MENUTGT];	// Selection outside listbox size
	};

	// CHECK FOR NEW PLAYER TARGET 
	if ( KEGs_tgtSelLast != lbCurSel IDC_MENUTGT ) then 
	{
		GVAR(tgtIdx) = lbValue[IDC_MENUTGT, (lbCurSel IDC_MENUTGT)]; // Get the new target
		KEGs_lastTgt = GVAR(tgtIdx);	//immediately capture the last target index
		KEGs_tgtSelLast = lbCurSel IDC_MENUTGT; //immediately capture the last selected target index
	
		// Check limits
		if(GVAR(tgtIdx) >= count GVAR(playerList)) then {GVAR(tgtIdx) = (count GVAR(playerList))-1;};
		if(GVAR(tgtIdx) < 0) then {GVAR(tgtIdx) = 0};	
						
		_KEGs_target = GVAR(playerList) select GVAR(tgtIdx);  // reset camera to the new or current player target

		GVAR(target) = _KEGs_target;
		GVAR(autoTarget) = _KEGs_target;
		
		// move free cam to same position
		GVAR(camFree) setPosATL (GVAR(target) modelToWorld [0,-50,((getPosATL GVAR(camFree)) select 2)]);
		GVAR(camFree) setDir (getDir GVAR(target));
		
	};
	
	
	// If not in First Person mode rest camera
	If (!((GVAR(cameras) select GVAR(cameraIdx)) == GVAR(cam1stPerson)) && !(cameraView in ["INTERNAL","GUNNER"]) ) then 
	{ 
		(GVAR(cameras) select GVAR(cameraIdx)) cameraEffect["internal", "BACK"];
	};
	
	
	if( lbValue[IDC_MENUTGT, (lbCurSel IDC_MENUTGT)] != GVAR(tgtIdx)) then {
		// Find listbox element with matching value
		for "_idx" from 0 to (lbSize IDC_MENUTGT) do {
			if(lbValue[IDC_MENUTGT, (lbCurSel IDC_MENUTGT)] == GVAR(tgtIdx)) then {
				lbSetCurSel[IDC_MENUTGT, _idx];
			};
		};
	};
	
};		

	
GVAR(targetName) = name GVAR(target);

if(GVAR(targetName) == "Error: no unit") then { GVAR(targetName) = "Unknown" };
	
_role = if(vehicle GVAR(target) != GVAR(target)) then {
	if(GVAR(target) == driver vehicle GVAR(target)) exitWith {"(Driver)"};
	if(GVAR(target) == gunner vehicle GVAR(target)) exitWith {"(Gunner)"};
	if(GVAR(target) == commander vehicle GVAR(target)) exitWith {"(Commander)"};
} else {""};

ctrlSetText[IDC_NAME, format["Focus: %1 %2", GVAR(targetName), _role]];	

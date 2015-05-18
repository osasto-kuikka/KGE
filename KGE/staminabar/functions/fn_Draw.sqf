disableSerialization;

private ["_fatigueBarBackground", "_fatigueBar", "_fatigue", "_staminaGreen", "_staminaAlpha", "_fnc_fade"];

_fatigueBar = (KGE_StaminaBar_Visualizer select 0) displayCtrl 9234;

_fnc_fade = {
	((KGE_StaminaBar_Visualizer select 0) displayCtrl 9234) ctrlSetFade _this;
	((KGE_StaminaBar_Visualizer select 0) displayCtrl 9234) ctrlCommit _this;
};

if (([KGE_Player] call KGE_Core_fnc_isAlive) && {(!visibleMap)} && {vehicle KGE_Player == KGE_Player} && {(positionCameraToWorld [0,0,0] distance KGE_Player) < 5}) then {

	if ((ctrlFade _fatigueBar) > 0) then {
		0 call _fnc_fade;
	};

	_fatigue = getFatigue KGE_Player;

	_staminaGreen = linearConversion [0,1,_fatigue,.6,0,true];
	_staminaAlpha = linearConversion [0,1,_fatigue,.5,1,true];

	_fatigueBar ctrlSetBackgroundColor [_fatigue,_staminaGreen,0,_staminaAlpha];
	_fatigueBar ctrlCommit 0;
} else {
	if ((ctrlFade _fatigueBar) == 0) then {
		1 call _fnc_fade;
	};
};
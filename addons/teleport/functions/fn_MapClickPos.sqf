cutText [localize "STR_Teleport_MapClick", "PLAIN"];

["KGE_MapClick", "onMapSingleClick", {
	KGE_Teleport_MapClickPos = _pos;
	cutText ["", "PLAIN"];
}] call BIS_fnc_addStackedEventHandler





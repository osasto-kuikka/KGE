_unit = _this select 0;
_assign = _this select 1;

if(_assign) then {
	if(!isNil "KGE_Zeus_AssignedCurator") then {
		unassignCurator KGE_Zeus_CuratorModule;
	};

	KGE_Zeus_AssignedCurator = _unit;
	_unit assignCurator KGE_Zeus_CuratorModule;
};

{
	_curator = _x;

	//Add all object in mission to editable
	_curator addCuratorEditableObjects [vehicles,true];
	_curator addCuratorEditableObjects [allUnits, true];
	_curator addCuratorEditableObjects [(allMissionObjects "Man"),false];
	_curator addCuratorEditableObjects [(allMissionObjects "Air"),true];
	_curator addCuratorEditableObjects [(allMissionObjects "Ammo"),false];

	// Add players to list (untested!)
	if(isMultiplayer) then {_curator addCuratorEditableObjects [playableUnits, true]}
	else {_curator addCuratorEditableObjects [switchableUnits, true]};

	// Reduce costs for all actions
	_curator setCuratorWaypointCost 0;
	{_curator setCuratorCoef [_x,0];} forEach ["place","edit","delete","destroy","group","synchronize"];


} forEach allCurators;


_type = _this select 0;
_typeUnits = _this select 1;

switch (_type) do {
	case "ADMIN": {_type = 0};
	case "LEADER": {_type = 1};
	case "MAPCLICK": {_type = 2};
};

switch (_typeUnits) do {
	case "SINGLE": {[_type, _typeUnits] call KGE_Teleport_fnc_CreateMenuPlayerList};
	case "GROUP": {[_type, _typeUnits] call KGE_Teleport_fnc_CreateMenuPlayerList};
	case "ALL": {[_type] call KGE_Teleport_fnc_AllTeleport};
};


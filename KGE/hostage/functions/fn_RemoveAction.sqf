if(isNil "KGE_Hostage_Action") exitWith {};
_hostage = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

// Find action
_index = -1;
{
	if((_x select 0) isEqualTo _hostage) exitWith {
		(_x select 0) removeAction (_x select 1);

		_index = _forEachIndex;
	};
} forEach KGE_Hostage_Action;

// Remove action from array
if(_index != -1) then {
	KGE_Hostage_Action set [_index, objNull];
	KGE_Hostage_Action = KGE_Hostage_Action - [objNull];
}

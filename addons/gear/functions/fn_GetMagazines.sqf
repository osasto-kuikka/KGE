private ["_magasinesList", "_hintText", "_cfg", "_pic", "_count", "_name"];

_magasinesList = [];
_hintText = "";

{
	_cfg = configFile >> "CfgMagazines" >> _x;
	_name = getText(_cfg >> "displayName");
	_pic = [getText(_cfg >> "picture")] call KGE_Gear_fnc_GetPicture;
	[[_name, _pic], _magasinesList, 1] call KGE_Gear_fnc_AddToArray;
} forEach (magazines KGE_Player);

{
	_cfg = (_x select 0) select 0;
	_pic = (_x select 0) select 1;
    _count = _x select 1;
    _count = str _count;
    _hintText = _hintText + format["<t align='center'>%1<br/><img image='%2' height=24 />x%3<br/><br/></t>", _cfg, _pic, _count];
} forEach _magasinesList;

Hint parseText _hintText;



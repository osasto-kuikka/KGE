private ["_unit", "_number", "_text", "_weaponsPrimary", "_weapons", "_items", "_cfg", "_weaponsList", "_magasinesList", "_pic", "_count", "_name"];

_unit = _this select 0;
_number = _this select 1;

_text = format["<font color='#FFFFBB'>%1. %2</font> %3", (str _number), ([_unit] call KGE_Core_fnc_GetName), (if(leader _unit == _unit)then{"(RJ)"}else{""})];
_weaponsList = [];
_itemsList = [];
_magasinesList = [];


if(primaryWeapon _unit != "")then
{
	_name = getText(configFile >> "CfgWeapons" >> (primaryWeapon _unit) >> "displayName");
	_text = _text + format[" - %1<br/>", _name];
} else {
	_text = _text + "<br/>";
};



_weaponsPrimary = [primaryWeapon _unit, secondaryWeapon _unit] - [""];
_weapons = weapons _unit - _weaponsPrimary - ["Binocular","lerca_1200_black","Rangefinder","Laserdesignator","lerca_1200_tan","BWA3_Vector","AGM_Vector"];
_items = assignedItems _unit - [""];

if(count ((_weaponsPrimary)+(primaryWeaponItems _unit - [""])) != 0) then {
	_text = _text + localize "STR_Gear_MainWeaponAttachments" + "<br/>";
	{
		_cfg = configFile >> "CfgWeapons" >> _x;
		_name = ""; //getText(_cfg >> "displayName");
		_pic = [getText(_cfg >> "picture")] call KGE_Gear_fnc_GetPicture;
		_text = _text + format["%1<img size='24' image='%2' height=40 /> ", _name, _pic];
	} forEach (_weaponsPrimary)+(primaryWeaponItems _unit - [""]);
	_text = _text + "<br/>";
};


{
	_cfg = configFile >> "CfgWeapons" >> _x;
	_name = ""; //getText(_cfg >> "displayName");
	_pic = [getText(_cfg >> "picture")] call KGE_Gear_fnc_GetPicture;
	if(!(_x in items _unit))then
	{
		[[_name, _pic], _weaponsList, 1] call KGE_Gear_fnc_AddToArray;
	};
} forEach (_weapons)+(handgunItems _unit - [""]);


{
	_cfg = configFile >> "CfgWeapons" >> _x;
	_name = ""; //getText(_cfg >> "displayName");
	_pic = [getText(_cfg >> "picture")] call KGE_Gear_fnc_GetPicture;
	[[_name, _pic], _itemsList, 1] call KGE_Gear_fnc_AddToArray;
} forEach (_items);

{
	_cfg = configFile >> "CfgMagazines" >> _x;
	_name = ""; //getText(_cfg >> "displayName");
	_pic = [getText(_cfg >> "picture")] call KGE_Gear_fnc_GetPicture;
	[[_name, _pic], _magasinesList, 1] call KGE_Gear_fnc_AddToArray;
} forEach (magazines _unit);

if(count _weaponsList != 0) then {
	_text = _text + localize "STR_Gear_SideWeaponAttachments" + "<br/>";
	{
		_name = (_x select 0) select 0;
		_pic = (_x select 0) select 1;
		_count = _x select 1;
		for "_i" from 1 to _count do
		{
			_text = _text + format["%1<img size='24' image='%2' height=24 /> ", _name, _pic];
		};
	}forEach _weaponsList;
	_text = _text + "<br/>";
};

if(count _itemsList != 0) then {
	_text = _text + localize "STR_Gear_Items" + "<br/>";
	{
		_name = (_x select 0) select 0;
		_pic = (_x select 0) select 1;
		_count = _x select 1;
		for "_i" from 1 to _count do
		{
			_text = _text + format["%1<img size='24' image='%2' height=24 /> ", _name, _pic];
		};
	}forEach _itemsList;
	_text = _text + "<br/>";
};


if(count _magasinesList != 0) then {
	_text = _text + localize "STR_Gear_Magazines" + "<br/>";
	{
		_name = (_x select 0) select 0;
		_pic = (_x select 0) select 1;
	    _count = _x select 1;
	    _count = str _count;
	    _text = _text + format["%1<img size='24' image='%2' height=24 /> x%3    ", _name, _pic, _count];
	}forEach _magasinesList;
};
_text = _text + "<br/><br/><br/>";

_text

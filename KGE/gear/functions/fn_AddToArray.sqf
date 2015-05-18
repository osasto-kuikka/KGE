private["_value", "_array", "_count", "_found", "_x", "_forEachIndex"];
_value = _this select 0;
_array = _this select 1;
_count = _this select 2;
_found = false;

{
	if (_x select 0 isEqualTo _value) exitWith {
		_found = true;
		_array set [_forEachIndex, [_value, (_x select 1) + _count]];
	};
}forEach _array;

if (!_found) then {
	_array pushBack [_value, _count];
};
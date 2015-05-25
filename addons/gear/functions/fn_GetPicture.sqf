private["_path", "_array", "_len", "_last4"];

_path = toLower (_this select 0);
_array = toArray(_path);
_len = count _array;
_last4 = toString[_array select _len-4, _array select _len-3, _array select _len-2, _array select _len-1];

if(_last4 == ".paa")then {(_this select 0)} else {(_this select 0) + ".paa"}
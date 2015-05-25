private ["_unit"];

_unit = _this select 0;

_unit addEventhandler ["killed", {
	[(_this select 0)] spawn {
		private ["_body", "_removalTime", "_remove"];

		_body = _this select 0;

		_removalTime = diag_tickTime + KGE_Cleanup_BodyRemovalTime;

		waitUntil {
			_remove = try {
					{
						if((_x distance _body) < KGE_Cleanup_BodyRemovalDistance) then {throw false};
					} forEach ([] call KGE_Core_fnc_GetAlivePlayers);
					throw true;
				} catch {_exception};

			_remove AND {diag_tickTime > _removalTime}
		};

		deleteVehicle _body;
	};
}];

_unit setVariable ["KGE_Cleanup_initialized", true];
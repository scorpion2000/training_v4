params ["_controller", "_type", "_caller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_activeMines = _trigger getVariable ["activeMines", []];

_mineClassname = if (_type == "ap") then {"APERSMine_Range_Ammo"} else {"ATMine_Range_Ammo"};
_safeCheckClassname = if (_type == "ap") then {"APERSMine"} else {"ATMine"};

for "_i" from 1 to 10 do {
	_rndPos = _trigger call BIS_fnc_randomPosTrigger;
	_safePos = _rndPos findEmptyPosition [0, 5, _safeCheckClassname];

	if (count _safePos == 0) then {continue};

	_mine = createVehicle [_mineClassname, _safePos, [], 0, "NONE"];
	_activeMines pushBack _mine;
};

_trigger setVariable ["activeMines", _activeMines];

[format ["Active Mine Count: %1", (count _activeMines)]] remoteExec ["hint", (owner _caller), false];
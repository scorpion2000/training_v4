params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_spawnPositions = _trigger getVariable ["objectivePositions", []];
if (count _spawnPositions < 2) exitWith {systemChat format ["ERROR: Not enough positions for objective generation! %1", count _spawnPositions];};

{
	deleteVehicle _x;
} forEach (_trigger getVariable ["objectiveItems", []]);

_radars = [];

for "_i" from 1 to 3 do {
	_pos = [];
	while {count _pos == 0} do {
		_rndPos = selectRandom _spawnPositions;
		_pos = _rndPos findEmptyPosition [0,1,"rhsgref_serhat_radar"];
	};

	_radar = createVehicle ["rhsgref_serhat_radar", _pos, [], 0, "CAN_COLLIDE"];
	_radars pushBack _radar;

	[
		_radar,
		"Disable Radar",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
		"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
		"_this distance _target < 3",
		"_caller distance _target < 3",
		{},{},
		{ (_this select 0) setVariable ["complete", true, true]; hint "Radar Disabled!"; },
		{},[],3,0,true,false
	] remoteExec ["BIS_fnc_holdActionAdd", 0, false];
};

_trigger setVariable ["objectiveItems", _radars];

[_radars, "radar", _trigger] remoteExec ["wsot_fnc_waitForObjectiveCompletion", 2, false];
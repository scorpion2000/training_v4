/*	NOTE: Targets are completely random. This script makes use of all the vehicles stored
*	in the vehicle files. You can limit the factions to use by replacing the wsot_allFactionsArray variable
*	with your own custom array.
*/

wsot_vehicleTargets = true;
wsot_bRangeLastHit = objNull;
wsot_bRangeReportDelay = 0;

while { true } do {
	_allVehicles = missionNamespace getVariable ["wsot_bRangeVehicles", []];

	if !(wsot_vehicleTargets) then { {deleteVehicle _x} forEach _allVehicles; sleep 20; continue; };
	if ({alive _x} count _allVehicles >= 8) then { sleep 20; continue; };

	while {{alive _x} count _allVehicles < 8 } do {
		_faction = selectRandom wsot_allFactionsArray;
		_vehicleArray = [] call compile preprocessFileLineNumbers (format ["scripts\vehicles\%1.sqf", _faction]);
		_vehicleType = selectRandom _vehicleArray;
		_vehicleClass = (selectRandom _vehicleType) select 1;
		_position = (selectRandom [bombing_1, bombing_1, bombing_2]) call BIS_fnc_randomPosTrigger;
		_positionSafe = [_position, 0, 100, 5, 0, 0.1, 0] call BIS_fnc_findSafePos;;
		_vehicle = createVehicle [_vehicleClass, _positionSafe, [], 0, "CAN_COLLIDE"];

		_vehicle addEventHandler ["Hit", {
			params ["_unit", "_source", "_damage", "_instigator"];
			_name = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
			if (alive _unit) then {
				[format ["%1: Target Hit", _name]] remoteExec ["hint", (owner _source), false];
			} else {
				[format ["%1: Target Hit", _name]] remoteExec ["hint", (owner _source), false];
			};
			[_unit, _name, _source] remoteExec ["wsot_fnc_reportDamage", 2, false];
		}];

		_allVehicles pushBack _vehicle;
	};

	missionNamespace setVariable ["wsot_bRangeVehicles", _allVehicles];
	sleep 20;
};
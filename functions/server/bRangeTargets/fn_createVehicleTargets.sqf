/*	NOTE: Targets are completely random. This script makes use of all the vehicles stored
*	in the vehicle files. You can limit the factions to use by replacing the wsot_allFactionsArray variable
*	with your own custom array.
*/
_allVehicles = missionNamespace getVariable ["wsot_bRangeVehicles", []];

if !(wsot_vehicleTargets) exitWith { {deleteVehicle _x} forEach _allVehicles; };
if ({alive _x} count _allVehicles >= 8) exitWith {};
if (wsot_bRangeForceRedeploy) then {{deleteVehicle _x} forEach _allVehicles; wsot_bRangeForceRedeploy = false;};

while {{alive _x} count _allVehicles < 8 } do {
	if (count wsot_allTypesBRange == 0 || count wsot_allFactionsBRange == 0) then {break};
	_faction = selectRandom wsot_allFactionsBRange;
	_vehicleArray = [] call compile preprocessFileLineNumbers (format ["scripts\vehicles\%1.sqf", _faction]);
	_vehicleType = [];
	//Some vehicle categories are not available in certain factions
	//So we iterate. Sad.
	//Later edit; Seems like we somehow still select bad categories. Must investigate later
	while { count _vehicleType == 0 } do {
		_type = selectRandom wsot_allTypesBRange;
		{
			if ((_x select 0) select 0 == _type) then { _vehicleType = _x; _vehicleType deleteAt 0; break; };
		} forEach _vehicleArray;
	};
	_vehicleClass = (selectRandom _vehicleType) select 1;
	_position = (selectRandom [bombing_1, bombing_1, bombing_1, bombing_2]) call BIS_fnc_randomPosTrigger;
	_positionSafe = [_position, 0, 100, 5, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_vehicle = createVehicle [_vehicleClass, _positionSafe, [], 0, "CAN_COLLIDE"];

	_vehicle addEventHandler ["Hit", {
		params ["_unit", "_source", "_damage", "_instigator"];
		_name = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
		[format ["%1: Target Hit", _name]] remoteExec ["hint", (owner _source), false];
		
		[_unit, _name, _source, _instigator] remoteExec ["wsot_fnc_reportDamage", 2, false];
	}];

	_vehicle addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		_name = getText (configFile >> "CfgVehicles" >> (typeOf _unit) >> "displayName");
		[format ["%1: Target Destroyed", _name]] remoteExec ["hint", (owner _source), false];
		[_unit, _name, _killer, _instigator] remoteExec ["wsot_fnc_reportDamage", 2, false];
		[] remoteExec ["wsot_fnc_createVehicleTargets", 2, false];
	}];
	_vehicle engineOn true;
	_vehicle setDir (random 360);

	_allVehicles pushBack _vehicle;
};

missionNamespace setVariable ["wsot_bRangeVehicles", _allVehicles];
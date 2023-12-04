_positionObjects = [uav_target_1, uav_target_2, uav_target_3];

if !(wsot_uavTargets) exitWith {
	{
		if !(isNull (_x getVariable ["thisUAV", objNull])) then {
			deleteVehicle (_x getVariable ["thisUAV", objNull]);
		};
	} forEach _positionObjects;
};

{
	_uav = _x getVariable ["thisUAV", objNull];
	if (isNull _uav || !(alive _uav)) then {
		_uav = createVehicle ["O_UAV_02_dynamicLoadout_F", getPos _x, [], 0, "FLY"];
		_crew = createVehicleCrew _uav;
		_wp = _crew addWaypoint [getPos _x, 0];
		_wp setWaypointType "LOITER";
		_wp setWaypointLoiterAltitude 850;
		_crew setBehaviour "CARELESS";
		_uav setVehicleAmmo 0;

		_uav setVariable ["myObject", _x];
		_x setVariable ["thisUAV", _uav];
		_uav addEventHandler ["Killed", {
			params ["_unit", "_killer", "_instigator", "_useEffects"];
			_object = _unit getVariable ["myObject", objNull];
			if (isNull _object) then {systemChat "ERROR: Object Was Not Set On UAV!"};
			_object setVariable ["thisUAV", objNull];
			[] remoteExec ["wsot_fnc_createUAVTargets", 2, false];
			[_unit] remoteExec ["wsot_fnc_delayedRemoval", 2, false];
		}];

		_uav addEventHandler ["Fuel", {
			params ["_vehicle", "_hasFuel"];
			if !(_hasFuel) then { _vehicle setFuel 1 };
		}];
	};
} forEach _positionObjects;
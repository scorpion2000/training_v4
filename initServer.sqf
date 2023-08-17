wsot_preferedLanguage = 0;
wsot_changingWeather = false;

[] call compile preprocessFileLineNumbers "scripts\stringTable.sqf";	//Server has to wait for this
[] execVM "scripts\factions\allFactions.sqf";
[] execVM "scripts\objectSetups.sqf";
[] execVM "scripts\createUAVTargets.sqf";
[] execVM "scripts\createVehicleTargets.sqf";
[] execVM "scripts\checkArtyInUse.sqf";
[] execVM "scripts\checkAdminLogon.sqf";

[(selectRandom ["clear", "cloudy", "rainy", "stormy"])] call wsot_fnc_changeWeather;
[6 + round (random 6)] call wsot_fnc_changeTime;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_owner = owner _unit;
	_allVehicles = _unit getVariable ["allVehicles", []];

	{
		if ( _x getVariable ["thisOwner", 2] == (owner _owner) ) then { deleteVehicle _x };
	} forEach _allVehicles;

	false;
}];
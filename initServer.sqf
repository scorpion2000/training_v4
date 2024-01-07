wsot_preferedLanguage = 0;
wsot_changingWeather = false;

ACE_maxWeightCarry = 4000;
publicVariable "ACE_maxWeightCarry";	//Don't ask why

[] call compile preprocessFileLineNumbers "scripts\stringTable.sqf";			//Server has to wait for this
[] call compile preprocessFileLineNumbers "scripts\factions\allFactions.sqf";	//Server has to wait for this
[] execVM "scripts\objectSetups.sqf";
//[] execVM "scripts\createUAVTargets.sqf";
[] execVM "scripts\createVehicleTargets.sqf";
[] execVM "scripts\checkArtyInUse.sqf";
[cmTreeLoc] execVM "scripts\christmasTree.sqf";
//[] execVM "scripts\checkAdminLogon.sqf";

[(selectRandom ["clear", "cloudy", "rainy", "stormy"])] call wsot_fnc_changeWeather;
[6 + round (random 6)] call wsot_fnc_changeTime;

wsot_uavTargets = true;
[] call wsot_fnc_createUAVTargets;

addMissionEventHandler ["HandleDisconnect", {
	params ["_unit", "_id", "_uid", "_name"];
	_owner = _unit getVariable ["bullshitID", 2];
	_allVehicles = _unit getVariable ["enteredVehicles", []];

	[format ["DEBUG: Deleting %1 vehicles by userID: %2", (count _allVehicles), _owner]] remoteExec ["systemChat", 0, false];

	{
		if ( _x getVariable ["thisOwner", 2] == _owner ) then { deleteVehicle _x };
	} forEach _allVehicles;

	false;
}];

addMissionEventHandler ["OnUserAdminStateChanged", {
	params ["_networkId", "_loggedIn", "_votedIn"];
	if (_loggedIn || _votedIn) then { [true] call wsot_fnc_switchAdminScreens }
	else { [false] call wsot_fnc_switchAdminScreens };
}];
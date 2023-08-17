if !("ACE_EarPlugs" in items player) then {
	player addItem "ACE_EarPlugs";
};

if !(count ([] call acre_api_fnc_getCurrentRadioList) <= 0) then {
	player addItem "ACRE_PRC343";
};

[] execVM "scripts\createAceStaticActions.sqf";
[] execVM "scripts\mapHideIcon.sqf";

player addEventHandler ["GetInMan", {
	params ["_unit", "_role", "_vehicle", "_turret"];
	_vehicle setVariable ["thisOwner", (owner _unit), true];
	_allVehicles = _unit getVariable ["enteredVehicles", []];
	if !(_vehicle in _allVehicles) then {
		_allVehicles pushBack _vehicle;
		_unit setVariable ["enteredVehicles", _allVehicles];
	};
}];

[] call wsot_fnc_welcomeMessage;
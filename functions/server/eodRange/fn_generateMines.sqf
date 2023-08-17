params ["_controller", "_type"];

_trigger = missionNamespace getVariable [[_controller getVariable ["controlGroup",""], "trigger"] joinString "_", objNull];

{
	if (isNil "_x" || isNull _x) then { continue };
	deleteVehicle _x;
} forEach (_trigger getVariable ["thisMines", []]);

_class = "";
switch (_type) do {
	case "ap": { _class = "APERSMine_Range_Ammo" };
	case "at": { _class = "ATMine_Range_Ammo" };
	default { _class = "APERSMine_Range_Ammo" };
};

_mines = [];
for "_i" from 1 to 10 do {
	_rndPos = _trigger call BIS_fnc_randomPosTrigger;
	_mine = createVehicle [_class, _rndPos, [], 0, "CAN_COLLIDE"];
	_mines pushBack _mine;
};

_trigger setVariable ["thisMines", _mines];
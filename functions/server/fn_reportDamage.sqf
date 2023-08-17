params ["_vehicle", "_vehicleName", "_damageSource"];

wsot_bRangeLastHit = _vehicle;
if (wsot_bRangeReportDelay != 0) exitWith {wsot_bRangeReportDelay = 3};
wsot_bRangeReportDelay = 3;

while { wsot_bRangeReportDelay > 0 } do {
	wsot_bRangeReportDelay = wsot_bRangeReportDelay - 1;
	systemChat str wsot_bRangeReportDelay;
	sleep 1;
};

_hp = getAllHitPointsDamage wsot_bRangeLastHit;

_string = format ["%1\nDamage Report\n\nFull Health: %2%3\nPart Damage:", _vehicleName, round (100 - (damage _vehicle * 100)), "%"];

{
    if (_x find "wheel" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		_hitString = if (_x find "wheel_1" != -1) then {"Left Wheel"} else {"Right Wheel"};
		_index = [_x, 0, 8] call BIS_fnc_trimString;
		_index = _index select [count _index - 1,1];
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [[_hitString, _index] joinString " ", _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	}
} forEach (_hp select 1);

{
    if (_x find "track" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		_hitString = if (_x find "hitl" != -1) then {"Left Track"} else {"Right Track"};
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	}
} forEach (_hp select 0);

{
    if (_x find "hitengine" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		_hitString = "Engine";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitfuel" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		_hitString = "Fuel";
		if (_x find "left" != -1) then {
			_hitString = "Fuel Left";
		};
		if (_x find "right" != -1) then {
			_hitString = "Fuel Right";
		};
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitbody" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		_hitString = "Body";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hithull" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		_hitString = if (_x == "hithull_structural") then { "Body Structural" } else {"Hull"};
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitturret" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		if (_x == "hitturretcom") then { continue };
		_hitString = "Turret";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitgun" != -1) then {
		if (((_hp select 2) select _foreachindex) == 0) then {continue};
		if (_x == "hitguncom") then { continue };
		_hitString = "Main Gun";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};
} forEach (_hp select 0);

_string = format ["%1\nDamaged ERA and/or SLAT:", _string];
_hpArray = +(_hp select 0);
_hasEraOrSlat = false;
{
	if (_x find "slat" != -1) then {
		_hasEraOrSlat = true;
		if ((_hp select 2) select _foreachindex == 0) then { continue };
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_x, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "era" != -1) then {
		_hasEraOrSlat = true;
		if ((_hp select 2) select _foreachindex == 0) then { continue };
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_x, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};
} forEach (_hp select 0);

if (!_hasEraOrSlat) then {
	_s = "Vehicle has no ERA or SLAT!";
	_string = [_string, _s] joinString "\n";
};

if !(alive wsot_bRangeLastHit) then {deleteVehicle wsot_bRangeLastHit};

[_string] remoteExec ["hint", (owner _damageSource), false];
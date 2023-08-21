params ["_vehicle"];

_trigger = _vehicle getVariable ["parentTrigger", objNull];

_isDisplaying = _trigger getVariable ["isDisplaying", false];
if (_isDisplaying) exitWith {};
_trigger setVariable ["isDisplaying", true];
sleep 0.2;

if (_trigger == objNull) exitWith {};
_name = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_boards = _trigger getVariable ["damageBoards", []];
if (count _boards == 0) exitWith {};

_hp = getAllHitPointsDamage _vehicle;

_string = "Wheel Damage:";

{
    if (_x find "wheel" != -1) then {
		_hitString = if (_x find "wheel_1" != -1) then {"Left Wheel"} else {"Right Wheel"};
		_index = [_x, 0, 8] call BIS_fnc_trimString;
		_index = _index select [count _index - 1,1];
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [[_hitString, _index] joinString " ", _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	}
} forEach (_hp select 1);

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
(_boards select 0) setObjectTextureGlobal [0, _texture];

_string = "Track Damage:";

{
    if (_x find "track" != -1) then {
		_hitString = if (_x find "hitl" != -1) then {"Left Track"} else {"Right Track"};
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	}
} forEach (_hp select 0);

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
(_boards select 1) setObjectTextureGlobal [0, _texture];

_string = format ["Full Health: %1%2\nPart Damage:", round (100 - (damage _vehicle * 100)), "%"];

{
    if (_x find "hitengine" != -1) then {
		_hitString = "Engine";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitfuel" != -1) then {
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
		_hitString = "Body";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hithull" != -1) then {
		_hitString = if (_x == "hithull_structural") then { "Body Structural" } else {"Hull"};
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitturret" != -1) then {
		if (_x == "hitturretcom") then { continue };
		_hitString = "Turret";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};

	if (_x find "hitgun" != -1) then {
		if (_x == "hitguncom") then { continue };
		_hitString = "Main Gun";
		_health = format ["%1%2", round (100 - (((_hp select 2) select _foreachindex) * 100)), "%"];
		_s = [_hitString, _health] joinString " - ";
		_string = [_string, _s] joinString "\n";
	};
} forEach (_hp select 0);

_texture = format ["#(rgb,512,512,3)text(0,0,%1,0.075,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
(_boards select 2) setObjectTextureGlobal [0, _texture];

_string = format ["%1\nDamaged ERA and/or SLAT:", _name];
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

_texture = format ["#(rgb,1024,1024,3)text(0,0,%1,0.055,%2,%3,%4)", "EtelkaNarrowMediumPro", "#1a1a1a", "#f5f5f5", _string];
(_boards select 3) setObjectTextureGlobal [0, _texture];

_trigger setVariable ["isDisplaying", false];
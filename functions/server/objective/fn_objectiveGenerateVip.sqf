params ["_controller"];

_trigger = missionNamespace getVariable [[_controller getVariable ["objectiveName",""], "trigger"] joinString "_", objNull];

_spawnPositions = _trigger getVariable ["objectivePositions", []];
if (count _spawnPositions < 2) exitWith {};

{
	deleteVehicle _x;
} forEach (_trigger getVariable ["objectiveItems", []]);

_pos = selectRandom _spawnPositions;
_group = createGroup CIVILIAN;
_unitTypes = ["C_journalist_F", "C_Man_Paramedic_01_F", "C_Nikos_aged", "C_scientist_02_formal_F"];

_unit = _group createUnit [(selectRandom _unitTypes), _pos, [], 0, "CAN_COLLIDE"];
[_unit, true] call ACE_captives_fnc_setHandcuffed;
_trigger setVariable ["objectiveItems", [_unit]];

[[_unit], "vip", _trigger] remoteExec ["wsot_fnc_waitForObjectiveCompletion", 2, false];
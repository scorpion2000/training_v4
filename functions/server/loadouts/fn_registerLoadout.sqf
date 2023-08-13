params ["_unit", "_category", "_loadoutName"];

_loadouts = missionNamespace getVariable ["wsot_loadouts", []];
_loadouts pushback [_category, _loadoutName, (getUnitLoadout _unit)];
_loadouts = missionNamespace setVariable ["wsot_loadouts", _loadouts, true];

deleteVehicle _unit;
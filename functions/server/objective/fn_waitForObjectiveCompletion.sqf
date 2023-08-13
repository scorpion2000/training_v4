params ["_objects", "_objectiveType", "_trigger"];

_objectsExist = true;
_objectiveComplete = false;
_objectiveID = 1;

_trigger setVariable ["objectiveType", _objectiveType];
_currentID = _trigger getVariable ["objectiveID", 0];
if (_currentID != 0) then {
	_objectiveID = _currentID + 1;
};
_trigger setVariable ["objectiveID", _objectiveID];
["Ongoing", _trigger] remoteExec ["wsot_fnc_updateObjectiveDisplays", 2, false];

while {_objectsExist} do {
	_radarCount = 0;
	{
		if (isNil "_x" || isNull _x || !(alive _x)) then {_objectsExist = false; break;};

		if (_objectiveType == "vip") then {
			if !(_x inArea _trigger) then {
				_objectiveComplete = true;
				_objectsExist = false;
			};
		};

		if (_objectiveType == "radar") then {
			if (_x getVariable ["complete", false]) then {
				_radarCount = _radarCount + 1;
			};
		};

		if (_radarCount == 3) then {
			_objectiveComplete = true;
			_objectsExist = false;
		};
	} forEach _objects;

	sleep 3;
};

if (_objectiveComplete) then {
	["Complete", _trigger] remoteExec ["wsot_fnc_updateObjectiveDisplays", 2, false];
} else {
	if (_trigger getVariable ["objectiveID", 0] == _objectiveID) then {
		["Aborted", _trigger] remoteExec ["wsot_fnc_updateObjectiveDisplays", 2, false];
	};
};
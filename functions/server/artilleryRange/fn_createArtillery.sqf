params ["_controller", "_type"];

_prevVehicle = _controller getVariable ["arty", objNull];
_position = (missionNamespace getVariable [[(_controller getVariable ["rangeName", ""]), "placement"] joinString "_", []]) select 0;
_direction = (missionNamespace getVariable [[(_controller getVariable ["rangeName", ""]), "placement"] joinString "_", []]) select 1;

if (count _position == 0) exitWith {systemChat "ERROR: Arty position not found!"};

if !(isNull _prevVehicle) then {
	deleteVehicle _prevVehicle;
};

//Safe pos checks CAN happen before vehicle is deleted
sleep 0.05;

_safePos = _position findEmptyPosition [0, 1, _type];
if (count _safePos == 0) exitWith {systemChat "ERROR: Arty position is not clear!"};

_veh = createVehicle [_type, _position, [], 0, "CAN_COLLIDE"];
_veh setDir _direction;
_veh setVariable ["controller", _controller];

_veh addEventHandler ["Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];
	_projectile setVariable ["parentVehicle", _unit];
	_projectile addEventHandler ["Deleted", {
		params ["_entity"];
		_position = getPos _entity;
		_controller = (_entity getVariable "parentVehicle") getVariable "controller";
		[_controller, _position] remoteExec ["wsot_fnc_artilleryUpdateDisplay", 2, false];
	}];
}];

_controller setVariable ["arty", _veh];
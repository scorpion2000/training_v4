//Must be called with remoteExec

params ["_vehicle", ["_timer", 10]];

sleep _timer;
deleteVehicle _vehicle;
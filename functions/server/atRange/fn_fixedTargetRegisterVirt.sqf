//Registers a point from where we measure distances, by an object
params ["_object", "_trigger"];

_trigger setVariable ["fixedVirtRef", [(getPosAtl _object), ((getDir _object) + 180)]];

deleteVehicle _object;
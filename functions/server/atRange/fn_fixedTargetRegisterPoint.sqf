//Registers a point from where we measure distances, by an object
params ["_object", "_trigger"];

_trigger setVariable ["fixedPointRef", [100, (getDir _object)]];
_trigger setVariable ["fixedPointObj", _object];
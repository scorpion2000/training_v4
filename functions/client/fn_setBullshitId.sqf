params ["_vehicle", "_player"];

_bId = _player getVariable "bullshitID";

_vehicle setVariable ["thisOwner", _bId, true];
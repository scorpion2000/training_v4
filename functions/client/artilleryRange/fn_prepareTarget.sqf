params ["_vehicle"];

if (isNil "loc_targetMarker") then {
	createMarkerLocal ["loc_targetMarker", [0,0,0]];
	"loc_targetMarker" setMarkerTypeLocal "hd_objective";
};

"loc_targetMarker" setMarkerPosLocal (getPos _vehicle);
params ["_location"];

TREE_RUN = true;

_tree = createVehicle ["CUP_t_picea1s", _location, [], 0, "NONE"];
_tree setDir (random 360);
_cSel = [0, 255, 255];
_colors = [
	[0, 255, 255],	//light blue
	[255, 0, 127],	//pink
	[0, 0, 255],	//dark blue
	[204, 204, 0],	//gold
	[204, 0, 0],	//red
	[255, 255, 0],	//yellow
	[0, 255, 0],	//green
	[0, 255, 128],	//teal
	[255, 128, 0]	//orange
];

_col = "#lightpoint" createVehicleLocal getPos _tree;
_col setLightBrightness 0.09;
_col setLightColor [1,1,1];
_col setLightAttenuation [1,4,4,0,5,7];
_col attachTo [_tree, [0, 0, 1]];
while {TREE_RUN} do {
	_cPick = +_colors;
	_cPick deleteAt (_cPick find _cSel);
	_cSel = selectRandom _cPick;
	_col setLightAmbient _cSel;
	sleep 1.25 + (random 2);
};
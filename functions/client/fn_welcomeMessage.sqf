/*	Only in Hungarian, feel free to translate	*/

_systemHour = systemTime select 3;
_timeOfDay = "";

switch true do {
	case (_systemHour >= 0 && _systemHour < 5): { _timeOfDay = "éjszakát" };
	case (_systemHour >= 5 && _systemHour < 7): { _timeOfDay = "hajnalt" };
	case (_systemHour >= 5 && _systemHour < 7): { _timeOfDay = "éjszakát" };
	case (_systemHour >= 7 && _systemHour < 9): { _timeOfDay = "reggelt" };
	case (_systemHour >= 9 && _systemHour < 12): { _timeOfDay = "délelőttöt" };
	case (_systemHour >= 12 && _systemHour < 14): { _timeOfDay = "kora délutánt" };
	case (_systemHour >= 14 && _systemHour < 16): { _timeOfDay = "délutánt" };
	case (_systemHour >= 16 && _systemHour < 19): { _timeOfDay = "késő délutánt" };
	case (_systemHour >= 19 && _systemHour < 24): { _timeOfDay = "estét" };
	default { _timeOfDay = "ERROR: lmao ezt hogy kúrhattam el xd" };
};

//Do not question the inner workings of this code
titleFadeOut 3;
sleep 3;
titleText [ 
	format [
		"<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Üdv, %1!<br/>Kellemes %2 és jó gyakorlatot!</t>",
		name player,
		_timeOfDay
	],
	"PLAIN DOWN",
	1,
	false,
	true
	];
sleep 5;
titleFadeOut 1;
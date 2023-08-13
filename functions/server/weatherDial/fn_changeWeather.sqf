params ["_weather", "_caller"];

if (wsot_changingWeather) exitWith {
	systemChat "ERROR: Already changing weather";
	["ERROR: Already changing weather"] remoteExec ["hint", (owner _caller), false];
};
wsot_changingWeather = true;

switch (_weather) do {
	case "clear": { 
		10 setOvercast 0.1;
		10 setRain 0;
		setHumidity 0;
		10 setLightnings 0;
		forceWeatherChange;
	};

	case "cloudy": { 
		10 setOvercast 0.45;
		10 setRain 0;
		setHumidity 0.2;
		10 setLightnings 0;
		forceWeatherChange;
	};

	case "rainy": { 
		10 setOvercast 0.71;	//Must be 0.7 for rain
		10 setRain 0.5;
		setHumidity 0.6;
		10 setLightnings 0.15;
		forceWeatherChange;
	};

	case "stormy": { 
		10 setOvercast 1;
		10 setRain 1;
		setHumidity 1;
		10 setLightnings 0.6;
		forceWeatherChange;
	};

	case "fogNone": { 
		10 setFog 0;
		forceWeatherChange;
	};

	case "fogLow": { 
		10 setFog 0.25;
		forceWeatherChange;
	};

	case "fogMid": { 
		10 setFog 0.55;
		forceWeatherChange;
	};

	case "fogHigh": { 
		10 setFog 0.9;
		forceWeatherChange;
	};

	default { 
		10 setOvercast 0.2;
		10 setRain 0;
		setHumidity 0;
		10 setLightnings 0;
		forceWeatherChange;
	};
};

sleep 3;
wsot_changingWeather = false;
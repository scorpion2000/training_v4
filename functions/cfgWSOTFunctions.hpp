class WSOTFunctions {
	tag = "WSOT";

	class WSOT_ServerUtils
	{
		file = "functions\server";

		class reportDamage;
	};

	class WSOT_Server_TargetPractice
	{
		file = "functions\server\targetPractice";

		class areaControllerSetup;
		class targetTriggerSetup;
		class toggleTargetPopups;
		class resetTargets;
		class areaController_practiceSetup;
		class areaController_startPractice;
		class areaController_endPractice;
		class randomTargetPopup;
		class practiceCallerHint;
		class practiceRegisterShooter;
		class registerScoreboard;
		class updateScoreBillboard;
		class controllerCountdown;
	};

	class WSOT_Server_Objective
	{
		file = "functions\server\objective";

		class objectiveInstructor;
		class objectiveTriggerSetup;
		class setObjectiveEnemyType;
		class spawnEnemyInObjective;
		class removeEnemyFromObjective;
		class registerObjectiveDisplay;
		class updateObjectiveDisplays;
		class waitForObjectiveCompletion;
		class objectiveGenerateRadar;
		class objectiveGenerateVip;
		class removeObjective;
		class activateArea;
	};

	class WSOT_Server_AtRange
	{
		file = "functions\server\atRange";

		class rangeControllerSetup;
		class rangeTriggerSetup;
		class setRangeEnemyType;
		class vehicleSelection;
		class generateVehicle;
		class displayVehicleDamage;
		class registerDamageBoards;
		class deleteVehicles;
	};

	class WSOT_Server_CreateStatics
	{
		file = "functions\server\createStatics";

		class registerStaticPlacement;
		class staticController;
	};

	class WSOT_Client_StaticsAddAceActions
	{
		file = "functions\client\createStatics";

		class staticsAddAceActions;
	};

	class WSOT_Server_CreateVehicles
	{
		file = "functions\server\createVehicles";

		class vehicleController;
		class vehicleTriggerSetup;
	};

	class WSOT_Client_VehiclesAddAceActions
	{
		file = "functions\client\createVehicles";

		class vehicleAddAceActions;
	};

	class WSOT_Server_ServerArtilleryRange
	{
		file = "functions\server\artilleryRange";

		class createArtillery;
		class artilleryController;
		class registerArtilleryPosition;
		class createTarget;
		class registerImpactZone;
		class artilleryRegisterDisplay;
		class artilleryUpdateDisplay;
	};

	class WSOT_Server_ClientArtilleryRange
	{
		file = "functions\client\artilleryRange";

		class prepareTarget;
	};

	class WSOT_Server_ServerLoadouts
	{
		file = "functions\server\loadouts";

		class registerLoadout;
		class loadoutController;
	};

	class WSOT_Server_ClientLoadouts
	{
		file = "functions\client\loadouts";

		class loadoutsAddAceActions;
	};

	class WSOT_Server_ServerCreateHelicopter
	{
		file = "functions\server\createHelicopters";

		class helicopterTriggerSetup;
		class helicopterController;
	};

	class WSOT_Server_ClientCreateHelicopter
	{
		file = "functions\client\createHelicopters";

		class helicoptersAddAceActions;
	};

	class WSOT_Server_ClientTeleportFlags
	{
		file = "functions\client\teleportFlags";

		class tpFlagcreateActions;
	};

	class WSOT_Server_ClientTeleportPoles
	{
		file = "functions\client\teleportPoles";

		class tpPoleCreateActions;
	};

	class WSOT_Server_ServerCreatePlanes
	{
		file = "functions\server\createPlanes";

		class planesRegisterSpawnPoint;
		class planesController;
	};

	class WSOT_Server_ClientCreatePlanes
	{
		file = "functions\client\createPlanes";

		class planesAddAceActions;
	};

	class WSOT_Server_TimeDial
	{
		file = "functions\server\timeDial";

		class timeDialController;
		class changeTime;
	};

	class WSOT_Server_WeatherDial
	{
		file = "functions\server\weatherDial";

		class weatherController;
		class changeWeather;
	};

	class WSOT_Client
	{
		file = "functions\client";
	};
};
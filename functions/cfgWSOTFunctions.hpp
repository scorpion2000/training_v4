class WSOTFunctions {
	tag = "WSOT";

	class WSOT_ServerUtils
	{
		file = "functions\server";

		class reportDamage;
		class handleDisconnectVehicles;
		class toggleAirPractice;
		class toggleAirPracticeController;
		class assignOwnerId;
		class scorePersistance;
		class switchAdminScreens;
		class createUAVTargets;
		class delayedRemoval;
	};

	class christmas
	{
		file = "functions\client\christmas";

		class lerp;
		class imageSpawn;
		class processImages;
		class rotateTexture;
	}

	class WSOT_ClientUtils
	{
		file = "functions\client";

		class changeArtyMarkers;
		class welcomeMessage;
		class setBullshitId;
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
		class objectiveGenerateMines;
		class objectiveRemoveMines;
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
		class fixedTargetController;
		class fixedTargetRegisterPoint;
		class fixedTargetSetParams;
		class fixedTargetRegisterVirt;
		class fixedTargetToggle;
		class fixedTargetVirtualisation;
		class movingTargetController;
		class movingTargetToggle;
		class movingTargetSetup;
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

	class WSOT_Server_ServerCreateBoats
	{
		file = "functions\server\createBoats";

		class boatTriggerSetup;
		class boatController;
	};

	class WSOT_Server_ClientCreateBoats
	{
		file = "functions\client\createBoats";

		class boatAddAceActions;
	};

	class WSOT_Server_ServerCrateRequest
	{
		file = "functions\server\crateRequest";

		class crateController;
		class crateRegisterPosition;
	};

	class WSOT_Server_ClientCreateCrate
	{
		file = "functions\client\createCrate";

		class crateAddAceActions;
	};

	class WSOT_Server_ServerCreateUavs
	{
		file = "functions\server\createUavs";

		class uavController;
		class uavTriggerSetup;
	};

	class WSOT_Server_ClientCreateUavs
	{
		file = "functions\client\createUavs";

		class uavAddAceActions;
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

	class WSOT_Server_EODRange
	{
		file = "functions\server\eodRange";

		class eodController;
		class eodTriggerSetup;
		class generateMines;
	};

	class WSOT_Server_bRange
	{
		file = "functions\server\bRangeTargets";

		class changeBRangeTargets;
		class bRangeController;
		class createVehicleTargets;
	};
};
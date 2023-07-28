class WSOTFunctions {
	tag = "WSOT";

	class WSOT_Utils
	{
		file = "functions";
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

	class WSOT_Client
	{
		file = "functions\client";
	};
};
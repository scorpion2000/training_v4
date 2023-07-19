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

	class WSOT_Client
	{
		file = "functions\client";
	};
};
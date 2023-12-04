MySimpleTask = player createSimpleTask ["simple task title"]; 
MySimpleTask setSimpleTaskDestination (position carryMissionCrate); 
MySimpleTask setSimpleTaskDescription [ 
   "Pick up the crate with a helicopter", 
   "Pick up the crate", 
   "Crate" 
]; 
MySimpleTask setTaskState "CREATED";
player setCurrentTask MySimpleTask;
//taskHint ["New task: Pick up the crate!", [1, 0, 0, 1], "taskNew"];
["TaskCreated", ["New task: Pick up the crate!", "New task: Pick up the crate!"]] call BIS_fnc_showNotification;

systemChat "Task successfully created! Check your map!";

waitUntil { ((getpos carryMissionCrate) select 2) > 5 };

MySimpleTask setTaskState "Succeeded";

MySimpleTask = player createSimpleTask ["simple task title"]; 
MySimpleTask setSimpleTaskDestination (position crateTargetPosition); 
MySimpleTask setSimpleTaskDescription [ 
   "Deliver the crate to the designated position", 
   "Deliver Crate", 
   "Deliver" 
]; 
MySimpleTask setTaskState "CREATED";
player setCurrentTask MySimpleTask;
//taskHint ["New task: Deliver the crate!", [1, 0, 0, 1], "taskNew"];
["TaskCreated", ["New task: Deliver the crate!", "New task: Deliver the crate!"]] call BIS_fnc_showNotification;

systemChat "Task successfully created! Check your map!";

waitUntil { ((getpos carryMissionCrate) select 2) < 1 };

if (carryMissionCrate distance crateTargetPosition < 100) then {
	MySimpleTask setTaskState "Succeeded";
	//taskHint ["Crate delivered!", [1, 0, 0, 1], "taskDone"];
	["TaskSucceeded", ["Crate Delivered!", "Crate Delivered!"]] call BIS_fnc_showNotification;
} else {
	MySimpleTask setTaskState "Failed";
	//taskHint ["Crate delivery failed!", [1, 0, 0, 1], "taskFailed"];
	["TaskFailed", ["Crate delivery failed!", "Crate delivery failed!"]] call BIS_fnc_showNotification;
};
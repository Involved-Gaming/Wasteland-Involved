																																																												asaerw3rw3r4 = 1; Menu_Init_Lol = 1;
//	@file Version: 1.2
//	@file Name: init.sqf
//	@file Author: [404] Deadbeat, [GoT] JoSchaap, + Involved
//	@file Description: The main init.

#define DEBUG false

enableSaving [false, false];

currMissionDir = compileFinal str call
{
	private "_arr";
	_arr = toArray str missionConfigFile;
	_arr resize (count _arr - 15);
	toString _arr
};

X_Server = false;
X_Client = false;
X_JIP = false;

// versionName = ""; // Set in STR_WL_WelcomeToWasteland in stringtable.xml

if (isServer) then { X_Server = true };
if (!isDedicated) then { X_Client = true };
if (isNull player) then { X_JIP = true };

[DEBUG] call compile preprocessFileLineNumbers "globalCompile.sqf";

//init Wasteland Core
[] execVM "config.sqf";
[] execVM "storeConfig.sqf"; // Separated as its now v large
[] execVM "briefing.sqf";
[] execVM "monitor\info.sqf"; //Ajout involved-Gaming (fps viewer)

if (!isDedicated) then
{
	[] spawn
	{
		9999 cutText ["Bienvenue sur Wasteland Involved. Patientez Merci", "BLACK", 0.01];

		waitUntil {!isNull player};
		removeAllWeapons player;
		client_initEH = player addEventHandler ["Respawn", { removeAllWeapons (_this select 0) }];

		// Reset group & side
		[player] joinSilent createGroup playerSide;

		[] execVM "client\init.sqf";
	};
};

if (isServer) then
{
	diag_log format ["############################# %1 #############################", missionName];
	diag_log "WASTELAND INVOLVED SERVEUR - Initializing Serveur";
	[] execVM "server\init.sqf"; 
};

//init 3rd Party Scripts
[] execVM "addons\R3F_ARTY_AND_LOG\init.sqf";
[] execVM "addons\proving_Ground\init.sqf";
[] execVM "addons\scripts\DynamicWeatherEffects.sqf";
[] execVM "addons\JumpMF\init.sqf";

/*
	Involved part
*/

//Far revive
diag_log "FAR REVIVE Initializing !";
call compileFinal preprocessFileLineNumbers "FAR_revive\FAR_revive_init.sqf";
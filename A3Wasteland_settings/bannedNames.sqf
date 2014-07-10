//	@file Version: 1.0
//	@file Name: bannedNames.sqf
//	@file Author: AgentRev
//	@file Created: 29/06/2013 12:21

// Players joining with these names will be warned, without further action

bannedPlayerNames = compileFinal str
[
	"Admin",
	"Administrator",
	"Owner",
	"Server",
	"Server Admin",
	"Server Administrator",
	"Server Owner",
	
	// publicVariableVal BE filters
	"createMine",
	"createUnit",
	"createVehicle",
	"BIS_fnc_3Dcredits",
	"BIS_fnc_AAN",
	"vChecksum",
	"vehicleChecksum"
];

publicVariable "bannedPlayerNames";

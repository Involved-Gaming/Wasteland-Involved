//	@file Version: 1.0
//	@file Name: manageUnit.sqf
//	@file Author: AgentRev
//	@file Created: 04/07/2013 20:46

private ["_unit", "_keyArray", "_packetKey", "_assignPacketKey", "_checksum", "_assignChecksum"];

_unit = _this select 0;
_keyArray = _this select 1;

_packetKey = _keyArray select 0;
_assignPacketKey = _keyArray select 1;
_checksum = _keyArray select 2;
_assignChecksum = _keyArray select 3;

if (isServer) then
{
	_unit allowDamage false;
	_unit disableAI "MOVE";
	_unit disableAI "FSM";

	removeAllWeapons _unit;
	removeBackpack _unit;
	removeVest _unit;
	removeUniform _unit;
	removeGoggles _unit;
	
	_unit addVest "V_RebreatherB";
	_unit addUniform "U_B_Wetsuit";
	_unit addGoggles "G_Diving";
	_unit setPosATL [1,1,1];
	_unit switchMove "";
		
	_this spawn
	{
		private ["_unit", "_grp"];
		_unit = _this select 0;
		_grp = group _unit;
		
		while {alive _unit} do { sleep 1 };
		
		deleteVehicle _unit;
		deleteGroup _grp;
		
		(_this select 1) execVM (externalCodeFolder+"server\antihack\createUnit.sqf");
	};
}
else
{
	_unit enableSimulation false;
};

if (isNil _checksum) then
{
	if (isNil "fn_findString") then { fn_findString = compileFinal preprocessFileLineNumbers "common\functions\fn_findString.sqf" };
	if (isNil "fn_filterString") then { fn_filterString = compileFinal preprocessFileLineNumbers "common\functions\fn_filterString.sqf" };
	
	TPG_fnc_MPexec = compileFinal (_assignPacketKey + (preprocessFileLineNumbers "common\functions\network\fn_MPexec.sqf"));
	TPG_fnc_MP = compileFinal (_assignPacketKey + (preprocessFileLineNumbers "common\functions\network\fn_MP.sqf"));
	call compile (_assignPacketKey + (preprocessFileLineNumbers "common\functions\network\fn_initMultiplayer.sqf"));
	
	if (isServer) then
	{
		flagHandler = compileFinal (_assignChecksum + (preprocessFileLineNumbers (externalCodeFolder+"server\antihack\flagHandler.sqf")));
		[] spawn compile (_assignChecksum + (preprocessFileLineNumbers (externalCodeFolder+"server\antihack\serverSide.sqf")));
	};
	
	if (!isDedicated) then	
	{
		clientFlagHandler = compileFinal (_assignChecksum + (preprocessFileLineNumbers "common\antihack\clientFlagHandler.sqf"));
		chatBroadcast = compileFinal (_assignChecksum + (preprocessFileLineNumbers "common\antihack\chatBroadcast.sqf"));
		//notifyAdminMenu = compileFinal (_assignChecksum + (preprocessFileLineNumbers "common\antihack\notifyAdminMenu.sqf"));
		[] spawn compile (_assignChecksum + (preprocessFileLineNumbers "common\antihack\payload.sqf"));
	};
	
	call compile format ["%1 = compileFinal 'true'", _checksum];
};

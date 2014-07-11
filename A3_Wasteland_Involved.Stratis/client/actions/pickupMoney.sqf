//	@file Version: 1.1
//	@file Name: pickupMoney.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Date modified: 07/12/2012 05:19
//	@file Args:

#define PICK_DISTANCE 5

// Check if mutex lock is active.
if (mutexScriptInProgress) exitWith
{
	player globalChat "Vous faites déjà quelque chose d'autre.";
};

if (vehicle player != player) exitWith
{
	titleText ["Vous ne pouvez pas prendre d'argent quand vous êtes dans un véhicule ", "PLAIN DOWN", 0.5];
};

mutexScriptInProgress = true;

private ["_moneyObjects", "_moneyObj", "_money"];

_moneyObjects = nearestObjects [player, ["Land_Money_F"], PICK_DISTANCE];

if (count _moneyObjects > 0) then
{
	_moneyObj = _moneyObjects select 0;
};

if (isNil "_moneyObj" || {player distance _moneyObj > PICK_DISTANCE}) exitWith
{
	titleText ["Vous êtes trop loin pour prendre de l'argent", "PLAIN DOWN", 0.5];
	mutexScriptInProgress = false;
};

player playMove ([player, "AmovMstpDnon_AinvMstpDnon", "putdown"] call getFullMove);
sleep 0.5;

if (!isNull _moneyObj) then
{
	_money = _moneyObj getVariable ["cmoney", 0];
	deleteVehicle _moneyObj;
	if (_money < 0) then { _money = 0 };
	player setVariable ["cmoney", (player getVariable ["cmoney", 0]) + _money, true];

	if (_money > 0) then
	{
		titleText [format ["Vous avez récupéré $%1", _money], "PLAIN DOWN", 0.5];
	}
	else
	{
		titleText ["The money was counterfeit!", "PLAIN DOWN", 0.5];
	};
};

sleep 0.5;
mutexScriptInProgress = false;

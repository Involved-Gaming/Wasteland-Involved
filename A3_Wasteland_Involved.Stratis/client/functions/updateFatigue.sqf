//	@file Version: 1.0
//	@file Name: updateFatigue.sqf
//	@file Author: S.Lambert
//	@file Created: 03/08/2014 16h12

//hint "init Fatigue system";
sleep 6;
//hint "Beginning loop fatigue system";
while{ alive player} do
{
	private ["_fatigue" , "_coef"];

	_coef = 0.5;
	_fatigue = getFatigue player;

	if (_fatigue > 0.0) then {
	// hint "Reducing fatigue";
		if (_fatigue > 0.7)
		{
			player setFatigue (0.7);
		}
		else
		{
			player setFatigue (_fatigue - 0.01 * _coef);
		};

	}
	else
	{
		 //hint "no fatigue detected";
	};

	sleep 1;
	//disable all the fatigue of the player
	//player enableFatigue false;
};
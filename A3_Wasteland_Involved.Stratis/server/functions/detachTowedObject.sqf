//	@file Version: 1.0
//	@file Name: detachTowedObject.sqf
//	@file Author: AgentRev
//	@file Created: 014/07/2013 14:54

private ["_object", "_tower", "_airdrop", "_pos", "_altitude", "_vel"];

if (typeName _this != "OBJECT") exitWith {};

_object = _this;

if (!isNull _object && {local _object}) then
{
	_tower = attachedTo _object;
	_airdrop = [_this, 1, false, [false]] call BIS_fnc_param;

	_object enableSimulation true; // FPS fix safeguard
	_tower enableSimulation true;

	if (_airdrop || ((getPos _object) select 2) > 30) then		//Si airdrop définit pour position de l'objet trop haute
	{
		_vel = velocity _object;
		detach _object;
		_object setVelocity _vel;
		sleep 1;
		_chute = createVehicle ["B_Parachute_02_F", _object modelToWorld [0,0,0], [], 0, "FLY"];
		sleep 0.1;
		_chute attachTo [_object,[0,0,0]];
		sleep 0.1;
		detach _chute;
		sleep 0.1;
		_object attachTo [_chute,[0,0,0]];

		_smoke        = "SmokeshellBlue" createVehicle position _object;
		_smoke attachto [_object,[0,0,0]];
		_chem         = "Chemlight_blue" createVehicle position _object;
		_chem attachto [_object,[0,0,0]];


		_heigh = 0;
		while {((getPosATL _chute) select 2) > 8} do {
			sleep 1;
			_heigh = (getPosATL _chute) select 2;
		};
		detach _object;

		/*
		_heigh = 0;
		while {((getPosATL _chute) select 2) > 8} do {
			sleep 1;
			_heigh = (getPosATL _chute) select 2;
		};
		detach _dropped;
		*/
	}
	else
	{
		_pos = getPos _object;
		_altitude = (getPosATL _object) select 2;
		detach _object;
		if (_tower isKindOf "Helicopter") then { _object setVectorUp [0,0,1] };
		_object setPosATL [_pos select 0, _pos select 1, (_altitude - (_pos select 2)) + 0.01];
		_object setVelocity [0,0,0.01];
	};

	_object lockDriver false;
	_object enableCopilot true;
};

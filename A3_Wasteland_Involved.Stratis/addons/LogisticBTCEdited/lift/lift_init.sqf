waitUntil {!isNull player};
waitUntil {player == player};

_cond = true;
if ((count BTC_lift_pilot) > 0) then
{
	if ((BTC_lift_pilot find (typeof player)) == - 1) exitWith {hint "Hélitreuillage indisponible";_cond = false;};
};
	if !(_cond) exitWith
	{
		hint "Hélitreuillage indisponible";
		Sleep 2;
		hint "";
	};

BTC_cargo = ObjNull;

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

BTC_lift_check =
{
	private ["_rel_pos"];
	if (!(vehicle player isKindOf "Helicopter") || BTC_lifted == 1) exitWith {false};
	_array = [vehicle player] call BTC_get_liftable_array;
	_chopper  = vehicle player;
	_can_lift = false;
	_cargo_array = nearestObjects [_chopper, _array, 50];

	if (count _cargo_array > 0) then
	{
		if (driver (_cargo_array select 0) == player) then
		{
			_cargo_array set [0,0];_cargo_array = _cargo_array - [0];
		};
	};

	if (count _cargo_array > 0) then
	{
		BTC_cargo = _cargo_array select 0;
	}
	else
	{
		BTC_cargo = objNull;_can_lift = false;
	};

	if ( ({BTC_cargo isKindOf _x} count _array) > 0 AND speed BTC_cargo < 2) then
	{
		_can_lift = true;
	}
	else
	{
		_can_lift = false;
	};

	if (_can_lift AND ((BTC_cargo isKindOf "Air" AND getdammage BTC_cargo != 1) || (format ["%1", BTC_cargo getVariable "BTC_cannot_lift"] == "1")) ) then
	{
		_can_lift = false;
	};

	if (!isNull BTC_cargo AND _can_lift) then
	{
		_cargo_pos = getPosATL BTC_cargo;
		_rel_pos   = _chopper worldToModel _cargo_pos;
		BTC_cargo_x   = _rel_pos select 0;
		BTC_cargo_y   = _rel_pos select 1;
		BTC_cargo_z   = _rel_pos select 2;//hintSilent format ["%1 - %2 - %3",BTC_cargo_x,BTC_cargo_y,BTC_cargo_z];
	};

	if (((abs BTC_cargo_z) < BTC_lift_max_h) AND ((abs BTC_cargo_z) > BTC_lift_min_h) AND ((abs BTC_cargo_x) < BTC_lift_radius) AND ((abs BTC_cargo_y) < BTC_lift_radius)) then
	{
		_can_lift = true;
	}
	else
	{
		_can_lift = false;
	};
	_can_lift
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

BTC_attach_cargo =
{
	private ["_cargo"];
	_chopper = vehicle player;
	_array = [vehicle player] call BTC_get_liftable_array;
	_cargo_array = nearestObjects [_chopper, _array, 50];

	if (count _cargo_array > 0 AND driver (_cargo_array select 0) == player) then
	{
		_cargo_array set [0,0];_cargo_array = _cargo_array - [0];
	};

	if (count _cargo_array > 0) then
	{
		_cargo = _cargo_array select 0;
	}
	else
	{
		_cargo = objNull;
	};

	if (isNull _cargo) exitWith {};

	BTC_lifted    = 1;
	_cargo_pos    = getPosATL _cargo;
	_rel_pos      = _chopper worldToModel _cargo_pos;
	_height       = (_rel_pos select 2) + 2.5;
	_cargo attachTo [_chopper, [0,0,_height]];
	_name_cargo  = getText (configFile >> "cfgVehicles" >> typeof _cargo >> "displayName");
	_chopper vehicleChat format ["%1 hélitreuillé(e).", _name_cargo];
	BTC_cargo_lifted = _cargo;
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

BTC_detach_cargo =
{
	detach BTC_cargo_lifted;
	_name_cargo  = getText (configFile >> "cfgVehicles" >> typeof BTC_cargo_lifted >> "displayName");
	vehicle player vehicleChat format ["%1 lâché(e).", _name_cargo];
	_veh=vehicle player;
	_obj=BTC_cargo_lifted;
	_height = getPos (vehicle player) select 2;
	switch (true) do
		{
			case (_height >= 20):
			{
				//hint "choix du paradrop";
				_obj_para = [_veh,_obj,"B_Parachute_02_F"] spawn BTC_l_paradrop;
			};
			case ((_height < 20) && (_height >= 2)):
			{
				//hint "choix de la chute";
				if (BTC_cargo_lifted isKindOf "Strategic") then
				{
					_obj_fall = [BTC_cargo_lifted] spawn BTC_l_Obj_Fall;
				}
				else
				{
					_vel = velocity (vehicle player);
					BTC_cargo_lifted setVelocity _vel;
				};
			};
			case (_height < 2):
			{
				//hint "Lacher simple";
				_obj setpos (_veh modelToWorld [-3,0,0]);
			};
		};


	BTC_cargo_lifted = ObjNull;
	BTC_lifted = 0;
};

[] spawn
{
	player addAction [("<t color=""#dfb300"">" + ("Hélitreuiller") + "</t>"),BTC_dir_action, [[],BTC_attach_cargo], 9, true, false, "", "[] call BTC_lift_check"];
	player addAction [("<t color=""#dfb300"">" + ("Lâcher") + "</t>"),BTC_dir_action, [[],BTC_detach_cargo], -9, true, false, "", "BTC_lifted == 1"];
	player addEventHandler ["Respawn",
	{
		[] spawn
		{
			WaitUntil {sleep 1; Alive player};
			BTC_l_pip_cond = false;
			BTC_cargo    = ObjNull;
			BTC_Hud_Cond = false;
			BTC_lifted   = 0;
			player addAction [("<t color=""#dfb300"">" + ("Hélitreuiller") + "</t>"),BTC_dir_action, [[],BTC_attach_cargo], 9, true, false, "", "[] call BTC_lift_check"];
			player addAction [("<t color=""#dfb300"">" + ("Lâcher") + "</t>"),BTC_dir_action, [[],BTC_detach_cargo], -9, true, false, "", "BTC_lifted == 1"];
		};
	}];
};
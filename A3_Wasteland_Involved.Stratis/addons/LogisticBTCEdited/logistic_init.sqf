if (isServer) then
{
	BTC_id_repo = 10;
	publicVariable "BTC_id_repo";
	BTC_cargo_repo = "Land_HBarrierBig_F" createVehicle [- 5000,- 5000,0];
	publicVariable "BTC_cargo_repo";
};

if (isDedicated) exitwith {};
BTC_active_lift      = 0;
BTC_active_fast_rope = 1;
BTC_active_cargo     = 0;

BTC_dir_action = "addons\LogisticBTCEdited\addAction.sqf";
BTC_l_placement_area = 20;

if (BTC_active_fast_rope == 1) then
{
	/////////////////// FAST ROPING
	BTC_fast_rope_h = 35;
	BTC_fast_rope_h_min = 5;
	BTC_roping_chopper =
	[
		"B_Heli_Light_01_F",
		"B_Heli_Transport_01_F",
		"B_Heli_Transport_01_camo_F",
		"O_Heli_Light_02_F",
		"O_Heli_Light_02_unarmed_F",
		"O_Heli_Attack_02_F",
		"O_Heli_Attack_02_black_F",
		"I_Heli_Transport_02_F"

	];
	_rope = [] execVM "addons\LogisticBTCEdited\fast_roping\fast_roping_init.sqf";
};
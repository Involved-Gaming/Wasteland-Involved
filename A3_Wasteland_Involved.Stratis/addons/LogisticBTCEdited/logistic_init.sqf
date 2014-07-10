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

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

BTC_dir_action = "COMFA\Logistic\addAction.sqf";
BTC_l_placement_area = 20;
if (BTC_active_lift == 1) then
{
	//LIFT
	BTC_lift_pilot    = [];
	BTC_lift          = 1;
	BTC_lifted        = 0;
	BTC_lift_min_h    = 7;
	BTC_lift_max_h    = 12;
	BTC_lift_radius   = 6;
	BTC_def_hud       = 1;
	BTC_def_pip       = 1;
	BTC_l_def_veh_pip =
	[
		"B_Heli_Transport_01_F",
		"B_Heli_Transport_01_camo_F",
		"B_Heli_Light_01_F",
		"B_Heli_Light_01_armed_F",
		"O_Heli_Light_02_F",
		"O_Heli_Light_02_unarmed_F",
		"O_Heli_Attack_02_F",
		"O_Heli_Attack_02_black_F"
	];
	BTC_l_pip_cond    = false;
	BTC_cargo_lifted  = objNull;
	_lift = [] execVM "COMFA\Logistic\lift\lift_init.sqf";
	BTC_get_liftable_array =
	{
		_chopper = _this select 0;
		_array   = [];
		switch (typeOf _chopper) do
		{
			case "B_Heli_Light_01_F" : {_array =
				[
					"B_supplyCrate_F"
				];
			};
			case "B_Heli_Light_01_armed_F" : {_array =
				[
					"B_supplyCrate_F"
				];
			};
			case "B_Heli_Transport_01_F" : {_array =
				[
					"B_supplyCrate_F",
			// VEHICULES BLUFOR
					"B_APC_Wheeled_01_cannon_F",
					"B_APC_Tracked_01_AA_F",
					"B_APC_Tracked_01_rcws_F",
					"B_MBT_01_cannon_F",
					"B_MBT_01_arty_F",
					"B_MBT_01_mlrs_F",
					"B_G_Van_01_transport_F",
					"B_Truck_01_mover_F",
					"B_Truck_01_box_F",
					"B_Truck_01_transport_F",
					"B_Truck_01_covered_F",
					"B_MRAP_01_F",
					"B_MRAP_01_gmg_F",
					"B_MRAP_01_hmg_F",
					"B_G_Quadbike_01_F",
					"B_Quadbike_01_F",
					"B_G_Offroad_01_F",
					"B_G_Offroad_01_armed_F",
					"B_UGV_01_F",
					"B_UGV_01_rcws_F",
					"B_UGV_01_rcws_F",
					"B_G_Boat_Transport_01_F",
					"B_Boat_Transport_01_F",
					"B_Lifeboat",
					"B_Boat_Armed_01_minigun_F",
					"B_G_Van_01_fuel_F",
					"B_APC_Tracked_01_CRV_F",
					"B_Truck_01_fuel_F",
					"B_Truck_01_medical_F",
					"B_Truck_01_ammo_F",
					"B_Truck_01_Repair_F",
			// VEHICULES OPFOR
					"O_MBT_02_arty_F",
					"O_APC_Tracked_02_cannon_F",
					"O_APC_Wheeled_02_rcws_F",
					"O_MBT_02_cannon_F",
					"O_APC_Tracked_02_AA_F",
					"O_MRAP_02_F",
					"O_MRAP_02_gmg_F",
					"O_MRAP_02_hmg_F",
					"O_Quadbike_01_F",
					"O_Truck_02_transport_F",
					"O_Truck_02_covered_F",
					"O_UGV_01_F",
					"O_UGV_01_rcws_F",
					"O_Boat_Transport_01_F",
					"O_Lifeboat",
					"O_Boat_Armed_01_hmg_F",
					"O_Truck_02_fuel_F",
					"O_Truck_02_box_F",
					"O_Truck_02_medical_F",
					"O_Truck_02_Ammo_F",
			// VEHICULES INDFOR
					"I_APC_Wheeled_03_cannon_F",
					"I_Quadbike_01_F",
					"I_MRAP_03_F",
					"I_MRAP_03_gmg_F",
					"I_MRAP_03_hmg_F",
					"I_Truck_02_transport_F",
					"I_Truck_02_covered_F",
					"I_UGV_01_F",
					"I_UGV_01_rcws_F",
					"I_Boat_Transport_01_F",
					"I_Boat_Armed_01_minigun_F",
					"I_Truck_02_fuel_F",
					"I_Truck_02_box_F",
					"I_Truck_02_medical_F",
					"I_Truck_02_ammo_F",
			// VEHICULES CIVILS
					"C_Van_01_transport_F",
					"C_Van_01_box_F",
					"C_Quadbike_01_F",
					"C_SUV_01_F",
					"C_Offroad_01_F",
					"C_Hatchback_01_F",
					"C_Hatchback_01_sport_F",
					"C_Boat_Civil_01_F",
					"C_Boat_Civil_01_police_F",
					"C_Boat_Civil_01_rescue_F",
					"C_Rubberboat",
					"C_Van_01_fuel_F"
				];
			};

			case "B_Heli_Transport_01_camo_F" : {_array =
				[
					"B_supplyCrate_F",
			// VEHICULES BLUFOR
					"B_APC_Wheeled_01_cannon_F",
					"B_APC_Tracked_01_AA_F",
					"B_APC_Tracked_01_rcws_F",
					"B_MBT_01_cannon_F",
					"B_MBT_01_arty_F",
					"B_MBT_01_mlrs_F",
					"B_G_Van_01_transport_F",
					"B_Truck_01_mover_F",
					"B_Truck_01_box_F",
					"B_Truck_01_transport_F",
					"B_Truck_01_covered_F",
					"B_MRAP_01_F",
					"B_MRAP_01_gmg_F",
					"B_MRAP_01_hmg_F",
					"B_G_Quadbike_01_F",
					"B_Quadbike_01_F",
					"B_G_Offroad_01_F",
					"B_G_Offroad_01_armed_F",
					"B_UGV_01_F",
					"B_UGV_01_rcws_F",
					"B_UGV_01_rcws_F",
					"B_G_Boat_Transport_01_F",
					"B_Boat_Transport_01_F",
					"B_Lifeboat",
					"B_Boat_Armed_01_minigun_F",
					"B_G_Van_01_fuel_F",
					"B_APC_Tracked_01_CRV_F",
					"B_Truck_01_fuel_F",
					"B_Truck_01_medical_F",
					"B_Truck_01_ammo_F",
					"B_Truck_01_Repair_F",
			// VEHICULES OPFOR
					"O_MBT_02_arty_F",
					"O_APC_Tracked_02_cannon_F",
					"O_APC_Wheeled_02_rcws_F",
					"O_MBT_02_cannon_F",
					"O_APC_Tracked_02_AA_F",
					"O_MRAP_02_F",
					"O_MRAP_02_gmg_F",
					"O_MRAP_02_hmg_F",
					"O_Quadbike_01_F",
					"O_Truck_02_transport_F",
					"O_Truck_02_covered_F",
					"O_UGV_01_F",
					"O_UGV_01_rcws_F",
					"O_Boat_Transport_01_F",
					"O_Lifeboat",
					"O_Boat_Armed_01_hmg_F",
					"O_Truck_02_fuel_F",
					"O_Truck_02_box_F",
					"O_Truck_02_medical_F",
					"O_Truck_02_Ammo_F",
			// VEHICULES INDFOR
					"I_APC_Wheeled_03_cannon_F",
					"I_Quadbike_01_F",
					"I_MRAP_03_F",
					"I_MRAP_03_gmg_F",
					"I_MRAP_03_hmg_F",
					"I_Truck_02_transport_F",
					"I_Truck_02_covered_F",
					"I_UGV_01_F",
					"I_UGV_01_rcws_F",
					"I_Boat_Transport_01_F",
					"I_Boat_Armed_01_minigun_F",
					"I_Truck_02_fuel_F",
					"I_Truck_02_box_F",
					"I_Truck_02_medical_F",
					"I_Truck_02_ammo_F",
			// VEHICULES CIVILS
					"C_Van_01_transport_F",
					"C_Van_01_box_F",
					"C_Quadbike_01_F",
					"C_SUV_01_F",
					"C_Offroad_01_F",
					"C_Hatchback_01_F",
					"C_Hatchback_01_sport_F",
					"C_Boat_Civil_01_F",
					"C_Boat_Civil_01_police_F",
					"C_Boat_Civil_01_rescue_F",
					"C_Rubberboat",
					"C_Van_01_fuel_F"
				];
			};

			case "O_Heli_Light_02_F" : {_array =
				[
					"B_supplyCrate_F",
			// VEHICULES BLUFOR
					"B_APC_Wheeled_01_cannon_F",
					"B_APC_Tracked_01_AA_F",
					"B_APC_Tracked_01_rcws_F",
					"B_MBT_01_cannon_F",
					"B_MBT_01_arty_F",
					"B_MBT_01_mlrs_F",
					"B_G_Van_01_transport_F",
					"B_Truck_01_mover_F",
					"B_Truck_01_box_F",
					"B_Truck_01_transport_F",
					"B_Truck_01_covered_F",
					"B_MRAP_01_F",
					"B_MRAP_01_gmg_F",
					"B_MRAP_01_hmg_F",
					"B_G_Quadbike_01_F",
					"B_Quadbike_01_F",
					"B_G_Offroad_01_F",
					"B_G_Offroad_01_armed_F",
					"B_UGV_01_F",
					"B_UGV_01_rcws_F",
					"B_UGV_01_rcws_F",
					"B_G_Boat_Transport_01_F",
					"B_Boat_Transport_01_F",
					"B_Lifeboat",
					"B_Boat_Armed_01_minigun_F",
					"B_G_Van_01_fuel_F",
					"B_APC_Tracked_01_CRV_F",
					"B_Truck_01_fuel_F",
					"B_Truck_01_medical_F",
					"B_Truck_01_ammo_F",
					"B_Truck_01_Repair_F",
			// VEHICULES OPFOR
					"O_MBT_02_arty_F",
					"O_APC_Tracked_02_cannon_F",
					"O_APC_Wheeled_02_rcws_F",
					"O_MBT_02_cannon_F",
					"O_APC_Tracked_02_AA_F",
					"O_MRAP_02_F",
					"O_MRAP_02_gmg_F",
					"O_MRAP_02_hmg_F",
					"O_Quadbike_01_F",
					"O_Truck_02_transport_F",
					"O_Truck_02_covered_F",
					"O_UGV_01_F",
					"O_UGV_01_rcws_F",
					"O_Boat_Transport_01_F",
					"O_Lifeboat",
					"O_Boat_Armed_01_hmg_F",
					"O_Truck_02_fuel_F",
					"O_Truck_02_box_F",
					"O_Truck_02_medical_F",
					"O_Truck_02_Ammo_F",
			// VEHICULES INDFOR
					"I_APC_Wheeled_03_cannon_F",
					"I_Quadbike_01_F",
					"I_MRAP_03_F",
					"I_MRAP_03_gmg_F",
					"I_MRAP_03_hmg_F",
					"I_Truck_02_transport_F",
					"I_Truck_02_covered_F",
					"I_UGV_01_F",
					"I_UGV_01_rcws_F",
					"I_Boat_Transport_01_F",
					"I_Boat_Armed_01_minigun_F",
					"I_Truck_02_fuel_F",
					"I_Truck_02_box_F",
					"I_Truck_02_medical_F",
					"I_Truck_02_ammo_F",
			// VEHICULES CIVILS
					"C_Van_01_transport_F",
					"C_Van_01_box_F",
					"C_Quadbike_01_F",
					"C_SUV_01_F",
					"C_Offroad_01_F",
					"C_Hatchback_01_F",
					"C_Hatchback_01_sport_F",
					"C_Boat_Civil_01_F",
					"C_Boat_Civil_01_police_F",
					"C_Boat_Civil_01_rescue_F",
					"C_Rubberboat",
					"C_Van_01_fuel_F"
				];
			};

			case "O_Heli_Light_02_unarmed_F" : {_array =
				[
					"B_supplyCrate_F",
			// VEHICULES BLUFOR
					"B_APC_Wheeled_01_cannon_F",
					"B_APC_Tracked_01_AA_F",
					"B_APC_Tracked_01_rcws_F",
					"B_MBT_01_cannon_F",
					"B_MBT_01_arty_F",
					"B_MBT_01_mlrs_F",
					"B_G_Van_01_transport_F",
					"B_Truck_01_mover_F",
					"B_Truck_01_box_F",
					"B_Truck_01_transport_F",
					"B_Truck_01_covered_F",
					"B_MRAP_01_F",
					"B_MRAP_01_gmg_F",
					"B_MRAP_01_hmg_F",
					"B_G_Quadbike_01_F",
					"B_Quadbike_01_F",
					"B_G_Offroad_01_F",
					"B_G_Offroad_01_armed_F",
					"B_UGV_01_F",
					"B_UGV_01_rcws_F",
					"B_UGV_01_rcws_F",
					"B_G_Boat_Transport_01_F",
					"B_Boat_Transport_01_F",
					"B_Lifeboat",
					"B_Boat_Armed_01_minigun_F",
					"B_G_Van_01_fuel_F",
					"B_APC_Tracked_01_CRV_F",
					"B_Truck_01_fuel_F",
					"B_Truck_01_medical_F",
					"B_Truck_01_ammo_F",
					"B_Truck_01_Repair_F",
			// VEHICULES OPFOR
					"O_MBT_02_arty_F",
					"O_APC_Tracked_02_cannon_F",
					"O_APC_Wheeled_02_rcws_F",
					"O_MBT_02_cannon_F",
					"O_APC_Tracked_02_AA_F",
					"O_MRAP_02_F",
					"O_MRAP_02_gmg_F",
					"O_MRAP_02_hmg_F",
					"O_Quadbike_01_F",
					"O_Truck_02_transport_F",
					"O_Truck_02_covered_F",
					"O_UGV_01_F",
					"O_UGV_01_rcws_F",
					"O_Boat_Transport_01_F",
					"O_Lifeboat",
					"O_Boat_Armed_01_hmg_F",
					"O_Truck_02_fuel_F",
					"O_Truck_02_box_F",
					"O_Truck_02_medical_F",
					"O_Truck_02_Ammo_F",
			// VEHICULES INDFOR
					"I_APC_Wheeled_03_cannon_F",
					"I_Quadbike_01_F",
					"I_MRAP_03_F",
					"I_MRAP_03_gmg_F",
					"I_MRAP_03_hmg_F",
					"I_Truck_02_transport_F",
					"I_Truck_02_covered_F",
					"I_UGV_01_F",
					"I_UGV_01_rcws_F",
					"I_Boat_Transport_01_F",
					"I_Boat_Armed_01_minigun_F",
					"I_Truck_02_fuel_F",
					"I_Truck_02_box_F",
					"I_Truck_02_medical_F",
					"I_Truck_02_ammo_F",
			// VEHICULES CIVILS
					"C_Van_01_transport_F",
					"C_Van_01_box_F",
					"C_Quadbike_01_F",
					"C_SUV_01_F",
					"C_Offroad_01_F",
					"C_Hatchback_01_F",
					"C_Hatchback_01_sport_F",
					"C_Boat_Civil_01_F",
					"C_Boat_Civil_01_police_F",
					"C_Boat_Civil_01_rescue_F",
					"C_Rubberboat",
					"C_Van_01_fuel_F"
				];
			};

			case "O_Heli_Attack_02_F" : {_array =
				[
					"B_supplyCrate_F",
			// VEHICULES BLUFOR
					"B_APC_Wheeled_01_cannon_F",
					"B_APC_Tracked_01_AA_F",
					"B_APC_Tracked_01_rcws_F",
					"B_MBT_01_cannon_F",
					"B_MBT_01_arty_F",
					"B_MBT_01_mlrs_F",
					"B_G_Van_01_transport_F",
					"B_Truck_01_mover_F",
					"B_Truck_01_box_F",
					"B_Truck_01_transport_F",
					"B_Truck_01_covered_F",
					"B_MRAP_01_F",
					"B_MRAP_01_gmg_F",
					"B_MRAP_01_hmg_F",
					"B_G_Quadbike_01_F",
					"B_Quadbike_01_F",
					"B_G_Offroad_01_F",
					"B_G_Offroad_01_armed_F",
					"B_UGV_01_F",
					"B_UGV_01_rcws_F",
					"B_UGV_01_rcws_F",
					"B_G_Boat_Transport_01_F",
					"B_Boat_Transport_01_F",
					"B_Lifeboat",
					"B_Boat_Armed_01_minigun_F",
					"B_G_Van_01_fuel_F",
					"B_APC_Tracked_01_CRV_F",
					"B_Truck_01_fuel_F",
					"B_Truck_01_medical_F",
					"B_Truck_01_ammo_F",
					"B_Truck_01_Repair_F",
			// VEHICULES OPFOR
					"O_MBT_02_arty_F",
					"O_APC_Tracked_02_cannon_F",
					"O_APC_Wheeled_02_rcws_F",
					"O_MBT_02_cannon_F",
					"O_APC_Tracked_02_AA_F",
					"O_MRAP_02_F",
					"O_MRAP_02_gmg_F",
					"O_MRAP_02_hmg_F",
					"O_Quadbike_01_F",
					"O_Truck_02_transport_F",
					"O_Truck_02_covered_F",
					"O_UGV_01_F",
					"O_UGV_01_rcws_F",
					"O_Boat_Transport_01_F",
					"O_Lifeboat",
					"O_Boat_Armed_01_hmg_F",
					"O_Truck_02_fuel_F",
					"O_Truck_02_box_F",
					"O_Truck_02_medical_F",
					"O_Truck_02_Ammo_F",
			// VEHICULES INDFOR
					"I_APC_Wheeled_03_cannon_F",
					"I_Quadbike_01_F",
					"I_MRAP_03_F",
					"I_MRAP_03_gmg_F",
					"I_MRAP_03_hmg_F",
					"I_Truck_02_transport_F",
					"I_Truck_02_covered_F",
					"I_UGV_01_F",
					"I_UGV_01_rcws_F",
					"I_Boat_Transport_01_F",
					"I_Boat_Armed_01_minigun_F",
					"I_Truck_02_fuel_F",
					"I_Truck_02_box_F",
					"I_Truck_02_medical_F",
					"I_Truck_02_ammo_F",
			// VEHICULES CIVILS
					"C_Van_01_transport_F",
					"C_Van_01_box_F",
					"C_Quadbike_01_F",
					"C_SUV_01_F",
					"C_Offroad_01_F",
					"C_Hatchback_01_F",
					"C_Hatchback_01_sport_F",
					"C_Boat_Civil_01_F",
					"C_Boat_Civil_01_police_F",
					"C_Boat_Civil_01_rescue_F",
					"C_Rubberboat",
					"C_Van_01_fuel_F"
				];
			};

			case "O_Heli_Attack_02_black_F" : {_array =
				[
					"B_supplyCrate_F",
			// VEHICULES BLUFOR
					"B_APC_Wheeled_01_cannon_F",
					"B_APC_Tracked_01_AA_F",
					"B_APC_Tracked_01_rcws_F",
					"B_MBT_01_cannon_F",
					"B_MBT_01_arty_F",
					"B_MBT_01_mlrs_F",
					"B_G_Van_01_transport_F",
					"B_Truck_01_mover_F",
					"B_Truck_01_box_F",
					"B_Truck_01_transport_F",
					"B_Truck_01_covered_F",
					"B_MRAP_01_F",
					"B_MRAP_01_gmg_F",
					"B_MRAP_01_hmg_F",
					"B_G_Quadbike_01_F",
					"B_Quadbike_01_F",
					"B_G_Offroad_01_F",
					"B_G_Offroad_01_armed_F",
					"B_UGV_01_F",
					"B_UGV_01_rcws_F",
					"B_UGV_01_rcws_F",
					"B_G_Boat_Transport_01_F",
					"B_Boat_Transport_01_F",
					"B_Lifeboat",
					"B_Boat_Armed_01_minigun_F",
					"B_G_Van_01_fuel_F",
					"B_APC_Tracked_01_CRV_F",
					"B_Truck_01_fuel_F",
					"B_Truck_01_medical_F",
					"B_Truck_01_ammo_F",
					"B_Truck_01_Repair_F",
			// VEHICULES OPFOR
					"O_MBT_02_arty_F",
					"O_APC_Tracked_02_cannon_F",
					"O_APC_Wheeled_02_rcws_F",
					"O_MBT_02_cannon_F",
					"O_APC_Tracked_02_AA_F",
					"O_MRAP_02_F",
					"O_MRAP_02_gmg_F",
					"O_MRAP_02_hmg_F",
					"O_Quadbike_01_F",
					"O_Truck_02_transport_F",
					"O_Truck_02_covered_F",
					"O_UGV_01_F",
					"O_UGV_01_rcws_F",
					"O_Boat_Transport_01_F",
					"O_Lifeboat",
					"O_Boat_Armed_01_hmg_F",
					"O_Truck_02_fuel_F",
					"O_Truck_02_box_F",
					"O_Truck_02_medical_F",
					"O_Truck_02_Ammo_F",
			// VEHICULES INDFOR
					"I_APC_Wheeled_03_cannon_F",
					"I_Quadbike_01_F",
					"I_MRAP_03_F",
					"I_MRAP_03_gmg_F",
					"I_MRAP_03_hmg_F",
					"I_Truck_02_transport_F",
					"I_Truck_02_covered_F",
					"I_UGV_01_F",
					"I_UGV_01_rcws_F",
					"I_Boat_Transport_01_F",
					"I_Boat_Armed_01_minigun_F",
					"I_Truck_02_fuel_F",
					"I_Truck_02_box_F",
					"I_Truck_02_medical_F",
					"I_Truck_02_ammo_F",
			// VEHICULES CIVILS
					"C_Van_01_transport_F",
					"C_Van_01_box_F",
					"C_Quadbike_01_F",
					"C_SUV_01_F",
					"C_Offroad_01_F",
					"C_Hatchback_01_F",
					"C_Hatchback_01_sport_F",
					"C_Boat_Civil_01_F",
					"C_Boat_Civil_01_police_F",
					"C_Boat_Civil_01_rescue_F",
					"C_Rubberboat",
					"C_Van_01_fuel_F"
				];
			};


		};
		_array
	};
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

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
	_rope = [] execVM "COMFA\Logistic\fast_roping\fast_roping_init.sqf";
};

if (BTC_active_cargo == 1) then
{
	//Cargo System
	_cargo = [] execVM "addons\LogisticBTCEdited\cargo\cargo_system_init.sqf";
	BTC_def_vehicles     = ["Tank", "Wheeled_APC", "Truck", "Car", "Helicopter"];
	BTC_def_cargo        = ["Motorcycle", "ReammoBox", "ReammoBox_F", "Strategic"];
	BTC_def_drag         = ["ReammoBox", "ReammoBox_F", "Strategic"];
	BTC_def_placement    = ["ReammoBox", "ReammoBox_F", "Strategic"];
	BTC_cargo_selected   = objNull;
	BTC_def_cc =
	[
		"B_Quadbike_01_F", 2,
		"B_Truck_01_transport_F", 10,
		"B_Truck_01_covered_F", 10,
		"I_Truck_02_covered_F", 10,
		"O_Truck_02_covered_F", 10,
		"I_Truck_02_transport_F", 10,
		"O_Truck_02_transport_F", 10,
		"O_Truck_02_transport_F", 10
	];
	BTC_def_rc =
	[
		"Land_BagBunker_Small_F", 4
	];
};

BTC_l_paradrop =
{

	//hint "debut paradrop";
	_veh          = _this select 0;
	_dropped      = _this select 1;
	_chute_type   = _this select 2;

	private ["_chute"];

	_dropped_type = typeOf _dropped;
	_dropped attachTo [_veh,[0,2,-5]];

	sleep 0.1;
	detach _dropped;
	_dropped setvariable ["BTC_cannot_lift",1,false];

	sleep 1;
	//hint "Caisse en cours de chute";
	_dropped setvariable ["BTC_cannot_lift",0,false];

	//_chute = createVehicle [_chute_type, getposatl _dropped, [], 0, "FLY"];
	//_chute = createVehicle [_chute_type, [((position _Veh) select 0) - 10,((position _Veh) select 1) - 10,((getPosATL _Veh) select 2)- 40], [], 0, "FLY"];					//Modif by Krisscut
	_chute = createVehicle [_chute_type, _dropped modelToWorld [0,0,0], [], 0, "FLY"];					//Modif by Krisscut

	sleep 0.1;
	_chute attachTo [_dropped,[0,0,0]];
	sleep 0.1;
	detach _chute;
	sleep 0.1;
	_dropped attachTo [_chute,[0,0,0]];

	_vel = velocity _veh;
	_dir = direction _veh;
	_speed = 0.7; //reduce a little bit speed;
	_chute setVelocity [(_vel select 0)+(sin _dir*_speed),(_vel select 1)+
(cos _dir*_speed),(_vel select 2)];


	sleep 0.2;
	_marker = createMarker ["Support", getPos _chute]; 	//add by Krisscut //add marker that follow the object
	"Support" setMarkerText "Point de chute";						//add by Krisscut
	"Support" setMarkerColor "ColorOrange";							//add by Krisscut
	"Support" setMarkerType "Select";								//add by Krisscut

	_heigh = 0;
	while {((getPosATL _chute) select 2) > 8} do {
		sleep 1;
		_heigh = (getPosATL _chute) select 2;
		"Support" setMarkerPos (getPos _chute);
	};
	detach _dropped;

	_smoke        = "SmokeshellBlue" createVehicle position _dropped;
	_smoke attachto [_dropped,[0,0,0]];
	_chem         = "Chemlight_blue" createVehicle position _dropped;
	_chem attachto [_dropped,[0,0,0]];
	_i=0;
	sleep 2;
	deleteVehicle _chute;
	//timer before delete of the marker
	while {_i<300} do{
		sleep 1;
		_i=_i+1;
	};
	deleteMarker "Support";
	//hint "Caisse au sol !";
	//[((position _Veh) select 0) - 5,((position _Veh) select 1) - 10,((position _Veh) select 2)- 4]
};

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

BTC_l_obj_fall =
{
	_obj    = _this select 0;
	_height = (getPos _obj) select 2;
	_fall   = 0.09;
	while {((getPos _obj) select 2) > 0.1} do
	{
		_fall = (_fall * 1.1);
		_obj setPos [getPos _obj select 0, getPos _obj select 1, _height];
		_height = _height - _fall;
		//hint format ["%1 - %2", (getPos _obj) select 2,_height];
		sleep 0.01;
	};
};
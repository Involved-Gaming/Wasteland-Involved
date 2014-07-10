waitUntil {!isNull player};
waitUntil {player == player};
#include "functions.sqf"
BTC_action_cargo   = false;
BTC_l_dragging     = false;
BTC_l_actions_cond = true;


_dlg   = player addaction [("<t color=""#bdd4a7"">") + ("Voir le contenu") + "</t>",BTC_dir_action,[[],BTC_l_check_vehicle],-7,false,false,"","BTC_l_actions_cond && count (nearestObjects [player, BTC_def_vehicles, 5]) > 0 || {vehicle player isKindOf _x} count BTC_def_vehicles > 0"];
_sel   = player addaction [("<t color=""#bdd4a7"">") + ("Sélectionner") + "</t>",BTC_dir_action,[[],BTC_l_select],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && count (nearestObjects [player, BTC_def_cargo, 5]) > 0"];
_load  = player addaction [("<t color=""#bdd4a7"">") + ("Charger") + "</t>",BTC_dir_action,[[],BTC_l_load],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && !isNull BTC_cargo_selected && count (nearestObjects [player, BTC_def_vehicles, 5]) > 0"];
_drag  = player addaction [("<t color=""#bdd4a7"">") + ("Déplacer") + "</t>",BTC_dir_action,[[],BTC_l_drag],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && count (nearestObjects [player, BTC_def_drag, 5]) > 0"];
//_plac  = player addaction [("<t color=""#bdd4a7"">") + ("Placer") + "</t>",BTC_dir_action,[[],BTC_l_placement],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && count (nearestObjects [player, BTC_def_placement, 5]) > 0"];
_eh = player addEventHandler 
["respawn", 
{
	_actions = [] spawn 
	{
		waitUntil {alive player};
		BTC_action_cargo   = false;
		BTC_l_dragging     = false;
		BTC_l_actions_cond = true;
		_dlg   = player addaction [("<t color=""#bdd4a7"">") + ("Voir le contenu") + "</t>",BTC_dir_action,[[],BTC_l_check_vehicle],-7,false,false,"","BTC_l_actions_cond && count (nearestObjects [player, BTC_def_vehicles, 5]) > 0 || {vehicle player isKindOf _x} count BTC_def_vehicles > 0"];
		_sel   = player addaction [("<t color=""#bdd4a7"">") + ("Sélectionner") + "</t>",BTC_dir_action,[[],BTC_l_select],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && count (nearestObjects [player, BTC_def_cargo, 5]) > 0"];
		_load  = player addaction [("<t color=""#bdd4a7"">") + ("Charger") + "</t>",BTC_dir_action,[[],BTC_l_load],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && !isNull BTC_cargo_selected && count (nearestObjects [player, BTC_def_vehicles, 5]) > 0"];
		_drag  = player addaction [("<t color=""#bdd4a7"">") + ("Déplacer") + "</t>",BTC_dir_action,[[],BTC_l_drag],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && count (nearestObjects [player, BTC_def_drag, 5]) > 0"];
		//_plac  = player addaction [("<t color=""#bdd4a7"">") + ("Placre") + "</t>",BTC_dir_action,[[],BTC_l_placement],-7,false,false,"","BTC_l_actions_cond && vehicle player == player && count (nearestObjects [player, BTC_def_placement, 5]) > 0"];
	};
}
];

BTC_main_cc =
[
	"Motorcycle",1,
	"Car", 3,
	"Truck", 10,
	"Wheeled_APC", 5,
	"Tank", 2,
	"Ship", 4,
	"Helicopter", 6
];
BTC_main_rc =
[
	"ReammoBox_F",2,
	"Strategic", 1,
	"Motorcycle",3,
	"Car",11,
	"Truck",15,
	"Wheeled_APC",20,
	"Tank",25,
	"Ship",15,
	"Helicopter",9999
];
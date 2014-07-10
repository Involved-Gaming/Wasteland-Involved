waitUntil {!isNull player};
waitUntil {player == player};
#include "functions.sqf"

_rope = player addaction [("<t color=""#dfb300"">") + ("Déployer la corde") + "</t>",BTC_dir_action,[[],BTC_deploy_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver vehicle player && format [""%1"",(vehicle player) getVariable ""BTC_rope""] != ""1"" && ((getPos (vehicle player)) select 2) < BTC_fast_rope_h && ((getPos (vehicle player)) select 2) > BTC_fast_rope_h_min && speed (vehicle player) < 2"];
_rope = player addaction [("<t color=""#dfb300"">") + ("Couper la corde") + "</t>",BTC_dir_action,[[],BTC_cut_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver (vehicle player) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];
_out  = player addaction [("<t color=""#dfb300"">") + ("Corde d'assaut") + "</t>",BTC_dir_action,[[player],BTC_fast_rope],-10,true,false,"","player in (assignedCargo (vehicle player)) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];

_outPara  = player addaction [("<t color=""#dfb300"">") + ("Parajump") + "</t>",BTC_dir_action,[[player],COMFA_parajump],-10,true,false,"","player in (assignedCargo (vehicle player)) && ((getPos player) select 2)>= 150 && ((velocity (vehicle player)) select 0) <= 15.3 && ((velocity (vehicle player)) select 1) <= 15.3"];		//15.3 metres par seconde == 55km/h

_eh = player addEventHandler ["respawn",
{
	_actions = [] spawn
	{
		waitUntil {Alive player};
		_rope = player addaction [("<t color=""#dfb300"">") + ("Déployer la corde") + "</t>",BTC_dir_action,[[],BTC_deploy_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver vehicle player && format [""%1"",(vehicle player) getVariable ""BTC_rope""] != ""1"" && ((getPos (vehicle player)) select 2) < BTC_fast_rope_h && ((getPos (vehicle player)) select 2) > BTC_fast_rope_h_min && speed (vehicle player) < 2"];
		_rope = player addaction [("<t color=""#dfb300"">") + ("Couper la corde") + "</t>",BTC_dir_action,[[],BTC_cut_rope],-10,true,false,"","typeOf (vehicle player) in BTC_roping_chopper && player == driver (vehicle player) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];
		_out  = player addaction [("<t color=""#dfb300"">") + ("Corde d'assaut") + "</t>",BTC_dir_action,[[player],BTC_fast_rope],-10,true,false,"","player in (assignedCargo (vehicle player)) && format [""%1"",(vehicle player) getVariable ""BTC_rope""] == ""1"""];

		_outPara  = player addaction [("<t color=""#dfb300"">") + ("Parajump") + "</t>",BTC_dir_action,[[player],COMFA_parajump],-10,true,false,"","player in (assignedCargo (vehicle player)) && ((getPos player) select 2)>= 150 && ((velocity (vehicle player)) select 0) <= 15.3 && ((velocity (vehicle player)) select 1) <= 15.3"];
	};
}];
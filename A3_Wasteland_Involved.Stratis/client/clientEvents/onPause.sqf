//	@file Version: 1.0
//	@file Name: onPause.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 15:48

disableSerialization;

waitUntil {!isNull findDisplay 49}; // 49 = Esc menu

// Disable field manual to prevent scriptkiddie exploits
((findDisplay 49) displayCtrl 122) ctrlEnable false;

with missionNamespace do
{
	_getPublicVar = missionNamespace getVariable "getPublicVar";
	_isConfigOn = missionNamespace getVariable "isConfigOn";

	if (alive player && !isNil "_getPublicVar" && !isNil "_isConfigOn") then
	{
		if (["A3W_playerSaving"] call _isConfigOn &&
		   {["playerSetupComplete", false] call _getPublicVar} &&
		   {!(["playerSpawning", false] call _getPublicVar)} && (player getVariable "FAR_isUnconscious") == 0) then
		{
			_enableButtons =
				{
					_display = findDisplay 49;
					if (!isNull _display) then
					{
						(_display displayCtrl 104) ctrlEnable _this; // Abort
						(_display displayCtrl 1010) ctrlEnable _this; // Respawn
					};
				};

			false call _enableButtons;			//Désactive les boutons par defaut
			_list = (position player) nearEntities ["Man", 100];	//cherche les joueurs à proximite

			_listVehicles = (position player) nearEntities [["Air","Car","Tank","Boat"], 100];		//liste les vehicules
			for "_y" from 0 to (count _listVehicles) do
			{
				_listCrew = crew (_listVehicles select _y);
				for "_iterCrew" from 0 to (count _listCrew) do
				{
					_oneCrew = (_listCrew select _iterCrew);
					_list = _list + [_oneCrew];
				};
			};
			while{ count _list != 0 } do
			{
				scopename "whileLoop";

				_list = (position player) nearEntities ["Man", 100];	//cherche les joueurs à proximite

				_listVehicles = (position player) nearEntities [["Air","Car","Tank","Boat"], 100];		//liste les vehicules
				for "_y" from 0 to (count _listVehicles) do
				{
					_listCrew = crew (_listVehicles select _y);
					for "_iterCrew" from 0 to (count _listCrew) do
					{
						_oneCrew = (_listCrew select _iterCrew);
						_list = _list + [_oneCrew];
					};
				};

				//hint format ["Il y a %1 homme(s) à proximité", count _list];
				//sleep 1;
				{
					if (group _x == group player || !(isPlayer _x) || !(alive _x) || _x == player || { side _x == side player &&  side player != resistance } ) then //Si la personne est dans le groupe, morte ou est une IA, ou si ils sont dans le même camp et pas independant ! ça ne compte pas !
					{
						_list = _list - [_x];
					}
					else{
						cutText [format ["\nUn joueur ennemi est à proximité, vous ne pouvez pas deconnecter !"], "PLAIN DOWN"];
					};
					//hint format ["Il reste %1 homme(s) à proximité", count _list];
					//sleep 0.5
				}forEach (_list);			//parcours la liste

				//On continu sauf si l'écran échap n'est plus affiché ou que la boucle est à 0
				if (isNull findDisplay 49 || (count _list == 0) ) then
				{
					//cutText [format ["\nBREAKOUT"], "PLAIN DOWN"];
					true call _enableButtons;
					breakOut "whileLoop" ;
				};
			};
			if (count _list == 0) then			// S'il n'y a plus d'ennemis à proximite
			{
				_abortDelay = ["A3W_combatAbortDelay", 0] call _getPublicVar;
				if (_abortDelay > 0) then			//Delay avant réapparition
				{
					_preventAbort =
					{
						_timeStamp = ["combatTimestamp", -1] call _getPublicVar;
						(!isNull findDisplay 49 && {_timeStamp != -1} && {diag_tickTime - _timeStamp < _abortDelay})
					};

					if !(["cannotAbortMessage", false] call _getPublicVar) then
					{
						if (call _preventAbort) then
						{
							missionNamespace setVariable ["cannotAbortMessage", true];

							with missionNamespace do { [false] spawn fn_savePlayerData };
							false call _enableButtons;

							private "_timeStamp";
							while {call _preventAbort} do
							{
								_remaining = ceil (_abortDelay - (diag_tickTime - _timeStamp));
								_mins = floor (_remaining / 60);
								_secs = _remaining - (_mins * 60);
								_time = format ["%1:%2%3", _mins, if (_secs < 10) then { "0" } else { "" }, _secs];

								cutText [format ["\nImpossible de quitter du jeu pendant un combat (%1)", _time], "PLAIN DOWN"];
								sleep 1;
							};

							true call _enableButtons;
							cutText ["", "PLAIN DOWN"];

							missionNamespace setVariable ["cannotAbortMessage", false];
						}
						else
						{
							true call _enableButtons;
							with missionNamespace do { [true] spawn fn_savePlayerData };
						};
					};
				}
				else
				{
					true call _enableButtons;
					with missionNamespace do { [true] spawn fn_savePlayerData };
				};
			};
		};
	};
};

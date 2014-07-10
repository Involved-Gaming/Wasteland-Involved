BTC_deploy_rope =
{
	hint parseText format ["CORDE<br/><t color='#727f66'>DÉPLOYÉE</t>"];
	_veh = vehicle player;
	_veh setVariable ["BTC_rope",1,true];
	Sleep 2;
	hint "";
	WaitUntil {!Alive _veh || !Alive player || (((getPos player) select 2) > BTC_fast_rope_h) || format ["%1",_veh getVariable "BTC_rope"] != "1"};
	_veh setVariable ["BTC_rope",0,true];
};
BTC_cut_rope =
{
	hint parseText format ["CORDE<br/><t color='#aa5858'>COUPÉE</t>"];
	_veh = vehicle player;
	_veh setVariable ["BTC_rope",0,true];
	Sleep 2;
	hint "";
};
BTC_fast_rope =
{
	hint parseText format ["CORDE<br/><t color='#aa5858'>D'ASSAUT</t>"];
	_unit = _this select 0;
	_veh = vehicle _unit;
	_unit action ["EJECT",_veh];
	unassignVehicle _unit;
	_unit setPos (_veh modelToWorld [2,1,-2]);
	_unit switchMove "LadderRifleStatic";
	_unit setDir (getDir _veh - 90);
	while {Alive _unit && (((getPos _unit) select 2) > 1.5)} do
	{
		_unit switchMove "LadderRifleStatic";
	};
	if (Alive _unit && format ["%1",_veh getVariable "BTC_rope"] == "1") then
	{
		_unit setVelocity [0,0,0];
		_unit playMove "LadderRifleDownOff";
		if !(isPlayer _unit) then {_unit move [((getPos _unit) select 0) + 3,((getPos _unit) select 1) + 3,0];};
	};
	if (format ["%1",_veh getVariable "BTC_rope"] != "1") then {hint parseText format ["<t color='#aa5858'>La corde a été coupée à cause du mouvement de l'appareil.</t>"]; _unit playMove "LadderRifleDownOff";};
};

COMFA_parajump=
{
	_unit = _this select 0;

	if (isDedicated) exitWith {};
	if (player == _unit ) then //local à un joueur !!
	{


	_markerName= "pack"+name _unit;
	_veh = vehicle _unit;			//memoire vehicule
	_pack = unitBackpack _unit;		//memoire du pack
	_pack attachTo [_veh,[0,0,0]];
	_unit addBackpack "B_Parachute";	// on rajoute un parachute

	unassignVehicle (_unit); // ejection véhicule
	_unit action ["EJECT",_veh];

		sleep 1;
	_markerPack = createMarkerLocal [_markerName, getPos _unit]; 	//add by Krisscut //add marker that follow the object

	//_marker= createMarkerLocal [Marker1, position player ]

	_markerName setMarkerText "Sac de "+name _unit;						//add by Krisscut
	_markerName setMarkerColor "ColorGreen";							//add by Krisscut
	_markerName setMarkerType "Select";								//add by Krisscut

	waitUntil {animationState _unit == "para_pilot"};

	_smokePack        = "SmokeshellGreen" createVehicle (getMarkerPos _markerName);
	_chemPack         = "Chemlight_green" createVehicle (getMarkerPos _markerName);

	sleep 1;
	//detach _pack;

	//freefall:
	//_pack attachTo [_unit,[0,-0.13,0],"Pelvis"];		//attaché au ventre du gars
	//_pack setVectorDirAndUp [[0,0,1],[0,1,0]];			//direction sac

	/*
	_nil = [_unit,_pack] spawn {
		_unit = _this select 0;
		_pack = _this select 1;

		waitUntil {animationState _unit == "para_pilot"}; //wait for parachute open
		//animation still weird, can't seem to attach while in parachute animation...so bury temporarily
		_pack setPos [(getPos _unit) select 0,(getPos _unit) select 1,-50]; //bury nearby...

		waitUntil {isTouchingGround _unit || (getPosASL _unit) select 2 < 0.1};//wait for landing
		if(surfaceIsWater [getPos _unit select 0,getPos _unit select 1]) then {
			waitUntil {isTouchingGround _unit}; //will trigger offshore, bag will float then
			detach _pack;
			_pack setPosASL [getposASL _unit select 0, getposASL _unit select 1,-0.28];
		} else {
			detach _pack;
			_pack setPos [(getPos _unit) select 0,(getPos _unit) select 1,1];
		};
		*/
		waitUntil {isTouchingGround _unit || (getPosASL _unit) select 2 < 0.1};
		//detach _pack;
		sleep 0.5;


		sleep 120;
		deleteMarker _markerName;
		deleteVehicle _chemPack;
		//_pack setPos [(getPos _unit) select 0,(getPos _unit) select 1,(getPos _unit) select 2];
		//_pack setVectorDirAndUp [[0,0,-1],[0,-1,0]];
		//_unit addBackpack _pack;
		//_pack addAction ["Take Bag",{(_this select 1) action ["TakeBag",_this select 0];},"",6,true,true,"","true"];
	};
};
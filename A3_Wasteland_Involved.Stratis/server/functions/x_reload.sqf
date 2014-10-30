_object = _this;

_type = typeOf _object;

x_reload_time_factor = 10.00;

_object vehicleChat format ["Entretien du véhicule %1... Merci de patientez...", _type];

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");


sleep x_reload_time_factor;
_object vehicleChat "Réparation... Merci de rangez vos armes";
_object setDamage 0;
sleep x_reload_time_factor;
_object vehicleChat "Plein du véhicule... L'essence est gratuite, pas le service !";
while {fuel _object < 0.99} do {
	//_object setFuel ((fuel _vehicle + 0.1) min 1);
	_object setFuel 1;
	sleep 0.01;
};
sleep x_reload_time_factor;
_object vehicleChat format ["%1 est prêt ...", _type];

if (true) exitWith {};

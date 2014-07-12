/*
	IG_hitpart.sqf - Event handler hitpart to detect headshot during unconscious state

*/

HandleHitPart_EH =
{
	private ["_unit", "_shooter", "_hitPart", "_causedBy", "_ammo", "_isUnconscious", "_isBleeding", "_isDown"];
	_unit = ((_this select 0) select 0);
	_shooter = ((_this select 0) select 1);
	_hitPart = ((_this select 0) select 5);
	_causedBy = ((_this select 0) select 6);
	_ammo = _causedBy select 4;

	_isUnconscious = _unit getVariable "FAR_isUnconscious";
	_damage = (damage _unit);

	cutText [format ["\nHITPART !"], "PLAIN DOWN"];

	if (format _hitPart == "head") then
	{
		_unit setVariable ["IG_headhit", 1, true];			//Touché à la tète .... cause la mort
	};
};
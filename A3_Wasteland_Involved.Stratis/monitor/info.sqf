waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

_rscLayer = "agnStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["agnStatusBar","PLAIN"];

[] spawn {
	sleep 5;
	_statusText = "Serveur Involved Gaming";
	_counter = 180;
	while {true} do
	{		
	sleep 5;
	((uiNamespace getVariable "agnStatusBar")displayCtrl 1000)ctrlSetText format["%3 | FPS: %1 | Joueurs connectés: %2  ", round diag_fps, count playableUnits, _statusText, _counter];
	};
};

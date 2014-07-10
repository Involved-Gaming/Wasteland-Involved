//	@file Version: 1.0
//	@file Name: fn_clearDatabaseUnconscious.sqf
//	@file Author: S.lambert
//	@file Created:  10/07/2014

if (!isServer) exitWith {};
private ["_player"];

diag_log "player is Unconscious, deleting all his data";

_player = _this select 0;

[_player] spawn server_PlayerDied;
//((getPlayerUID _player) call PDB_databaseNameCompiler) call iniDB_delete;
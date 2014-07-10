//	@file Version: 1.0
//	@file Name: fn_clearDatabaseInconscious.sqf
//	@file Author: S.lambert
//	@file Created:  10/07/2014

if (!isServer) exitWith {};
private ["_player"];

diag_log "player is Inconscious, deleting all his data";
_player = _this select 0;
((getPlayerUID _player) call PDB_databaseNameCompiler) call iniDB_delete;
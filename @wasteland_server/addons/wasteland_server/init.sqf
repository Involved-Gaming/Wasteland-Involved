#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})

diag_log "=======INITIALIZING WASTELAND_SERVER MOD=======";

__CONST__(LIFE_SCHEMA_NAME,"'arma3life'");//CHANGE THIS IF YOUR DATABASE IS NOT CALLED ARMA3LIFE KEEP THE ' '
publicVariable "LIFE_SCHEMA_NAME";

__CONST__(WASTELAND_SCHEMA_NAME,"'wastelandDatabase'");//CHANGE THIS IF YOUR DATABASE IS NOT CALLED ARMA3LIFE KEEP THE ' '
publicVariable "WASTELAND_SCHEMA_NAME";

DB_Async_Active = false;
//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

server_query_running = false;
life_DB_queue = [];
serv_sv_use = [];

diag_log "=======INITIALIZING WASTELAND_SERVER COMPLETED=======";

//Run procedures for SQL cleanup on mission start.			//MEMO
//"Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['%2', '%1']", "CALL resetLifeVehicles();",(call LIFE_SCHEMA_NAME)]; //Reset vehicles active state to false.

//Server-side functions that need to be sent out.
//publicVariable "TON_fnc_addVehicle2Chain";
//publicVariable "life_fnc_fedSuccess";

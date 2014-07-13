class DefaultEventhandlers;
class CfgPatches 
{
	class wasteland_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "wasteland_server.pbo";
		author[]= {"S.Lambert / Graincheux for Involved Gaming"}; 
	};
};

class CfgFunctions
{

	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\wasteland_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
		};
	};

	class Wasteland_System
	{
		tag = "WL";
		class Wasteland
		{
			file = "\wasteland_server\Functions\Wasteland";
		};
	};
};

class CfgVehicles
{
	class Car_F;
};
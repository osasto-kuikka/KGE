class CfgPatches
{
	class KGE
	{
		units[] = {"KGE_RespawnInit_Module", "KGE_SafeStartInit_Module"};
		weapons[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"CBA_Main", "A3_UI_F", "A3_Data_F", "A3_UIFonts_F"};
		version = "0.90";
		versionStr = "0.90";
		versionAr[] = {0,90,0};
		author = "Nikolauska";
		authorUrl = "https://github.com/Nikolauska/";
		magazines[] = {};
		ammo[] = {};
	};
};

// Include functions
class CfgFunctions
{
	#include "ai\functions.hpp"
	#include "cache\functions.hpp"
	#include "core\functions.hpp"
	#include "debug\functions.hpp"
	#include "gear\functions.hpp"	
	#include "hostage\functions.hpp"
	#include "misc\functions.hpp"
	#include "respawn\functions.hpp"
	#include "safestart\functions.hpp"
	#include "spectator\functions.hpp"
	#include "staminabar\functions.hpp"
	#include "teamRoster\functions.hpp"
	#include "teleport\functions.hpp"
	#include "ui\functions.hpp"
	#include "zeus\functions.hpp"	
};

// Initialize KGE
class Extended_PostInit_EventHandlers
{
	class KGEInitServer
	{
		Init = "call compile preprocessFileLineNumbers 'KGE\KGE_Init_Server.sqf'";
		disableModuload = 0;
	};
	class KGEInitClient
	{
		Init = "call compile preprocessFileLineNumbers 'KGE\KGE_Init_Client.sqf'";
		disableModuload = 0;
	};
};

// Create KGE category in modules
class CfgFactionClasses
{
	class NO_CATEGORY;
	class KGE: NO_CATEGORY
	{
		displayName = "KGE";
		priority = 3;
        side = 7;
	};
};

// Include modules
class CfgVehicles
{
	class Logic;
	class Module_F: Logic
	{
		class ArgumentsBaseUnits{};
	};

	#include "ai\modules.hpp"
	#include "cache\modules.hpp"
	#include "core\modules.hpp"
	#include "debug\modules.hpp"
	#include "gear\modules.hpp"	
	#include "hostage\modules.hpp"
	#include "misc\modules.hpp"
	#include "respawn\modules.hpp"
	#include "safestart\modules.hpp"
	#include "spectator\modules.hpp"
	#include "staminabar\modules.hpp"
	#include "teamRoster\modules.hpp"
	#include "teleport\modules.hpp"
	#include "ui\modules.hpp"
	#include "zeus\modules.hpp"
};

// Include all dialogs
#include "basic_defines.hpp"
#include "spectator\dialog.hpp"
#include "ui\dialog.hpp"
#include "staminabar\dialog.hpp"


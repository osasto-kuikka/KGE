#include "script_component.hpp"

class CfgPatches
{
	class ADDON
	{
		units[]={};
		weapons[]={};
		requiredVersion=0.5;
		requiredAddons[]=
		{
			"CBA_Main",
			"extended_eventhandlers",
			"CBA_UI",
			"CBA_XEH",
			"CBA_XEH_A3"
		};
		version=VERSION;
		versionStr=VERSION;
		versionAr[]={VERSION_AR};
		author="Nikolauska";
		authorUrl="https://github.com/Nikolauska/";
	};
};

#include "config_eventhandlers.hpp"
#include "dialog.hpp"
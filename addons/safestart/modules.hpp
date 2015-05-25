class KGE_SafeStartInit_Module: Module_F
{
	scope = 2;
	displayName = "Safestart";
	category = "KGE";
	function = "KGE_SafeStart_fnc_Module";
	functionPriority = 0;
	isGlobal = 0;
	isTriggerActivated = 0;
	isDisposable = 0;
	class Arguments
	{
		class STSide
		{
			displayName = $STR_SafeStart_Module_Side_Name;
			description = $STR_SafeStart_Module_Side_Description;
			typeName = "NUMBER";
			class values
			{
				class AllSIDES		{name = $STR_SafeStart_Module_Side_All; value = -1; default = 1;};
				class WEST			{name = $STR_SafeStart_Module_Side_Blufor;	value = 0;};
				class EAST			{name = $STR_SafeStart_Module_Side_Opfor; value = 1;};
				class INDEPENDENT	{name = $STR_SafeStart_Module_Side_Independent; value = 2;};
				class CIVILIAN		{name = $STR_SafeStart_Module_Side_Civilian; value = 3;};					
			};
		};
	};
	class ModuleDescription
	{
		description = $STR_SafeStart_Module_Description;
		sync[] = {};
	};
};
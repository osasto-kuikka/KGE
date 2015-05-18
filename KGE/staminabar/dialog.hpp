class IGUIBack;
class RscTitles
{
	class KGE_StaminaBar_Visualizer
	{
		idd = 10777;
		movingEnable = 1;
		enableSimulation = 1;
		enableDisplay = 1;
		onLoad = "KGE_StaminaBar_Visualizer = _this; disableSerialization";
		onunLoad = "";
		duration = 9999;
		fadein = 0;
		fadeout = 0;
		class controls
		{
			class IGUIBack_2203: IGUIBack
			{
				idc = 9234;
				x = "0.025 * safezoneW + safezoneX";
				y = "0.9775 * safezoneH + safezoneY";
				w = "0.1 * safezoneW";
				h = "0.0025 * safezoneH";
			};
		};
	};
};
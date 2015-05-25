// Fonts
#define GUI_FONT_NORMAL         PuristaMedium
#define GUI_FONT_BOLD           PuristaSemibold
#define GUI_FONT_THIN           PuristaLight
#define GUI_FONT_MONO           EtelkaMonospacePro
#define GUI_FONT_NARROW         EtelkaNarrowMediumPro
#define GUI_FONT_CODE           LucidaConsoleB
#define GUI_FONT_SYSTEM         TahomaB

// Grids
#define GUI_GRID_CENTER_WAbs        ((safezoneW / safezoneH) min 1.2)
#define GUI_GRID_CENTER_HAbs        (GUI_GRID_CENTER_WAbs / 1.2)
#define GUI_GRID_CENTER_W       (GUI_GRID_CENTER_WAbs / 40)
#define GUI_GRID_CENTER_H       (GUI_GRID_CENTER_HAbs / 25)
#define GUI_GRID_CENTER_X       (safezoneX + (safezoneW - GUI_GRID_CENTER_WAbs)/2)
#define GUI_GRID_CENTER_Y       (safezoneY + (safezoneH - GUI_GRID_CENTER_HAbs)/2)

class KGE_GUI_Menu_Listbox
{
	access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
	idc = CT_LISTBOX; // Control identification (without it, the control won't be displayed)
	type = CT_LISTBOX; // Type
	style = ST_LEFT + LB_TEXTURES; // Style
	default = 0; // Control selected by default (only one within a display can be used)
	blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.

	x = 1 * GUI_GRID_CENTER_W + GUI_GRID_CENTER_X; // Horizontal coordinates
	y = 11 * GUI_GRID_CENTER_H + GUI_GRID_CENTER_Y; // Vertical coordinates
	w = 10 * GUI_GRID_CENTER_W; // Width
	h = 3 * GUI_GRID_CENTER_H; // Height

	colorBackground[] = {0,0,0,0.3}; // Fill color
	colorSelectBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
	colorSelectBackground2[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};

	sizeEx = GUI_GRID_CENTER_H; // Text size
	font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
	shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
	colorText[] = {1,1,1,1}; // Text and frame color
	colorDisabled[] = {1,1,1,0.5}; // Disabled text color
	colorSelect[] = {1,1,1,1}; // Text selection color
	colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
	colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

	pictureColor[] = {1,0.5,0,1}; // Picture color
	pictureColorSelect[] = {1,1,1,1}; // Selected picture color
	pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

	tooltip = ""; // Tooltip text
	tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
	tooltipColorText[] = {1,1,1,1}; // Tooltip text color
	tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

	period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

	rowHeight = 1.5 * GUI_GRID_CENTER_H; // Row height
	itemSpacing = 0; // Height of empty space between items
	maxHistoryDelay = 1; // Time since last keyboard type search to reset it
	canDrag = 1; // 1 (true) to allow item dragging

	soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

	// Scrollbar configuration (applied only when LB_TEXTURES style is used)
	class ListScrollBar
	{
		width = 0; // Unknown?
		height = 0; // Unknown?
		scrollSpeed = 0.01; // Unknown?

		arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
		arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
		border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
		thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

		color[] = {1,1,1,1}; // Scrollbar color
	};

	onCanDestroy = "";
	onDestroy = "";
	onSetFocus = "";
	onKillFocus = "";
	onKeyDown = "";
	onKeyUp = "";
	onMouseButtonDown = "";
	onMouseButtonUp = "";
	onMouseButtonClick = "";
	onMouseButtonDblClick = "";
	onMouseZChanged = "";
	onMouseMoving = "";
	onMouseHolding = "";

	onLBSelChanged = "";
	onLBDblClick = "";
	onLBDrag = "";
	onLBDragging = "";
	onLBDrop = "";
};

class KGE_GUI_Menu_Text
{
	access = 0;
	type = 0;
	idc = -1;
	colorBackground[] = {0,0,0,0};
	colorText[] = {1,1,1,1};
	text = "";
	fixedWidth = 0;
	x = 0;
	y = 0;
	h = 0.037;
	w = 0.3;
	style = ST_LEFT;
	shadow = 0;
	font = "puristaMedium";
	SizeEx = 0.03921;
};

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Nikolauska, v1.063, #Vedysu)
////////////////////////////////////////////////////////

class KGE_UI_Dialog {
	idd = -1;
	movingEnable = 0;
	class controls {

		class KGE_UI_Header: RscText
		{
			idc = 5120;
			text = "KGE Menu Header"; //--- ToDo: Localize;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.478 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.077 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0,0,0,1};
			style = ST_CENTER;
		};
		class KGE_UI_Button1: RscButton
		{
			idc = 5121;
			text = "test1"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 1] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button2: RscButton
		{
			idc = 5122;
			text = "test2"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 2] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button3: RscButton
		{
			idc = 5123;
			text = "test3"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 3] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button4: RscButton
		{
			idc = 5124;
			text = "test4"; //--- ToDo: Localize;
			x = 0.567031 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 4] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button5: RscButton
		{
			idc = 5125;
			text = "test5"; //--- ToDo: Localize;
			x = 0.551562 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 5] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button6: RscButton
		{
			idc = 5126;
			text = "test6"; //--- ToDo: Localize;
			x = 0.505156 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 6] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button7: RscButton
		{
			idc = 5127;
			text = "test7"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.588 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 7] call KGE_UI_fnc_UIHandler";
		};		
		class KGE_UI_Button8: RscButton
		{
			idc = 5128;
			text = "test8"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.555 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 8] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button9: RscButton
		{
			idc = 5129;
			text = "test9"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.522 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 9] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button10: RscButton
		{
			idc = 5130;
			text = "test10"; //--- ToDo: Localize;
			x = 0.340156 * safezoneW + safezoneX;
			y = 0.489 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 10] call KGE_UI_fnc_UIHandler";
		};			
		class KGE_UI_Button11: RscButton
		{
			idc = 5131;
			text = "test11"; //--- ToDo: Localize;
			x = 0.355625 * safezoneW + safezoneX;
			y = 0.456 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 11] call KGE_UI_fnc_UIHandler";
		};
		class KGE_UI_Button12: RscButton
		{
			idc = 5132;
			text = "test12"; //--- ToDo: Localize;
			x = 0.402031 * safezoneW + safezoneX;
			y = 0.423 * safezoneH + safezoneY;
			w = 0.0928125 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
			action = "['pressed', 12] call KGE_UI_fnc_UIHandler";
		};
	};
};

class KGE_GUI_Menu
{
	idd = -1;
	movingenable = false;

	class Controls
	{
		class KGE_GUI_Menu_Listbox_01: KGE_GUI_Menu_Listbox
		{
			idc = 5133;
			x = 0;
			y = 0.099844;
			w = 0.375;
			h = 0.3;
			onLBSelChanged = "[] call KGE_UI_fnc_MenuButtonPressed";
		};
		class KGE_GUI_Menu_Header: KGE_GUI_Menu_Text
		{
			idc = 5134;
			x = 0;
			y = 0.041688;
			w = 0.375;
			h = 0.063;
			colorBackground[] = {0,0,0,0};
			colorText[] = {1,1,1,1};
			text = "";
			style = ST_CENTER;
		};
	};
};
////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT END
////////////////////////////////////////////////////////

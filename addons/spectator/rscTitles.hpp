#define PIXEL_X (safeZoneWAbs / (getResolution select 0))
#define PIXEL_Y (safeZoneH / (getResolution select 1))
#define XHAIR RESUNITS_X * 4
#define COMPASS_W RESUNITS_X * 20
#define COMPASS_H COMPASS_W / 15
#define COMPASS_X RESCENTRE_X - COMPASS_W / 2
#define HELP_W RESUNITS_X * 75
#define HELP_H RESUNITS_Y * 75

class rscTitles {
	class GVAR(rsc_black) {

		idd=-1;
		movingEnable=0;
		fadein=0;
		fadeout=0;
		duration=1e+011;
		
		class controls {
		
			class Black: GVAR(rsc_box) {
				x = safeZoneX;
				y = safeZoneY;
				w = safeZoneWAbs;
				h = safeZoneH;
				colorBackground[] = {0,0,0,1};
			}; 
		};
	};

	class GVAR(rsc_crosshair) {

		onLoad = QUOTE(SETUVAR(QGVAR(rsc_crosshair), _this select 0));
		idd=-1;
		movingEnable=0;
		fadein=0;
		fadeout=0;
		duration=1e+011;

		class controls {
		
			class X: GVAR(rsc_picture) {
				idc = 0;
				x = QUOTE(RESCENTRE_X - XHAIR / 2);
				y = QUOTE(RESCENTRE_Y - XHAIR * 4/3 / 2);
				w = QUOTE(XHAIR);
				h = QUOTE(XHAIR * 4/3);
				text = "\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa";
				colorText[] = {1,1,1,0.8};
			};
		};
	};

	class GVAR(rsc_status) {

		onLoad = QUOTE(SETUVAR(QGVAR(rsc_status), _this select 0); [ARR_2(QUOTE(QUOTE(Status)), _this select 0)] call FUNC(events));
		idd = -1;
		movingEnable=0;
		fadein=0;
		fadeout=0;
		duration=1e+011;

		class controls {
		
			class BGRight: GVAR(rsc_box) {
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
				y = QUOTE(safeZoneY);
				w = QUOTE(RESUNITS_X * 30);
				h = QUOTE(COMPASS_H);
				colorBackground[] = {0.1,0.1,0.1,1};
			};
			
			class BGLeft: BGRight {
				x = QUOTE(safeZoneX);
			};
			
			class SpeedFrame: GVAR(rsc_frame) {
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 5);
				y = QUOTE(safeZoneY);
				w = QUOTE(RESUNITS_X * 5);
				h = QUOTE(COMPASS_H);
				shadow = 2;
				colorText[]={1,1,1,1};
			};
			
			class Speed: GVAR(rsc_text) {
				idc = 0;
				style = ST_CENTER;
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 5);
				y = QUOTE(safeZoneY);
				w = QUOTE(RESUNITS_X * 5);
				h = QUOTE(COMPASS_H);
				colorText[]={1,1,1,1};
				sizeEx = QUOTE(RESUNITS_Y * 2);
				font = GUI_FONT_NORMAL;
				text = "";
			};
			
			class FovFrame: SpeedFrame {
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 10.5);
			};
			
			class Fov: Speed {
				idc = 4;
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 10.5);
			};
			
			class TimeAccFrame: SpeedFrame {
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 21.5);
			};
			
			class TimeAcc: Speed {
				idc = 5;
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 21.5);
			};
			
			class FocusFrame: SpeedFrame {
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 16);
			};
			
			class Focus: Speed {
				idc = 6;
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 16);
			};
			
			class NameFrame: SpeedFrame {	
				x = QUOTE(safeZoneX);
				w = QUOTE(RESUNITS_X * 24.5);
			};
			
			class Name: Speed {
				idc = 1;
				x = QUOTE(safeZoneX);
				w = QUOTE(RESUNITS_X * 24.5);
			};
			
			class ModeFrame: SpeedFrame {
				x = QUOTE(safeZoneX + RESUNITS_X * 25);
			};
			
			class Mode: Speed {
				idc = 2;
				x = QUOTE(safeZoneX + RESUNITS_X * 25);	
			};
			
			class TimeFrame: SpeedFrame {
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
				w = QUOTE(RESUNITS_X * 8);
			};
			
			class Time: Speed {
				idc = 3;
				x = QUOTE(safeZoneX + safeZoneW - RESUNITS_X * 30);
				w = QUOTE(RESUNITS_X * 8);
			};
		};
	};

	class GVAR(rsc_compass) {

		onLoad = QUOTE(SETUVAR(QGVAR(rsc_compass), _this select 0));
		onUnload = "";
		idd=-1;
		movingEnable=0;
		fadein=0;
		fadeout=0;
		duration=1e+011;

		class controls {
			
			class BG: GVAR(rsc_box) {
				x = QUOTE(COMPASS_X);
				y = QUOTE(safeZoneY);
				w = QUOTE(COMPASS_W);
				h = QUOTE(COMPASS_H);
				colorBackground[] = {0.1,0.1,0.1,1};
			};
			
			class 0_90: GVAR(rsc_picture) {
				idc = 1;
				x = QUOTE(RESCENTRE_X);
				y = QUOTE(safeZoneY);
				w = QUOTE(COMPASS_W / 2);
				h = QUOTE(COMPASS_H);
				text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture180_ca.paa";
			};
			
			class 90_180: 0_90 {
				idc = 2;
				x = QUOTE(RESCENTRE_X + COMPASS_W / 2);
				text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture270_ca.paa";
			};
			
			class 180_270: 0_90 {
				idc = 3;
				x = QUOTE(RESCENTRE_X + COMPASS_W);
				text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture0_ca.paa";
			};
			
			class 270_0: 0_90 {
				idc = 4;
				x = QUOTE(RESCENTRE_X + COMPASS_W * 1.5);
				text = "A3\ui_f_curator\data\cfgIngameUI\compass\texture90_ca.paa";
			};
			
			class Post: GVAR(rsc_box) {
				x = QUOTE(COMPASS_X + COMPASS_W / 2);
				y = QUOTE(safeZoneY);
				w = QUOTE(PIXEL_X * 2);
				h = QUOTE(COMPASS_H);
				colorBackground[]={1,0,0,1};
			};
			
			class LeftBlocker: GVAR(rsc_box) {
				x = QUOTE(COMPASS_X - COMPASS_W / 2);
				y = QUOTE(safeZoneY);
				w = QUOTE(COMPASS_W / 2);
				h = QUOTE(COMPASS_H);
				colorBackground[] = {0.1,0.1,0.1,1};
			};
			
			class RightBlocker: LeftBlocker {
				x = QUOTE(COMPASS_X + COMPASS_W);
			};
			
			class Frame: GVAR(rsc_frame) {
				x = QUOTE(COMPASS_X);
				y = QUOTE(safeZoneY);
				w = QUOTE(COMPASS_W);
				h = QUOTE(COMPASS_H);
				shadow=2;
				colorText[]={1,1,1,1};
			};
		};
	};

	class GVAR(rsc_help) {
		onLoad = QUOTE(SETUVAR(QGVAR(rsc_help), _this select 0); [ARR_2(QUOTE(QUOTE(Help)), _this select 0)] call FUNC(events));
		idd = -1;
		movingEnable=0;
		fadein=0;
		fadeout=0;
		duration=1e+011;

		class controls {
		
			class BG: GVAR(rsc_box) {
				idc = -1;
				x = QUOTE(RESCENTRE_X - HELP_W / 2);
				y = QUOTE(RESCENTRE_Y - HELP_H / 2);
				w = QUOTE(HELP_W);
				h = QUOTE(HELP_H);
				colorBackground[] = {0.1,0.1,0.1,1};
			};
			
			class Title: GVAR(rsc_text) {
				idc = 0;
				style = ST_CENTER;
				x = QUOTE(RESCENTRE_X - RESUNITS_X * 25);
				y = QUOTE(RESCENTRE_Y - (HELP_H / 2) + RESUNITS_Y * 3);
				w = QUOTE(RESUNITS_X * 50);
				h = QUOTE(RESUNITS_Y * 4);
				colorText[]={1,1,1,1};
				sizeEx = QUOTE(RESUNITS_Y * 4);
				font = GUI_FONT_NORMAL;
				text = "KGE Camera Controls";
			};
			
			class LeftColumn1 {
				idc = 1;
				type = CT_STRUCTURED_TEXT;
				style = ST_LEFT;
				x = QUOTE(RESCENTRE_X - HELP_W / 2 + RESUNITS_X * 3);
				y = QUOTE(RESCENTRE_Y - (HELP_H / 2) + RESUNITS_Y * 12);
				w = QUOTE(RESUNITS_X * 14.75);
				h = QUOTE(RESUNITS_Y * 63);
				text = "";
				size = QUOTE(RESUNITS_Y * 2.5);
				colorBackground[] = {0,0,0,0};
			};
			
			class LeftColumn2: LeftColumn1 {
				idc = 2;
				x = QUOTE(RESCENTRE_X - HELP_W / 2 + RESUNITS_X * 17.75);
			};
			
			class RightColumn1: LeftColumn1 {
				idc = 3;
				x = QUOTE(RESCENTRE_X + HELP_W / 2 - RESUNITS_X * 3 - RESUNITS_X * 29.5);
			};
			
			class RightColumn2: LeftColumn1 {
				idc = 4;
				x = QUOTE(RESCENTRE_X + HELP_W / 2 - RESUNITS_X * 3 - RESUNITS_X * 11.75);
			};
		};
	};
};
/*
	@file Version: 1.0
	@file Name: hud.hpp
	@file Author: [404] Deadbeat
	@file Created: 11/09/2012 04:23
	@file Args:
*/

#define hud_status_idc 3600
#define hud_vehicle_idc 3601

class WastelandHud {
	idd = -1;
    fadeout = 0;
    fadein = 0;
	duration = 20;
	name = "WastelandHud";
	onLoad = "uiNamespace setVariable['WastelandHud', _this select 0]";

	class controlsBackground {

		class WastelandHud_Vehicle:w_RscText {
			idc = hud_vehicle_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.42 / SafeZoneW)));
			y = safeZoneY + (safeZoneH * (1 - (0.30 / SafeZoneH)));
			w = 0.4; h = 0.65;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};

		class WastelandHud_Status:w_RscText {
			idc = hud_status_idc;
			type = CT_STRUCTURED_TEXT;
			size = 0.040;
			x = safeZoneX + (safeZoneW * (1 - (0.16 / SafeZoneW)));
			y = safeZoneY + (safeZoneH * (1 - (0.10 / SafeZoneH)));
			w = 0.14; h = 0.20;
			colorText[] = {1,1,1,1};
			lineSpacing = 3;
			colorBackground[] = {0,0,0,0};
			text = "";
			shadow = 2;
			class Attributes {
				align = "right";
			};
		};

		class WastelandHud_Watermark {
			idc = -1;
			x = safeZoneX + 0.01125;
			y = safeZoneY + safeZoneH - 0.1125;
			w = 0.35 * safeZoneW;
			h = 0.057 * safeZoneH;
			class Attributes {
				color = "#20FFFFFF";
				align = "left";
				valign = "middle";
			};
			font = "EtelkaNarrowMediumPro";
			colorBackground[] = {0, 0, 0, 0};
			shadow = 0; 
			size = 0.06 * safeZoneH;
			type = 13;
			style = 0;
			text="Event Horizon Gaming";
		};

	};
};

#include "player_sys.sqf"

class playerSettings {

	idd = playersys_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "execVM 'client\systems\playerMenu\item_list.sqf'";

	class controlsBackground {
		class MainBG : w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			moving = true;
			x = 0.0; y = 0.1;
			w = 1.0; h = 0.65;
		};

		class MainTitle : w_RscText {
			idc = -1;
			text = "Player Inventory Menu";
			sizeEx = 0.04;
			shadow = 2;
			x = 0.260; y = 0.112;
			w = 0.3; h = 0.05;
		};

		class moneyIcon : w_RscPicture {
	  		idc = -1;
        	text = "\CA\misc\data\icons\picture_money_CA.paa";
        	x = 0.02; y = 0.32;
			w = 0.04; h = 0.04;
		};

		class moneyText : w_RscText {
			idc = money_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.313;
			w = 0.3; h = 0.05;
		};

		class ServerUptimeText : w_RscText {
			idc = uptime_text;
			sizeEx = 0.03;
			text = "";
			x = 0.06; y = 0.254;
			w = 0.3; h = 0.05;
		};

		class ServerFrameRateText : w_RscText {
			idc = frame_rate_text;
			text = "";
			sizeEx = 0.03;
			x = 0.06; y = 0.193;
			w = 0.3; h = 0.05;
		};

		class distanceText : w_RscText {
			idc = view_range_text;
			text = "View Distance:";
			sizeEx = 0.025;
			x = 0.03; y = 0.40;
			w = 0.3; h = 0.02;
		};

		class bountyIcon : w_RscPicture {
	  		idc = -1;
        	text = "client\icons\bounty.paa";
        	x = 0.31; y = 0.32;
			w = 0.04; h = 0.04;
		};

		class bountyText : w_RscText {
			idc = bounty_text;
			text = "";
			sizeEx = 0.03;
			x = 0.35; y = 0.313;
			w = 0.3; h = 0.05;
		};
	};

	class controls {
		class itemList : w_Rsclist {
			idc = item_list;
			x = 0.49; y = 0.200;
			w = 0.235; h = 0.325;
		};

		class DropButton : w_RscButton {
			text = "Drop";
			onButtonClick = "1 execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.610; y = 0.54;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class UseButton : w_RscButton {
			text = "Use";
			onButtonClick = "0 execVM 'client\systems\playerMenu\itemfnc.sqf'";
			x = 0.48; y = 0.54;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class EarplugsButton : w_RscButton {
			text = "Earplugs";
			onButtonClick = "call toggleEarplugs;";
			x = 0.35; y = 0.42;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class PlayerNamesButton : w_RscButton {
			text = "Player Names";
			onButtonClick = "call togglePlayerNames;";
			x = 0.35; y = 0.48;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class SpawnBicyleButton : w_RscButton {
			text = "Deploy Bicycle";
			onButtonClick = "[] spawn spawnBicycle;";
			x = 0.35; y = 0.54;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class FlipVehicleButton : w_RscButton {
			text = "Flip Vehicle";
			onButtonClick = "call flipVehicle;";
			x = 0.35; y = 0.60;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class moneyInput: w_RscEdit {
			idc = money_value;
			x = 0.625; y = 0.605;
			w = 0.10; h = 0.02 * safezoneH;
			sizeEx = 0.03;
		};

		class DropcButton : w_RscButton {
			text = "Drop Money";
			onButtonClick = "execVM 'client\systems\playerMenu\dropMoney.sqf'";
			x = 0.48; y = 0.60;
			w = 0.135; h = 0.033 * safezoneH;
		};

		class CloseButton : w_RscButton {
			text = "Close";
			onButtonClick = "closeDialog 0;";
			x = 0.02; y = 0.68;
			w = 0.125; h = 0.033 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class GroupsButton : w_RscButton {
			idc = groupButton;
			text = "Group Management";
			onButtonClick = "execVM 'client\systems\groups\loadGroupManagement.sqf'";
			x = 0.150; y = 0.68;
			w = 0.225; h = 0.033 * safezoneH;
		};

		class btnDistanceNear : w_RscButton {
			text = "Near";
			onButtonClick = "setViewDistance 1100;";
			x = 0.02; y = 0.45;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class btnDistanceMedium : w_RscButton {
			text = "Medium";
			onButtonClick = "setViewDistance 2200;";
			x = 0.02; y = 0.50;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class btnDistanceFar : w_RscButton {
			text = "Far";
			onButtonClick = "setViewDistance 3300;";
			x = 0.02; y = 0.55;
			w = 0.125; h = 0.033 * safezoneH;
		};

		class btnDistanceInsane : w_RscButton {
			text = "Insane";
			onButtonClick = "setViewDistance 5000;";
			x = 0.02; y = 0.60;
			w = 0.125; h = 0.033 * safezoneH;
		};

	};

};
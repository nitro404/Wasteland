#include "buildingStoreDefines.sqf"

class buildingStoreDialog {

	idd = buildingStore_DIALOG;
	movingEnable = true;
	enableSimulation = true;
	onLoad = "execVM 'client\systems\buildingStore\populateBuildingStore.sqf'";

	class controlsBackground {

		class MainBackground: w_RscPicture {
			idc = -1;
			text = "\ca\ui\data\ui_background_controlers_ca.paa";
			x = 0.35 * safezoneW + safezoneX;
			y = 0.15 * safezoneH + safezoneY;
			w = 0.35 * safezoneW;
			h = 0.661111 * safezoneH;
		};

		class DialogTitleText: w_RscText {
			idc = -1;
			text = "Available Buildings";
			x = 0.355 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};

		class PriceText: w_RscText {
			idc = buildingStore_price;
			text = "Price: $0";
			x = 0.53 * safezoneW + safezoneX;
			y = 0.175 * safezoneH + safezoneY;
			w = 0.0844792 * safezoneW;
			h = 0.0448148 * safezoneH;
		};

	};

	class controls {

		class BuildingList: w_RscListbox {
			idc = buildingStore_item_list;
			onLBSelChanged = "[] spawn buildingItemInfo";
			x = 0.37 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.22 * safezoneW;
			h = 0.49 * safezoneH;
		};

		class BuyBuildingButton: w_RscButton {
			idc = buildingStore_buy_button;
			onButtonClick = "ctrlEnable[buildingStore_buy_button, false]; execVM 'client\systems\buildingStore\buyBuilding.sqf';";
			text = "Buy";
			x = 0.52 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.072 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.1,0.95,0.1,1};
		};

		class CancelButton: w_RscButton {
			idc = -1;
			onButtonClick = "closeDialog 0;";
			text = "Cancel";
			x = 0.36 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.072 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

		class ClearButton: w_RscButton {
			idc = -1;
			onButtonClick = "execVM 'client\systems\buildingStore\clearArea.sqf';";
			text = "Clear Area";
			x = 0.432 * safezoneW + safezoneX;
			y = 0.750 * safezoneH + safezoneY;
			w = 0.072 * safezoneW;
			h = 0.040 * safezoneH;
			color[] = {0.95,0.1,0.1,1};
		};

	};

};

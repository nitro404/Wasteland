//	@file Version: 1.0
//	@file Name: briefing.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 30th May 13

player createDiarySubject ["Event Horizon Gaming", "Event Horizon Gaming Information"];
player createDiarySubject ["Changelog", "Rolling Thunder Wasteland Changelog"];
player createDiarySubject ["Wasteland", "What Is Wasteland?"];

player createDiaryRecord["Changelog",
[
"0.0.1",
"	<br/>
	Date: August 17, 2015<br/>
	<br/>
	General:<br/>
		+ Removed food and water / hunger & thirst system.<br/>
		+ Disabled dynamic weather.<br/>
		+ Enabled full speed running with base pieces.<br/>
		+ Disabled global communication channel.<br/>
		+ Players now spawn with:<br/>
			- Glock 17 & 4 magazines<br/>
			- Binoculars<br/>
			- GPS<br/>
			- Full Fuel Can<br/>
			- Minimum $800<br/>
		+ Simplified money dropping / pickup to reduce exploits, no more animation or delay.<br/>
		+ Added option for HALO jumping out of air vehicles to the bottom of the scroll menu.<br/>
		+ Removed item and money dropping cooldown.<br/>
		+ Players now drop camo nets and spawn beacons on death.<br/>
		+ Disabled towing script on dropped items.<br/>
		+ Updated player skins:<br/>
			- Replaced all medic skins with corpsman skin to fix reduced inventories.<br/>
			- Replaced all field technician skins with saboteur skin to fix offset player sights.<br/>
			- Replaced independent officer skin with better suited camo warlord skin.<br/>
		+ Fuel cans now give 75% fuel for air vehicles, 25% for tanks and 50% for anything else.<br/>
		+ Added group management to blu-for and op-for.<br/>
		+ Other group members can now be promoted to leader.<br/>
		+ Any member of a group can invite new players.<br/>
		+ Player names are now displayed when the windows key is pressed.<br/>
		+ Player markers now display from up to 5km away.<br/>
		+ Removed player graves.<br/>
		+ Added vehicle hit-n-run teamkill check.<br/>
	<br/>
	Interface:<br/>
		+ Added new loading splash screen.<br/>
		+ Added background image to respawn screen.<br/>
		+ Added icons for camo nets and spawn beacons in general store.<br/>
		+ Adjusted player health / money info position on hud.<br/>
	<br/>
	Player Menu:<br/>
		+ Added button to spawn a bicycle.<br/>
		+ Added button to flip a ground vehicle rightside up that is within 10m of the player.<br/>
		+ Added text field to allow the player to type the amount of money to drop.<br/>
			- Money text input field contains the player’s total money by default.<br/>
			- Money info label and input text field now update as money is dropped.<br/>
		+ Player money label and input field now update automatically.<br/>
		+ Added server uptime and server frame rate information.<br/>
	<br/>
	Spawn System:<br/>
		+ Added new and improved spawning system!<br/>
		+ Added random HALO jump option to spawn menu.<br/>
		+ Independent players can now spawn on beacons without requiring a group.<br/>
		+ When spawning on a beacon you now face the direction the beacon was placed.<br/>
		+ Added altimeter & help message for deploying parachute to all HALO jump options.<br/>
		+ Multiple pages of spawn locations can now be viewed in the spawn screen.<br/>
		+ Spawn beacons now indicate their relative position & the direction they are facing.<br/>
		+ Players can now place new spawn beacons (old ones are de-activated, but not removed from the world).<br/>
		+ Spawn beacons are now placed in front of the player and no longer cause damage.<br/>
		+ Added checks so spawn beacons cannot be placed over water or out of map boundaries.<br/>
		+ Added E hotkey to remove parachute while HALO jumping or parachuting out of a vehicle.<br/>
	Repair Centers:<br/>
		+ Added new repair centers:<br/>
			- West of Petrovka<br/>
			- West of Gorka<br/>
			- North of Myshkino<br/>
			- South of Pobeda Dam<br/>
			- North of Cap Golovav
			- East of Vyshnoye<br/>
		+ Repair pads do not break re-arm cycle if you move away from them.<br/>
		+ Maximum vehicle speed of 100 km/h set for vehicle re-arm trigger.<br/>
		+ Repair pads now also work with tanks, apcs and jets.<br/>
	<br/>
	Stores:<br/>
		+ Added new general store to Lopatino.<br/>
		+ Added new gun stores to Vybor, Berezino and Tulga.<br/>
		+ Added new helicopter stores:<br/>
			- West of Moglievka<br/>
			- East of Myshkino<br/>
			- North of Gorka<br/>
	<br/>
	Static Spawns:<br/>
		+ Reduced static vehicle and weapon crate spawn offsets.<br/>
		+ Increased initial number of static helicopter spawns to 26.<br/>
		+ Disabled random static helicopter wreck spawns.<br/>
		+ Updated static vehicle spawn lists to include new vehicles.<br/>
		+ Changed spawn list rarities to 20% apcs, 50% military and 30% civilian.<br/>
		+ Ground vehicles now spawn with 2-6 random weapons, with 4-6 magazines for each.<br/>
		+ Added 32 initial static weapon crate spawns.<br/>
		+ Moved spawn locations off of airfields to remove clutter and debris.<br/>
		+ Added An2 bi-planes to airfields.<br/>
			- Bi-planes have (2x) 500 Vickers machine gun rounds and 16 SPG-9 HE rockets.<br/>
			- Respawn timer for bi-planes is set to 10 minutes.<br/>
			- North west airfield has 4 bi-plane spawns and Balota / north east airfield have 2 spawns.<br/>
		+ Added C130J bomber with (2x) 6 GBU-12 bombs to Balota airfield.<br/>
		+ Added MQ9 Predator Drone to north west airfield.<br/>
		+ Added L39ZA jet to north east airfield.<br/>
			- Respawn timer for special air vehicles is set to 30 minutes.<br/>
	<br/>
	Missions:<br/>
		+ Removed mobile radar and VIP missions.<br/>
	<br/>
	Bug Fixes:<br/>
		+ Fixed tons of script errors and bugs.<br/>
"
]
];

player createDiaryRecord["Event Horizon Gaming", [
	"Credits",
"	<br/>
	Event Horizon Developers:<br/>
		- nitro glycerine<br/>
		- Skipwich<br/>
		- Tesla<br/>
		- BRPC<br/>
	<br/>
	Event Horizon Artists:<br/>
		- with_milk<br/>
	<br/>
	Event Horizon Testers & Administrators:<br/>
		- Mawson<br/>
		- Dropy<br/>
		- U_T<br/>
		- Bat Manning<br/>
		- Sponty<br/>
		- Mobley<br/>
		- Northern Petrol<br/>
		- Yams<br/>
		- jaeger<br/>
		- Xinova<br/>
		- Corpsegrinder<br/>
		- Alpha Wing<br/>
"
]
];

player createDiaryRecord["Event Horizon Gaming",
[
"Bug and Cheat Reporting",
"	<br/>
	Found a bug? Please report it at: www.eventhorizongaming.net<br/>
	<br/>
	Suspect a player is hacking or exploiting? Please report it at: www.eventhorizongaming.net
"
]
];

player createDiaryRecord["Event Horizon Gaming",
[
"Teamspeak",
"	<br/>
	There is a public Teamspeak 3 server available for players of this server.<br/>
	<br/>
	Teamspeak IP: ts.eventhorizongaming.net<br/>
	<br/>
	Feel free to join and say hello!
"
]
];

player createDiaryRecord["Wasteland",
[
"Hints & Tips",
"	<br/>
	At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.<br/><br/>
	When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, castles, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.<br/><br/>
	If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.<br/><br/>
	Always be on the lookout for nightvision. Two pairs are located in the Large Cache, and there are pairs scattered throughout cars. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.<br/><br/>
	When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.<br/><br/>
	The helicopter from the side mission spawns with no fuel, so do not make a mad dash for the chopper unless you are armed and plan to protect it, or have some fuel which can be found in the fuel truck, or in the palated barrels from the abandoned base.<br/>
	There are very aggressive AI characters that spawn with most side missions and will protect the mission objectives with deadly force, be aware of them.<br/>
"
]
];

player CreateDiaryRecord["Wasteland",
[
"Welcome to Wasteland!",
"	<br/>
	Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction, scavenge supplies, weapons, and vehicles, and destroy the other factions. It is survival at its best! Keep in mind this is a work in progress.
	<br/><br/>

	FAQ<br/>
	Q. What am I supposed to do here?<br/>
	A. See the above description<br/>
	<br/>
	Q. Where can I get a gun?<br/>
	A. Weapons are found in one of three places, first in ammo caches that randomly spawn around the map inside and outside buildings, and second, in the gear section of the vehicles, which also randomly spawn around the map. The last place to find a gun would be at the gunshops located throughout the map. You can also find them on dead players whose bodies have not yet been looted.
	<br/><br/>
	Q. What are the circles on the map?<br/>
	A. The circles represent town limits. If friendly soldiers are in a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.
	<br/><br/>
	Q. Why is it so dark, I cant see.<br/>
	A. The server has a day/night cycle just like in the real world, and as such, night time is a factor in your survival. It is recommended that you find sources of light or Night Vision Goggles before the darkness sets in. You can find night vision goggles in vehicles, or you can purchase them at the gunshops.
	<br/><br/>
	Q. Is it ok for me to shoot my team mates?<br/>
	A. If you are member of BLUFOR or OPFOR teams, then you are not allowed to shoot or steam items and vehicles from other players. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.
	<br/><br/>
	Q. I saw someone breaking a rule, what do I do?<br/>
	A. Simply go into global chat and get the attention of one of the admins or visit www.eventhorizongaming.net and make a report if the offence is serious.
	<br/>
"]
];

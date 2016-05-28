//	@file Version: 1.0
//	@file Name: briefing.sqf
//	@file Author: nitro glycerine
//	@file Created: August 17, 2015

player createDiarySubject ["Event Horizon Gaming", "Event Horizon Information"];
player createDiarySubject ["Changelog", "Rolling Thunder Changelog"];
player createDiarySubject ["Coming Soon", "Upcoming Features"];
player createDiarySubject ["Wasteland", "What Is Wasteland?"];

player createDiaryRecord["Changelog", [
"1.0",
"Date: Februrary 14, 2016<br/>
<br/>
General:<br/>
	+ Removed food and water / hunger &amp; thirst system.<br/>
	+ Disabled dynamic weather.<br/>
	+ Enabled full speed running with base pieces.<br/>
	+ Disabled global communication channel.<br/>
	+ Players now spawn with:<br/>
		- Glock 17 &amp; 4 magazines<br/>
		- Binoculars<br/>
		- GPS<br/>
		- Full Jerry Can<br/>
		- Minimum $800<br/>
	+ Fixed players being able to spawn on top trees when spawning in towns and falling to their death.<br/>
	+ Added script to make all default / initial buildings indestructible.<br/>
	+ Simplified money dropping / pickup to reduce exploits, no more animation or delay.<br/>
	+ Added messages to display how much money the player has dropped.<br/>
	+ Added one minute cooldown (with messages) for dropping money.<br/>
	+ Killing AI now rewards money to player directly.<br/>
	+ Squishing AI with a vehicle also yields a money reward.<br/>
	+ Added option for HALO jumping out of air vehicles to the bottom of the scroll menu.<br/>
	+ HALO jumping out of air vehicles now shows location info text.<br/>
	+ Removed item dropping cooldown.<br/>
	+ Players now drop camo nets and spawn beacons on death.<br/>
	+ Disabled towing script on dropped items.<br/>
	+ Updated player skins:<br/>
		- Replaced all medic skins with corpsman skin to fix reduced inventories.<br/>
		- Replaced all field technician skins with saboteur skin to fix offset player sights.<br/>
		- Replaced independent officer skin with better suited camo warlord skin.<br/>
		- Replaced all half-ghillie skins with full ghillies.<br/>
	+ Jerry cans now give 75% fuel for air vehicles, 25% for tanks and 50% for anything else.<br/>
	+ Players can now refuel jerry cans from propane tanks, gas stations and fuel trucks.<br/>
	+ Doubled interaction range from 5 to 10 metres for repairing and refueling actions.<br/>
	+ Repair and refuel scripts now display the type of targeted vehicle.<br/>
	+ Added group management to blu-for and op-for.<br/>
	+ Other group members can now be promoted to leader.<br/>
	+ Fixed kick, disband and promote buttons not disabling after promoting a new leader.<br/>
	+ Any member of a group can invite new players.<br/>
	+ Invitable player list no longer shows players already in your group.<br/>
	+ Player markers now display from up to 5km away.<br/>
	+ Removed player graves.<br/>
	+ Added vehicle hit-n-run teamkill check.<br/>
	+ Added new town spawns for:<br/>
		1. Three Valleys<br/>
		2. Vysota (North Chernogorsk)<br/>
		3. Pass Sosnovy (South Pustoshka)<br/>
	<br/>
	Continued on next page...<br/>
		4. East Dolina<br/>
		5. North Dubrovka<br/>
		6. Devil's Pit (West Ghozdno)<br/>
		7. Windy Valley (South Kozlovka)<br/>
		8. Moglievka Pass (South-East Moglievka)<br/>
		9. North Balota<br/>
	+ Added lock so players cannot spawn multiple times before the dialog is dismissed.<br/>
	+ Player scores now increment properly when AI and enemy independent players (while on independent) are killed with a hand-held weapon or are road killed.<br/>
	+ Player scores now decrement when friendly units are road killed (including independent group members).<br/>
<br/>
Interface:<br/>
	+ Added new loading splash screen.<br/>
	+ Added background image to respawn screen.<br/>
	+ Player names / markers are now toggled when the windows key is pressed.<br/>
	+ Added lock to player name toggle to prevent flickering when held.<br/>
	+ Added icons for camo nets and spawn beacons in general store.<br/>
	+ Adjusted player health / money info position on hud.<br/>
	+ Friendly spawn beacons now show up in the map.<br/>
	+ Added ability to lock and unlock vehicles.<br/>
<br/>
Player Menu:<br/>
	+ Added button to deploy a random bicycle (has a 10 second cooldown).<br/>
	+ Added context menu options to pack up bicycles.<br/>
	+ Added button to flip a ground vehicle rightside up that is within 10m of the player (has a 10 second cooldown).<br/>
	+ Added text field to allow the player to type the amount of money to drop.<br/>
		- Money text input field contains the player’s total money by default.<br/>
		- Money info label and input text field now update as money is dropped.<br/>
	+ Player money label and input field now update automatically.<br/>
	+ Added server uptime and server frame rate information.<br/>
	+ Added player menu buttons for toggling player names and earplugs.<br/>
<br/>
Player Spawn System:<br/>
	+ Added new and improved spawning system!<br/>
	+ Added random HALO jump option to spawn menu.<br/>
	+ Independent players can now spawn on beacons without requiring a group.<br/>
	+ When spawning on a beacon you now face the direction the beacon was placed.<br/>
	+ Added altimeter &amp; help message for deploying parachute to all HALO jump options.<br/>
	+ Multiple pages of spawn locations can now be viewed in the spawn screen.<br/>
	+ Spawn beacons now indicate their relative position &amp; the direction they are facing.<br/>
	+ Players can now place new spawn beacons (old ones are de-activated, but not removed from the world).<br/>
	+ Spawn beacons are now placed in front of the player and no longer cause damage.<br/>
	+ Players are now allowed to have one active spawn beacon per faction (although it can't be used unless the player is currently on that team).<br/>
	+ Added checks so spawn beacons cannot be placed over water or out of map boundaries.<br/>
	+ Added E hotkey to remove parachute while HALO jumping or parachuting out of a vehicle.<br/>
<br/>
	<br/>
	Continued on next page...<br/>
Repair Centers:<br/>
	+ Added new repair centers:<br/>
		- West of Petrovka<br/>
		- West of Gorka<br/>
		- North of Myshkino<br/>
		- South of Pobeda Dam<br/>
		- North of Cap Golova<br/>
		- East of Vyshnoye<br/>
	+ Repair pads do not break re-arm cycle if you move away from them.<br/>
	+ Maximum vehicle speed of 100 km/h set for vehicle re-arm trigger.<br/>
	+ Repair pads now also work with tanks, apcs and jets.<br/>
	+ Repair centers now repair and refuel vehicles before rearming them.<br/>
	+ Added one minute cooldown (with messages) for using repair centers.<br/>
	+ Added medical tents to all repair centers.<br/>
<br/>
Stores:<br/>
	+ Added new general store to Lopatino.<br/>
	+ Added new gun stores to Vybor, Berezino and Tulga.<br/>
	+ Added new helicopter stores:<br/>
		- West of Pusta<br/>
		- East of Myshkino<br/>
		- North of Gorka<br/>
	+ Added new base building part stores:<br/>
		- East of Kamenka<br/>
		- East of Pulkovo<br/>
		- East of Msta<br/>
		- Old Fields (North of Novy Sobor)<br/>
		- West of Petrovka<br/>
		- North of Olsha<br/>
	+ Stores now show when friendly and / or enemy players are present.<br/>
	+ Stores are now exclusively scroll to interact instead of pressing E.<br/>
	+ Cleaned up random building parts around some gun stores.<br/>
	+ Added structures around stores.<br/>
<br/>
Static Spawns:<br/>
	+ Replaced old static spawn scripts with new and improved scripts.<br/>
	+ Added random boat spawning and re-spawning scripts.<br/>
		- Bonus boats spawn at Black Lake, Pobeda Dam, Topolka Dam and Prud.<br/>
	+ Added new, more efficient scripts for respawning vehicles in towns as well as helicopters and boats at their custom spawn locations.<br/>
	+ Added weighed categorized lists for land vehicle, helicopter, boat, weapon crate, static weapon and building part spawns.<br/>
		- Land vehicle weights: 25% for civilian, 8% for utility, 54% light armor, 11% for medium armor and 2% for heavy armor vehicles.<br/>
		- Helicopters weights: 8% for light, 35% for transport, 55% for light attack and 2% for heavy attack helicopters.<br/>
		- Boat weights: 50% RHIB, 40% PBX, 10% civilian boats.<br/>
	+ Updated random vehicle weapon script to account for both max weapon and magazine storage capacity.<br/>
	+ Removed static spawn map markers.<br/>
	<br/>
	Continued on next page...<br/>
	+ Increased initial number of static helicopter spawns to 90.<br/>
	+ Removed random static helicopter wreck spawns.<br/>
	+ Updated static vehicle spawn lists to include new vehicles.<br/>
	+ Added weapon crate static spawns in towns.<br/>
	+ Ground vehicles now spawn with 2-6 random weapons, with 4-6 magazines for each.<br/>
	+ Added new and improved random weapon list with weighted categories and more weapons for use with AI and vehicles.<br/>
	+ Vehicles also have a chance to spawn night vision goggles, rangefinders and laser designators (with a battery pack).<br/>
	+ Added An2 bi-planes to airfields.<br/>
		- Bi-planes have (2x) 500 Vickers machine gun rounds and 16 SPG-9 HE rockets.<br/>
		- Respawn timer for bi-planes is set to 10 minutes.<br/>
		- North west airfield has 4 bi-plane spawns and Balota / north east airfield have 2 spawns.<br/>
	+ Added C130J bomber with (2x) 6 GBU-12 bombs to Balota airfield.<br/>
	+ Added MQ9 Predator Drone to north west airfield.<br/>
	+ Added L39ZA jet to north east airfield with 3 additional magazines of GSh23L.<br/>
	+ Respawn timer for special air vehicles is set to 30 minutes.<br/>
<br/>
Vehicle Improvements:<br/>
	+ M2A3 Bradley and M6 Linebacker now have new woodland camouflage textures.<br/>
	+ Ka60 (without M32) now has a flare launcher with a 120 round magazine.<br/>
	+ AH64D now has a 120 round flare magazine instead of 60.<br/>
<br/>
AI:<br/>
	+ Replaced old AI spawn scripts with new and improved system.<br/>
	+ AI are now spawned randomly within a specified radius with random weapons corresponding to their specified class type.<br/>
	+ There are now 5 different AI classes which are assigned from a list of class types:<br/>
		1. Rifleman<br/>
		2. Machine Gunner<br/>
		3. Sniper<br/>
		4. Anti-Tank<br/>
		5. Anti-Air<br/>
	+ Each AI class type has its own unique skin.<br/>
	+ AI now have a chance to spawn with binoculars, rangefinders or a laser designator and night vision goggles.<br/>
	+ All AI now also spawn with a random secondary weapon.<br/>
	+ Anti-Tank and Anti-Air AI also spawn with a random rifle.<br/>
<br/>
Missions:<br/>
	+ Removed mobile radar and VIP missions.<br/>
	+ Added new and improved mission controllers and mission scripts.<br/>
	+ There are currently 5 mission types, each of which can be active simultaneously:<br/>
		1. Armored Personnel Carrier Mission: M2A3 Bradley, M6 Linebacker, BMP3<br/>
		2. Main Battle Tank Mission: M1A2 Tusk, T90, FV510 Warrior 2<br/>
		3. Anti-Air Vehicle Mission: 2S6M Tunguska<br/>
		4. Attack Helicopter Mission: Mi-24P, Mi-24V, Mi-24D<br/>
		5. Geo Cache Mission: 2-3 random weapon crates<br/>
	+ Added AI count to mission markers.<br/>
	+ Mission markers now turn green when mission is completed.<br/>
	+ Fixed and simplified mission marker synchronizing.<br/>
	<br/>
	Continued on next page...<br/>
	+ Added simple bases to missions.<br/>
	+ Leftover base parts are cleaned up 2 minutes after mission is completed.<br/>
	+ There is up to 1 of each mission type active at any given time, except for geo caches which can be up to 2.<br/>
	+ Different mission types now use different lists when choosing a spawn location.<br/>
	+ Updated missions to use new randomized AI spawning scripts.<br/>
<br/>
Bounty System:<br/>
	+ Added preliminary simplified version of bounty system.<br/>
	+ Current bounty value is displayed in player menu with custom icon.<br/>
	+ Bounties always start with a value of 0.<br/>
	+ Player bounty increases by 50 for killing AI and 100 for killing enemy players.<br/>
	+ Player bounties are only claimed when they are killed by an enemy (they persist through team killing and suicide).<br/>
	+ An additional $100 is added to the claimed bounty when you kill an enemy player.<br/>
<br/>
Cleanup Manager:<br/>
	+ Replaced old FSM cleanup script with new and improved cleanup manager.<br/>
	+ Vehicles and objects are cleaned up with different conditions:<br/>
		- Mission and special vehicles are exempt from cleanup.<br/>
		- If there is any player alive and within 150 metres of a vehicle, it will not be cleaned up. A timer is started as soon as no activity is detected.<br/>
		- Player and AI corpses: 15 minutes<br/>
		- Vehicle husks: 5 minutes<br/>
		- Craters from crashed air vehicles: 10 minutes<br/>
		- Weapon piles: 30 minutes<br/>
		- Money (if less than $250): 15 minutes<br/>
		- Repair kits, medkits, Camo nets (backpack item) and jerry cans: 20 minutes<br/>
		- Abandoned bicycles: 5 minutes<br/>
		- Abandoned and immobile vehicles: 10 minutes<br/>
<br/>
Bug Fixes:<br/>
	+ Fixed tons of script errors and bugs.<br/>
	+ Cleaned up lots of unused and duplicated code.<br/>
	+ Fixed old spawn beacons being deactivated before new beacon is placed.<br/>"
]];

player createDiaryRecord["Coming Soon", [
"Upcoming Features",
"We have lots of cool new features planned for the mission! Here is a brief list of items to give you an idea of what to expect in the near future:<br/>
<br/>
Persistence<br/>
	+ Player inventory, gear, backpack, health, money, bounty, location, settings will be saved!<br/>
	+ Spawn beacons, special / mission vehicles, locked base parts and their contents will also save!<br/>
	+ Persistence currently being worked on with a custom-designed server plugin!<br/>
<br/>
Improved Interface<br/>
	+ Spawn loadouts will be choosable from the respawn screen and saved to the database!<br/>
	+ Store interfaces, functionality and contents will be overhauled!<br/>
	+ New stores!<br/>
	+ Improved bounty system!<br/>
	+ Custom scoreboard!<br/>
<br/>
Missions<br/>
	+ Tasks will be added to task list for active missions.<br/>
	+ More new and improved bases will be added for missions.<br/>
	+ New mission types and rewards!<br/>
	+ Overhaul of towing script with bug fixes and tons of improvements!<br/>
<br/>
Spawning<br/>
	+ Ability to spawn inside of friendly air vehicles!<br/>
	+ Ground spawn beacons!<br/>
<br/>
Base Building<br/>
	+ New and improved base building with features like snapping and keybinds!<br/>
<br/>
And may more features to come!"
]];

player createDiaryRecord["Event Horizon Gaming", [
"Credits",
"Event Horizon Developers:<br/>
	- nitro glycerine<br/>
	- Skipwich<br/>
	- BRPC<br/>
<br/>
Event Horizon Artists:<br/>
	- with_milk<br/>
	- Nash<br/>
<br/>
Event Horizon Testers &amp; Administrators:<br/>
	- Mawson<br/>
	- U_T<br/>
	- Sponty<br/>
	- Mobley<br/>
	- Northern Petrol<br/>
	- Alhazred<br/>
	- PyroStalker<br/>
	- Yams<br/>
	- jaeger<br/>
	- Xinova<br/>
	- Corpsegrinder<br/>
	- Alpha Wing<br/>
<br/>
Special Thanks:<br/>
	- Dropy<br/>"
]];

player createDiaryRecord["Event Horizon Gaming", [
"Bug and Cheat Reporting",
"Found a bug? Please report it at: http://www.eventhorizongaming.net<br/>
<br/>
Suspect a player is hacking or exploiting? Please report it at: http://www.eventhorizongaming.net"
]];

player createDiaryRecord["Event Horizon Gaming", [
"Teamspeak",
"<br/>
There is a public Teamspeak 3 server available for players of this server.<br/>
<br/>
Teamspeak IP: ts.eventhorizongaming.net<br/>
<br/>
Feel free to join and say hello, or if you're looking to team up with another group!"
]];

player createDiaryRecord["Wasteland", [
"Hints & Tips",
"At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.<br/><br/>
When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, castles, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.<br/><br/>
If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.<br/><br/>
Always be on the lookout for nightvision. Two pairs are located in the Large Cache, and there are pairs scattered throughout cars. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.<br/><br/>
When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.<br/><br/>
There are very aggressive AI characters that spawn with most side missions and will protect the mission objectives with deadly force, be aware of them.<br/>"
]];

player CreateDiaryRecord["Wasteland", [
"Welcome to Wasteland!",
"Wasteland is a team versus team versus team sandbox survival experience. The objective of this mission is to rally your faction / group members, scavenge weapons, base parts and vehicles, and use them destroy other groups / factions. This server is armor focused, so expect to encounter a lot of tanks and armored personel carriers! It is survival of the fittest! Please keep in mind that this is a work in progress. Have fun!
<br/><br/>
FAQ<br/>
Q. Where can I get a gun?<br/>
A. Weapons are found in a number of different places:<br/>
	- In weapon caches that randomly spawn in towns.<br/>
	- Inside the gear of vehicles.<br/>
	- Weapons can be purchased from one of many gun stores scattered around the map.<br/>
	- On the corpses of dead players or AI at missions.<br/>
<br/>
Q. What are the circles on the map?<br/>
A. The circles represent town and store limits. The circle will appear green if friendly units are present, red if enemies are present and orange if both enemy and friendly units are present. If friendly soldiers are in range of a town, you can spawn there from the re-spawn menu; however if there is an enemy presence, you will not be able to spawn there.<br/>
<br/>
Q. Is it ok for me to shoot my team mates?<br/>
A. If you are member of BLUFOR or OPFOR teams, then you are not allowed to shoot or steam items and vehicles from your teammates. If you play as Independent, you are free to engage anyone as well as team up with anyone you want.<br/>
<br/>
Q. I saw someone breaking a rule, what do I do?<br/>
A. If you wish to report an incident or concern, please join our TeamSpeak server at ts.eventhorizongaming.net and report it to a server administrator / moderator. If no admins are available, please visit our website at http://www.eventhorizongaming.net and submit a report. Please provide as much evidence as you can to enforce your report, whether it be screenshots, recorded video footage, chat logs, etc.<br/>"
]];

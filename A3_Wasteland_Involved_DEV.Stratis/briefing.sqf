// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["infos", "Infos and Help"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];

player createDiaryRecord ["changelog",
[
"v1.0",
"
<br/> [Added] Custom scoreboard
<br/> [Added] Mission and store vehicle saving
<br/> [Added] Player markers on GPS and UAV Terminal
<br/> [Added] Holster actions
<br/> [Changed] Full rewrite of side mission system
<br/> [Changed] Windows key toggles player marker names too
<br/> [Changed] New loading picture by Gameaholic.se
<br/> [Fixed] Weapon sometimes disppearing when moving objects
<br/> [Fixed] More money duping exploits
<br/> [Fixed] Store menu sizes on smaller aspect ratios
<br/> [Fixed] Hunger and thirst reset on rejoin
<br/> [Fixed] Other minor optimizations and fixes
"
]];
player createDiaryRecord ["changelog",
[
"Version : 0.9i Involved 04/08/2014",
"
<br/>	[AJOUT]		Caisse de stuff under the dome
<br/>	[FIX]		Bogue des conteneurs réarmement véhicule
<br/>	[FIX]		Prix des TWS & Nightstalker plus élevé
<br/>	[AJOUT]		Ajout de JVN à l'apparition
<br/>	[AJOUT]		Ajout d'icone involved player menu
<br/>	[FIX]		Slot sapeur corriger
<br/>	[FIX]		Slot civil supprimer
<br/>	[FIX]		Bogue bureau vendeur d'arme
<br/>	[FIX]		Correction de la fatigue
<br/>
<br/> [Added]  Marqueur d'escouade
<br/> [Added]  Image d'intro
<br/> [Added]  Droit modo/admin
<br/> [Added]  Suppression Side et Global canal
<br/> [Added]  Rez coéquipier
<br/> [Changed]  Traduction
<br/> [Fixed]  Error messages in various menus
<br/>[AJOUT]     Empecher la deconnexion si personnel à proximité
<br/>[AJOUT]     Système de revive
<br/>[AJOUT]     Ajouter la possibiliter d'achever les gens d'un balle dans la tête. [FAIT,à debuguer en multi?]
<br/>[AJOUT]     Image de chargement
<br/>[AJOUT]     Mapping base
<br/>[AJOUT]     Mapping repar zone + refuel + reaload ammo
<br/>[AJOUT]     Ajout de panneaux publicitaire involved-Gaming
<br/>[FIX]       Bourse sur la droite -> traduction de l'ancien
<br/>[FIX]       Side supp globale
<br/>[FIX]       Supprimer le stuff lors de la deco quand au sol [A TESTER]
<br/>[AJOUT]     Mettre son équipe en temps réel sur la carte ( quand la MAp s'ouvre )
<br/>[FIX]       Droits admin
<br/>[AJOUT]     Parachuter des véhicules depuis le drop hélico + fumigène
<br/>[AJOUT]     Parachutes automatique
<br/>[FIX]       bogue blesser hélico


"
]];
player createDiaryRecord ["changelog",
[
"0.9h",
"
<br/> [Added] Custom revive system based on Farooq's Revive
<br/> [Added] Territory payroll at regular intervals
<br/> [Added] Emergency eject and free parachutes (jump key)
<br/> [Added] Player names toggled with Windows key
<br/> [Added] Increased missile damage against tanks and helis
<br/> [Added] Ability to stash money in weapon crates
<br/> [Added] Ability to sell vehicle inventory at stores
<br/> [Added] More money shipment mission variants
<br/> [Added] Reduced wheel damage from collisions
<br/> [Added] Wreck salvaging
<br/> [Added] Selling bin in stores
<br/> [Added] Karts DLC content in stores
<br/> [Added] Camo sniper rifles in gunstore
<br/> [Added] Repair Offroad in vehicle store
<br/> [Added] Team players on map as server option
<br/> [Added] Unlimited stamina server option
<br/> [Added] Static weapon saving server option
<br/> [Added] More push vehicle actions
<br/> [Added] Paradrop option for airlifted vehicles
<br/> [Added] Preload checkbox on respawn menu
<br/> [Added] Remote explosives store distance restriction
<br/> [Added] Server time multipliers for day and night
<br/> [Added] Addon-less profileNamespace server persistence
<br/> [Added] Linux server compatibility
<br/> [Added] Basic support for headless client
<br/> [Changed] Independent territory capture is now group-based
<br/> [Changed] Towns blocked if more enemies than friendlies
<br/> [Changed] Increased ammo/fuel/repair cargo for resupply trucks
<br/> [Changed] Increased territory capture rewards for Altis
<br/> [Changed] Increased money mission rewards
<br/> [Changed] Weapon loot in buildings now disabled by default
<br/> [Changed] Mission crates loot was made more random
<br/> [Changed] Thermal imaging is now available on UAVs
<br/> [Changed] Increased vehicle store prices
<br/> [Changed] Increased prices for thermal optics
<br/> [Changed] Increased player icons up to 2000m
<br/> [Changed] Improved antihack
<br/> [Changed] Improved FPS
<br/> [Fixed] Vehicle store purchase errors due to server lag
<br/> [Fixed] Corpse created when leaving with player saving
<br/> [Fixed] Custom vehicle damage handling not working
<br/> [Fixed] Indie-indie spawn beacon stealing
<br/> [Fixed] Repair kit and jerrycan distance limit
<br/> [Fixed] Spawn beacon packing and stealing restrictions
<br/> [Fixed] Not able to lock static weapons
<br/> [Fixed] Unbreakable store windows
<br/> [Fixed] Stratis airbase gunstore desk glitches
<br/> [Fixed] Missions sometimes completing instantaneously
<br/> [Fixed] Object ammo/fuel/repair cargo not saving
<br/> [Fixed] Respawn menu aspect ratio on some resolutions
<br/> [Fixed] Minor bugs with group system
<br/> [Fixed] Minor bugs with player items
<br/> [Fixed] Various other minor bugfixes and optimizations
"
]];

player createDiaryRecord ["changelog",
[
"0.9g",
"
<br/> [Added] - Vehicle stores
<br/> [Added] - New lootspawner by Na_Palm, stuff in ALL buildings
<br/> [Added] - New jets and truck added in A3 v1.14
<br/> [Added] - New AAF vehicles added in A3 v1.08
<br/> [Added] - New camos for Mk20 and MX in gunstores
<br/> [Added] - Ability to push plane backwards
<br/> [Added] - Ability to sell quadbike contents like crates
<br/> [Added] - Abort delay during combat when player saving on
<br/> [Changed] - Improved respawn menu
<br/> [Changed] - Respawn now longer to preload destination
<br/> [Changed] - Optimized player icons
<br/> [Changed] - Optimized FPS fix
<br/> [Changed] - Improved server persistence (requires iniDBI v1.4+)
<br/> [Changed] - Improved player saving (server-specific)
<br/> [Changed] - Improved base saving (server-specific)
<br/> [Changed] - Reduced starting gear
<br/> [Changed] - Modified some store prices
<br/> [Changed] - Reduced initial fuel in cars and helis
<br/> [Changed] - Removed Buzzard jet from too short runways
<br/> [Changed] - Removed Kavala castle territory for use as base
<br/> [Changed] - Increased vehicle repair time to 20 sec.
<br/> [Changed] - Increased owner unlocking time to 10 sec.
<br/> [Changed] - Toggling spawn beacon perms is now instant
<br/> [Changed] - Improved Take option for player items
<br/> [Changed] - Added option to cancel towing selection
<br/> [Changed] - Added machine gunner to main mission NPCs
<br/> [Changed] - Added grenadier to side mission NPCs
<br/> [Fixed] - Error messages in various menus
<br/> [Fixed] - Crash when toggling spawn beacon perms
<br/> [Fixed] - Error when hacking warchests
<br/> [Fixed] - Vehicle towing and lifting positions
<br/> [Fixed] - Repair Vehicle option showing for brand new vehicles
<br/> [Fixed] - Vest purchase price
<br/> [Fixed] - Vest and helmet armor value
<br/> [Fixed] - NPC leader now has launcher ammo
"
]];

player createDiaryRecord ["changelog",
[
"0.9f",
"
<br/> [Added] - Money missions
<br/> [Added] - Sell Crate Items option at stores when moving crate
<br/> [Changed] - Reorganized loots for crates and trucks
<br/> [Fixed] - Broken Warchest menu
<br/> [Fixed] - Spawn beacons not working for Independent groups
<br/> [Fixed] - Player icons position inside buildings
<br/> [Fixed] - MRAPs and quadbikes not spawning
<br/> [Fixed] - Broken money rewards for territories
"
]];

player createDiaryRecord ["changelog",
[
"0.9e",
"
<br/> [Added] - Territory system
<br/> [Added] - Jumping option (step over while running)
<br/> [Added] - New weapons from v1.04 update
<br/> [Changed] - Water and food now use water bottles and baked beans
<br/> [Fixed] - Store object purchases not operating as intended
<br/> [Fixed] - Objects purchased from stores not saving properly
<br/> [Fixed] - Minor server-side memory leak
"
]];

player createDiaryRecord ["changelog",
[
"0.9d",
"
<br/> [Added] - Store object purchases
<br/> [Changed] - New UI by KoS
"
]];

player createDiaryRecord ["changelog",
[
"0.9c",
"
<br/> [Changed] - Instant money pickup and drop
<br/> [Changed] - Increased plane and heli spawning odds
<br/> [Fixed] - FPS fix improvements
<br/> [Fixed] - Vehicles disappearing when untowed or airdropped
"
]];

player createDiaryRecord ["changelog",
[
"0.9b",
"
<br/> [Initial release] - Welcome to stratis!
"
]];


player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16' color='#BBBBBB'>Developed by A3Wasteland.com:</font>
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16' color='#BBBBBB'>Original Arma 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16' color='#BBBBBB'>Improved and ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16' color='#BBBBBB'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* Austerror (GitHub)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
<br/>	* Farooq (GitHub)
<br/>	* HatchetHarry (GitHub)
<br/>	* Hub (TeamPlayerGaming)
<br/>	* k4n30 (GitHub)
<br/>	* Krunch (GitHub)
<br/>	* madbull (R3F)
<br/>	* Mainfrezzer (Magnon)
<br/>	* meat147 (GitHub)
<br/>	* Na_Palm (BIS forums)
<br/>	* red281gt (GitHub)
<br/>	* RockHound (BierAG)
<br/>	* s3kShUn61 (GitHub)
<br/>	* Sa-Matra (BIS forums)
<br/>	* Sanjo (GitHub)
<br/>	* SCETheFuzz (GitHub)
<br/>	* Shockwave (A3W forums)
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>	* wiking.at (A3W forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];

player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland Involved modified</font>
<br/>
<br/>* At the start of the game, spread out and find supplies before worrying about where to establish a meeting place or a base, supplies are important and very valuable.
<br/>
<br/>* When picking a base location, it is best advised to pick a place that is out of the way and not so obvious such as airports, cities, map-bound bases, etc. remember, players randomly spawn in and around towns and could even spawn inside your base should you set it up in a town.
<br/>
<br/>* If you spawn in an area with no vehicles or supplies in the immediate area, DO NOT just click respawn from the pause menu, chances are if you search an area of a few hundred meters, you will find something.
<br/>
<br/>* Always be on the lookout for nightvision. they are located in the ammo crates, and there are pairs scattered throughout vehicles. You can also purchase them from the gunstores. Nighttime without them SUCKS, and if you have them, you can conduct stealth raids on enemy bases under the cover of complete darkness.
<br/>
<br/>* When you set up a base, never leave your supplies unguarded, one guard will suffice, but it is recommended you have at least 2, maybe 3 guards at base at all times.
<br/>
<br/>* There are very aggressive AI characters that spawn with most missions and will protect the mission objectives with deadly force, be aware of them.
"
]];

player createDiaryRecord ["infos",
[
"About Wasteland",
"
<br/>Wasteland c'est tout l'inverse de Altis Life, no rules juste fun and no rp just RIP.
<br/>
<br/>FAQ:
<br/>
<br/>Q. Que suis-je supposer faire ici ?
<br/>R. See the above description
<br/>
<br/>Q. Ou je peux avoir une arme ?
<br/>R. Dans votre environnement, autour de vous, dans les véhicules, sur vos ennemis, sur vos amis, bref ouvrez vos yeux !
<br/>
<br/>Q. Qu'est ce que ces ronds sur la carte ?
<br/>R. Les ronds sont les zones à captures, les magasins d'armes, de véhicules, ... Et aussi les zones de spawn ! Mefiez vous donc, les ennemis peuvent être partout !
<br/>
<br/>Q. Pourquoi fait-il si noir ?
<br/>R. Car il faut allez récupérer des JVN (Lunette de vision nocture) dans votre magasin le plus proche.
<br/>
<br/>Q. Les tir fratricides sont-ils permit ?
<br/>R. Non les teams BLUFOR et OPFOR teams ne peuvent pas se tirer dessus. Par contre si vous être indépendant vous être contre tous !
<br/>
<br/>Q. Ou je trouve des grands sacs et un peu de nourriture ?
<br/>R. Comme pour les armes, tout autour de vous, au alors si vous avez un peu de bifton dans le magasin le plus proche.
<br/>
<br/>Q. Si je vois quelqu'un enfriendre une règles je fais quoi ?
<br/>R. Très simple vous appeler un administrateur ou modérateur, ou alors vous filmer et vous allez sur forum.involved-gaming.com
"
]];


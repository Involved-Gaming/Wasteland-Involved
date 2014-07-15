//	@file Name: briefing.sqf

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["infos", "Infos & aide"];
player createDiarySubject ["changelog", "Changelog"];
player createDiarySubject ["credits", "Credits"];

player createDiaryRecord ["changelog",
[
"Version : 0.1 Involved 10/07/2014",
"
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
<br/> [Initial release] - Bienvenu sur Stratis Involved !
"
]];


player createDiaryRecord ["credits",
[
"Credits",
"
<br/><font size='16'>Developed by Team Involved:</font>
<br/>	* S.Lambert
<br/>	* Graincheux
<br/>	* LA10
<br/>	* Altis-Life Involved dev


<br/><font size='16'>Developed by Team Wasteland:</font>
<br/>	* JoSchaap (GoT/Tweakers.net)
<br/>	* AgentRev (TeamPlayerGaming)
<br/>	* MercyfulFate
<br/>	* His_Shadow (KoS/KillonSight)
<br/>	* Bewilderbeest (KoS/KillonSight)
<br/>	* Torndeco
<br/>	* Del1te (404Games)
<br/>
<br/><font size='16'>Original Arma 2 Wasteland missions by:</font>
<br/>	* Tonic
<br/>	* Sa-Matra
<br/>	* MarKeR
<br/>
<br/><font size='16'>Ported to Arma 3 by 404Games:</font>
<br/>	* Deadbeat
<br/>	* Costlyy
<br/>	* Pulse
<br/>	* Domuk
<br/>
<br/><font size='16'>Other contributors:</font>
<br/>	* 82ndab-Bravo17 (GitHub)
<br/>	* afroVoodo (Armaholic)
<br/>	* AWA (OpenDayZ)
<br/>	* bodybag (Gameaholic.se)
<br/>	* code34 (iniDBI)
<br/>	* Das Attorney (Jump MF)
<br/>	* Ed! (404Games forums)
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
<br/>	* SicSemperTyrannis (iniDB)
<br/>	* SPJESTER (404Games forums)
<br/>	* spunFIN (BIS forums)
<br/>	* Tonic (BIS forums)
<br/>
<br/><font size='16'>Thanks A LOT to everyone involved for the help and inspiration!</font>
"
]];


player createDiaryRecord ["infos",
[
"Hints and Tips",
"
<br/><font size='18'>A3Wasteland</font>
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

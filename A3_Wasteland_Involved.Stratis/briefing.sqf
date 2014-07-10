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
<br/> [Added] - Marqueur d'escouade
<br/> [Added] - Parachute automatique (option parajump + perte de sac et largage de smoke)
<br/> [Added] - Image d'intro
<br/> [Added] - Droit modo/admin
<br/> [Added] - Suppression Side et Global canal
<br/> [Added] - Rez coéquipier
<br/> [Changed] - Traduction
<br/> [Fixed] - Error messages in various menus

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
<br/> [Initial release] - Bienvenue sur Stratis Involved !
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
"Trucs & Astuces",
"
<br/><font size='18'>A3Wasteland</font>
<br/>
<br/>* Au début de la partie, éparpissez-vous et trouvez du materiel avant de vous occuper d'un point de rencontre ou d'une base. Le materiel que vous trouverez peut-être important et peut avoir beaucoup de valeur. 
<br/>
<br/>* Quand vous etablissez votre camp de base, il est conseillé de le placer dans un lieu isolé; évitez les aéroports, les villes, les bases, etc. Les joueurs peuvent apparaitre à l'interieur et à l'exterieur des bases et pourrait même apparaitre dans votre base si vous vous êtes placés en ville.
<br/>
<br/>* Si vous apparaissez dans une ville à priori vide NE réapparaissez PAS immédiatement. Vous avez de fortes chances de trouver des fournitures dans un rayon de 100 mètre autour de là où vous vous trouvez.
<br/>
<br/>* Soyez toujours à la recherche de Jumelles de Vision Nocturne
"
]];

player createDiaryRecord ["infos",
[
"F.A.Q Wasteland",
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
<br/>
<br/>Q. Comment faire pour sauter ?
<br/>R. En appuiant sur la touche "v"
<br/>
<br/>Q. Comment faire pour sauter en parachute ?
<br/>R. Dans tous les hélicoptères, aller au dessus des 200m et ralantiser, choisisez l'option Jump en parachute. N'oubliez pas de récupéré votre sac en bas.
"
]];

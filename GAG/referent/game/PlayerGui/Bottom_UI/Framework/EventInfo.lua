local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.Chalk)
local v_u_3 = require(v1.Data.NPCLevels.NPCLevelData)
local v_u_4 = require(v1.Modules.SessionTimeLuckController)
local v10 = {
	["AcidRain"] = {
		["Title"] = "Acid Rain",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#55ff00\">ACIDIC</font>")
	},
	["SpinnerGame"] = {
		["Title"] = "Spinner Game",
		["Description"] = "Beat the minigame to receive an Admin Pack!"
	},
	["AlienAurora"] = {
		["Title"] = "Alien Aurora",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#29e81f\">Alienated</font>")
	},
	["AlienInvasion"] = {
		["Title"] = "Alien Invasion",
		["Description"] = ("\n Small chance of UFOs making fruit %*!"):format("<font color=\"#33fff6\">ALIENLIKE</font>")
	},
	["Armageddon"] = {
		["Title"] = "Armageddon",
		["Description"] = ("EVERYONE IS GOING EXTINCT!!! \nHigher %* Fruit Chance!\nHigher %* Fruit Chance!"):format("<font color=\"#DF6400\">MOLTEN</font>", "<font color=\"#000000\">BURNT</font>")
	},
	["AuroraBorealis"] = {
		["Title"] = "Aurora Borealis",
		["Description"] = ("+50%% Grow Speed! Higher %* Fruit Chance!"):format("<font color=\"#664fb8\">AURORA</font>")
	},
	["BatAttack"] = {
		["Title"] = "Bat Attack",
		["Description"] = ("Bats are flying around! Your fruit can get the %* mutation!"):format("<font color=\"#8b0000\">VAMP</font>")
	},
	["Beanaura"] = {
		["Title"] = "Beanaura",
		["Description"] = ("If 4 or more players hold a Beanstalk, they get the OP %* mutation!"):format("<font color=\"#066600\">BEANBOUND</font>")
	},
	["BeeNado"] = {
		["Title"] = "BeeNado",
		["Description"] = "Your fruit can become POLLINATED!"
	},
	["BeeStorm"] = {
		["Title"] = "BeeStorm",
		["Description"] = "Your fruit can become POLLINATED! Chance of Honey Glazed."
	},
	["BeeSwarm"] = {
		["Title"] = "Bee Swarm",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#ff9500\">POLLINATED</font>")
	},
	["Blackhole"] = {
		["Title"] = "Blackhole",
		["Description"] = ("Small chance for fruit to turn %*!"):format("<font color=\"#E100FF\">Voidtouched</font>")
	},
	["Blizzard"] = {
		["Title"] = "Blizzard",
		["Description"] = ("Higher %* and %* Fruit Chance!"):format("<font color=\"#66ccff\">CHILLED</font>", "<font color=\"#00e5ff\">FROZEN</font>")
	},
	["BloodMoonEvent"] = {
		["Title"] = "Blood Moon",
		["Description"] = ("Your fruit can become %*!"):format("<font color=\"#550000\">BLOODLIT</font>")
	},
	["Boil"] = {
		["Title"] = "Boil Rain!",
		["Description"] = ("Increased %* Fruit Chance!"):format("<font color=\"#f0c18b\">BOIL</font>")
	},
	["BoomboxParty"] = {
		["Title"] = "Boombox Party",
		["Description"] = ("Fruit can turn %*%*%*%*%*!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["Brainrot Portal"] = {
		["Title"] = "Brainrot Portal",
		["Description"] = ("BRAINROTS ATTACK! Higher %* Fruit Chance!"):format("<font color=\"#ff5d52\">BRAINROT</font>")
	},
	["Brainrot Stampede"] = {
		["Title"] = "Brainrot STAMPEDE",
		["Description"] = ("BRAINROT STAMEPEDEE!! Higher %* Fruit Chance!"):format("<font color=\"#ba52ff\">WARPED</font>")
	},
	["ChickenRain"] = {
		["Title"] = "Fried Chicken",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#ffcb2f\">FRIED</font>")
	},
	["ChocolateRain"] = {
		["Title"] = "Chocolate Rain",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#666633\">Chocolate</font>")
	},
	["ChristmasCrackers"] = {
		["Title"] = "Christmas Crackers",
		["Description"] = ("POP! %* %* are appearing around the map! Grab a buddy to open for a reward!"):format("<font color=\"#D2042D\">Christmas</font>", "<font color=\"#D2042D\">Crackers</font>")
	},
	["ChristmasDinner"] = {
		["Title"] = "Christmas Dinner",
		["Description"] = "It\'s time for Christmas Dinner! Cooking speed 2x, Christmas Recipes return double and festive tables appear!"
	},
	["Cooking"] = {
		["Title"] = "Cooking",
		["Description"] = ("Gather all vegetables for the stew!  \nOnce finished, plants will get %* mutation!"):format("<font color=\"#F57327\">COOKED</font>")
	},
	["CorruptZenAura"] = {
		["Title"] = "Corrupted Aura",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#B0171A\">CORRUPT</font>")
	},
	["CrystalBeams"] = {
		["Title"] = "Crystal Beams",
		["Description"] = "Activate all crystals! \nOnce finished, plants have a chance to get a few mutations!"
	},
	["Disco"] = {
		["Title"] = "DISCO",
		["Description"] = ("Small chance for fruit to turn %*%*%*%*%*!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["DiscoApocalypse"] = {
		["Title"] = "Disco Apocalypse",
		["Description"] = ("A rift tears open the dance floor! Survive every round on the right %* for a chance at a %*%*%*%*%* mutation!"):format("<font color=\"#FF4444\">color</font>", "<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#FF007F\">C</font>", "<font color=\"#00FF00\">O</font>")
	},
	["DiscoParty"] = {
		["Title"] = "Disco Party",
		["Description"] = ("Small chance for fruit to turn %*%*%*%*%*!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["Dissonant"] = {
		["Title"] = "Dissonant...",
		["Description"] = ("Roblox is breaking! Fruit can turn %*!"):format("<font color=\"#FB00FF\">GLITCHED</font>")
	},
	["DivineSeedRain"] = {
		["Title"] = "Divine Seed Rain",
		["Description"] = "It\'s raining Divine Seeds! Chance to get any Divine Seed in the restock shop!"
	},
	["DJJhai"] = {
		["Title"] = "DJ Jhai",
		["Description"] = ("Small chance for fruit to turn %*%*%*%*%*!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["DJSandstorm"] = {
		["Title"] = "DJ Sam",
		["Description"] = ("Small chance for fruit to turn %*%*%*%*%*!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["Drought"] = {
		["Title"] = "Drought",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#2dce98\">WILTPROOF</font>")
	},
	["Earthquake"] = {
		["Title"] = "Earthquake",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#8a7f72\">CRACKED</font>")
	},
	["Enchantment"] = {
		["Title"] = "Enchantment",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#FFD229\">ENCHANTED</font>")
	},
	["Eruption"] = {
		["Title"] = "Eruption",
		["Description"] = ("Small chance for fruit to turn %*"):format("<font color=\"#ff4b14\">Volcanic!</font>")
	},
	["Fairies"] = {
		["Title"] = "Fairies",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#ff87f5\">GLIMMERING</font>")
	},
	["FestiveNight"] = {
		["Title"] = "Festive Night",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#164220\">Ornamented</font>")
	},
	["Frost"] = {
		["Title"] = "Frost",
		["Description"] = ("+50%% Grow Speed! Higher %* and %* Fruit Chance!"):format("<font color=\"#66ccff\">CHILLED</font>", "<font color=\"#00e5ff\">FROZEN</font>")
	},
	["FruitBatAttack"] = {
		["Title"] = "Fruit Bats Attack!",
		["Description"] = ("Bats!: increased %* Fruit Chance! + Seed Rewards!"):format("<font color=\"#3d3d3d\">BATTY</font>")
	},
	["FullMoon"] = {
		["Title"] = "Full Moon",
		["Description"] = ("\240\159\145\187 Slightly higher %* chance!"):format("<font color=\"#550000\">BLOODLIT</font>")
	},
	["Gale"] = {
		["Title"] = "Gale",
		["Description"] = ("Super High %* Fruit Chance!"):format("<font color=\"#D3D3D3\">Windstruck</font>")
	},
	["GentleDrizzle"] = {
		["Title"] = "Gentle Drizzle",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#8ea1ad\">MOIST</font>")
	},
	["GiantCandyCaneRain"] = {
		["Title"] = "Giant Candy Cane Rain",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#ff3838\">Peppermint</font>")
	},
	["GiantCauldron"] = {
		["Title"] = "Giant Cauldron",
		["Description"] = "Fill up the Cauldron with fruit to tip it over!"
	},
	["GiantSnowballDodge"] = {
		["Title"] = "Giant Snowball Dodge",
		["Description"] = "Make it to the top to claim a Rare Gift!"
	},
	["GiantSwordPull"] = {
		["Title"] = "Giant Sword",
		["Description"] = ("Pull out the sword for increased %* Fruit Chance!"):format("<font color=\"#E8E8E8\">SLICED</font>")
	},
	["GlassAnimalConcert"] = {
		["Title"] = "Glass Animals - Vampire Bat",
		["Description"] = "Join Glass Animals as they perform their newest hit - Vampire Bat!"
	},
	["HalloweenNight"] = {
		["Title"] = "Halloween Night",
		["Description"] = "The Halloween Event begins! A spooky market has appeared!"
	},
	["Heatwave"] = {
		["Title"] = "Heatwave",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#d76d2d\">SUNDRIED</font>")
	},
	["IceKing"] = {
		["Title"] = "Frozen Ice King",
		["Description"] = ("Awaken the Ice King!: increased %* Fruit Chance!"):format("<font color=\"#82b2ff\">SUBZERO</font>")
	},
	["IceRink"] = {
		["Title"] = "Ice Rink",
		["Description"] = ("Time to slide! Ice skate through all the %* to earn a reward!"):format("<font color=\"#b10000\">hoops</font>")
	},
	["JandelBeanstalk"] = {
		["Title"] = "Jandel\'s Beanstalk",
		["Description"] = "A giant beanstalk has appeared! Climb to the top and touch Jandel for a seed reward!"
	},
	["JandelFestival"] = {
		["Title"] = "Jandel Festival",
		["Description"] = ("The Jandel Festival is here! Small chance for fruit to turn %*%*%*%*%*!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["JandelGalaxy"] = {
		["Title"] = "Jandel Galaxy",
		["Description"] = ("We are now in space! Small chance for fruit to turn %*"):format("<font color=\"#f4b5ff\">GALACTIC!</font>")
	},
	["JandelMagician"] = {
		["Title"] = "Jandel Magician",
		["Description"] = ("A magician has appeared! Spells give your fruit the %* mutation!"):format("<font color=\"#5c4033\">CHOC</font>")
	},
	["JandelsLastStand"] = {
		["Title"] = "Jandel\'s Last Stand",
		["Description"] = ("The moon is falling! Help Jandel push it back!\nChance for %*, %* and %* fruit!\nSeeds rain down from the moonfall!"):format("<font color=\"#afafaf\">MOONBLED</font>", "<font color=\"#a347fd\">MOONLIT</font>", "<font color=\"#0055ff\">CELESTIAL</font>")
	},
	["SammysReturn"] = {
		["Title"] = "Sammy\'s Return",
		["Description"] = ("%* is back... and %* brought a soccer ball."):format("<font color=\"#b480ff\">Scammy</font>", "<font color=\"#ff3232\">Jandel</font>")
	},
	["ShredSolo"] = {
		["Title"] = "Shred Solo",
		["Description"] = "Jandel shredding?? His blasts give your plants <font color=\"#ff3232\">Bloom</font>, <font color=\"#ffce3a\">Gilded</font>, or <font color=\"#ff6600\">Flaming</font> mutations."
	},
	["NeonRain"] = {
		["Title"] = "Neon Rain",
		["Description"] = ("Neon rain! Your plants may receive the %* mutation! Luminous plants appear on the map for anyone to harvest."):format("<font color=\"#55aaff\">LUMINOUS</font>")
	},
	["BubbleBath"] = {
		["Title"] = "Bubble Bath",
		["Description"] = ("Pop rising bubbles for %*!"):format("<font color=\"#7ecfff\">rewards</font>")
	},
	["Dominoes"] = {
		["Title"] = "Dominoes",
		["Description"] = "Giant dominoes cascade across the map! Stand near them for seed rewards. The bigger they get, the better the loot!"
	},
	["JandelZeus"] = {
		["Title"] = "Jandel Zeus",
		["Description"] = ("Zeus has arrived! Lightning strikes give your fruit the %* mutation!"):format("<font color=\"#fff9a0\">HEAVENLY</font>")
	},
	["JandelStampede"] = {
		["Title"] = "Jandel Stampede",
		["Description"] = "A stampede of NPCs has flooded the map! Find Jandel hidden in the crowd for a seed reward!"
	},
	["JhaiWedding"] = {
		["Title"] = "Jhai\'s Wedding",
		["Description"] = "Jhai is getting married! Gift a harvested fruit to receive a fruit reward and an exclusive wedding badge!"
	},
	["JandelUFO"] = {
		["Title"] = "Jandel UFO",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#33fff6\">ALIENLIKE</font>")
	},
	["JandelWaldo"] = {
		["Title"] = "Find the Pet!",
		["Description"] = ("Find the missing pet for a %*!"):format("<font color=\"#cfad57\">EGG REWARD</font>")
	},
	["JandelZombie"] = {
		["Title"] = "Brains..",
		["Description"] = ("Zombie invasion: increased %* Fruit Chance!"):format("<font color=\"#62ff00\">INFECTED</font>")
	},
	["JunkbotRaid"] = {
		["Title"] = "JUNKBOT RAID",
		["Description"] = "OIL OR BOIL!"
	},
	["KitchenStorm"] = {
		["Title"] = "Kitchen Storm",
		["Description"] = ("2x Cooking Speed! Higher Mutation Carry Over and %* Fruit Chance!"):format("<font color=\"#a29139\">AROMATIC</font>")
	},
	["LaserCrystals"] = {
		["Title"] = "Laser Crystals",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#ffffff\">Crystalized</font>")
	},
	["Luck"] = {
		["Title"] = "Luck",
		["Description"] = function()
			-- upvalues: (copy) v_u_4
			local v5 = v_u_4:GetCurrentLuck() * 100
			return ("+%*%% Playtime Luck"):format((math.floor(v5)))
		end
	},
	["MarrowMoon"] = {
		["Title"] = "Marrow Moon",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#afafaf\">MOONBLED</font>")
	},
	["MegaHarvest"] = {
		["Title"] = "Mega Harvest",
		["Description"] = ("%* \n Submit your summer fruit in the %* for a reward at the end of the event!"):format("<font color=\"#ffb705\">2x SUMMER HARVEST POINTS and GROW SPEED!</font>", "<font color=\"#2a8c09\">Summer Harvest</font>")
	},
	["MeteorShower"] = {
		["Title"] = "Meteor Shower",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#0055ff\">CELESTIAL</font>")
	},
	["MeteorStrike"] = {
		["Title"] = "Meteor Strike",
		["Description"] = ("Small chance for fruit to turn %*"):format("<font color=\"#491DC1\">Meteoric!</font>")
	},
	["MidasRain"] = {
		["Title"] = "Midas Rain",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#ffce3a\">GILDED</font>")
	},
	["MilkAndCookies"] = {
		["Title"] = "Milk and Cookies",
		["Description"] = ("Its raining MILK And %* Increased pet XP gain and reduced pet abiliy cooldown!"):format("<font color=\"#4b4037\">COOKIES!</font>")
	},
	["Cyclone"] = {
		["Title"] = "Cyclone",
		["Description"] = ("\226\154\160\239\184\143%*\226\154\160\239\184\143 Cyclone inbound. Increased movement speed and plant growth speed. Also chance for %* fruit mutation!"):format("<font color=\"#ff4517\">WARNING!</font>", "<font color=\"#969696\">WINDSTRUCK</font>")
	},
	["MythicalSeedRain"] = {
		["Title"] = "Mythical Seed Rain",
		["Description"] = "It\'s raining Mythical Seeds! Chance to get any Mythical Seed in the restock shop!"
	},
	["NightEvent"] = {
		["Title"] = "Night",
		["Description"] = ("Your fruit can become %*!"):format("<font color=\"#a347fd\">MOONLIT</font>")
	},
	["NPCBirthday"] = {
		["Title"] = "NPC Birthday",
		["Description"] = function()
			-- upvalues: (copy) v_u_3, (copy) v_u_2
			local v6 = workspace:GetServerTimeNow()
			local v7 = {}
			for v8 in v_u_3.NPCEntires do
				if v_u_3:IsNPCBirthday(v8, v6) then
					table.insert(v7, v8)
				end
			end
			local v9 = table.concat(v7, ", ")
			return ("%* for <stroke color=\"rgb(0,50,0)\">%*</stroke> <stroke color=\"rgb(50,25,0)\">%*</stroke>\nFeed them %* to get a reward!"):format(#v7 > 1 and "Birthdays" or "Birthday", v_u_2.green(v9), v_u_2.orange("TODAY!"), (v_u_2.pink("Cake")))
		end
	},
	["NuttyFever"] = {
		["Title"] = "Nutty Fever",
		["Description"] = "Chipmunk has gone nutty and will perform its ability every 30 seconds"
	},
	["Obby"] = {
		["Title"] = "Obby",
		["Description"] = ("Complete the obby for a %*!"):format("<font color=\"#00bdff\">COSMETIC JUMP PAD REWARD</font>")
	},
	["Offering"] = {
		["Title"] = "Offering",
		["Description"] = ("Offer a fruit in front of your garden for a higher %* Fruit Chance!"):format("<font color=\"#E8E8E8\">SEVERED</font>")
	},
	["Oil"] = {
		["Title"] = "Oil Rain!",
		["Description"] = ("Increased %* Fruit Chance!"):format("<font color=\"#edbf1a\">OIL</font>")
	},
	["PermafrostExplosion"] = {
		["Title"] = "Permafrost Explosion",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#55ffff\">Glacial</font>")
	},
	["PoolParty"] = {
		["Title"] = "Pool Party!",
		["Description"] = ("Party like theres no tomorrow! Everyone gets a free  %* cosmetic!"):format("<font color=\"#00bdff\">Duckfloat</font>")
	},
	["PrismaticSeedRain"] = {
		["Title"] = "Prismatic Seed Rain",
		["Description"] = "It\'s raining Prismatic Seeds! Chance to get any Prismatic Seed in the restock shop!"
	},
	["PyramidObby"] = {
		["Title"] = "Pyramid Obby",
		["Description"] = ("Complete the pyramid obby for a %*! Increased %* Fruit Chance!"):format("<font color=\"#00bdff\">COSMETIC REWARD</font>", "<font color=\"#d76d2d\">SUNDRIED</font>")
	},
	["RadioactiveCarrot"] = {
		["Title"] = "The Carrot",
		["Description"] = ("Launch the Carrot for %* Fruit Chance!"):format("<font color=\"#70e700\">RADIOACTIVE</font>")
	},
	["Rain"] = {
		["Title"] = "Rain",
		["Description"] = ("+50%% Grow Speed! Higher %* Fruit Chance!"):format("<font color=\"#0055ff\">WET</font>")
	},
	["RainDance"] = {
		["Title"] = "Rain Dance",
		["Description"] = ("Higher %* & %* Fruit Chance!"):format("<font color=\"#0037e4\">Drenched</font>", "<font color=\"#0055ff\">WET</font>")
	},
	["RainingGlassAnimals"] = {
		["Title"] = "Raining Glass Animals!",
		["Description"] = ("Its raining glass animals!: increased %* Fruit Chance!"):format("<font color=\"#d9fff7\">GLOSSY</font>")
	},
	["ReaperScythe"] = {
		["Title"] = "Grim Reaper",
		["Description"] = ("The Reaper!: increased %* Fruit Chance!"):format("<font color=\"#3C3C3C\">BLACKOUT</font>")
	},
	["RestockFever"] = {
		["Title"] = "Restock Fever",
		["Description"] = "Lucky Restocks!"
	},
	["SafariDrought"] = {
		["Title"] = "Safari Drought",
		["Description"] = ("Chance for fruit to turn %*!"):format("<font color=\"#FFAA00\">ARID</font>")
	},
	["SafariDusk"] = {
		["Title"] = "Safari Dusk",
		["Description"] = ("Chance for fruit to turn %*!"):format("<font color=\"#a347fd\">TWILIGHT</font>")
	},
	["SafariHunt"] = {
		["Title"] = "Safari Hunt",
		["Description"] = ("Chance for fruit to turn %* and %*!"):format("<font color=\"#FFAA00\">ARID</font>", "<font color=\"#AAFFFF\">MIRAGE</font>")
	},
	["SafariMegaHarvest"] = {
		["Title"] = "Safari Mega Harvest",
		["Description"] = "Safari Joe arrives! 2x points from submitting!"
	},
	["SafariNight"] = {
		["Title"] = "Safari Night",
		["Description"] = ("Chance for fruit to turn %*!"):format("<font color=\"#3DDBFF\">NOCTURNAL</font>")
	},
	["SafariOasis"] = {
		["Title"] = "Safari Oasis",
		["Description"] = ("x5 Craft Speed! Chance for fruit to turn %*!"):format("<font color=\"#AAFFFF\">MIRAGE</font>")
	},
	["SafariRain"] = {
		["Title"] = "Safari Rain",
		["Description"] = ("Chance for fruit to turn %*!"):format("<font color=\"#3DDBFF\">WET</font>")
	},
	["SafariStampede"] = {
		["Title"] = "Safari Stampede",
		["Description"] = ("Chance for fruit to turn %*! \nPet cooldowns advance %* faster!"):format("<font color=\"#FFAA00\">STAMPEDE</font>", "<font color=\"#FFAA00\">2X</font>")
	},
	["SafariStorm"] = {
		["Title"] = "Safari Storm",
		["Description"] = ("5x Grow Speed and Chance for fruit to turn %*!"):format("<font color=\"#3DDBFF\">TYPHOON</font>")
	},
	["SafariTour"] = {
		["Title"] = "Safari Tour",
		["Description"] = "Go on a Safari Tour and enjoy some rewards!"
	},
	["SafariTyphoon"] = {
		["Title"] = "Safari Typhoon",
		["Description"] = ("Chance for fruit to turn %*!"):format("<font color=\"#3DDBFF\">MONSOON</font>")
	},
	["Sandstorm"] = {
		["Title"] = "Sandstorm",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#cfad57\">SANDY</font>")
	},
	["SantaIsHere"] = {
		["Title"] = "Samta\'s Here",
		["Description"] = ("Samta is here! Open all the dropped %* for a reward!"):format("<font color=\"#D2042D\">Presents</font>")
	},
	["SeedRain"] = {
		["Title"] = "SeedRain",
		["Description"] = "It\'s raining seeds! Chance to get any seed in the restock shop!"
	},
	["ShootingStars"] = {
		["Title"] = "Shooting Stars",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#a347fd\">MOONLIT</font>")
	},
	["CupidsArrows"] = {
		["Title"] = "Cupid\'s Arrows",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#f542cb\">HEARTSTRUCK</font>")
	},
	["SilentNight"] = {
		["Title"] = "Silent Night",
		["Description"] = "Silent Night! Bells will ring with a random buff each time!"
	},
	["SmithingFever"] = {
		["Title"] = "Smithing Fever",
		["Description"] = ("Hammers swirling! Increased chance for a fruit to turn %*!"):format("<font color=\"#ff4618\">TEMPERED</font>")
	},
	["SmithingStorm"] = {
		["Title"] = "Smithing Storm",
		["Description"] = "Blacksmith Furnace grants 10x Craft Speed!"
	},
	["SnowballFight"] = {
		["Title"] = "Snowball Fight",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#b0c4cc\">Snowtouched</font>")
	},
	["SnowDay"] = {
		["Title"] = "Snow Day",
		["Description"] = ("Snowballs spawning! Hit players with snowballs for chance for fruit to turn %*"):format("<font color=\"#d3dbeb\">SNOWY</font>")
	},
	["Snowfall"] = {
		["Title"] = "Snowfall",
		["Description"] = ("\"A gentle snowfall\226\128\166 and with it, boosted odds for %* fruits!\""):format("<font color=\"#a8d8ff\">snowy-mutated</font>")
	},
	["SoccerEvent"] = {
		["Title"] = "SoccerEvent",
		["Description"] = ("Score 3 points to win a reward! Higher %* Fruit Chance!"):format("<font color=\"#929292\">Windstruck</font>")
	},
	["SolarEclipse"] = {
		["Title"] = "Solar Eclipse",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#2c6fa2\">ECLIPSE</font>")
	},
	["SolarFlare"] = {
		["Title"] = "Solar Flare",
		["Description"] = ("\n The solar flare will apply %* to some fruit! \n The solar flare will apply %* to some fruit!"):format("<font color=\"#d76d2d\">SUNDRIED</font>", "<font color=\"#009114\">VERDANT</font>")
	},
	["SpaceTravel"] = {
		["Title"] = "Space Travel",
		["Description"] = ("+75%% Grow Speed! Small chance for fruit to turn %*"):format("<font color=\"#f4b5ff\">GALACTIC!</font>")
	},
	["Stoplight"] = {
		["Title"] = "Stoplight",
		["Description"] = "Don\'t get caught by the owl! Win to get a prize."
	},
	["StrobeParty"] = {
		["Title"] = "Strobe Party",
		["Description"] = ("Activate all buttons for a higher %*%*%*%*%* Fruit Chance!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["SummerHarvest"] = {
		["Title"] = "Summer Harvest",
		["Description"] = ("Submit your summer fruit in the %* for a reward at the end of the event!"):format("<font color=\"#2a8c09\">Summer Harvest</font>")
	},
	["Sunset"] = {
		["Title"] = "Sunset",
		["Description"] = ("The sun is setting, giving %* to some fruit!"):format("<font color=\"#228b22\">VERDANT</font>")
	},
	["Supernova"] = {
		["Title"] = "Supernova",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#f394ff\">GALACTIC</font>")
	},
	["SuperStorm"] = {
		["Title"] = "Super Storm",
		["Description"] = "A STORM OF ADMIN ABUSE, HIGHER CHANCE FOR LOTS OF MUTATIONS!"
	},
	["TextCollect"] = {
		["Title"] = "Text Collect",
		["Description"] = ("Assemble the text by collecting all letters! \nHigher %*%*%*%*%* Fruit Chance once finished!"):format("<font color=\"#FF007F\">D</font>", "<font color=\"#FFD700\">I</font>", "<font color=\"#00FFFF\">S</font>", "<font color=\"#00FF00\">C</font>", "<font color=\"#8A2BE2\">O</font>")
	},
	["Thunderstorm"] = {
		["Title"] = "Thunderstorm",
		["Description"] = ("+50%% Grow Speed! Higher %* Fruit Chance!"):format("<font color=\"#0055ff\">SHOCKED</font>")
	},
	["TK_LightningStorm"] = {
		["Title"] = "Lightning Storm",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#6243ff\">BLITZSHOCK</font>")
	},
	["TK_MoneyRain"] = {
		["Title"] = "Money Rain",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#53ff4a\">MONEY</font>")
	},
	["TK_PostDunk"] = {
		["Title"] = "Post Dunk",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#27ffe6\">TOUCHDOWN</font>")
	},
	["TK_RouteRunner"] = {
		["Title"] = "Route Runner",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#00aeff\">SUBZERO</font>")
	},
	["Tornado"] = {
		["Title"] = "Tornado",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#D3D3D3\">TWISTED</font>")
	},
	["TranscendentSeedRain"] = {
		["Title"] = "Transcendent Seed Rain",
		["Description"] = "It\'s raining Transcendent Seeds! Chance to get any Transcendent Seed in the restock shop!"
	},
	["TropicalRain"] = {
		["Title"] = "Tropical Rain",
		["Description"] = ("+50%% Grow Speed! Higher %* Fruit Chance!"):format("<font color=\"#0037e4\">Drenched</font>")
	},
	["Tsunami"] = {
		["Title"] = "Tsunami",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#0037e4\">Drenched</font>")
	},
	["UnderTheSea"] = {
		["Title"] = "Under The Sea",
		["Description"] = ("Higher %* Fruit Chance! You can swim around freely!"):format("<font color=\"#0055ff\">WET</font>")
	},
	["VampireBatThirst"] = {
		["Title"] = "Vampire Bats Attack!",
		["Description"] = ("Vampires!: increased %* Fruit Chance! + Seed Rewards!"):format("<font color=\"#410000\">LEECHED</font>")
	},
	["Volcano"] = {
		["Title"] = "Volcano",
		["Description"] = ("Small chance for fruit to turn %*"):format("<font color=\"#DF6400\">Molten!</font>")
	},
	["WaterYourGardens"] = {
		["Title"] = "Water Your Gardens",
		["Description"] = ("Water your plants for a higher %* fruit chance and higher %* fruit chance!"):format("<font color=\"#2795F5\">WET</font>", "<font color=\"#2742F5\">DRENCHED</font>")
	},
	["WhaleWaters"] = {
		["Title"] = "Whale Waters",
		["Description"] = ("Fruits gain Drenched mutations, remove barnacles from whales to gain the Whalebound mutation.\n2x Pet XP, Pet cooldowns advance %* faster!"):format("<font color=\"#FFAA00\">1.5X</font>")
	},
	["WhiteElephant"] = {
		["Title"] = "White Elephant",
		["Description"] = "White Elephant Present time! Find groups of presents but you can only pick 1!"
	},
	["Windy"] = {
		["Title"] = "Windy",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#929292\">Windstruck</font>")
	},
	["WinterAurora"] = {
		["Title"] = "Winter Aurora",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#55ffff\">Glacial</font>")
	},
	["WorkingBeeSwarm"] = {
		["Title"] = "Working Bee Swarm",
		["Description"] = ("x10 Craft Speed! Higher %* Fruit Chance!"):format("<font color=\"#ff9500\">POLLINATED</font>")
	},
	["YetiNight"] = {
		["Title"] = "Yeti Night",
		["Description"] = "Dark stormy blizzard night\226\128\166 Dead Trees appear randomly, containing powerful mutations. Plants grow 3\195\151 faster!"
	},
	["ZenAura"] = {
		["Title"] = "Zen Aura",
		["Description"] = ("Higher %* Fruit Chance!"):format("<font color=\"#30a5ff\">TRANQUIL</font>")
	}
}
return v10
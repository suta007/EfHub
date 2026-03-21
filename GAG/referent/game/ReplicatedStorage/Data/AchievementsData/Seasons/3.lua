local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.UpdateService)
require(v1.Data.AchievementsData.Types)
local v2 = {
	["StartTime"] = game.GameId == 7500518143 and 0 or 1757167200,
	["SeasonName"] = "Mini Achievements",
	["SeasonDescription"] = "Complete the achievements in each set to earn their unique rewards!",
	["SeasonAwardHeading"] = "Unique Prizes!",
	["SeasonAwardSubHeading"] = "Complete the achievements in each set to earn their unique rewards!",
	["Rewards"] = {}
}
local v3 = {
	["Fairy Event"] = {
		["IsBlocked"] = true,
		["Rewards"] = {
			{
				["Type"] = "Fences",
				["Value"] = "FAIRY",
				["Quantity"] = 1
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Enchanted Chest",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Pet Shard Luminous",
				["Quantity"] = 1
			},
			{
				["Type"] = "Cosmetic",
				["Value"] = "Wish Fountain",
				["Quantity"] = 1
			}
		},
		["Quests"] = {
			{
				["Id"] = "Fairy_Event_Harvest_10_Glimmering_Plants",
				["Display"] = "Harvest 10 Glimmering Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Glimmering" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Harvest_50_Glimmering_Plants",
				["Display"] = "Harvest 50 Glimmering Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Glimmering" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Harvest_100_Glimmering_Plants",
				["Display"] = "Harvest 100 Glimmering Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Glimmering" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					},
					{
						["Type"] = "Seed Pack",
						["Value"] = "Enchanted Seed Pack",
						["Quantity"] = 1
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Craft_10_Glimmering_Spray",
				["Display"] = "Craft 10 Glimmering Spray",
				["Type"] = "Craft",
				["Arguments"] = { "Mutation Spray Glimmering" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Craft_15_Fairy_Net",
				["Display"] = "Craft 15 Fairy Net",
				["Type"] = "Craft",
				["Arguments"] = { "Fairy Net" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Craft_1_Fairy_Summoner",
				["Display"] = "Craft 1 Fairy Summoner",
				["Type"] = "Craft",
				["Arguments"] = { "Fairy Summoner" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Hatch_5_Enchanted_Eggs",
				["Display"] = "Hatch 5 Enchanted Eggs",
				["Type"] = "HatchEgg",
				["Arguments"] = { "Enchanted Egg" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Hatch_15_Enchanted_Eggs",
				["Display"] = "Hatch 15 Enchanted Eggs",
				["Type"] = "HatchEgg",
				["Arguments"] = { "Enchanted Egg" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Hatch_30_Enchanted_Eggs",
				["Display"] = "Hatch 30 Enchanted Eggs",
				["Type"] = "HatchEgg",
				["Arguments"] = { "Enchanted Egg" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					},
					{
						["Type"] = "Gear",
						["Value"] = "Small Treat",
						["Quantity"] = 3
					},
					{
						["Type"] = "Gear",
						["Value"] = "Small Toy",
						["Quantity"] = 3
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Hatch_1_2kg_Imp",
				["Display"] = "Hatch an Imp at least 1.2kg",
				["Type"] = "HatchPetGreaterThanSize",
				["Arguments"] = { "Imp" },
				["Target"] = 1,
				["Size"] = 1.2,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fairy_Event_Hatch_1kg_Pixie",
				["Display"] = "Hatch a Pixie less than 1kg",
				["Type"] = "HatchPetLessThanSize",
				["Arguments"] = { "Pixie" },
				["Target"] = 1,
				["Size"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fairy_Event_A_Ladybug",
				["Display"] = "Obtain a Ladybug",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Ladybug" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Fairy_Event_A_Pixie",
				["Display"] = "Obtain a Pixie",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Pixie" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fairy_Event_A_Imp",
				["Display"] = "Obtain an Imp",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Imp" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 120
					}
				}
			},
			{
				["Id"] = "Fairy_Event_A_Glimmering_Sprite",
				["Display"] = "Obtain a Glimmering Sprite",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Glimmering Sprite" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Fairy_Event_A_Cockatrice",
				["Display"] = "Obtain a Cockatrice",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Cockatrice" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			}
		}
	},
	["Fall Event"] = {
		["IsBlocked"] = true,
		["Rewards"] = {
			{
				["Type"] = "Fences",
				["Value"] = "FALL",
				["Quantity"] = 1
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Fall Seed Pack",
				["Quantity"] = 5
			},
			{
				["Type"] = "Egg",
				["Value"] = "Fall Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Cosmetic",
				["Value"] = "Fall Market Cart",
				["Quantity"] = 1
			}
		},
		["Quests"] = {
			{
				["Id"] = "Fall_Event_Harvest_10_Fall_Plants",
				["Display"] = "Harvest 10 Fall Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Fall" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fall_Event_Harvest_50_Fall_Plants",
				["Display"] = "Harvest 50 Fall Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Fall" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fall_Event_Harvest_100_Fall_Plants",
				["Display"] = "Harvest 100 Fall Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Fall" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Fall_Event_Plant_Pumpkin",
				["Display"] = "Plant 5 Carnival Pumpkin",
				["Type"] = "Plant",
				["Arguments"] = { "Carnival Pumpkin" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fall_Event_Plant_Autumn_Shroom",
				["Display"] = "Plant 10 Autumn Shroom",
				["Type"] = "Plant",
				["Arguments"] = { "Autumn Shroom" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fall_Event_Plant_Speargrass",
				["Display"] = "Plant 3 Speargrass",
				["Type"] = "Plant",
				["Arguments"] = { "Speargrass" },
				["Target"] = 3,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Fall_Event_Plant_Auburn_Pine",
				["Display"] = "Plant 1 Auburn Pine",
				["Type"] = "Plant",
				["Arguments"] = { "Auburn Pine" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Fall_Event_Plant_Peach",
				["Display"] = "Plant 1 Golden Peach",
				["Type"] = "Plant",
				["Arguments"] = { "Golden Peach" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Fall_Event_Hatch_5_Fall_Eggs",
				["Display"] = "Hatch 5 Fall Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Fall Egg", "Premium Fall Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fall_Event_Hatch_15_Fall_Eggs",
				["Display"] = "Hatch 15 Fall Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Fall Egg", "Premium Fall Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Fall_Event_Hatch_30_Fall_Eggs",
				["Display"] = "Hatch 30 Fall Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Fall Egg", "Premium Fall Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					},
					{
						["Type"] = "Gear",
						["Value"] = "Small Treat",
						["Quantity"] = 3
					},
					{
						["Type"] = "Gear",
						["Value"] = "Small Toy",
						["Quantity"] = 3
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Grizzly_Bear",
				["Display"] = "Obtain a Grizzly Bear",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Grizzly Bear" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Badger",
				["Display"] = "Obtain a Badger",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Badger" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Chipmunk",
				["Display"] = "Obtain a Chipmunk",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Chipmunk" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Red_Squirrel",
				["Display"] = "Obtain a Red Squirrel",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Red Squirrel" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Salmon",
				["Display"] = "Obtain a Salmon",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Salmon" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Mallard",
				["Display"] = "Obtain a Mallard",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Mallard" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Sugar_Glider",
				["Display"] = "Obtain an Sugar Glider",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Sugar Glider" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 120
					}
				}
			},
			{
				["Id"] = "Fall_Event_A_Space Squirrel",
				["Display"] = "Obtain a Space Squirrel",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Space Squirrel" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			}
		}
	},
	["Halloween Event Part 1"] = {
		["IsBlocked"] = true,
		["Rewards"] = {
			{
				["Type"] = "Fences",
				["Value"] = "PUMPKIN",
				["Quantity"] = 1
			}
		},
		["Quests"] = {
			{
				["Id"] = "Halloween_EventP1_Harvest_10_Ghostly_Plants",
				["Display"] = "Harvest 10 Ghostly Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Ghostly" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Harvest_25_Ghostly_Plants",
				["Display"] = "Harvest 25 Ghostly Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Ghostly" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Harvest_50_Ghostly_Plants",
				["Display"] = "Harvest 50 Ghostly Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Ghostly" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_10_Pumpkin",
				["Display"] = "Plant 10 Pumpkin",
				["Type"] = "Plant",
				["Arguments"] = { "Pumpkin" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_15_Bloodred_Mushroom",
				["Display"] = "Plant 15 Bloodred Mushroom",
				["Type"] = "Plant",
				["Arguments"] = { "Bloodred Mushroom" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_10_Jack_O_Lantern",
				["Display"] = "Plant 10 Jack-O-Lantern",
				["Type"] = "Plant",
				["Arguments"] = { "Jack O Lantern" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_7_Ghoul_Root",
				["Display"] = "Plant 7 Ghoul Root",
				["Type"] = "Plant",
				["Arguments"] = { "Ghoul Root" },
				["Target"] = 7,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_5_Chicken_Feed",
				["Display"] = "Plant 5 Chicken Feed",
				["Type"] = "Plant",
				["Arguments"] = { "Chicken Feed" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_3_Seer_Vine",
				["Display"] = "Plant 3 Seer Vine",
				["Type"] = "Plant",
				["Arguments"] = { "Seer Vine" },
				["Target"] = 3,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Plant_2_Poison_Apple",
				["Display"] = "Plant 2 Poison Apple",
				["Type"] = "Plant",
				["Arguments"] = { "Poison Apple" },
				["Target"] = 2,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Hatch_5_Spooky_Eggs",
				["Display"] = "Hatch 5 Spooky Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Spooky Egg", "Premium Spooky Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Hatch_15_Spooky_Eggs",
				["Display"] = "Hatch 15 Spooky Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Spooky Egg", "Premium Spooky Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Hatch_30_Spooky_Eggs",
				["Display"] = "Hatch 30 Spooky Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Spooky Egg", "Premium Spooky Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Bat",
				["Display"] = "Obtain a Bat",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Bat" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Bone Dog",
				["Display"] = "Obtain a Bone Dog",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Bone Dog" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Spider",
				["Display"] = "Obtain a Spider",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Spider" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Black_Cat",
				["Display"] = "Obtain an Black Cat",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Black Cat" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 120
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Pumpkin_Rat",
				["Display"] = "Obtain a Pumpkin Rat",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Pumpkin Rat" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Ghost_Bear",
				["Display"] = "Obtain a Ghost Bear",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Ghost Bear" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Wolf",
				["Display"] = "Obtain a Wolf",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Wolf" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_A_Reaper",
				["Display"] = "Obtain a Reaper",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Reaper" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 120
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Earn_10_Candy_Corn",
				["Display"] = "Earn 10 Candy Corn",
				["Type"] = "EarnSpecialCurrency",
				["Arguments"] = { "CandyCorn" },
				["ActivePet"] = {},
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Earn_25_Candy_Corn",
				["Display"] = "Earn 25 Candy Corn",
				["Type"] = "EarnSpecialCurrency",
				["Arguments"] = { "CandyCorn" },
				["ActivePet"] = {},
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Earn_100_Candy_Corn",
				["Display"] = "Earn 100 Candy Corn",
				["Type"] = "EarnSpecialCurrency",
				["Arguments"] = { "CandyCorn" },
				["ActivePet"] = {},
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Halloween_EventP1_Get_Jumpscared_1",
				["Display"] = "Beware the Consequences of the Jack-o-Lantern!",
				["Type"] = "HP1_GetJumpscared",
				["Arguments"] = {},
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 25
					}
				}
			}
		}
	},
	["Halloween Event Part 2"] = {
		["IsBlocked"] = true,
		["Rewards"] = {
			{
				["Type"] = "Fences",
				["Value"] = "WEB",
				["Quantity"] = 1
			},
			{
				["Type"] = "Cosmetic",
				["Value"] = "Mausoleum",
				["Quantity"] = 1
			},
			{
				["Type"] = "Egg",
				["Value"] = "Spooky Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Halloween Gear Box",
				["Quantity"] = 5
			},
			{
				["Type"] = "Crate",
				["Value"] = "Spooky Crate",
				["Quantity"] = 3
			},
			{
				["Type"] = "Crate",
				["Value"] = "Pumpkin Crate",
				["Quantity"] = 3
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Spooky Chest",
				["Quantity"] = 3
			}
		},
		["Quests"] = {
			{
				["Id"] = "Halloween_EventP2_Harvest_10_Blight_Plants",
				["Display"] = "Harvest 10 Blight Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Blight" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Harvest_25_Blight_Plants",
				["Display"] = "Harvest 25 Blight Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Blight" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Harvest_50_Blight_Plants",
				["Display"] = "Harvest 50 Blight Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Blight" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Harvest_10_Spooky_Trait_Plants",
				["Display"] = "Harvest 10 Plants with the Spooky trait",
				["Type"] = "HarvestTrait",
				["Arguments"] = { "Spooky" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Harvest_50_Spooky_Trait_Plants",
				["Display"] = "Harvest 50 Plants with the Spooky trait",
				["Type"] = "HarvestTrait",
				["Arguments"] = { "Spooky" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Harvest_40_Zombie_Fruit",
				["Display"] = "Harvest 35 Zombie Fruit",
				["Type"] = "Harvest",
				["Arguments"] = { "Zombie Fruit" },
				["Target"] = 40,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Harvest_20_Candy_Cornflower",
				["Display"] = "Harvest 20 Candy Cornflower",
				["Type"] = "Harvest",
				["Arguments"] = { "Candy Cornflower" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Sell_7_Wisp_Flower",
				["Display"] = "Sell 7 Wisp Flower",
				["Type"] = "Sell",
				["Arguments"] = { "Wisp Flower" },
				["Target"] = 7,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Sell_4_Mummy\'s_Hand",
				["Display"] = "Sell 4 Mummy\'s Hand",
				["Type"] = "Sell",
				["Arguments"] = { "Mummy\'s Hand" },
				["Target"] = 4,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Plant_20_Zombie_Fruit",
				["Display"] = "Plant 20 Zombie Fruit",
				["Type"] = "Plant",
				["Arguments"] = { "Zombie Fruit" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Plant_15_Candy_Cornflower",
				["Display"] = "Plant 15 Candy Cornflower",
				["Type"] = "Plant",
				["Arguments"] = { "Candy Cornflower" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Plant_10_Wisp_Flower",
				["Display"] = "Plant 10 Wisp Flower",
				["Type"] = "Plant",
				["Arguments"] = { "Wisp Flower" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Plant_5_Mummy\'s_Hand",
				["Display"] = "Plant 5 Mummy\'s Hand",
				["Type"] = "Plant",
				["Arguments"] = { "Mummy\'s Hand" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_A_Crow",
				["Display"] = "Obtain a Crow",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Crow" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_A_Goat",
				["Display"] = "Obtain a Goat",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Goat" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 75
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_A_Goblin",
				["Display"] = "Obtain a Goblin",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Goblin" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_A_Dark_Spriggan",
				["Display"] = "Obtain an Dark Spriggan",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Dark Spriggan" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_A_Hex_Serpent",
				["Display"] = "Obtain a Hex Serpent",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Hex Serpent" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Dig_Up_Any_Reward_1",
				["Display"] = "Dig up 1 treasure from the Gravedigger Event!",
				["Type"] = "HP2_DigUpAnyReward",
				["Arguments"] = {},
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 25
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Dig_Up_Any_Reward_10",
				["Display"] = "Dig up 10 treasure from the Gravedigger Event!",
				["Type"] = "HP2_DigUpAnyReward",
				["Arguments"] = {},
				["ActivePet"] = {},
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Halloween_EventP2_Dig_Up_Any_Reward_50",
				["Display"] = "Dig up 50 treasure from the Gravedigger Event!",
				["Type"] = "HP2_DigUpAnyReward",
				["Arguments"] = {},
				["ActivePet"] = {},
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			}
		}
	},
	["Safari Harvest"] = {
		["IsBlocked"] = true,
		["Rewards"] = {
			{
				["Type"] = "Fences",
				["Value"] = "SAFARISANCTUARY",
				["Quantity"] = 1
			},
			{
				["Type"] = "Cosmetic",
				["Value"] = "Safari Shipping Container",
				["Quantity"] = 1
			},
			{
				["Type"] = "Egg",
				["Value"] = "Safari Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Safari Seed Pack",
				["Quantity"] = 5
			},
			{
				["Type"] = "Crate",
				["Value"] = "Safari Crate",
				["Quantity"] = 3
			},
			{
				["Type"] = "Crate",
				["Value"] = "Savannah Crate",
				["Quantity"] = 3
			}
		},
		["Quests"] = {
			{
				["Id"] = "Safari_Harvest_Harvest_10_Mirage_Plants",
				["Display"] = "Harvest 10 Mirage Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Mirage" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Harvest_25_Arid_Plants",
				["Display"] = "Harvest 25 Arid Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Arid" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Harvest_50_Lush_Plants",
				["Display"] = "Harvest 50 Lush Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Lush" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Plant_25_Orange_Delight",
				["Display"] = "Plant 25 Orange Delight",
				["Type"] = "Plant",
				["Arguments"] = { "Orange Delight" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Plant_10_Protea",
				["Display"] = "Plant 10 Protea",
				["Type"] = "Plant",
				["Arguments"] = { "Protea" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Plant_20_Daisy",
				["Display"] = "Plant 20 Daisy",
				["Type"] = "Plant",
				["Arguments"] = { "Daisy" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Plant_7_Bamboo_Tree",
				["Display"] = "Plant 7 Bamboo Tree",
				["Type"] = "Plant",
				["Arguments"] = { "Bamboo Tree" },
				["Target"] = 7,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Plant_5_Amberfruit_Shrub",
				["Display"] = "Plant 5 Amberfruit Shrub",
				["Type"] = "Plant",
				["Arguments"] = { "Amberfruit Shrub" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Harvest_10_Baobab",
				["Display"] = "Harvest 10 Baobab",
				["Type"] = "Harvest",
				["Arguments"] = { "Baobab" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Harvest_15_Castor_Bean",
				["Display"] = "Harvest 15 Castor Bean",
				["Type"] = "Harvest",
				["Arguments"] = { "Castor Bean" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Harvest_5_Java_Banana",
				["Display"] = "Harvest 5 Java Banana",
				["Type"] = "Harvest",
				["Arguments"] = { "Java Banana" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Open_10_Safari_Seed_Pack",
				["Display"] = "Open 10 Safari Seed Packs",
				["Type"] = "OpenSeedPackOfType",
				["Arguments"] = { "Safari Seed Pack", "Exotic Safari Seed Pack" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Open_30_Safari_Seed_Pack",
				["Display"] = "Open 30 Safari Seed Packs",
				["Type"] = "OpenSeedPackOfType",
				["Arguments"] = { "Safari Seed Pack", "Exotic Safari Seed Pack" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Open_60_Safari_Seed_Pack",
				["Display"] = "Open 60 Safari Seed Packs",
				["Type"] = "OpenSeedPackOfType",
				["Arguments"] = { "Safari Seed Pack", "Exotic Safari Seed Pack" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Hatch_5_Safari_Eggs",
				["Display"] = "Hatch 5 Safari Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Safari Egg", "Premium Safari Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Hatch_15_Safari_Eggs",
				["Display"] = "Hatch 15 Safari Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Safari Egg", "Premium Safari Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Hatch_30_Safari_Eggs",
				["Display"] = "Hatch 30 Safari Eggs",
				["Type"] = "HatchEggs",
				["Arguments"] = { "Safari Egg", "Premium Safari Egg" },
				["AnyArgumentsMatch"] = true,
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Oxpecker",
				["Display"] = "Obtain an Oxpecker",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Oxpecker" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Zebra",
				["Display"] = "Obtain a Zebra",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Zebra" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Giraffe",
				["Display"] = "Obtain a Giraffe",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Giraffe" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Rhino",
				["Display"] = "Obtain a Rhino",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Rhino" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Gecko",
				["Display"] = "Obtain a Gecko",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Gecko" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Hyena",
				["Display"] = "Obtain 2 Hyena",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Hyena" },
				["ActivePet"] = {},
				["Target"] = 2,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Safari_Harvest_Cape_Buffalo",
				["Display"] = "Obtain a Cape Buffalo",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Cape Buffalo" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			}
		}
	},
	["Christmas Event"] = {
		["IsBlocked"] = false,
		["Rewards"] = {
			{
				["Type"] = "Fences",
				["Value"] = "CANDYCANE",
				["Quantity"] = 1
			},
			{
				["Type"] = "Cosmetic",
				["Value"] = "Snow Globe",
				["Quantity"] = 1
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Santa\'s Surprise Present",
				["Quantity"] = 5
			},
			{
				["Type"] = "Crate",
				["Value"] = "Christmas Crate",
				["Quantity"] = 5
			}
		},
		["Quests"] = {
			{
				["Id"] = "Christmas_Event_Harvest_10_Ornamented_Plants",
				["Display"] = "Harvest 10 Ornamented Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Ornamented" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_25_Arctic_Plants",
				["Display"] = "Harvest 25 Arctic Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Arctic" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_50_Snowy_Plants",
				["Display"] = "Harvest 50 Snowy Mutated Plants",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Snowy" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Plant_25_Cookie_Stack",
				["Display"] = "Plant 25 Cookie Stack",
				["Type"] = "Plant",
				["Arguments"] = { "Cookie Stack" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Plant_20_Poinsettia",
				["Display"] = "Plant 20 Poinsettia",
				["Type"] = "Plant",
				["Arguments"] = { "Poinsettia" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Plant_15_Antlerbloom",
				["Display"] = "Plant 15 Antlerbloom",
				["Type"] = "Plant",
				["Arguments"] = { "Antlerbloom" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Plant_7_Holly_Berry",
				["Display"] = "Plant 7 Holly Berry",
				["Type"] = "Plant",
				["Arguments"] = { "Holly Berry" },
				["Target"] = 7,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Plant_5_Gift_Berry",
				["Display"] = "Gift 1 Gift Berry",
				["Type"] = "Gift",
				["Arguments"] = { "Gift Berry" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_10_Frosty_Bite",
				["Display"] = "Harvest 10 Frosty Bite",
				["Type"] = "Harvest",
				["Arguments"] = { "Frosty Bite" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_10_Cryo_Rose",
				["Display"] = "Harvest 10 Cryo Rose",
				["Type"] = "Harvest",
				["Arguments"] = { "Cryo Rose" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_10_Bush_Flake",
				["Display"] = "Harvest 10 Bush Flake",
				["Type"] = "Harvest",
				["Arguments"] = { "Bush Flake" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_10_Rosemary",
				["Display"] = "Harvest 10 Rosemary",
				["Type"] = "Harvest",
				["Arguments"] = { "Rosemary" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_5_Cryoshard",
				["Display"] = "Harvest 5 Cryoshard",
				["Type"] = "Harvest",
				["Arguments"] = { "Cryoshard" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Harvest_3_Frostwing",
				["Display"] = "Harvest 3 Frostwing",
				["Type"] = "Harvest",
				["Arguments"] = { "Frostwing" },
				["Target"] = 3,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Open_10_Presents",
				["Display"] = "Open 10 Presents",
				["Type"] = "OpenSeedPackOfType",
				["Arguments"] = {
					"Bad Present",
					"Normal Present",
					"Rare Present",
					"Christmas Present",
					"Santa\'s Surprise Present",
					"Common Gift",
					"Rare Gift",
					"Mythical Gift",
					"Gold Gift",
					"Rainbow Gift"
				},
				["AnyArgumentsMatch"] = true,
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Open_30_Presents",
				["Display"] = "Open 30 Presents",
				["Type"] = "OpenSeedPackOfType",
				["Arguments"] = {
					"Bad Present",
					"Normal Present",
					"Rare Present",
					"Christmas Present",
					"Santa\'s Surprise Present",
					"Common Gift",
					"Rare Gift",
					"Mythical Gift",
					"Gold Gift",
					"Rainbow Gift"
				},
				["AnyArgumentsMatch"] = true,
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Open_60_Presents",
				["Display"] = "Open 60 Presents",
				["Type"] = "OpenSeedPackOfType",
				["Arguments"] = {
					"Bad Present",
					"Normal Present",
					"Rare Present",
					"Christmas Present",
					"Santa\'s Surprise Present",
					"Common Gift",
					"Rare Gift",
					"Mythical Gift",
					"Gold Gift",
					"Rainbow Gift"
				},
				["AnyArgumentsMatch"] = true,
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Gift_Rat",
				["Display"] = "Obtain a Gift Rat",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Gift Rat" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Penguin",
				["Display"] = "Obtain a Penguin",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Penguin" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Snow_Bunny",
				["Display"] = "Obtain a Snow Bunny",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Snow Bunny" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Christmas_Event_French_Hen",
				["Display"] = "Obtain a French Hen",
				["Type"] = "ObtainPet",
				["Arguments"] = { "French Hen" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Mistletoad",
				["Display"] = "Obtain a Mistletoad",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Mistletoad" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Snowman_Soldier",
				["Display"] = "Feed a Snowman Soldier",
				["Type"] = "FeedPetWithAny",
				["Arguments"] = { "Snowman Soldier" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Christmas_Event_Snowman_Builder",
				["Display"] = "Feed a Snowman Builder",
				["Type"] = "FeedPetWithAny",
				["Arguments"] = { "Snowman Builder" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			}
		}
	}
}
v2.Sets = v3
return v2
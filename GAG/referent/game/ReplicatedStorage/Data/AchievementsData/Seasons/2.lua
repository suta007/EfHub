local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.UpdateService)
require(v1.Data.AchievementsData.Types)
local v2 = {
	["StartTime"] = game.GameId == 7500518143 and 0 or 1755955800,
	["SeasonName"] = "Core Pets",
	["SeasonDescription"] = "Achievements for eggs in the egg shop",
	["SeasonAwardSubHeading"] = "Complete all achievement for the MEGA Lollipop, Egg Incubator and Pet Shard Rainbow",
	["Rewards"] = {
		{
			["Type"] = "Gear",
			["Value"] = "Mega Lollipop",
			["Quantity"] = 1
		},
		{
			["Type"] = "Cosmetic",
			["Value"] = "Egg Incubator",
			["Quantity"] = 1
		},
		{
			["Type"] = "Gear",
			["Value"] = "Pet Shard Rainbow",
			["Quantity"] = 1
		}
	}
}
local v3 = {
	["Common"] = {
		["Rewards"] = {
			{
				["Type"] = "Egg",
				["Value"] = "Uncommon Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Levelup Lollipop",
				["Quantity"] = 1
			}
		},
		["Quests"] = {
			{
				["Id"] = "Common_Dog_to_DigUp_15_Seeds",
				["Display"] = "Dog to dig up 15 Seeds ",
				["Type"] = "DogDigUp",
				["Arguments"] = { "Dog" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_GoldenLab_to_DigUp_30_Seeds",
				["Display"] = "Golden Lab to dig up 30 Seeds ",
				["Type"] = "DogDigUp",
				["Arguments"] = { "Golden Lab" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_Feed_Pets_100_Times",
				["Display"] = "Feed Pets 100 Times",
				["Type"] = "FeedAnyPetWithAny",
				["Arguments"] = {},
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_Sell_Pets_100_Times",
				["Display"] = "Sell 100 Pets",
				["Type"] = "SellAnyPet",
				["Arguments"] = {},
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_Gift_5_Dogs",
				["Display"] = "Gift 5 Dogs",
				["Type"] = "GiftPet",
				["Arguments"] = { "Dog" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_Mutate_Lab",
				["Display"] = "Mutate a Golden Lab",
				["Type"] = "MutatePetWithAny",
				["Arguments"] = { "Golden Lab" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			}
		}
	},
	["Uncommon"] = {
		["Rewards"] = {
			{
				["Type"] = "Egg",
				["Value"] = "Rare Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Levelup Lollipop",
				["Quantity"] = 3
			}
		},
		["Quests"] = {
			{
				["Id"] = "Uncommon_Cat_Nap_15_times",
				["Display"] = "Get Cat to Nap 15 Times",
				["Type"] = "PetZoneTrigger",
				["Arguments"] = { "Cat" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_BerryType_100_times_Deer",
				["Display"] = "Get Berry type crops to replant 100 times with Deer active",
				["Type"] = "PetAttributeCounter",
				["Arguments"] = {},
				["ActivePet"] = { "Deer" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Hatch_25_Eggs_With_Chicken",
				["Display"] = "Hatch 25 Eggs with Chicken active",
				["Type"] = "HatchAnyEgg",
				["Arguments"] = {},
				["Target"] = 25,
				["ActivePet"] = { "Chicken" },
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Gift_200_Pets",
				["Display"] = "Gift 200 Pets",
				["Type"] = "GiftAnyPet",
				["Arguments"] = {},
				["Target"] = 200,
				["ActivePet"] = {},
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Grow_Cat_Age_50",
				["Display"] = "Grow a Cat to age 50",
				["Type"] = "GrowPetToAge",
				["Arguments"] = { "Cat", "50" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Use_200_Pet_Boosts",
				["Display"] = "Use 200 Pet Boosts",
				["Type"] = "BoostAnyPetWithAny",
				["Arguments"] = {},
				["Target"] = 200,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			}
		}
	},
	["Rare"] = {
		["Rewards"] = {
			{
				["Type"] = "Egg",
				["Value"] = "Legendary Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Levelup Lollipop",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Pet Shard Silver",
				["Quantity"] = 1
			}
		},
		["Quests"] = {
			{
				["Id"] = "Rare_OrangeTabby_Nap_15_times",
				["Display"] = "Get Orange Tabby to Nap 20 Times",
				["Type"] = "PetZoneTrigger",
				["Arguments"] = { "Orange Tabby" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Rare_BerryType_200_times_SpottedDeer",
				["Display"] = "Get Berry type crops to replant 200 times with Spotted Deer active",
				["Type"] = "PetAttributeCounter",
				["Arguments"] = {},
				["ActivePet"] = { "Spotted Deer" },
				["Target"] = 200,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Rare_Get_Refunded_100_Fruit_Monkey",
				["Display"] = "Get refunded 100 fruit with Monkey active",
				["Type"] = "PetAttributeCounter",
				["Arguments"] = {},
				["ActivePet"] = { "Monkey" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Rare_Hatch_50_Eggs_With_Rooster",
				["Display"] = "Hatch 50 Eggs with Rooster active",
				["Type"] = "HatchAnyEgg",
				["Arguments"] = {},
				["Target"] = 50,
				["ActivePet"] = { "Rooster" },
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Rare_Grow_Monkey_Age_75",
				["Display"] = "Grow a Monkey to age 75",
				["Type"] = "GrowPetToAge",
				["Arguments"] = { "Monkey", "75" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Rare_Gift_200_Pet",
				["Display"] = "Gift 200 Pets",
				["Type"] = "GiftAnyPet",
				["Arguments"] = {},
				["Target"] = 200,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			}
		}
	},
	["Legendary"] = {
		["Rewards"] = {
			{
				["Type"] = "Egg",
				["Value"] = "Mythical Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Silver Lollipop",
				["Quantity"] = 1
			},
			{
				["Type"] = "Gear",
				["Value"] = "Pet Shard Silver",
				["Quantity"] = 2
			}
		},
		["Quests"] = {
			{
				["Id"] = "Legendary_Get_Refunded_300_Fruit_SilverMonkey",
				["Display"] = "Get refunded 300 fruit with Silver Monkey active",
				["Type"] = "PetAttributeCounter",
				["Arguments"] = {},
				["ActivePet"] = { "Silver Monkey" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Legendary_Place_Sprinkler_100_times_Turtle",
				["Display"] = "Place Sprinklers 100 times with Turtle active",
				["Type"] = "PlaceItem",
				["Arguments"] = {},
				["ActivePet"] = { "Turtle" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Legendary_Plant_500_Crop_Cow",
				["Display"] = "Plant 500 crops with Cow active",
				["Type"] = "PlantAny",
				["Arguments"] = {},
				["ActivePet"] = { "Cow" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Legendary_Otter_Water_500_Crop",
				["Display"] = "Get Sea Otter to water 500 crops",
				["Type"] = "PetAction",
				["Arguments"] = { "Sea Otter" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Legendary_PolarBear_Mutate_100",
				["Display"] = "Get Polar Bear to mutate fruits 100 times",
				["Type"] = "PetAction",
				["Arguments"] = { "Polar Bear" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Legendary_Use_5_LevelUp_Lollipop",
				["Display"] = "Use 5 Level Up Lollipop",
				["Type"] = "BoostAnyPet",
				["Arguments"] = { "Lollipop" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			}
		}
	},
	["Mythical"] = {
		["Rewards"] = {
			{
				["Type"] = "Egg",
				["Value"] = "Bug Egg",
				["Quantity"] = 5
			},
			{
				["Type"] = "Gear",
				["Value"] = "Silver Lollipop",
				["Quantity"] = 2
			},
			{
				["Type"] = "Gear",
				["Value"] = "Pet Shard Silver",
				["Quantity"] = 2
			}
		},
		["Quests"] = {
			{
				["Id"] = "Mythical_Lucky_Harvest_250_Times_Snail",
				["Display"] = "Get 250 Lucky Harvests with the Snail",
				["Type"] = "LuckyHarvestAny",
				["Arguments"] = {},
				["ActivePet"] = { "Snail" },
				["Target"] = 250,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Plant_500_Leafy_Crops_Caterpillar",
				["Display"] = "Plant 500 Leafy crops with Caterpillar active",
				["Type"] = "PlantWithTrait",
				["Arguments"] = { "Leafy" },
				["ActivePet"] = { "Caterpillar" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Grey_Mouse_Gain_10000_XP",
				["Display"] = "Get Grey Mouse to gain 10,000 XP",
				["Type"] = "PetXPGain",
				["Arguments"] = { "Grey Mouse" },
				["ActivePet"] = {},
				["Target"] = 10000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Brown_Mouse_Gain_15000_XP",
				["Display"] = "Get Brown Mouse to gain 15,000 XP",
				["Type"] = "PetXPGain",
				["Arguments"] = { "Brown Mouse" },
				["ActivePet"] = {},
				["Target"] = 15000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Duplicate_Crops_500_Times_Giant_Ant",
				["Display"] = "Get 500 Lucky Dupes with Red Giant Ant",
				["Type"] = "LuckyDupeAny",
				["Arguments"] = {},
				["ActivePet"] = { "Red Giant Ant" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Save_100_Reclaimers_Squirrel",
				["Display"] = "Save 100 Reclaimers while Squirrel is active",
				["Type"] = "LuckyReclaim",
				["Arguments"] = {},
				["ActivePet"] = { "Squirrel" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Grow_Squirrel_Age_100",
				["Display"] = "Grow a Squirrel to Age 100",
				["Type"] = "GrowPetToAge",
				["Arguments"] = { "Squirrel", "100" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Gold_Mutation_Brown_Mouse",
				["Display"] = "Obtain Golden Mutation on Brown Mouse",
				["Type"] = "MutatePet",
				["Arguments"] = { "Brown Mouse", "Golden" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			}
		}
	},
	["Divine"] = {
		["Rewards"] = {
			{
				["Type"] = "Gear",
				["Value"] = "Pet Shard Golden",
				["Quantity"] = 1
			},
			{
				["Type"] = "Gear",
				["Value"] = "Gold Lollipop",
				["Quantity"] = 2
			}
		},
		["Quests"] = {
			{
				["Id"] = "Divine_Duplicate_Crops_750_Times_Giant_Ant",
				["Display"] = "Get 750 Lucky Dupes with Giant Ant",
				["Type"] = "LuckyDupeAny",
				["Arguments"] = {},
				["ActivePet"] = { "Giant Ant" },
				["Target"] = 750,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Praying_Mantis_Zen_Zone_100",
				["Display"] = "Get Praying Mantis to perform Zen Zone 100 times",
				["Type"] = "PetZoneTrigger",
				["Arguments"] = { "Praying Mantis" },
				["ActivePet"] = { "Praying Mantis" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Dragonfly_Turn_500_Fruit",
				["Display"] = "Get Dragonfly to turn 500 fruit Gold",
				["Type"] = "PetFruitVariantTrigger",
				["Arguments"] = { "Dragonfly", "Gold" },
				["ActivePet"] = { "Dragonfly" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Red_Fox_Steal_50_Seed",
				["Display"] = "Get Red Fox to steal 50 seeds",
				["Type"] = "PetStealSeeds",
				["Arguments"] = { "Red Fox" },
				["ActivePet"] = { "Red Fox" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Grow_3_Pet_Age_100",
				["Display"] = "Grow 3 Pets to Age 100",
				["Type"] = "GrowAnyPetToAge",
				["Arguments"] = { "100" },
				["Target"] = 3,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Mutate_100_Pets",
				["Display"] = "Mutate 100 Pets",
				["Type"] = "MutateAnyPetWithAny",
				["Arguments"] = {},
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Hatch_1750_Eggs",
				["Display"] = "Hatch 1750 eggs",
				["Type"] = "HatchAnyEgg",
				["Arguments"] = {},
				["Target"] = 1750,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Sell_Pets_1000_Times",
				["Display"] = "Sell 1000 Pets",
				["Type"] = "SellAnyPet",
				["Arguments"] = {},
				["Target"] = 1000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			}
		}
	},
	["Catch Them All"] = {
		["Rewards"] = {
			{
				["Type"] = "Gear",
				["Value"] = "Pet Pouch",
				["Quantity"] = 10
			},
			{
				["Type"] = "Cosmetic",
				["Value"] = "Mutation Machine Booster",
				["Quantity"] = 1
			}
		},
		["Quests"] = {
			{
				["Id"] = "CatchThemAll_A_Dog",
				["Display"] = "Obtain a Dog",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Dog" },
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
				["Id"] = "CatchThemAll_A_GoldenLab",
				["Display"] = "Obtain a Golden Lab",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Golden Lab" },
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
				["Id"] = "CatchThemAll_A_Bunny",
				["Display"] = "Obtain a Bunny",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Bunny" },
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
				["Id"] = "CatchThemAll_A_BlackBunny",
				["Display"] = "Obtain a Black Bunny",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Black Bunny" },
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
				["Id"] = "CatchThemAll_A_Cat",
				["Display"] = "Obtain a Cat",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Cat" },
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
				["Id"] = "CatchThemAll_A_Deer",
				["Display"] = "Obtain a Deer",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Deer" },
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
				["Id"] = "CatchThemAll_A_Chicken",
				["Display"] = "Obtain a Chicken",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Chicken" },
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
				["Id"] = "CatchThemAll_A_OrangeTabby",
				["Display"] = "Obtain a Orange Tabby",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Orange Tabby" },
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
				["Id"] = "CatchThemAll_A_Monkey",
				["Display"] = "Obtain a Monkey",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Monkey" },
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
				["Id"] = "CatchThemAll_A_SpottedDeer",
				["Display"] = "Obtain a Spotted Deer",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Spotted Deer" },
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
				["Id"] = "CatchThemAll_A_Rooster",
				["Display"] = "Obtain a Rooster",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Rooster" },
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
				["Id"] = "CatchThemAll_A_Pig",
				["Display"] = "Obtain a Pig",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Pig" },
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
				["Id"] = "CatchThemAll_A_SilverMonkey",
				["Display"] = "Obtain a Silver Monkey",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Silver Monkey" },
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
				["Id"] = "CatchThemAll_A_Cow",
				["Display"] = "Obtain a Cow",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Cow" },
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
				["Id"] = "CatchThemAll_A_SeaOtter",
				["Display"] = "Obtain a Sea Otter",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Sea Otter" },
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
				["Id"] = "CatchThemAll_A_Turtle",
				["Display"] = "Obtain a Turtle",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Turtle" },
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
				["Id"] = "CatchThemAll_A_PolarBear",
				["Display"] = "Obtain a Polar Bear",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Polar Bear" },
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
				["Id"] = "CatchThemAll_A_GreyMouse",
				["Display"] = "Obtain a Grey Mouse",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Grey Mouse" },
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
				["Id"] = "CatchThemAll_A_Squirrel",
				["Display"] = "Obtain a Squirrel",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Squirrel" },
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
				["Id"] = "CatchThemAll_A_BrownMouse",
				["Display"] = "Obtain a Brown Mouse",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Brown Mouse" },
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
				["Id"] = "CatchThemAll_A_RedGiantAnt",
				["Display"] = "Obtain a Red Giant Ant",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Red Giant Ant" },
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
				["Id"] = "CatchThemAll_A_RedFox",
				["Display"] = "Obtain a Red Fox",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Red Fox" },
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
				["Id"] = "CatchThemAll_A_Dragonfly",
				["Display"] = "Obtain a Dragonfly",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Dragonfly" },
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
				["Id"] = "CatchThemAll_A_PrayingMantis",
				["Display"] = "Obtain a Praying Mantis",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Praying Mantis" },
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
				["Id"] = "CatchThemAll_A_GiantAnt",
				["Display"] = "Obtain a Giant Ant",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Giant Ant" },
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
				["Id"] = "CatchThemAll_A_Snail",
				["Display"] = "Obtain a Snail",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Snail" },
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
				["Id"] = "CatchThemAll_A_Caterpillar",
				["Display"] = "Obtain a Caterpillar",
				["Type"] = "ObtainPet",
				["Arguments"] = { "Caterpillar" },
				["ActivePet"] = {},
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			}
		}
	}
}
v2.Sets = v3
return v2
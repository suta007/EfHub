local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.UpdateService)
require(v1.Data.AchievementsData.Types)
local v2 = {
	["StartTime"] = game.GameId == 7500518143 and 0 or 1755352800,
	["SeasonName"] = "Core Plants",
	["SeasonDescription"] = "Achievements for seeds in the seed shop",
	["SeasonAwardSubHeading"] = "Complete all achievements to unlock 100 backpack slots",
	["Rewards"] = {
		{
			["Type"] = "Cosmetic",
			["Value"] = "Statue Of Achievement",
			["Quantity"] = 1
		}
	}
}
local v3 = {
	["Common"] = {
		["Rewards"] = {
			{
				["Type"] = "Cosmetic",
				["Value"] = "Cooking Kit",
				["Quantity"] = 1
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Silver Common Seed Pack",
				["Quantity"] = 5
			}
		},
		["Quests"] = {
			{
				["Id"] = "Common_Shovel_100_Plants",
				["Display"] = "Shovel 100 Plants ",
				["Type"] = "ShovelAny",
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
				["Id"] = "Common_Harvest_200_Carrots",
				["Display"] = "Harvest 200 Carrots",
				["Type"] = "Harvest",
				["Arguments"] = { "Carrot" },
				["Target"] = 200,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_Gift_1_Carrots",
				["Display"] = "Gift 1 Carrot",
				["Type"] = "Gift",
				["Arguments"] = { "Carrot" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 50
					}
				}
			},
			{
				["Id"] = "Common_Sell_500_Strawberries",
				["Display"] = "Sell 500 Strawberries",
				["Type"] = "Sell",
				["Arguments"] = { "Strawberry" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 100
					}
				}
			},
			{
				["Id"] = "Common_Gift_5_Strawberry",
				["Display"] = "Gift 5 Strawberries",
				["Type"] = "Gift",
				["Arguments"] = { "Strawberry" },
				["Target"] = 5,
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
				["Type"] = "Seed Pack",
				["Value"] = "Silver Uncommon Seed Pack",
				["Quantity"] = 5
			}
		},
		["Quests"] = {
			{
				["Id"] = "Common_Shovel_300_Plants",
				["Display"] = "Shovel 300 Plants ",
				["Type"] = "ShovelAny",
				["Arguments"] = {},
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Uncommon_Harvest_250_Mutations",
				["Display"] = "Harvest 250 Mutated Crops",
				["Type"] = "HarvestAnyMutation",
				["Arguments"] = {},
				["Target"] = 250,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Uncommon_Harvest_150_Any_Variant",
				["Display"] = "Harvest 150 Silver, Gold or Rainbow Crops",
				["Type"] = "HarvestAnyVariant",
				["Arguments"] = {},
				["Target"] = 150,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Harvest_1000_Blueberries",
				["Display"] = "Harvest 1000 Blueberries",
				["Type"] = "Harvest",
				["Arguments"] = { "Blueberry" },
				["Target"] = 1000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Harvest_300_Mutated_Blueberries",
				["Display"] = "Harvest 300 Mutated Blueberries",
				["Type"] = "HarvestCropWithAnyMutation",
				["Arguments"] = { "Blueberry" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Cooking_100_Blueberries",
				["Display"] = "Use 100 Blueberries in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Blueberry" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Feed_150_Blueberry_To_Pet",
				["Display"] = "Feed 150 Blueberry to Pets",
				["Type"] = "FeedAnyPet",
				["Arguments"] = { "Blueberry" },
				["Target"] = 150,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 150
					}
				}
			},
			{
				["Id"] = "Uncommon_Plant_200_Orange_Tulip",
				["Display"] = "Harvest 10 Gold Blueberry",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Blueberry", "Gold" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 200
					}
				}
			},
			{
				["Id"] = "Uncommon_Gift_100_Orange_Tulip",
				["Display"] = "Gift any 100 Crop",
				["Type"] = "GiftAny",
				["Arguments"] = {},
				["Target"] = 100,
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
				["Type"] = "Cosmetic",
				["Value"] = "Cooking Kit",
				["Quantity"] = 1
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Silver Rare Seed Pack",
				["Quantity"] = 5
			}
		},
		["Quests"] = {
			{
				["Id"] = "Rare_Harvest_500_Mutations",
				["Display"] = "Harvest 500 Mutated Crops",
				["Type"] = "HarvestAnyMutation",
				["Arguments"] = {},
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_200_Wet_Crops",
				["Display"] = "Harvest 200 Wet Crops",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Wet" },
				["Target"] = 200,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_500_Corn",
				["Display"] = "Harvest 500 Corn",
				["Type"] = "Harvest",
				["Arguments"] = { "Corn" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 300
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_100_Mutated_Any_Corn",
				["Display"] = "Harvest 100 Mutated Corn",
				["Type"] = "HarvestCropWithAnyMutation",
				["Arguments"] = { "Corn" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_30_Silver_Corn",
				["Display"] = "Harvest 30 Silver, Gold or Rainbow Corn",
				["Type"] = "HarvestCropAnyVariant",
				["Arguments"] = { "Corn" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_15_Gold_Corn",
				["Display"] = "Harvest 15 Gold Corn",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Corn", "Gold" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_1_Rainbow_Corn",
				["Display"] = "Harvest 1 Rainbow Corn",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Corn", "Rainbow" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Cook_100_Corn",
				["Display"] = "Use 100 Corn in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Corn" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_2000_Tomato",
				["Display"] = "Harvest 2000 Tomatoes",
				["Type"] = "Harvest",
				["Arguments"] = { "Tomato" },
				["Target"] = 2000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_1Kg_Tomato",
				["Display"] = "Harvest 10 1kg Tomatoes",
				["Type"] = "HarvestGreaterThanSize",
				["Arguments"] = { "Tomato" },
				["Target"] = 10,
				["Size"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_30_Silver_Tomato",
				["Display"] = "Harvest 30 Silver, Gold or Rainbow Tomatoes",
				["Type"] = "HarvestCropAnyVariant",
				["Arguments"] = { "Tomato" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_15_Gold_Tomato",
				["Display"] = "Harvest 5 Gold Tomatoes",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Tomato", "Gold" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_1_Rainbow_Tomato",
				["Display"] = "Harvest 1 Rainbow Tomatoes",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Tomato", "Rainbow" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Cook_500_Tomato",
				["Display"] = "Use 500 Tomatoes in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Tomato" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Rare_Plant_500_Daffodil",
				["Display"] = "Plant 500 Daffodils",
				["Type"] = "Plant",
				["Arguments"] = { "Daffodil" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Rare_Gift_40_Daffodil",
				["Display"] = "Gift 40 Daffodils",
				["Type"] = "Gift",
				["Arguments"] = { "Daffodil" },
				["Target"] = 40,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			},
			{
				["Id"] = "Rare_Harvest_10_Wet_Daffodil",
				["Display"] = "Harvest 10 Wet Daffodils",
				["Type"] = "HarvestCropWithMutation",
				["Arguments"] = { "Daffodil", "Wet" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 250
					}
				}
			}
		}
	},
	["Legendary"] = {
		["Rewards"] = {
			{
				["Type"] = "Seed Pack",
				["Value"] = "Silver Legendary Seed Pack",
				["Quantity"] = 5
			}
		},
		["Quests"] = {
			{
				["Id"] = "Legendary_Harvest_60_Windstruck_Crops",
				["Display"] = "Harvest 60 Windstruck Crops",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Windstruck" },
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_60_Chilled_Crops",
				["Display"] = "Harvest 60 Chilled Crops",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Chilled" },
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_100_Any_Variant",
				["Display"] = "Harvest 100 Silver, Gold or Rainbow Crops",
				["Type"] = "HarvestAnyVariant",
				["Arguments"] = {},
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_500_Bamboo",
				["Display"] = "Harvest 500 Bamboo",
				["Type"] = "Harvest",
				["Arguments"] = { "Bamboo" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 450
					}
				}
			},
			{
				["Id"] = "Legendary_Feed_100_Bamboo_To_Pet",
				["Display"] = "Feed 500 Bamboo to Pets",
				["Type"] = "FeedAnyPet",
				["Arguments"] = { "Bamboo" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Sell_300_Bamboos",
				["Display"] = "Sell 300 Bamboos",
				["Type"] = "Sell",
				["Arguments"] = { "Bamboo" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_1_15kg_Bamboo",
				["Display"] = "Harvest 1 15kg Bamboo",
				["Type"] = "HarvestGreaterThanSize",
				["Arguments"] = { "Bamboo" },
				["Target"] = 1,
				["Size"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_100_Mutated_Bamboo",
				["Display"] = "Harvest 50 Mutated Bamboo",
				["Type"] = "HarvestCropWithAnyMutation",
				["Arguments"] = { "Bamboo" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Cook_250_Apple",
				["Display"] = "Use 250 Apples in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Apple" },
				["Target"] = 250,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Plant_30_Apple",
				["Display"] = "Plant 30 Apple Trees",
				["Type"] = "Plant",
				["Arguments"] = { "Apple" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 450
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_1500_Apple",
				["Display"] = "Harvest 1500 Apples",
				["Type"] = "Harvest",
				["Arguments"] = { "Apple" },
				["Target"] = 1500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 450
					}
				}
			},
			{
				["Id"] = "Legendary_Gift_20_Pumpkin",
				["Display"] = "Gift 20 Pumpkins",
				["Type"] = "Gift",
				["Arguments"] = { "Pumpkin" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_15_10kg_Pumpkin",
				["Display"] = "Harvest 15 10kg Pumpkins",
				["Type"] = "HarvestGreaterThanSize",
				["Arguments"] = { "Pumpkin" },
				["Target"] = 15,
				["Size"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Legendary_Cook_20_Pumpkin",
				["Display"] = "Use 20 Pumpkins in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Pumpkin" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Legendary_Feed_Pets_100_Watermelon",
				["Display"] = "Feed 100 Watermelons to Pets",
				["Type"] = "FeedAnyPet",
				["Arguments"] = { "Watermelon" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Legendary_Gift_10_Watermelon",
				["Display"] = "Gift 10 Watermelons",
				["Type"] = "Gift",
				["Arguments"] = { "Watermelon" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 350
					}
				}
			},
			{
				["Id"] = "Legendary_Harvest_15_Watermelon",
				["Display"] = "Harvest 15 9kg Watermelons",
				["Type"] = "HarvestGreaterThanSize",
				["Arguments"] = { "Watermelon" },
				["Target"] = 15,
				["Size"] = 9,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			}
		}
	},
	["Mythical"] = {
		["Rewards"] = {
			{
				["Type"] = "Cosmetic",
				["Value"] = "Cooking Kit",
				["Quantity"] = 1
			},
			{
				["Type"] = "Seed Pack",
				["Value"] = "Silver Mythical Seed Pack",
				["Quantity"] = 4
			}
		},
		["Quests"] = {
			{
				["Id"] = "Mythical_Harvest_5000_Mutations",
				["Display"] = "Harvest 5000 Mutated Plants",
				["Type"] = "HarvestAnyMutation",
				["Arguments"] = {},
				["Target"] = 5000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_50_Shocked_Mango",
				["Display"] = "Harvest 50 Shocked Mangos",
				["Type"] = "HarvestCropWithMutation",
				["Arguments"] = { "Mango", "Shocked" },
				["Target"] = 50,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 550
					}
				}
			},
			{
				["Id"] = "Mythical_Shovel_850_Crops",
				["Display"] = "Shovel 850 Plants",
				["Type"] = "ShovelAny",
				["Arguments"] = {},
				["Target"] = 850,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 400
					}
				}
			},
			{
				["Id"] = "Mythical_Plant_30_Coconut",
				["Display"] = "Plant 30 Coconut Trees",
				["Type"] = "Plant",
				["Arguments"] = { "Coconut" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 550
					}
				}
			},
			{
				["Id"] = "Mythical_Cook_60_Coconut",
				["Display"] = "Use 60 Coconuts in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Coconut" },
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_1500_Coconuts",
				["Display"] = "Harvest 1500 Coconuts",
				["Type"] = "Harvest",
				["Arguments"] = { "Coconut" },
				["Target"] = 1500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 550
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_300_Cactus",
				["Display"] = "Harvest 300 Cacti",
				["Type"] = "Harvest",
				["Arguments"] = { "Cactus" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_30_Silver_Cactus",
				["Display"] = "Harvest 30 Silver, Gold or Rainbow Cacti",
				["Type"] = "HarvestCropAnyVariant",
				["Arguments"] = { "Cactus" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 450
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_20_Shocked_Coconut",
				["Display"] = "Harvest 20 Shocked Coconuts",
				["Type"] = "HarvestCropWithMutation",
				["Arguments"] = { "Coconut", "Shocked" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 450
					}
				}
			},
			{
				["Id"] = "Mythical_Gift_15_Dragon_Fruit",
				["Display"] = "Gift 15 Dragon Fruits",
				["Type"] = "Gift",
				["Arguments"] = { "Dragon Fruit" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Feed_Pets_100_Dragon_Fruit",
				["Display"] = "Feed 100 Dragon Fruits to Pets",
				["Type"] = "FeedAnyPet",
				["Arguments"] = { "Dragon Fruit" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_5_Rainbow_Dragon_Fuit",
				["Display"] = "Harvest 5 Rainbow Dragon Fruits",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Dragon Fruit", "Rainbow" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_300_Dragon_Fruit",
				["Display"] = "Harvest 600 Dragon Fruits",
				["Type"] = "Harvest",
				["Arguments"] = { "Dragon Fruit" },
				["Target"] = 600,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 550
					}
				}
			},
			{
				["Id"] = "Mythical_Feed_125_Mango",
				["Display"] = "Feed 125 Mangos to Pets",
				["Type"] = "FeedAnyPet",
				["Arguments"] = { "Mango" },
				["Target"] = 125,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_500_Mango",
				["Display"] = "Harvest 500 Mangos",
				["Type"] = "Harvest",
				["Arguments"] = { "Mango" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 550
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_20Kg_Mango",
				["Display"] = "Harvest 10 20kg Mangos",
				["Type"] = "HarvestGreaterThanSize",
				["Arguments"] = { "Mango" },
				["Target"] = 10,
				["Size"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Mythical_Harvest_15_Gold_Mango",
				["Display"] = "Harvest 15 Gold Mangos",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Mango", "Gold" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			}
		}
	},
	["Divine"] = {
		["Rewards"] = {
			{
				["Type"] = "Seed Pack",
				["Value"] = "Silver Divine Seed Pack",
				["Quantity"] = 3
			}
		},
		["Quests"] = {
			{
				["Id"] = "Divine_Harvest_2000_Mutations",
				["Display"] = "Harvest 8000 Mutated Crops",
				["Type"] = "HarvestAnyMutation",
				["Arguments"] = {},
				["Target"] = 8000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 700
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_75_Shocked_Crops",
				["Display"] = "Harvest 75 Shocked Crops",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Shocked" },
				["Target"] = 75,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 700
					}
				}
			},
			{
				["Id"] = "Divine_Cook_60_Grape",
				["Display"] = "Use 60 Grapes in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Grape" },
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_1000_Grape",
				["Display"] = "Harvest 1000 Grapes",
				["Type"] = "Harvest",
				["Arguments"] = { "Grape" },
				["Target"] = 1000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 650
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_200_Grape",
				["Display"] = "Harvest 200 Mutated Grapes",
				["Type"] = "HarvestCropWithAnyMutation",
				["Arguments"] = { "Grape" },
				["Target"] = 200,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 650
					}
				}
			},
			{
				["Id"] = "Divine_Cook_250_Mushroom",
				["Display"] = "Use 250 Mushrooms in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Mushroom" },
				["Target"] = 250,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 500
					}
				}
			},
			{
				["Id"] = "Divine_Gift_30_Mushroom",
				["Display"] = "Gift 30 Mushrooms",
				["Type"] = "Gift",
				["Arguments"] = { "Mushroom" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 450
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_60_Mushroom",
				["Display"] = "Harvest 60 Mushrooms",
				["Type"] = "Harvest",
				["Arguments"] = { "Mushroom" },
				["Target"] = 60,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_500_Pepper",
				["Display"] = "Harvest 500 Peppers",
				["Type"] = "Harvest",
				["Arguments"] = { "Pepper" },
				["Target"] = 500,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Feed_Pets_300_Pepper",
				["Display"] = "Feed 300 Peppers to Pets",
				["Type"] = "FeedAnyPet",
				["Arguments"] = { "Pepper" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_15_Gold_Pepper",
				["Display"] = "Harvest 15 Gold Peppers",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Pepper", "Gold" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Harvest_400_Cacao",
				["Display"] = "Harvest 400 Cacao",
				["Type"] = "Harvest",
				["Arguments"] = { "Cacao" },
				["Target"] = 400,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 650
					}
				}
			},
			{
				["Id"] = "Divine_Cook_250_Cacao",
				["Display"] = "Use 250 Cacao in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Cacao" },
				["Target"] = 250,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			},
			{
				["Id"] = "Divine_Gift_20_Cacao",
				["Display"] = "Gift 20 Cacao",
				["Type"] = "Gift",
				["Arguments"] = { "Cacao" },
				["Target"] = 20,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 600
					}
				}
			}
		}
	},
	["Prismatic"] = {
		["Rewards"] = {
			{
				["Type"] = "Seed Pack",
				["Value"] = "Silver Prismatic Seed Pack",
				["Quantity"] = 2
			}
		},
		["Quests"] = {
			{
				["Id"] = "Prismatic_Harvest_20000_Mutations",
				["Display"] = "Harvest 20000 Mutated Plants",
				["Type"] = "HarvestAnyMutation",
				["Arguments"] = {},
				["Target"] = 20000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Shovel_1000_Crops",
				["Display"] = "Shovel 1000 Plants",
				["Type"] = "ShovelAny",
				["Arguments"] = {},
				["Target"] = 1000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_30_Disco_Crops",
				["Display"] = "Harvest 30 Disco Crops",
				["Type"] = "HarvestMutation",
				["Arguments"] = { "Disco" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_300_Beanstalk",
				["Display"] = "Harvest 300 Beanstalks",
				["Type"] = "Harvest",
				["Arguments"] = { "Beanstalk" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_100_Silver_Beanstalk",
				["Display"] = "Harvest 100 Silver, Gold or Rainbow Beanstalks",
				["Type"] = "HarvestCropAnyVariant",
				["Arguments"] = { "Beanstalk" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 950
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_5_Rainbow_Beanstalk",
				["Display"] = "Harvest 5 Rainbow Beanstalks",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Beanstalk", "Rainbow" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_100_Ember_Lily",
				["Display"] = "Harvest 100 Ember Lilies",
				["Type"] = "Harvest",
				["Arguments"] = { "Ember Lily" },
				["Target"] = 100,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_10_Gold_Ember_Lily",
				["Display"] = "Harvest 10 Gold Ember Lilies",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Ember Lily", "Gold" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Gift_10_Ember_Lily",
				["Display"] = "Gift 10 Ember Lilies",
				["Type"] = "Gift",
				["Arguments"] = { "Ember Lily" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Plant_6_Sugar_Apple",
				["Display"] = "Plant 6 Sugar Apple Trees",
				["Type"] = "Plant",
				["Arguments"] = { "Sugar Apple" },
				["Target"] = 6,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_1000_Sugar_Apple",
				["Display"] = "Harvest 1000 Sugar Apples",
				["Type"] = "Harvest",
				["Arguments"] = { "Sugar Apple" },
				["Target"] = 1000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_10_Rainbow_Sugar_Apple",
				["Display"] = "Harvest 10 Rainbow Sugar Apples",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Sugar Apple", "Rainbow" },
				["Target"] = 10,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Cook_15_Sugar_Apple",
				["Display"] = "Use 15 Sugar Apples in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Sugar Apple" },
				["Target"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_300_Giant_Pinecone",
				["Display"] = "Harvest 300 Giant Pinecones",
				["Type"] = "Harvest",
				["Arguments"] = { "Giant Pinecone" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_10_Giant_Giant_Pinecone",
				["Display"] = "Harvest 10 15kg Giant Pinecones",
				["Type"] = "HarvestGreaterThanSize",
				["Arguments"] = { "Giant Pinecone" },
				["Target"] = 10,
				["Size"] = 15,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Sell_1000_Burning_Bud",
				["Display"] = "Sell 1000 Burning Buds",
				["Type"] = "Sell",
				["Arguments"] = { "Burning Bud" },
				["Target"] = 1000,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Gift_5_Burning_Bud",
				["Display"] = "Gift 5 Burning Buds",
				["Type"] = "Gift",
				["Arguments"] = { "Burning Bud" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_30_Silver_Burning_Bud",
				["Display"] = "Harvest 30 Silver, Gold or Rainbow Burning Buds",
				["Type"] = "HarvestCropAnyVariant",
				["Arguments"] = { "Burning Bud" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_300_Elder_Strawberry",
				["Display"] = "Harvest 300 Elder Strawberries",
				["Type"] = "Harvest",
				["Arguments"] = { "Elder Strawberry" },
				["Target"] = 300,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_30_Gold_Elder_Strawberry",
				["Display"] = "Harvest 30 Gold Elder Strawberries",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Elder Strawberry", "Gold" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Cook_30_Elder_Strawberry",
				["Display"] = "Use 30 Elder Strawberries in Cooking",
				["Type"] = "Cooking",
				["Arguments"] = { "Elder Strawberry" },
				["Target"] = 30,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Plant_3_Romanesco",
				["Display"] = "Plant 3 Romanesco",
				["Type"] = "Plant",
				["Arguments"] = { "Romanesco" },
				["Target"] = 3,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 1000
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_25_Romanesco",
				["Display"] = "Harvest 25 Mutated Romanesco",
				["Type"] = "HarvestCropWithAnyMutation",
				["Arguments"] = { "Romanesco" },
				["Target"] = 25,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_5_Gold_Romanesco",
				["Display"] = "Harvest 5 Gold Romanesco",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Romanesco", "Gold" },
				["Target"] = 5,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			},
			{
				["Id"] = "Prismatic_Harvest_1_Rainbow_Romanesco",
				["Display"] = "Harvest 1 Rainbow Romanesco",
				["Type"] = "HarvestCropWithVariant",
				["Arguments"] = { "Romanesco", "Rainbow" },
				["Target"] = 1,
				["Rewards"] = {
					{
						["Type"] = "XP",
						["Value"] = 900
					}
				}
			}
		}
	}
}
v2.Sets = v3
return v2
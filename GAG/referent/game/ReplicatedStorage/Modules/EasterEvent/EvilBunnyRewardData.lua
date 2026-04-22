local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon).Types
return {
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Currency",
		["Name"] = "ChocCoins",
		["Quantity"] = 100,
		["Reward"] = v2.Currency:Use("ChocCoins", 100),
		["Chance"] = 34.75
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Seed",
		["Name"] = "Blue Candypop",
		["Quantity"] = 1,
		["Reward"] = v2.Seed:Use("Blue Candypop", 1),
		["Chance"] = 27
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Crate",
		["Name"] = "Easter Crate",
		["Quantity"] = 1,
		["Reward"] = v2.Crate:Use("Easter Crate", 1),
		["Chance"] = 20
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Egg",
		["Name"] = "Golden Egg",
		["Quantity"] = 1,
		["Reward"] = v2.Egg:Use("Golden Egg", 1),
		["Chance"] = 10
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Pet",
		["Name"] = "Stork",
		["Quantity"] = 1,
		["Reward"] = v2.Pet:Use("Stork"),
		["Chance"] = 5
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Egg",
		["Name"] = "Golden Egg",
		["Quantity"] = 3,
		["Reward"] = v2.Egg:Use("Golden Egg", 3),
		["Chance"] = 2.5
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Pet",
		["Name"] = "Orchid Mantis",
		["Quantity"] = 1,
		["Reward"] = v2.Pet:Use("Orchid Mantis"),
		["Chance"] = 0.5
	},
	{
		["Type"] = "GiveItem",
		["RewardType"] = "Seed",
		["Name"] = "Easter Sprout",
		["Quantity"] = 1,
		["Reward"] = v2.Seed:Use("Easter Sprout", 1),
		["Chance"] = 0.25
	}
}
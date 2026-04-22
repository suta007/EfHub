local v1 = {
	["Egg"] = "Egg",
	["Gear"] = "Gear",
	["Currency"] = "Currency",
	["Crate"] = "Crate",
	["SeedPack"] = "Seed Pack",
	["Seed"] = "Seed"
}
local v2 = {
	["Rewards"] = {
		{
			["Value"] = "Golden Egg",
			["Quantity"] = 3,
			["Weight"] = 1,
			["Type"] = v1.Egg
		},
		{
			["Value"] = "Golden Egg",
			["Quantity"] = 2,
			["Weight"] = 4,
			["Type"] = v1.Egg
		},
		{
			["Value"] = "Golden Egg",
			["Quantity"] = 1,
			["Weight"] = 7,
			["Type"] = v1.Egg
		},
		{
			["Value"] = "Easter Crate",
			["Quantity"] = 1,
			["Weight"] = 15,
			["Type"] = v1.Crate
		},
		{
			["Value"] = "Chocolate Sprinkler",
			["Quantity"] = 2,
			["Weight"] = 15,
			["Type"] = v1.Gear
		},
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 5000,
			["Weight"] = 5,
			["Type"] = v1.Currency
		},
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 2500,
			["Weight"] = 8,
			["Type"] = v1.Currency
		},
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 1000,
			["Weight"] = 15,
			["Type"] = v1.Currency
		},
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 500,
			["Weight"] = 30,
			["Type"] = v1.Currency
		}
	}
}
local v3 = {
	["Golden Egg"] = {
		{
			["Value"] = "Golden Egg",
			["Display"] = "Golden Egg",
			["Quantity"] = 1,
			["Type"] = v1.Egg,
			["RainbowInterface"] = true
		}
	},
	["Rare"] = {
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 1250,
			["Type"] = v1.Currency
		},
		{
			["Value"] = "Easter Crate",
			["Display"] = "Easter Crate",
			["Quantity"] = 1,
			["Type"] = v1.Crate
		},
		{
			["Value"] = "Chocolate Sprinkler",
			["Display"] = "Chocolate Sprinkler",
			["Quantity"] = 1,
			["Type"] = v1.Gear
		},
		{
			["Value"] = "Easter Seed Pack",
			["Display"] = "Easter Seed Pack",
			["Quantity"] = 1,
			["Type"] = v1.SeedPack
		},
		{
			["Value"] = "Golden Egg",
			["Display"] = "Golden Egg",
			["Quantity"] = 1,
			["Type"] = v1.Egg,
			["RainbowInterface"] = true
		}
	},
	["Legendary"] = {
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 5000,
			["Type"] = v1.Currency
		},
		{
			["Value"] = "Chocolate Sprinkler",
			["Display"] = "Chocolate Sprinkler",
			["Quantity"] = 2,
			["Type"] = v1.Gear
		},
		{
			["Value"] = "Easter Seed Pack",
			["Display"] = "Easter Seed Pack",
			["Quantity"] = 2,
			["Type"] = v1.SeedPack
		},
		{
			["Value"] = "Golden Egg",
			["Display"] = "Golden Egg",
			["Quantity"] = 2,
			["Type"] = v1.Egg,
			["RainbowInterface"] = true
		}
	},
	["Mythical"] = {
		{
			["Value"] = "ChocCoins",
			["Display"] = "Chocolate Coin",
			["Quantity"] = 10000,
			["Type"] = v1.Currency
		},
		{
			["Value"] = "Springtide Egg",
			["Display"] = "Springtide Egg",
			["Quantity"] = 1,
			["Type"] = v1.Egg
		},
		{
			["Value"] = "Easter Seed Pack",
			["Display"] = "Easter Seed Pack",
			["Quantity"] = 3,
			["Type"] = v1.SeedPack
		},
		{
			["Value"] = "Golden Egg",
			["Display"] = "Golden Egg",
			["Quantity"] = 3,
			["Type"] = v1.Egg,
			["RainbowInterface"] = true
		}
	},
	["Divine"] = {
		{
			["Value"] = "Springtide Egg",
			["Display"] = "Springtide Egg",
			["Quantity"] = 5,
			["Type"] = v1.Egg
		},
		{
			["Value"] = "Golden Egg",
			["Display"] = "Golden Egg",
			["Quantity"] = 10,
			["Type"] = v1.Egg,
			["RainbowInterface"] = true
		},
		{
			["Value"] = "Marshmallow Root",
			["Display"] = "Marshmallow Root Seed",
			["Quantity"] = 1,
			["Type"] = v1.Seed,
			["RainbowInterface"] = true
		}
	}
}
v2.GlobalRewards = v3
v2.GlobalRewardRarities = {
	["Golden Egg"] = 40,
	["Rare"] = 39,
	["Legendary"] = 15,
	["Mythical"] = 5,
	["Divine"] = 1
}
v2.RewardType = v1
return v2
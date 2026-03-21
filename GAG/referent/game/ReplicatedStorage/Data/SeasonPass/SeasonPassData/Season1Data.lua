local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Data.GearData)
local v3 = require(v1.Data.SeedData)
local v4 = require(v1.Data.SeedPackData)
local v5 = require(v1.Data.CosmeticRegistry.CosmeticList)
local v6 = require(v1.Data.CosmeticCrateRegistry.CosmeticCrates)
local v7 = {
	["InfRewards"] = {
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 200
		}
	}
}
local v8 = {
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		},
		{
			["DisplayName"] = "Firework",
			["Type"] = "Gear",
			["Value"] = "Firework",
			["Quantity"] = 5
		}
	},
	{
		{
			["DisplayName"] = "Blue Jay",
			["Type"] = "Pet",
			["Value"] = "Blue Jay",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Sundew Seed",
			["Type"] = "Seed",
			["Value"] = "Sundew",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Computer Monitor",
			["Type"] = "Cosmetic",
			["Value"] = "Computer Monitor",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		},
		{
			["DisplayName"] = "Uncommon Egg",
			["Type"] = "Egg",
			["Value"] = "Uncommon Egg",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Black Bat Flower Seed",
			["Type"] = "Seed",
			["Value"] = "Black Bat Flower",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		},
		{
			["DisplayName"] = "Leaf Blower",
			["Type"] = "Gear",
			["Value"] = "Leaf Blower",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Grandmaster Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Grandmaster Sprinkler",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		}
	},
	{
		{
			["DisplayName"] = "Watering Can",
			["Type"] = "Gear",
			["Value"] = "Watering Can",
			["Quantity"] = 10
		},
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		},
		{
			["DisplayName"] = "Super Leaf Blower",
			["Type"] = "Gear",
			["Value"] = "Super Leaf Blower",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Mandrone Berry Seed",
			["Type"] = "Seed",
			["Value"] = "Mandrone Berry",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 75
		}
	},
	{
		{
			["DisplayName"] = "Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Godly Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Godly Sprinkler",
			["Quantity"] = 1
		},
		{
			["DisplayName"] = "Watering Can",
			["Type"] = "Gear",
			["Value"] = "Watering Can",
			["Quantity"] = 20
		}
	},
	{
		{
			["DisplayName"] = "Mushroom Bed",
			["Type"] = "Cosmetic",
			["Value"] = "Mushroom Bed",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 75
		}
	},
	{
		{
			["DisplayName"] = "Small Treat",
			["Type"] = "Gear",
			["Value"] = "Small Treat",
			["Quantity"] = 2
		},
		{
			["DisplayName"] = "Medium Treat",
			["Type"] = "Gear",
			["Value"] = "Medium Treat",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Small Toy",
			["Type"] = "Gear",
			["Value"] = "Small Toy",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Lightning Rod",
			["Type"] = "Gear",
			["Value"] = "Lightning Rod",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Corpse Flower Seed",
			["Type"] = "Seed",
			["Value"] = "Corpse Flower",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Firefly",
			["Type"] = "Pet",
			["Value"] = "Firefly",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Favorite Tool",
			["Type"] = "Gear",
			["Value"] = "Favorite Tool",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Pet Lead",
			["Type"] = "Gear",
			["Value"] = "Pet Lead",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Rare Egg",
			["Type"] = "Egg",
			["Value"] = "Rare Egg",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Master Sprinkler",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Grow All",
			["Type"] = "Gear",
			["Value"] = "Grow All",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Mystical Waterfall",
			["Type"] = "Cosmetic",
			["Value"] = "Mystical Waterfall",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Harvest Tool",
			["Type"] = "Gear",
			["Value"] = "Harvest Tool",
			["Quantity"] = 2
		},
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 50
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Silver Dragonfly",
			["Type"] = "Pet",
			["Value"] = "Silver Dragonfly",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		},
		{
			["DisplayName"] = "Pumpkin Seed",
			["Type"] = "Seed",
			["Value"] = "Pumpkin",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Inferno Quince Seed",
			["Type"] = "Seed",
			["Value"] = "Inferno Quince",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Grow All",
			["Type"] = "Gear",
			["Value"] = "Grow All",
			["Quantity"] = 1
		},
		{
			["DisplayName"] = "Super Watering Can",
			["Type"] = "Gear",
			["Value"] = "Super Watering Can",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 75
		},
		{
			["DisplayName"] = "Jungle Egg",
			["Type"] = "Egg",
			["Value"] = "Jungle Egg",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Mizuchi",
			["Type"] = "Pet",
			["Value"] = "Mizuchi",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		},
		{
			["DisplayName"] = "Mushroom Seed",
			["Type"] = "Seed",
			["Value"] = "Mushroom",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Multitrap Seed",
			["Type"] = "Seed",
			["Value"] = "Multitrap",
			["Quantity"] = 1
		}
	}
}
v7.FreeRewards = v8
local v9 = {
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Firework",
			["Type"] = "Gear",
			["Value"] = "Firework",
			["Quantity"] = 5
		}
	},
	{
		{
			["DisplayName"] = "Rainbow Blue Jay",
			["Type"] = "Pet",
			["Value"] = "Rainbow Blue Jay",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Sundew Seed",
			["Type"] = "Seed",
			["Value"] = "Sundew",
			["Quantity"] = 3
		}
	},
	{
		{
			["DisplayName"] = "Exotic Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Golden Radio",
			["Type"] = "Cosmetic",
			["Value"] = "Golden Radio",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Rare Egg",
			["Type"] = "Egg",
			["Value"] = "Rare Egg",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Black Bat Flower Seed",
			["Type"] = "Seed",
			["Value"] = "Black Bat Flower",
			["Quantity"] = 1,
			["Variant"] = "Gold"
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Reclaimer",
			["Type"] = "Gear",
			["Value"] = "Reclaimer",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Grandmaster Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Grandmaster Sprinkler",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		}
	},
	{
		{
			["DisplayName"] = "Watering Can",
			["Type"] = "Gear",
			["Value"] = "Watering Can",
			["Quantity"] = 20
		},
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 100
		},
		{
			["DisplayName"] = "Advanced Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Advanced Sprinkler",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Mandrone Berry Seed",
			["Type"] = "Seed",
			["Value"] = "Mandrone Berry",
			["Quantity"] = 1,
			["Variant"] = "Silver"
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Exotic Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Master Sprinkler",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Flower Swing",
			["Type"] = "Cosmetic",
			["Value"] = "Flower Swing",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Reclaimer",
			["Type"] = "Gear",
			["Value"] = "Reclaimer",
			["Quantity"] = 3
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		},
		{
			["DisplayName"] = "Medium Toy",
			["Type"] = "Gear",
			["Value"] = "Medium Toy",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Grow All",
			["Type"] = "Gear",
			["Value"] = "Grow All",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Corpse Flower Seed",
			["Type"] = "Seed",
			["Value"] = "Corpse Flower",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "GIANT Firefly",
			["Type"] = "Pet",
			["Value"] = "GIANT Firefly",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		},
		{
			["DisplayName"] = "Pet Lead",
			["Type"] = "Gear",
			["Value"] = "Pet Lead",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Exotic Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 200
		}
	},
	{
		{
			["DisplayName"] = "Godly Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Godly Sprinkler",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 150
		}
	},
	{
		{
			["DisplayName"] = "Golden Harp",
			["Type"] = "Cosmetic",
			["Value"] = "Golden Harp",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Prime Crate",
			["Type"] = "Crate",
			["Value"] = "Prime Crate",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 200
		},
		{
			["DisplayName"] = "Legendary Egg",
			["Type"] = "Egg",
			["Value"] = "Legendary Egg",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Reclaimer",
			["Type"] = "Gear",
			["Value"] = "Reclaimer",
			["Quantity"] = 2
		},
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 75
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 200
		}
	},
	{
		{
			["DisplayName"] = "GIANT Silver Dragonfly",
			["Type"] = "Pet",
			["Value"] = "GIANT Silver Dragonfly",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Exotic Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 200
		},
		{
			["DisplayName"] = "Pumpkin Seed",
			["Type"] = "Seed",
			["Value"] = "Pumpkin",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Master Sprinkler",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Inferno Quince Seed",
			["Type"] = "Seed",
			["Value"] = "Inferno Quince",
			["Quantity"] = 1,
			["Variant"] = "Gold"
		}
	},
	{
		{
			["DisplayName"] = "Grow All",
			["Type"] = "Gear",
			["Value"] = "Grow All",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 500
		}
	},
	{
		{
			["DisplayName"] = "Rainbow Mizuchi",
			["Type"] = "Pet",
			["Value"] = "Rainbow Mizuchi",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Exotic Prime Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Prime Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 1000
		},
		{
			["DisplayName"] = "Mushroom Seed",
			["Type"] = "Seed",
			["Value"] = "Mushroom",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Multitrap Seed",
			["Type"] = "Seed",
			["Value"] = "Multitrap",
			["Quantity"] = 1,
			["Variant"] = "Silver"
		}
	}
}
v7.PremiumRewards = v9
v7.IncludesItems = {
	"Silver Multitrap",
	"Gold Inferno Quince",
	"Rainbow Mizuchi",
	"Golden Harp",
	"Flower Swing"
}
local v10 = {
	["Prime Crate"] = {
		["DisplayName"] = "Prime Crate",
		["Rarity"] = "Common",
		["Type"] = "Crate",
		["ImageId"] = v6["Prime Crate"].Icon,
		["StockChance"] = 1,
		["StockAmount"] = { 1, 2 },
		["Price"] = 100,
		["PurchaseID"] = 3415145445,
		["GiftPurchaseID"] = 3415145914,
		["LayoutOrder"] = 1,
		["FallbackPrice"] = 179
	},
	["Egg Yolk Mat"] = {
		["DisplayName"] = "Egg Yolk Mat",
		["Rarity"] = v5["Egg Yolk Mat"].Rarity,
		["Type"] = "Cosmetic",
		["ImageId"] = v5["Egg Yolk Mat"].Icon,
		["StockChance"] = 5,
		["StockAmount"] = { 1, 1 },
		["Price"] = 600,
		["PurchaseID"] = 3415152614,
		["GiftPurchaseID"] = 3415152891,
		["LayoutOrder"] = 2,
		["FallbackPrice"] = 239
	},
	["Silver Fertilizer"] = {
		["DisplayName"] = "Silver Fertilizer",
		["Rarity"] = v2["Silver Fertilizer"].GearRarity,
		["Type"] = "Gear",
		["ImageId"] = v2["Silver Fertilizer"].Asset,
		["Desc"] = v2["Silver Fertilizer"].GearDescription,
		["Stack"] = 1,
		["StockChance"] = 50,
		["StockAmount"] = { 1, 1 },
		["Price"] = 300,
		["PurchaseID"] = 3369805300,
		["GiftPurchaseID"] = 3415155618,
		["LayoutOrder"] = 3,
		["FallbackPrice"] = 129
	},
	["Prime Seed Pack"] = {
		["DisplayName"] = "Prime Seed Pack",
		["Rarity"] = "Divine",
		["Type"] = "Seed Pack",
		["ImageId"] = v4.Packs["Prime Seed Pack"].Icon,
		["StockChance"] = 5,
		["StockAmount"] = { 1, 2 },
		["Price"] = 100,
		["PurchaseID"] = 3415156946,
		["GiftPurchaseID"] = 3415157116,
		["LayoutOrder"] = 4,
		["FallbackPrice"] = 199
	},
	["Levelup Lollipop"] = {
		["DisplayName"] = "Levelup Lollipop",
		["Rarity"] = v2["Levelup Lollipop"].GearRarity,
		["Type"] = "Gear",
		["ImageId"] = v2["Levelup Lollipop"].Asset,
		["Desc"] = v2["Levelup Lollipop"].GearDescription,
		["Stack"] = 1,
		["StockChance"] = 250,
		["StockAmount"] = { 1, 1 },
		["Price"] = 250,
		["PurchaseID"] = 3329528135,
		["GiftPurchaseID"] = 3329530334,
		["LayoutOrder"] = 5,
		["FallbackPrice"] = 79
	},
	["Grow All"] = {
		["DisplayName"] = "Grow All",
		["Rarity"] = v2["Grow All"].GearRarity,
		["Type"] = "Gear",
		["ImageId"] = v2["Grow All"].Asset,
		["Desc"] = v2["Grow All"].GearDescription,
		["Stack"] = 1,
		["StockChance"] = 300,
		["StockAmount"] = { 1, 1 },
		["Price"] = 900,
		["PurchaseID"] = 3415151239,
		["GiftPurchaseID"] = 3415151549,
		["LayoutOrder"] = 6,
		["FallbackPrice"] = 375
	},
	["Naval Wort"] = {
		["DisplayName"] = "Naval Wort",
		["Rarity"] = v3["Naval Wort"].SeedRarity,
		["Type"] = "Seed",
		["ImageId"] = v3["Naval Wort"].Asset,
		["StockChance"] = 400,
		["StockAmount"] = { 1, 1 },
		["Price"] = 2000,
		["PurchaseID"] = 3415158407,
		["GiftPurchaseID"] = 3415158618,
		["LayoutOrder"] = 7,
		["FallbackPrice"] = 779
	}
}
v7.ShopItems = v10
return v7
local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Data.GearData)
local v3 = require(v1.Data.SeedData)
require(v1.Data.PetRegistry.PetList)
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
		}
	},
	{
		{
			["DisplayName"] = "Firemite",
			["Type"] = "Pet",
			["Value"] = "Firemite",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Drowned Flower Seed",
			["Type"] = "Seed",
			["Value"] = "Drowned Flower",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Vials",
			["Type"] = "Cosmetic",
			["Value"] = "Vials",
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
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Saskia Seed",
			["Type"] = "Seed",
			["Value"] = "Saskia",
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
			["Quantity"] = 75
		}
	},
	{
		{
			["DisplayName"] = "Watering Can",
			["Type"] = "Gear",
			["Value"] = "Watering Can",
			["Quantity"] = 10
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 125
		}
	},
	{
		{
			["DisplayName"] = "Mini Pumpkin Seed",
			["Type"] = "Seed",
			["Value"] = "Mini Pumpkin",
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
			["DisplayName"] = "Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Master Sprinkler",
			["Quantity"] = 5
		}
	},
	{
		{
			["DisplayName"] = "Fire Lamp",
			["Type"] = "Cosmetic",
			["Value"] = "Fire Lamp",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
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
			["Quantity"] = 50
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
			["DisplayName"] = "Jungle Cherry Seed",
			["Type"] = "Seed",
			["Value"] = "Jungle Cherry",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Ash Raven",
			["Type"] = "Pet",
			["Value"] = "Ash Raven",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Super Watering Can",
			["Type"] = "Gear",
			["Value"] = "Super Watering Can",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 3
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
			["DisplayName"] = "Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 175
		}
	},
	{
		{
			["DisplayName"] = "Rare Egg",
			["Type"] = "Egg",
			["Value"] = "Rare Egg",
			["Quantity"] = 4
		}
	},
	{
		{
			["DisplayName"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Master Sprinkler",
			["Quantity"] = 5
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
			["DisplayName"] = "Pool Table",
			["Type"] = "Cosmetic",
			["Value"] = "Pool Table",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
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
			["DisplayName"] = "Hazehound",
			["Type"] = "Pet",
			["Value"] = "Hazehound",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Season 4 Seed Pack",
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
			["DisplayName"] = "Grow All",
			["Type"] = "Gear",
			["Value"] = "Grow All",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Amazon Feather Fern Seed",
			["Type"] = "Seed",
			["Value"] = "Amazon Feather Fern",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Burning Bud Seed",
			["Type"] = "Seed",
			["Value"] = "Burning Bud",
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
			["DisplayName"] = "Cerberus",
			["Type"] = "Pet",
			["Value"] = "Cerberus",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Season 4 Seed Pack",
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
			["DisplayName"] = "Boreal Orange Seed",
			["Type"] = "Seed",
			["Value"] = "Boreal Orange",
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
		}
	},
	{
		{
			["DisplayName"] = "Giant Firemite",
			["Type"] = "Pet",
			["Value"] = "GIANT Firemite",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Drowned Flower Seed",
			["Type"] = "Seed",
			["Value"] = "Drowned Flower",
			["Quantity"] = 3
		}
	},
	{
		{
			["DisplayName"] = "Exotic Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Cerberus Statue",
			["Type"] = "Cosmetic",
			["Value"] = "Cerberus Statue",
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
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Saskia Seed",
			["Type"] = "Seed",
			["Value"] = "Saskia",
			["Quantity"] = 2
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
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 5
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 125
		}
	},
	{
		{
			["DisplayName"] = "Watering Can",
			["Type"] = "Gear",
			["Value"] = "Watering Can",
			["Quantity"] = 20
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
			["DisplayName"] = "Mini Pumpkin",
			["Type"] = "Seed",
			["Value"] = "Mini Pumpkin",
			["Quantity"] = 1,
			["Variant"] = "Silver"
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 125
		}
	},
	{
		{
			["DisplayName"] = "Exotic Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Super Watering Can",
			["Type"] = "Gear",
			["Value"] = "Super Watering Can",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Gear Lamp",
			["Type"] = "Cosmetic",
			["Value"] = "Gear Lamp",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
			["Quantity"] = 2
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
			["Quantity"] = 125
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
			["DisplayName"] = "Jungle Cherry Seed",
			["Type"] = "Seed",
			["Value"] = "Jungle Cherry",
			["Quantity"] = 1,
			["Variant"] = "Silver"
		}
	},
	{
		{
			["DisplayName"] = "Giant Ash Raven",
			["Type"] = "Pet",
			["Value"] = "GIANT Ash Raven",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Reclaimer",
			["Type"] = "Gear",
			["Value"] = "Reclaimer",
			["Quantity"] = 4
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
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
			["DisplayName"] = "Exotic Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 300
		}
	},
	{
		{
			["DisplayName"] = "Legendary Egg",
			["Type"] = "Egg",
			["Value"] = "Legendary Egg",
			["Quantity"] = 2
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
			["DisplayName"] = "Hydro Pillar",
			["Type"] = "Cosmetic",
			["Value"] = "Hydro Pillar",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Season 4 Crate",
			["Type"] = "Crate",
			["Value"] = "Season 4 Crate",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Legendary Egg",
			["Type"] = "Egg",
			["Value"] = "Legendary Egg",
			["Quantity"] = 2
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
			["DisplayName"] = "Reclaimer",
			["Type"] = "Gear",
			["Value"] = "Reclaimer",
			["Quantity"] = 2
		}
	},
	{
		{
			["DisplayName"] = "Rainbow Hazehound",
			["Type"] = "Pet",
			["Value"] = "Rainbow Hazehound",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Exotic Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Season 4 Seed Pack",
			["Quantity"] = 1
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
			["DisplayName"] = "Grow All",
			["Type"] = "Gear",
			["Value"] = "Grow All",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Amazon Feather Fern Seed",
			["Type"] = "Seed",
			["Value"] = "Amazon Feather Fern",
			["Quantity"] = 1,
			["Variant"] = "Gold"
		}
	},
	{
		{
			["DisplayName"] = "Burning Bud Seed",
			["Type"] = "Seed",
			["Value"] = "Burning Bud",
			["Quantity"] = 1,
			["Variant"] = "Silver"
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 300
		}
	},
	{
		{
			["DisplayName"] = "Rainbow Cerberus",
			["Type"] = "Pet",
			["Value"] = "Rainbow Cerberus",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Exotic Season 4 Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Exotic Season 4 Seed Pack",
			["Quantity"] = 1
		}
	},
	{
		{
			["DisplayName"] = "Pass Points",
			["Type"] = "Currency",
			["Value"] = "PassPoints",
			["Quantity"] = 800
		}
	},
	{
		{
			["DisplayName"] = "Boreal Orange Seed",
			["Type"] = "Seed",
			["Value"] = "Boreal Orange",
			["Quantity"] = 1,
			["Variant"] = "Gold"
		}
	}
}
v7.PremiumRewards = v9
v7.IncludesItems = {
	"Rainbow Cerberus!",
	"Gold Boreal Orange!",
	"Gold Amazon Feather Fern",
	"Giant Ash Raven",
	"Hydro Pillar"
}
local v10 = {
	["Season 4 Crate"] = {
		["DisplayName"] = "Season 4 Crate",
		["Rarity"] = "Common",
		["Type"] = "Crate",
		["ImageId"] = v6["Season 4 Crate"].Icon,
		["StockChance"] = 1,
		["StockAmount"] = { 1, 2 },
		["Price"] = 100,
		["PurchaseID"] = 3564957722,
		["GiftPurchaseID"] = 0,
		["LayoutOrder"] = 1,
		["FallbackPrice"] = 179
	},
	["Smith Hammer of Harvest"] = {
		["DisplayName"] = "Hammer of Harvest",
		["Rarity"] = v2["Smith Hammer of Harvest"].GearRarity,
		["Type"] = "Gear",
		["ImageId"] = v2["Smith Hammer of Harvest"].Asset,
		["Desc"] = v2["Smith Hammer of Harvest"].GearDescription,
		["Stack"] = 1,
		["StockChance"] = 50,
		["StockAmount"] = { 1, 1 },
		["Price"] = 275,
		["PurchaseID"] = 3455273154,
		["GiftPurchaseID"] = 0,
		["LayoutOrder"] = 2,
		["FallbackPrice"] = 179
	},
	["Garden Basin"] = {
		["DisplayName"] = "Garden Basin",
		["Rarity"] = v5["Garden Basin"].Rarity,
		["Type"] = "Cosmetic",
		["ImageId"] = v5["Garden Basin"].Icon,
		["StockChance"] = 5,
		["StockAmount"] = { 1, 1 },
		["Price"] = 600,
		["PurchaseID"] = 3564957303,
		["GiftPurchaseID"] = 0,
		["LayoutOrder"] = 3,
		["FallbackPrice"] = 119
	},
	["Season 4 Seed Pack"] = {
		["DisplayName"] = "Season 4 Seed Pack",
		["Rarity"] = "Divine",
		["Type"] = "Seed Pack",
		["ImageId"] = v4.Packs["Season 4 Seed Pack"].Icon,
		["StockChance"] = 5,
		["StockAmount"] = { 1, 2 },
		["Price"] = 150,
		["PurchaseID"] = 3564957517,
		["GiftPurchaseID"] = 0,
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
		["StockChance"] = 150,
		["StockAmount"] = { 1, 1 },
		["Price"] = 500,
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
		["StockChance"] = 250,
		["StockAmount"] = { 1, 1 },
		["Price"] = 1000,
		["PurchaseID"] = 3415151239,
		["GiftPurchaseID"] = 3415151549,
		["LayoutOrder"] = 6,
		["FallbackPrice"] = 375
	},
	["Purple Treeshroom"] = {
		["DisplayName"] = "Purple Treeshroom",
		["Rarity"] = v3["Purple Treeshroom"].SeedRarity,
		["Type"] = "Seed",
		["ImageId"] = v3["Purple Treeshroom"].Asset,
		["StockChance"] = 300,
		["StockAmount"] = { 1, 1 },
		["Price"] = 3000,
		["PurchaseID"] = 3564958091,
		["GiftPurchaseID"] = 0,
		["LayoutOrder"] = 7,
		["FallbackPrice"] = 819
	}
}
v7.ShopItems = v10
return v7
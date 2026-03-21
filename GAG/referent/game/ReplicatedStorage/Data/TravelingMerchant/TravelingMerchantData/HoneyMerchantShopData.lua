local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.Chalk)
local v2 = {
	["Flower Seed Pack"] = {
		["SeedName"] = "Flower Seed Pack",
		["SeedRarity"] = "Rare",
		["StockChance"] = 1,
		["StockAmount"] = { 1, 2 },
		["Price"] = 10,
		["PurchaseID"] = 3295395160,
		["SpecialCurrencyType"] = "Honey",
		["DisplayInShop"] = true,
		["ShowOdds"] = true,
		["LayoutOrder"] = 1,
		["ItemType"] = "Seed Pack",
		["Stack"] = 1,
		["Description"] = "",
		["FallbackPrice"] = 199
	},
	["Honey Sprinkler"] = {
		["SeedName"] = "Honey Sprinkler",
		["SeedRarity"] = "Divine",
		["StockChance"] = 6,
		["StockAmount"] = { 1, 1 },
		["Price"] = 30,
		["PurchaseID"] = 3295397583,
		["SpecialCurrencyType"] = "Honey",
		["DisplayInShop"] = true,
		["LayoutOrder"] = 25,
		["ItemType"] = "Gear",
		["Stack"] = 1,
		["Description"] = "Covers nearby plants in honey! Lasts 1 minute",
		["FallbackPrice"] = 199
	},
	["Bee Egg"] = {
		["SeedName"] = "Bee Egg",
		["SeedRarity"] = "Mythical",
		["StockChance"] = 1,
		["StockAmount"] = { 1, 1 },
		["Price"] = 18,
		["PurchaseID"] = 3295398638,
		["SpecialCurrencyType"] = "Honey",
		["DisplayInShop"] = true,
		["ShowOdds"] = true,
		["LayoutOrder"] = 30,
		["ItemType"] = "Egg",
		["Stack"] = 1,
		["Description"] = "",
		["FallbackPrice"] = 129
	},
	["Bee Crate"] = {
		["SeedName"] = "Bee Crate",
		["SeedRarity"] = "Legendary",
		["StockChance"] = 4,
		["StockAmount"] = { 1, 1 },
		["Price"] = 12,
		["PurchaseID"] = 3295396781,
		["SpecialCurrencyType"] = "Honey",
		["DisplayInShop"] = true,
		["ShowOdds"] = true,
		["LayoutOrder"] = 40,
		["ItemType"] = "Crate",
		["Stack"] = 1,
		["Description"] = "",
		["FallbackPrice"] = 179
	},
	["Honey Crafters Crate"] = {
		["SeedName"] = "Honey Crafters Crate",
		["SeedRarity"] = "Legendary",
		["StockChance"] = 4,
		["StockAmount"] = { 1, 1 },
		["Price"] = 15,
		["PurchaseID"] = 3306484248,
		["SpecialCurrencyType"] = "Honey",
		["DisplayInShop"] = true,
		["ShowOdds"] = true,
		["LayoutOrder"] = 50,
		["ItemType"] = "Crate",
		["Stack"] = 1,
		["Description"] = "",
		["FallbackPrice"] = 179
	}
}
return v2
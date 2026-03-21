game:GetService("ReplicatedStorage")
local v1 = {
	["Sky Traveling Merchant"] = {
		["Title"] = "Sky",
		["ShopData"] = require(script.SkyMerchantShopData),
		["AppearanceChance"] = 4,
		["Duration"] = 1800
	},
	["Gnome Traveling Merchant"] = {
		["Title"] = "Gnome",
		["ShopData"] = require(script.GnomeMerchantShopData),
		["AppearanceChance"] = 3,
		["Duration"] = 1800
	},
	["Honey Traveling Merchant"] = {
		["Title"] = "Honey",
		["ShopData"] = require(script.HoneyMerchantShopData),
		["AppearanceChance"] = 4,
		["Duration"] = 1800
	},
	["Summer Traveling Merchant"] = {
		["Title"] = "Summer",
		["ShopData"] = require(script.SummerMerchantShopData),
		["AppearanceChance"] = 4,
		["Duration"] = 1800
	},
	["Rare Cosmetic Traveling Merchant"] = {
		["Title"] = "Rare Cosmetic",
		["ShopData"] = require(script.RareCosmeticMerchantShopData),
		["AppearanceChance"] = 2,
		["Duration"] = 1800
	},
	["Spray Traveling Merchant"] = {
		["Title"] = "Spray",
		["ShopData"] = require(script.SprayMerchantShopData),
		["AppearanceChance"] = -1,
		["Duration"] = 1800
	},
	["Sprinkling Traveling Merchant"] = {
		["Title"] = "Sprinkler",
		["ShopData"] = require(script.SprinklerMerchantShopData),
		["AppearanceChance"] = 4,
		["Duration"] = 1800
	},
	["Fall Traveling Merchant"] = {
		["Title"] = "Fall",
		["ShopData"] = require(script.FallMerchantShopData),
		["AppearanceChance"] = 4,
		["Duration"] = 1800
	},
	["Safari Traveling Merchant"] = {
		["Title"] = "Safari",
		["ShopData"] = require(script.SafariMerchantShopData),
		["AppearanceChance"] = 4,
		["Duration"] = 1800
	},
	["Halloween Traveling Merchant"] = {
		["Title"] = "Halloween",
		["ShopData"] = require(script.HalloweenMerchantShopData),
		["AppearanceChance"] = -1,
		["Duration"] = 86400
	},
	["American Traveling Merchant"] = {
		["Title"] = "4th July",
		["ShopData"] = require(script.AmericanMerchantShopData),
		["AppearanceChance"] = -1,
		["Duration"] = 122400
	}
}
return v1
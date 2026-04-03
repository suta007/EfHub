local fVar = {}

fVar.IsPlanting = false
fVar.IsAgeBreaking = false
fVar.IsHarvesting = false
fVar.IsSelling = false
fVar.IsFruitHidden = false
fVar.IsPlantHidden = false
fVar.IsRemovingPlants = false
fVar.IsRemovingCrops = false
fVar.IsTroweling = false
fVar.IsReclaiming = false
fVar.IsSprinkling = false
fVar.IsCatLeading = false
fVar.IsFarmingLevel = false
--fVar.IsOpeningPack = false
fVar.IsMutating = false
fVar.IsFeeding = false

fVar.UIShopLoaded = false

fVar.CheckLevelConnection = nil
fVar.CheckLevelConnection2 = nil

fVar.Pos = {
	Trowel = nil,
	Sprinkler = nil,
}

fVar.ShopKey = {
	Seed = "ROOT/SeedStocks/Shop/Stocks",
	Daily = "ROOT/SeedStocks/Daily Deals/Stocks",
	Gear = "ROOT/GearStock/Stocks",
	Egg = "ROOT/PetEggStock/Stocks",
	Santa = "ROOT/EventShopStock/Santa's Stash/Stocks",
	NewYear = "ROOT/EventShopStock/New Years Shop/Stocks",
	Traveling = "ROOT/TravelingMerchantShopStock/Stocks",
}

fVar.BuyList = {
	[fVar.ShopKey.Seed] = {
		Enabled = false,
		BuyAll = false,
		Items = {},
		RemoteName = "BuySeedStock",
		ArgType = "SeedMode",
	},
	[fVar.ShopKey.Daily] = {
		Enabled = true,
		BuyAll = true,
		Items = {},
		RemoteName = "BuyDailySeedShopStock",
		ArgType = "NormalMode",
	},
	[fVar.ShopKey.Gear] = {
		Enabled = false,
		BuyAll = false,
		Items = {},
		RemoteName = "BuyGearStock",
		ArgType = "NormalMode",
	},
	[fVar.ShopKey.Egg] = {
		Enabled = false,
		BuyAll = false,
		Items = {},
		RemoteName = "BuyPetEgg",
		ArgType = "NormalMode",
	},
	[fVar.ShopKey.Traveling] = {
		Enabled = false,
		BuyAll = false,
		Items = {},
		RemoteName = "BuyTravelingMerchantShopStock",
		ArgType = "NormalMode",
	},
	[fVar.ShopKey.Santa] = {
		Enabled = false,
		BuyAll = false,
		Items = {},
		RemoteName = "BuyEventShopStock",
		ArgType = "EventMode",
		EventArg = "Santa's Stash",
	},
	[fVar.ShopKey.NewYear] = {
		Enabled = false,
		BuyAll = false,
		Items = {},
		RemoteName = "BuyEventShopStock",
		ArgType = "EventMode",
		EventArg = "New Years Shop",
	},
}

return fVar

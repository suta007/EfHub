local Shop = {}
local reg
local BuyList = {}
local GetSelectedItems
local ShopKey = {
	Seed = "SeedStocks/Shop/Stocks",
	Daily = "SeedStocks/Daily Deals/Stocks",
	Gear = "GearStock/Stocks",
	Egg = "PetEggStock/Stocks",
	Santa = "EventShopStock/Santa's Stash/Stocks",
	NewYear = "EventShopStock/New Years Shop/Stocks",
	Traveling = "TravelingMerchantShopStock/Stocks",
}
function Shop.Initialize(Registry)
	reg = Registry
	GetSelectedItems = reg.Utils.GetSelectedItems
end

function Shop.UpdateBuyList()
	local Options = reg.Options
	BuyList = {
		[ShopKey.Seed] = {
			Enabled = Options.tgBuySeedEnable.Value,
			Items = GetSelectedItems(Options.ddBuySeeds.Value),
			RemoteName = "BuySeedStock",
			ArgType = "SeedMode",
		},
		[ShopKey.Daily] = {
			Enabled = Options.tgBuyDailyEnable.Value,
			Items = GetSelectedItems(Options.ddBuyDaily.Value),
			RemoteName = "BuyDailySeedShopStock",
			ArgType = "NormalMode",
		},
		[ShopKey.Gear] = {
			Enabled = Options.tgBuyGearEnable.Value,
			Items = GetSelectedItems(Options.ddBuyGear.Value),
			RemoteName = "BuyGearStock",
			ArgType = "NormalMode",
		},
		[ShopKey.Egg] = {
			Enabled = Options.tgBuyEggEnable.Value,
			Items = GetSelectedItems(Options.ddBuyEggs.Value),
			RemoteName = "BuyPetEgg",
			ArgType = "NormalMode",
		},
		[ShopKey.Traveling] = {
			Enabled = Options.tgBuyTravelingEnable.Value,
			BuyAll = Options.tgBuyTravelingAll.Value,
			Items = GetSelectedItems(Options.ddTraveling_Items.Value),
			RemoteName = "BuyTravelingMerchantShopStock",
			ArgType = "NormalMode",
		},
		[ShopKey.Santa] = {
			Enabled = false,
			BuyAll = false,
			Items = {},
			RemoteName = "BuyEventShopStock",
			ArgType = "EventMode",
			EventArg = "Santa's Stash",
		},
		[ShopKey.NewYear] = {
			Enabled = false,
			BuyAll = false,
			Items = {},
			RemoteName = "BuyEventShopStock",
			ArgType = "EventMode",
			EventArg = "New Years Shop",
		},
	}
end

return Shop

local Shop = {}
local reg
local BuyList = {}
local sData
local GetSelectedItems
Shop.ShopKey = {
	Seed = "SeedStocks/Shop/Stocks",
	Daily = "SeedStocks/Daily Deals/Stocks",
	Gear = "GearStock/Stocks",
	Egg = "PetEggStock/Stocks",
	Traveling = "TravelingMerchantShopStock/Stocks",
	Santa = "EventShopStock/Santa's Stash/Stocks",
	NewYear = "EventShopStock/New Years Shop/Stocks",
	Easter = "EventShopStock/Easter Shop/Stocks",
}
--local AutoBuyConnections = {}
function Shop.Initialize(Registry)
	reg = Registry
	sData = reg.sData
	GetSelectedItems = reg.Utils.GetSelectedItems

	--table.clear(AutoBuyConnections)
	for _, BasePath in pairs(Shop.ShopKey) do
		local Signal = sData.DataService:GetPathSignal(BasePath .. "/@")
		--local Connection = Signal:Connect(function(Key, StockData)
		Signal:Connect(function(_, StockData)
			if type(StockData) == "table" then
				task.spawn(function()
					task.wait(0.5)
					Shop.BuyItem(BasePath, StockData)
				end)
			end
		end)
		--table.insert(AutoBuyConnections, Connection)
	end
end

function Shop.UpdateBuyList()
	if not reg.fVar.UIShopLoaded then
		return
	end
	local Options = reg.Options
	local TravelingItems = {}
	if Options.tgBuyTravelingAll.Value then
		TravelingItems = { "ALL" }
	else
		for Name, _ in pairs(sData.TravelingMerchantTable) do
			local OptionName = "ddTraveling_" .. Name
			for Value, State in pairs(Options[OptionName].Value) do
				if State then
					table.insert(TravelingItems, Value)
				end
			end
		end
	end
	BuyList = {
		[Shop.ShopKey.Seed] = {
			Enabled = Options.tgBuySeedEnable.Value,
			Items = GetSelectedItems(Options.ddBuySeeds.Value),
			RemoteName = "BuySeedStock",
			ArgType = "SeedMode",
		},
		[Shop.ShopKey.Daily] = {
			Enabled = Options.tgBuyDailyEnable.Value,
			Items = GetSelectedItems(Options.ddBuyDaily.Value),
			RemoteName = "BuyDailySeedShopStock",
			ArgType = "NormalMode",
		},
		[Shop.ShopKey.Gear] = {
			Enabled = Options.tgBuyGearEnable.Value,
			Items = GetSelectedItems(Options.ddBuyGear.Value),
			RemoteName = "BuyGearStock",
			ArgType = "NormalMode",
		},
		[Shop.ShopKey.Egg] = {
			Enabled = Options.tgBuyEggEnable.Value,
			Items = GetSelectedItems(Options.ddBuyEggs.Value),
			RemoteName = "BuyPetEgg",
			ArgType = "NormalMode",
		},
		[Shop.ShopKey.Traveling] = {
			Enabled = Options.tgBuyTravelingEnable.Value,
			BuyAll = Options.tgBuyTravelingAll.Value,
			Items = TravelingItems,
			RemoteName = "BuyTravelingMerchantShopStock",
			ArgType = "NormalMode",
		},
		[Shop.ShopKey.Santa] = {
			Enabled = Options.tgBuySantaEnable.Value,
			Items = GetSelectedItems(Options.ddBuySanta.Value),
			RemoteName = "BuyEventShopStock",
			ArgType = "EventMode",
			EventArg = "Santa's Stash",
		},
		[Shop.ShopKey.NewYear] = {
			Enabled = Options.tgBuyNewYearEnable.Value,
			Items = GetSelectedItems(Options.ddBuyNewYear.Value),
			RemoteName = "BuyEventShopStock",
			ArgType = "EventMode",
			EventArg = "New Years Shop",
		},
		[Shop.ShopKey.Easter] = {
			Enabled = Options.tgBuyEasterEnable.Value,
			Items = GetSelectedItems(Options.ddBuyEaster.Value),
			RemoteName = "BuyEventShopStock",
			ArgType = "EventMode",
			EventArg = "Easter Shop",
		},
	}
end
local RemoteCache = {}

function Shop.BuyItem(ShopKey, StockData)
	local Setting = BuyList[ShopKey]
	if not Setting or not Setting.Enabled then
		return
	end
	local Remote = RemoteCache[Setting.RemoteName]
	if not Remote then
		Remote = sData.GameEvents:FindFirstChild(Setting.RemoteName)
		if Remote then
			RemoteCache[Setting.RemoteName] = Remote
		end
	end

	for itemId, itemInfo in pairs(StockData) do
		local ItemName = itemInfo.EggName or itemId
		local StockAmount = tonumber(itemInfo.Stock) or 0

		if not table.find(Setting.Items, "ALL") and not table.find(Setting.Items, ItemName) then
			continue
		end

		if StockAmount > 0 then
			for _i = 1, StockAmount do
				local Args = {}
				if Setting.ArgType == "SeedMode" then
					Args = { "Shop", ItemName }
				elseif Setting.ArgType == "EventMode" then
					Args = { ItemName, Setting.EventArg }
				else
					Args = { ItemName }
				end
				Remote:FireServer(unpack(Args))
				task.wait(0.25)
			end
		end
	end
end

return Shop

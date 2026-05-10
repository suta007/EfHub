local ShopBee = {}
local reg
local Tabs
local sData
local Utils
local Shop
local stockConnection = nil

local function BuyBeeEgg()
	local Options = reg.Options
	local GetSelectedItems = reg.Utils.GetSelectedItems
	local GetData_result = sData.DataService:GetData()
	local BeeEggStocks = GetData_result.BeeEggShopStock.Stocks
	if not Utils.IsTableEmpty(BeeEggStocks) then
		local beeEggList = GetSelectedItems(Options.ddBuyBeeEgg.Value)
		for EggName, EggInfo in pairs(BeeEggStocks) do
			if table.find(beeEggList, EggName) then
				local StockAmount = tonumber(EggInfo.Stock) or 0
				for _i = 1, StockAmount do
					sData.GameEvents:WaitForChild("BeeColonyEggShopService"):WaitForChild("BuyBeeEggStock"):InvokeServer(EggName)
				end
			end
		end
	end
end

function ShopBee.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks
	Utils = reg.Utils
	Shop = reg.Shop

	local HoneyCoinShopData = { "ALL" }
	for itemName, _itemInfo in pairs(reg.EVENT_DATA["Honey Coin Shop"]) do
		table.insert(HoneyCoinShopData, itemName)
	end

	local HoneySeedShopData = { "ALL" }
	for itemName, _itemInfo in pairs(reg.EVENT_DATA["Honey Seed Shop"]) do
		table.insert(HoneySeedShopData, itemName)
	end

	local GetData_result = sData.DataService:GetData()

	local HoneyCoinSection = EventsTab:AddCollapsibleSection("Honey Coin Shop", false)
	HoneyCoinSection:AddDropdown("ddBuyHoneyCoin", {
		Title = "Honey Coin Shop Items",
		Values = HoneyCoinShopData,
		Multi = true,
		Default = {},
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	HoneyCoinSection:AddButton({
		Title = "Clear Honey Coin Shop Items",
		Callback = function()
			Options.ddBuyHoneyCoin:SetValue({})
		end,
	})
	HoneyCoinSection:AddToggle("tgBuyHoneyCoinEnable", {
		Title = "Buy Honey Coin Shop Items",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local HoneyCoinStocks = GetData_result.EventShopStock["Honey Coin Shop"].Stocks
				if not Utils.IsTableEmpty(HoneyCoinStocks) then
					Shop.BuyItem(Shop.ShopKey.HoneyCoin, HoneyCoinStocks)
				end
			end
		end,
	})

	local HoneySeedSection = EventsTab:AddCollapsibleSection("HoneySeed", false)
	HoneySeedSection:AddDropdown("ddBuyHoneySeed", {
		Title = "Honey Seed Shop Items",
		Values = HoneySeedShopData,
		Multi = true,
		Default = {},
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	HoneySeedSection:AddButton({
		Title = "Clear Honey Seed Shop Items",
		Callback = function()
			Options.ddBuyHoneySeed:SetValue({})
		end,
	})
	HoneySeedSection:AddToggle("tgBuyHoneySeedEnable", {
		Title = "Buy Honey Seed Shop Items",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local HoneySeedStocks = GetData_result.EventShopStock["Honey Seed Shop"].Stocks
				if not Utils.IsTableEmpty(HoneySeedStocks) then
					Shop.BuyItem(Shop.ShopKey.HoneySeed, HoneySeedStocks)
				end
			end
		end,
	})

	local BeeEggShopSection = EventsTab:AddCollapsibleSection("Bee Egg Shop", false)
	local BeeEggData = { "Common Bee Egg", "Rare Bee Egg", "Mythical Bee Egg" }
	BeeEggShopSection:AddDropdown("ddBuyBeeEgg", {
		Title = "Bee Egg Shop Items",
		Values = BeeEggData,
		Multi = true,
		Default = {},
		--Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	BeeEggShopSection:AddButton({
		Title = "Clear Bee Egg Shop Items",
		Callback = function()
			Options.ddBuyBeeEgg:SetValue({})
		end,
	})
	local Signal = sData.DataService:GetPathSignal("BeeEggShopStock/Stocks/@")
	BeeEggShopSection:AddToggle("tgBuyBeeEggEnable", {
		Title = "Buy Bee Egg Shop Items",
		Default = false,
		Callback = function(Value)
			QuickSave()
			if Value then
				pcall(function()
					task.spawn(BuyBeeEgg)
				end)
				stockConnection = Signal:Connect(function(_, _StockData)
					pcall(function()
						task.spawn(BuyBeeEgg)
					end)
				end)
			else
				if stockConnection then
					stockConnection:Disconnect()
					stockConnection = nil
				end
			end
		end,
	})
end

return ShopBee

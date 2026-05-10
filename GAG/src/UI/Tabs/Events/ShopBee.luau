local ShopBee = {}
local reg
local Tabs
local sData
local Utils

function ShopBee.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	local EfTasks = reg.EfTasks
	Utils = reg.Utils

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
			--Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	HoneyCoinSection:AddButton("btnClearHoneyCoin", {
		Title = "Clear Honey Coin Shop Items",
		Callback = function()
			Options.ddBuyHoneyCoin:SetValue({})
		end,
	})
	HoneyCoinSection:AddToggle("tgBuyHoneyCoinEnable", {
		Title = "Buy Honey Coin Shop Items",
		Default = false,
		Callback = function(Value)
			--Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local HoneyCoinStocks = GetData_result.EventShopStock["Honey Coin Shop"].Stocks
				if not Utils.IsTableEmpty(HoneyCoinStocks) then
					--Shop.BuyItem(Shop.ShopKey.HoneyCoin, HoneyCoinStocks)
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
			--Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	HoneySeedSection:AddButton("btnClearHoneySeed", {
		Title = "Clear Honey Seed Shop Items",
		Callback = function()
			Options.ddBuyHoneySeed:SetValue({})
		end,
	})
	HoneySeedSection:AddToggle("tgBuyHoneySeedEnable", {
		Title = "Buy Honey Seed Shop Items",
		Default = false,
		Callback = function(Value)
			--Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local HoneySeedStocks = GetData_result.EventShopStock["Honey Seed Shop"].Stocks
				if not Utils.IsTableEmpty(HoneySeedStocks) then
					--Shop.BuyItem(Shop.ShopKey.HoneySeed, HoneySeedStocks)
				end
			end
		end,
	})
end

return ShopBee

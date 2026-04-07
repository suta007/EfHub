local ShopTab = {}
local reg

function ShopTab.Initialize(Registry)
	reg = Registry
	local Interface = reg.Interface
	local Tabs = reg.Tabs
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local sData = reg.sData
	local Shop = reg.Shop
	local fVar = reg.fVar
	local Utils = reg.Utils
	fVar.UIShopLoaded = false

	Tabs.Shop = Interface:AddTab({ Title = "Shop", Icon = "shopping-cart" })

	-- [[ Auto Buy Hardcore ]]
	--[[ 	local HardCoreSection = Tabs.Shop:AddCollapsibleSection("Auto Buy Hardcore", false)
	HardCoreSection:AddToggle("tgBuyHardCoreEnable", {
		Title = "Buy Hardcore",
		Default = false,
		Callback = function()
			QuickSave()
		end,
	})
	HardCoreSection:AddInput("ipBuyHardCoreDelay", {
		Title = "Delay (Seconds)",
		Default = 0.3,
		Numeric = true,
		Finished = false,
		Callback = function()
			QuickSave()
		end,
	}) ]]

	-- [[ Auto Buy Seeds ]]
	local BuySeedSection = Tabs.Shop:AddCollapsibleSection("Seed Shop", false)
	BuySeedSection:AddToggle("tgBuySeedEnable", {
		Title = "Buy Seeds",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local SeedStocks = GetData_result.SeedStocks.Shop.Stocks
				if not Utils.IsTableEmpty(SeedStocks) then
					Shop.BuyItem(Shop.ShopKey.Seed, SeedStocks)
				end
			end
		end,
	})
	BuySeedSection:AddDropdown("ddBuySeeds", {
		Title = "Seeds",
		Description = "Select seeds to buy",
		Values = sData.SeedShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	-- [[ Auto Buy Daily Seed ]]
	local BuyDailySection = Tabs.Shop:AddCollapsibleSection("Daily Seed Shop", false)
	BuyDailySection:AddToggle("tgBuyDailyEnable", {
		Title = "Buy Daily Seed",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local DailyStocks = GetData_result.SeedStocks["Daily Deals"].Stocks
				if not Utils.IsTableEmpty(DailyStocks) then
					Shop.BuyItem(Shop.ShopKey.Daily, DailyStocks)
				end
			end
		end,
	})

	BuyDailySection:AddDropdown("ddBuyDaily", {
		Title = "Daily Seeds",
		Description = "Select daily seeds to buy",
		Values = sData.DailySeedShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	-- [[ Auto Buy Gear ]]
	local BuyGearSection = Tabs.Shop:AddCollapsibleSection("Gear Shop", false)
	BuyGearSection:AddToggle("tgBuyGearEnable", {
		Title = "Buy Gear",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local GearStocks = GetData_result.GearStock.Stocks
				if not Utils.IsTableEmpty(GearStocks) then
					Shop.BuyItem(Shop.ShopKey.Gear, GearStocks)
				end
			end
		end,
	})
	BuyGearSection:AddDropdown("ddBuyGear", {
		Title = "Gear",
		Description = "Select gear to buy",
		Values = sData.GearShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	-- [[ Auto Buy Pet Eggs ]]
	local BuyEggSection = Tabs.Shop:AddCollapsibleSection("Pet Eggs Shop", false)
	BuyEggSection:AddToggle("tgBuyEggEnable", {
		Title = "Buy Pet Eggs",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local EggStocks = GetData_result.PetEggStock.Stocks
				if not Utils.IsTableEmpty(EggStocks) then
					Shop.BuyItem(Shop.ShopKey.Egg, EggStocks)
				end
			end
		end,
	})

	BuyEggSection:AddDropdown("ddBuyEggs", {
		Title = "Pet Eggs",
		Description = "Select pet eggs to buy",
		Values = sData.EggShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	-- [[ Auto Buy Traveling Merchant Items ]]
	local BuyTravelingSection = Tabs.Shop:AddCollapsibleSection("Traveling Merchant Shop", false)
	BuyTravelingSection:AddToggle("tgBuyTravelingEnable", {
		Title = "Buy Traveling Merchant Items",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local TravelingStocks = GetData_result.TravelingMerchantShopStock.Stocks
				if not Utils.IsTableEmpty(TravelingStocks) then
					Shop.BuyItem(Shop.ShopKey.Traveling, TravelingStocks)
				end
			end
		end,
	})
	BuyTravelingSection:AddToggle("tgBuyTravelingAll", {
		Title = "Buy All",
		Default = false,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	for Name, items in pairs(sData.TravelingMerchantTable) do
		BuyTravelingSection:AddDropdown("ddTraveling_" .. Name, {
			Title = Name .. " Items",
			Description = "Select items to buy",
			Values = items,
			Multi = true,
			Default = {},
			Searchable = true,
			Callback = function()
				Shop.UpdateBuyList()
				QuickSave()
			end,
		})
	end

	-- [[ Auto Buy Santa's Stash Items ]]
	local BuyEventSection = Tabs.Shop:AddCollapsibleSection("Events Shop", false)
	--[[ 	{
	BuyEventSection:AddToggle("tgBuySantaEnable", {
		Title = "Buy Santa's Stash Items",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local SantaStocks = GetData_result.EventShopStock["Santa's Stash"].Stocks
				if not Utils.IsTableEmpty(SantaStocks) then
					Shop.BuyItem(Shop.ShopKey.Santa, SantaStocks)
				end
			end
		end,
	})
	BuyEventSection:AddDropdown("ddBuySanta", {
		Title = "Santa's Stash Items",
		Description = "Select items to buy",
		Values = sData.SantaShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	BuyEventSection:AddDivider()

	BuyEventSection:AddToggle("tgBuyNewYearEnable", {
		Title = "Buy New Years Shop Items",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local NewYearStocks = GetData_result.EventShopStock["New Years Shop"].Stocks
				if not Utils.IsTableEmpty(NewYearStocks) then
					Shop.BuyItem(Shop.ShopKey.NewYear, NewYearStocks)
				end
			end
		end,
	})
	BuyEventSection:AddDropdown("ddBuyNewYear", {
		Title = "New Years Shop Items",
		Description = "Select items to buy",
		Values = sData.NewYearShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})
	BuyEventSection:AddDivider()
} ]]
	-- [[ Auto Buy Easter Shop Items ]]
	BuyEventSection:AddToggle("tgBuyEasterEnable", {
		Title = "Buy Easter Shop Items",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local EasterStocks = GetData_result.EventShopStock["Easter Seed Shop"].Stocks
				if not Utils.IsTableEmpty(EasterStocks) then
					Shop.BuyItem(Shop.ShopKey.Easter, EasterStocks)
				end
			end
		end,
	})
	BuyEventSection:AddDropdown("ddBuyEaster", {
		Title = "Easter Shop Items",
		Description = "Select items to buy",
		Values = sData.EasterShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	local SeasonPassSection = Tabs.Shop:AddCollapsibleSection("Season Pass", false)
	SeasonPassSection:AddToggle("tgBuySeasonPassEnable", {
		Title = "Buy Season Pass",
		Default = false,
		Callback = function(Value)
			Shop.UpdateBuyList()
			QuickSave()
			if Value then
				local GetData_result = sData.DataService:GetData()
				local SeasonPassStocks = GetData_result.SeasonPass[sData.SeasonPassData.CurrentSeason].Stocks
				if not Utils.IsTableEmpty(SeasonPassStocks) then
					Shop.BuyItem(Shop.ShopKey.SeasonPass, SeasonPassStocks)
				end
			end
		end,
	})
	SeasonPassSection:AddDropdown("ddBuySeasonPass", {
		Title = "Season Pass",
		Description = "Select items to buy",
		Values = sData.SeasonPassShopTable,
		Multi = true,
		Default = { "ALL" },
		Searchable = true,
		Callback = function()
			Shop.UpdateBuyList()
			QuickSave()
		end,
	})

	fVar.UIShopLoaded = true
end

return ShopTab

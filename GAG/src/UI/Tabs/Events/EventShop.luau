local EventShop = {}
local reg
local sData
local Utils
local Shop
local stockConnection = nil

--[[ local function BuyBeeEgg()
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
end ]]

function EventShop.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	--local EfTasks = reg.EfTasks
	Utils = reg.Utils
	Shop = reg.Shop

	local GetData_result = sData.DataService:GetData()
	local EventShopStock = require(game:GetService("ReplicatedStorage").Data.EventShopData)
	local EventShopData = {}
	local Section = {}
	for ShopName, ShopInfo in pairs(EventShopStock) do
		EventShopData[ShopName] = { "ALL" }
		for itemName, _itemInfo in pairs(ShopInfo) do
			table.insert(EventShopData[ShopName], itemName)
		end
		Section[ShopName] = EventsTab:AddCollapsibleSection(ShopName, false)
		local ddName = "ddBuy" .. ShopName
		local tgName = "tgBuy" .. ShopName
		Section[ShopName]:AddDropdown(ddName, {
			Title = ShopName .. " Items",
			Values = EventShopData[ShopName],
			Multi = true,
			Default = {},
			Searchable = true,
			Callback = function()
				--	Shop.UpdateBuyList()
				QuickSave()
			end,
		})
		Section[ShopName]:AddButton({
			Title = "Clear " .. ShopName .. " Items",
			Callback = function()
				Options[ddName]:SetValue({})
			end,
		})
		Section[ShopName]:AddToggle(tgName, {
			Title = "Buy " .. ShopName .. " Items",
			Default = false,
			Callback = function(Value)
				--Shop.UpdateBuyList()
				QuickSave()
				if Value then
					local ItemStocks = GetData_result.EventShopStock[ShopName].Stocks
					if not Utils.IsTableEmpty(ItemStocks) then
						--	Shop.BuyItem(Shop.ShopKey[ShopName], ItemStocks)
					end
				end
			end,
		})
	end
end

return EventShop

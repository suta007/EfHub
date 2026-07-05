local EventShop = {}
local reg
local sData
local Utils
local EventShopData = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameEvents = ReplicatedStorage:WaitForChild("GameEvents")
local BuyEventShop = GameEvents.BuyEventShopStock
local function buyEventItems(ShopName, StockData)
	local ddName = "ddBuy" .. ShopName
	local tgName = "tgBuy" .. ShopName
	local Options = reg.Options
	if not Options[tgName] or not Options[tgName].Value then
		return
	end
	if not Options[ddName].Value then
		return
	end

	local GetSelectedItems = reg.Utils.GetSelectedItems
	local ItemList = GetSelectedItems(Options[ddName].Value)
	if not ItemList or #ItemList == 0 then
		return
	end

	for itemId, itemInfo in pairs(StockData) do
		local ItemName = itemId
		local StockAmount = tonumber(itemInfo.Stock) or 0
		if not table.find(ItemList, "ALL") and not table.find(ItemList, ItemName) then
			continue
		end

		if StockAmount > 0 then
			for _i = 1, StockAmount do
				BuyEventShop:FireServer(ItemName, ShopName)
				task.wait()
			end
		end
	end
end

function EventShop.Initialize(registry, tab)
	reg = registry
	local Options = reg.Options
	_ = Options
	local QuickSave = reg.Window.QuickSave
	local EventsTab = tab
	sData = reg.sData
	Utils = reg.Utils

	local GetData_result = sData.DataService:GetData()
	local EventShopStock = require(game:GetService("ReplicatedStorage").Data.EventShopData)

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
				QuickSave()
				if Value then
					local ItemStocks = GetData_result.EventShopStock[ShopName].Stocks
					if not Utils.IsTableEmpty(ItemStocks) then
						buyEventItems(ShopName, ItemStocks)
					end
				end
			end,
		})

		local BasePath = "EventShopStock/" .. ShopName .. "/Stocks"
		local Signal = sData.DataService:GetPathSignal(BasePath .. "/@")
		local Signal2 = sData.DataService:GetPathSignal(BasePath)
		Signal:Connect(function(_, StockData)
			if type(StockData) == "table" then
				task.spawn(function()
					task.wait(0.5)
					buyEventItems(ShopName, StockData)
				end)
			end
		end)
		Signal2:Connect(function(_, StockData)
			if type(StockData) == "table" then
				task.spawn(function()
					task.wait(0.5)
					buyEventItems(ShopName, StockData)
				end)
			end
		end)
	end
end

return EventShop

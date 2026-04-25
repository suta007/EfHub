local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Notification = ReplicatedStorage.GameEvents.Notification

Notification.OnClientEvent:Connect(function(...)
	local args = { ... }
	for i, v in pairs(args) do
		print(i, v)
	end
end)

--[[ Notification.OnClientEvent:Connect(function(...)
	local args = { ... }
	local notiStr = args[1]
	local chkStr = "restocked"
	if notiStr:find(chkStr) then
		local GetData_result = sData.DataService:GetData()
		if notiStr:find("Seed") then
			local SeedStocks = GetData_result.SeedStocks.Shop.Stocks
			if not Utils.IsTableEmpty(SeedStocks) then
				Shop.BuyItem(Shop.ShopKey.Seed, SeedStocks)
			end
		elseif notiStr:find("Gear") then
			local GearStocks = GetData_result.GearStock.Stocks
			if not Utils.IsTableEmpty(GearStocks) then
				Shop.BuyItem(Shop.ShopKey.Gear, GearStocks)
			end
		elseif notiStr:find("Egg") then
			local EggStocks = GetData_result.PetEggStock.Stocks
			if not Utils.IsTableEmpty(EggStocks) then
				Shop.BuyItem(Shop.ShopKey.Egg, EggStocks)
			end
		end
	end
end) ]]

--restocked

local function ShowData(tbl, indent)
	local lclIndent = indent or 0
	local spacing = string.rep("  ", lclIndent)
	if type(tbl) == "table" then
		for k, v in pairs(tbl) do
			if type(v) == "table" then
				print(spacing .. "[" .. tostring(k) .. "] : (Table)")
				ShowData(v, lclIndent + 1)
			else
				print(spacing .. "[" .. tostring(k) .. "] : " .. tostring(v))
			end
			--return
		end
	else
		print(spacing .. tostring(tbl))
	end
end

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local DataService = require(ReplicatedStorage.Modules.DataService)
--local GetData_result = DataService:GetData()
--local HoneyMachine2026 = GetData_result.HoneyMachine2026
--ShowData(HoneyMachine2026)

local Signal = DataService:GetPathSignal("BeeEggShopStock/Stocks/@")
Signal:Connect(function(_, StockData)
	print(os.date("%X"), " Bee Egg Stocks : ")
	ShowData(StockData)
end)

local Signal2 = DataService:GetPathSignal("BeeEggShopStock/Stocks")
Signal2:Connect(function(_, StockData2)
	print(os.date("%X"), " Bee Egg Stocks 2 : ")
	ShowData(StockData2)
end)

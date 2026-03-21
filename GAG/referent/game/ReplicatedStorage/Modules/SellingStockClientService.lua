local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.EventService).new("SellingStockClientService", "Sell Stocks")
local _ = v1.Data.SellStocks
function v2.GetCurrentStockMultiplier(p3, _)
	return p3.IsRunning and 1 or 1
end
return v2
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Modules = ReplicatedStorage:WaitForChild("Modules") :: any
local DataService = require(Modules.DataService)
local beeEgg = "BeeEggShopStock/Stocks/@"

local Signal = DataService:GetPathSignal(beeEgg)
Signal:Connect(function(_, StockData)
	print("StockData", StockData)
end)

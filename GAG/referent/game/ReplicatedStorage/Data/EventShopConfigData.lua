local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
require(v1.Modules.EventService)
require(v1.Modules.UpdateService)
require(v1.Data.SafariEvent.SafariEventRewardData)
return {
	["GetShopResetTime"] = function()
		return 300
	end,
	["REQUIRED_WEIGHT"] = 30,
	["ROTATING_SHOP_SLOTS"] = 5,
	["BASE_RESTOCK_COST"] = 100000,
	["RESTOCK_COST_RESET_TIME"] = 86400,
	["RESTOCK_CURRENCY"] = "ROBUX",
	["SHOP_LOCK_TYPE"] = "PLAYER"
}
local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
require(v_u_1.Modules.EventService)
require(v_u_1.Modules.UpdateService)
require(v_u_1.Data.SafariEvent.SafariEventRewardData)
return {
	["GetShopResetTime"] = function()
		-- upvalues: (copy) v_u_1
		local _ = v_u_1.Data.ReplicatedGlobalStock.GiftsGiven
		return 600
	end,
	["REQUIRED_WEIGHT"] = 30,
	["ROTATING_SHOP_SLOTS"] = 5,
	["BASE_RESTOCK_COST"] = 100000,
	["RESTOCK_COST_RESET_TIME"] = 86400,
	["RESTOCK_CURRENCY"] = "Sheckles",
	["SHOP_LOCK_TYPE"] = "EVENT"
}
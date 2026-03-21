local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.CosmeticRegistry.CosmeticMutableStats)
require(v1.Modules.ExponentialScaler)
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = v1:WaitForChild("GameEvents"):WaitForChild("CosmeticUpgradeService")
return {
	["GetUpgradePrice"] = function(_, p5, p6)
		-- upvalues: (copy) v_u_2
		local v7 = v_u_2[p5]
		if not v7 then
			warn(p5, "is a invalid cosmetic stat type!")
			return (1 / 0)
		end
		local v8 = v7.UpgradeData
		local v9 = v8.Cost
		local v10 = v8.Scale
		return v9 * math.pow(v10, p6)
	end,
	["Upgrade"] = function(_, p11)
		-- upvalues: (copy) v_u_4
		return v_u_4:FireServer("Upgrade", p11)
	end,
	["GetUpgradeValue"] = function(_, p12, p13)
		-- upvalues: (copy) v_u_2
		local v14 = v_u_2[p12]
		if v14 then
			return v14.UpgradeData.Increment * p13
		end
		warn(p12, "is a invalid cosmetic stat type!")
		return (1 / 0)
	end,
	["GetUpgradeLevel"] = function(_, p15)
		-- upvalues: (copy) v_u_3
		local v16 = v_u_3:GetData()
		if v16 then
			return v16.CosmeticData.MutableStats[p15] or 0
		end
	end
}
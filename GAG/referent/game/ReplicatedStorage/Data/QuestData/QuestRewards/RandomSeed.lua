local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Data.QuestData.Types)
local v_u_2 = require(v_u_1.Modules.ItemImageFinder)
local v_u_3 = require(v_u_1.Data.SeedShopData)
return {
	["Type"] = "RandomSeed",
	["Display"] = function(_, p4)
		local v5 = p4.Data.Amount
		return ("+%* Random Seed Shop Seeds %*"):format(v5, v5 > 1 and "s" or "")
	end,
	["DisplayIcon"] = function(_, p6)
		-- upvalues: (copy) v_u_2
		return v_u_2(p6.Data.Type or "", "RandomSeed")
	end,
	["Give"] = function(_, p7, p8)
		-- upvalues: (copy) v_u_1, (copy) v_u_3
		game:GetService("ServerScriptService")
		local v9 = require(v_u_1.Give_Seed)
		local v10 = Random.new()
		local v11 = {}
		for v12, v13 in v_u_3 do
			if not v13.SpecialCurrencyType then
				table.insert(v11, v12)
			end
		end
		for _ = 1, p8.Data.Amount do
			local v14 = v11[v10:NextInteger(1, #v11)]
			task.spawn(v9.Give_Seed, p7, v14)
		end
		return true
	end,
	["Use"] = function(p15, p16)
		return {
			["Type"] = p15.Type,
			["Data"] = p16
		}
	end
}
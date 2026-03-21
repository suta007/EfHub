local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Data.QuestData.Types)
require(v_u_1.Comma_Module)
return {
	["Type"] = "CompositeAll",
	["Display"] = function(_, p2)
		-- upvalues: (copy) v_u_1
		game:GetService("ServerScriptService")
		local v3 = require(v_u_1.Data.QuestData.QuestRewards)
		local v4 = nil
		for _, v5 in p2.Data.SubRewards do
			local v6 = v3[v5.Type]
			if v4 == nil then
				v4 = v6:Display(v5)
			else
				v4 = v4 .. ", " .. v6:Display(v5)
			end
		end
		return v4
	end,
	["DisplayIcon"] = function(_, p7)
		-- upvalues: (copy) v_u_1
		game:GetService("ServerScriptService")
		local v8 = require(v_u_1.Data.QuestData.QuestRewards)
		local v9 = os.time() % #p7.Data.SubRewards + 1
		local v10 = p7.Data.SubRewards[v9]
		return v8[v10.Type]:DisplayIcon(v10)
	end,
	["Give"] = function(_, p11, p12)
		-- upvalues: (copy) v_u_1
		game:GetService("ServerScriptService")
		local v13 = require(v_u_1.Data.QuestData.QuestRewards)
		for _, v14 in p12.Data.SubRewards do
			v13[v14.Type]:Give(p11, v14)
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
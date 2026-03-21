local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.DataService)
local v_u_3 = require(v1.Modules.ItemNameFinder)
local v_u_4 = require(v1.Data.AchievementsData)
local v_u_5 = require(v1.Modules.AchievementsController)
local v_u_31 = {
	["GetRewardString"] = function(p6)
		-- upvalues: (copy) v_u_3
		local v7 = {}
		for _, v8 in p6 do
			local v9 = v8.Value
			local v10 = v8.Quantity or 1
			local v11 = ("%*%*"):format(v_u_3(v9, v8.Type), v10 <= 1 and "" or (" x%*"):format(v10))
			table.insert(v7, v11)
		end
		return table.concat(v7, ", ")
	end,
	["CalculateSetProgress"] = function(p12, p13, p14)
		-- upvalues: (copy) v_u_4
		local v15 = 0
		local v16 = 0
		for _, v17 in v_u_4.Seasons[p12].Sets[p13].Quests do
			local v18 = v17.Id
			local v19 = v17.Target
			v15 = v15 + 1
			if p14[v18] and v19 <= p14[v18].Progress then
				v16 = v16 + 1
			end
		end
		return v16, v15
	end,
	["CalculateSeasonProgress"] = function(p20, p21)
		-- upvalues: (copy) v_u_4, (copy) v_u_31
		local v22 = 0
		for v23, _ in v_u_4.Seasons[p20].Sets do
			local v24 = p21[v23].Quests
			local v25, _ = v_u_31.CalculateSetProgress(p20, v23, v24)
			v22 = v22 + v25
		end
		return v22
	end,
	["CheckForUnclaimed"] = function(p26, p27)
		-- upvalues: (copy) v_u_2, (copy) v_u_4, (copy) v_u_5
		local v28 = v_u_2:GetData().Achievements.Seasons[("Season_%*"):format(p26)].Sets[p27].Quests
		for v29, v30 in v_u_4.Seasons[p26].Sets[p27].Quests do
			if v28[v30.Id] and (v28[v30.Id].Progress >= v30.Target and not v_u_5:IsClaimed("Quest", { p26, p27, v29 })) then
				return true
			end
		end
		return false
	end
}
return v_u_31
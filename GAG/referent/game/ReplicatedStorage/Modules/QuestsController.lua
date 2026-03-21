local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
require(v1.Modules.Trove)
local v_u_3 = require(v1.Modules.DataService)
require(v1.Data.QuestData)
local v_u_4 = require(v1.Data.QuestData.Quests)
local v_u_5 = require(v1.Data.QuestData.QuestRewards)
require(v1.Data.QuestData.Types)
local _ = v2.LocalPlayer
return {
	["GetQuest"] = function(_, p6)
		-- upvalues: (copy) v_u_4
		return v_u_4[p6]
	end,
	["GetRewardInfo"] = function(_, p7)
		-- upvalues: (copy) v_u_5
		return v_u_5[p7]
	end,
	["GetContainerFromId"] = function(_, p8)
		-- upvalues: (copy) v_u_3
		local v9 = v_u_3:GetData()
		if not v9 then
			return nil
		end
		local v10 = tostring(p8)
		return v9.QuestContainers[v10]
	end,
	["GetQuestFromId"] = function(_, p11)
		-- upvalues: (copy) v_u_3
		local v12 = v_u_3:GetData()
		if not v12 then
			return nil
		end
		local v13 = tostring(p11)
		for _, v14 in v12.QuestContainers do
			for _, v15 in v14.Quests do
				local v16 = v15.Id
				if tostring(v16) == v13 then
					return v15
				end
			end
		end
		return nil
	end
}
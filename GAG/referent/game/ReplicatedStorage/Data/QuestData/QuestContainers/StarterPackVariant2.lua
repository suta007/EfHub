local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Data.QuestData.Quests)
require(v1.Data.QuestData.QuestRewards)
return {
	["Type"] = "StarterPackVariant2",
	["Display"] = function(_)
		return "Stater Pack Play Time Logic"
	end,
	["Generate"] = function(_)
		-- upvalues: (copy) v_u_2
		local v3 = {
			["Quests"] = { v_u_2.PlayTime:Use({
					["Target"] = 600
				}) },
			["Rewards"] = {}
		}
		return v3
	end
}
local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v_u_2 = require(v1.Data.QuestData.Quests)
require(v1.Data.QuestData.QuestRewards)
return {
	["Type"] = "StarterPack",
	["Display"] = function(_)
		return "Stater Pack Plant Logic"
	end,
	["Generate"] = function(_)
		-- upvalues: (copy) v_u_2
		local v3 = {
			["Quests"] = { v_u_2.Plant:Use({
					["Target"] = 2,
					["Arguments"] = { "Tomato" }
				}) },
			["Rewards"] = {}
		}
		return v3
	end
}
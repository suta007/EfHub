local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v3 = require(v1.Data.QuestData.QuestRewards)
local v_u_4 = {
	v2.Plant:Use({
		["Target"] = 10,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Harvest:Use({
		["Target"] = 5,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Plant:Use({
		["Target"] = 3,
		["Arguments"] = { "Great Pumpkin" }
	}),
	v2.Harvest:Use({
		["Target"] = 1,
		["Arguments"] = { "Great Pumpkin" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 10,
		["Arguments"] = { "Ghostly" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 5,
		["Arguments"] = { "Ghostly" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Bat", "25" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Bone Dog", "20" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Spider", "15" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Black Cat", "10" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Headless Horseman", "5" }
	}),
	v2.HatchEgg:Use({
		["Target"] = 10,
		["Arguments"] = { "Spooky Egg" }
	}),
	v2.SubmitWitchsCauldron:Use({
		["Target"] = 25
	}),
	v2.SubmitWitchsCauldron:Use({
		["Target"] = 10
	}),
	v2.SubmitWitchsCauldron:Use({
		["Target"] = 5
	}),
	v2.SubmitJackoLantern:Use({
		["Target"] = 25
	}),
	v2.SubmitJackoLantern:Use({
		["Target"] = 10
	}),
	v2.SubmitJackoLantern:Use({
		["Target"] = 5
	}),
	v2.EarnEventCurrency:Use({
		["Target"] = 25,
		["Arguments"] = { "CandyCorn" }
	}),
	v2.EarnEventCurrency:Use({
		["Target"] = 10,
		["Arguments"] = { "CandyCorn" }
	}),
	v2.EarnEventCurrency:Use({
		["Target"] = 5,
		["Arguments"] = { "CandyCorn" }
	})
}
local v_u_5 = { v3["Seed Pack"]:Use({
		["Amount"] = 1,
		["Type"] = "Zen Seed Pack"
	}), v3.Currency:Use({
		["Type"] = "CandyCorn",
		["Amount"] = 100
	}), v3.Egg:Use({
		["Type"] = "Zen Egg",
		["Amount"] = 1
	}) }
local v12 = {
	["Type"] = "HalloweenPart1",
	["CustomData"] = {
		["PossibleQuests"] = v_u_4,
		["PossibleRewards"] = v_u_5
	},
	["Display"] = function(_)
		return "Ghoul Garden Quests"
	end,
	["Generate"] = function(_, p6)
		-- upvalues: (copy) v_u_4, (copy) v_u_5
		local v7 = table.create(1)
		local v8
		if type(p6) == "function" then
			v8 = p6({
				["type"] = "quests"
			})
		else
			v8 = table.clone(v_u_4)
		end
		local v9 = Random.new()
		v9:Shuffle(v8)
		v7[1] = table.remove(v8, 1) or v_u_4[v9:NextInteger(1, #v_u_4)]
		local v10 = {
			["Quests"] = v7
		}
		local v11
		if type(p6) == "function" then
			v11 = p6({
				["type"] = "rewards"
			})
		else
			v11 = { v_u_5[v9:NextInteger(1, #v_u_5)] }
		end
		v10.Rewards = v11
		return v10
	end
}
return v12
local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v3 = require(v1.Data.QuestData.QuestRewards)
local v_u_4 = {
	v2.Plant:Use({
		["Target"] = 100,
		["Arguments"] = { "Carrot" }
	}),
	v2.Plant:Use({
		["Target"] = 10,
		["Arguments"] = { "Watermelon" }
	}),
	v2.Plant:Use({
		["Target"] = 5,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Plant:Use({
		["Target"] = 25,
		["Arguments"] = { "Bamboo" }
	}),
	v2.Plant:Use({
		["Target"] = 1,
		["Arguments"] = { "Mango" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Dog", "10" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Golden Lab", "10" }
	}),
	v2.GrowPetToAge:Use({
		["Target"] = 1,
		["Arguments"] = { "Bunny", "10" }
	}),
	v2.Harvest:Use({
		["Target"] = 50,
		["Arguments"] = { "Strawberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 150,
		["Arguments"] = { "Blueberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 25,
		["Arguments"] = { "Apple" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Coconut" }
	}),
	v2.Harvest:Use({
		["Target"] = 5,
		["Arguments"] = { "Dragon Fruit" }
	}),
	v2.Craft:Use({
		["Target"] = 1,
		["Arguments"] = { "Gear", "Lightning Rod" }
	}),
	v2.Craft:Use({
		["Target"] = 1,
		["Arguments"] = { "Gear", "Mutation Spray Amber" }
	})
}
local v_u_5 = { v3["Seed Pack"]:Use({
		["Amount"] = 1,
		["Type"] = "Ancient Seed Pack"
	}), v3["Cosmetic Crate"]:Use({
		["Type"] = "Dino Crate",
		["Amount"] = 1
	}), v3.Egg:Use({
		["Type"] = "Dinosaur Egg",
		["Amount"] = 1
	}) }
local v12 = {
	["Type"] = "Dino",
	["CustomData"] = {
		["PossibleQuests"] = v_u_4,
		["PossibleRewards"] = v_u_5
	},
	["Display"] = function(_)
		return "Dino Event Quests"
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
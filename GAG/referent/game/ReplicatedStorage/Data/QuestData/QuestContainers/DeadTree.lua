local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
require(v1.Data.QuestData.QuestRewards)
local v_u_3 = {
	v2.Plant:Use({
		["Target"] = 10,
		["Arguments"] = { "Bloodred Mushroom" }
	}),
	v2.Harvest:Use({
		["Target"] = 5,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Harvest:Use({
		["Target"] = 2,
		["Arguments"] = { "Jack O Lantern" }
	}),
	v2.Harvest:Use({
		["Target"] = 1,
		["Arguments"] = { "Banesberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Corn" }
	}),
	v2.WaterPlants:Use({
		["Target"] = 30,
		["Arguments"] = {}
	}),
	v2.HarvestMutation:Use({
		["Target"] = 10,
		["Arguments"] = { "Spooky" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 10,
		["Arguments"] = { "Vamp" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 5,
		["Arguments"] = { "Moonlit" }
	}),
	v2.OpenSeedPack:Use({
		["Target"] = 3,
		["Arguments"] = { "Halloween Gear Box" }
	}),
	v2.EatSuspiciousSoup:Use({
		["Target"] = 3,
		["Arguments"] = {}
	}),
	v2.TravelWitchesBroom:Use({
		["Target"] = 250,
		["Arguments"] = {}
	}),
	v2.OpenCrate:Use({
		["Target"] = 1,
		["Arguments"] = { "Pumpkin Crate" }
	}),
	v2.OpenCrate:Use({
		["Target"] = 1,
		["Arguments"] = { "Spooky Crate" }
	}),
	v2.FeedAnyPet:Use({
		["Target"] = 15,
		["Arguments"] = {}
	}),
	v2.HatchEgg:Use({
		["Target"] = 1,
		["Arguments"] = { "Spooky Egg" }
	}),
	v2.AgePetWithTrait:Use({
		["Target"] = 10,
		["Arguments"] = { "Halloween" }
	}),
	v2.SellAnyPlant:Use({
		["Target"] = 40,
		["Arguments"] = {}
	}),
	v2.SellPlant:Use({
		["Target"] = 10,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.SellPlant:Use({
		["Target"] = 25,
		["Arguments"] = { "Corn" }
	}),
	v2.SellPlant:Use({
		["Target"] = 5,
		["Arguments"] = { "Bloodred Mushroom" }
	}),
	v2.SellPlant:Use({
		["Target"] = 1,
		["Arguments"] = { "Jack O Lantern" }
	}),
	v2.EarnSheckles:Use({
		["Target"] = 500000
	}),
	v2.SpendCurrency:Use({
		["Target"] = 50,
		["Arguments"] = { "CandyCorn" }
	}),
	v2.SpendCurrency:Use({
		["Target"] = 500000,
		["Arguments"] = { "Sheckles" }
	})
}
local v_u_4 = {}
local v11 = {
	["Type"] = "DeadTree",
	["CustomData"] = {
		["PossibleQuests"] = v_u_3,
		["PossibleRewards"] = v_u_4
	},
	["Display"] = function(_)
		return "Dead Tree Quests"
	end,
	["Generate"] = function(_, p5)
		-- upvalues: (copy) v_u_3, (copy) v_u_4
		local v6 = table.create(1)
		local v7
		if type(p5) == "function" then
			v7 = p5({
				["type"] = "quests"
			})
		else
			v7 = table.clone(v_u_3)
		end
		local v8 = Random.new()
		v8:Shuffle(v7)
		v6[1] = table.remove(v7, 1) or v_u_3[v8:NextInteger(1, #v_u_3)]
		local v9 = {
			["Quests"] = v6
		}
		local v10
		if type(p5) == "function" then
			v10 = p5({
				["type"] = "rewards"
			})
		else
			v10 = { v_u_4[v8:NextInteger(1, #v_u_4)] }
		end
		v9.Rewards = v10
		return v9
	end
}
return v11
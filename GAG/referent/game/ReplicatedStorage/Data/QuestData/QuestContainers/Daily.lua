local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v3 = require(v1.Data.QuestData.QuestRewards)
require(v1.Modules.UpdateService)
local v4 = {
	["Common"] = { 100, 50, 25 },
	["Uncommon"] = { 50, 25, 10 },
	["Rare"] = { 25, 10, 5 },
	["Legendary"] = { 10, 5, 3 },
	["Mythical"] = { 1 }
}
local v_u_5 = {
	v2.PlayTime:Use({
		["Target"] = 600
	}),
	v2.PlayTime:Use({
		["Target"] = 900
	}),
	v2.PlayTime:Use({
		["Target"] = 1800
	}),
	v2.EarnSheckles:Use({
		["Target"] = 15000
	}),
	v2.EarnSheckles:Use({
		["Target"] = 25000
	}),
	v2.EarnSheckles:Use({
		["Target"] = 50000
	}),
	v2.EarnSheckles:Use({
		["Target"] = 100000
	}),
	v2.HarvestMutation:Use({
		["Target"] = 1,
		["Arguments"] = { "Wet" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 2,
		["Arguments"] = { "Wet" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 3,
		["Arguments"] = { "Wet" }
	}),
	v2.Craft:Use({
		["Target"] = 1,
		["Arguments"] = { "Gear", "Lightning Rod" }
	}),
	v2.Plant:Use({
		["Target"] = v4.Common[1],
		["Arguments"] = { "Carrot" }
	}),
	v2.Plant:Use({
		["Target"] = v4.Common[2],
		["Arguments"] = { "Carrot" }
	}),
	v2.Plant:Use({
		["Target"] = v4.Common[1],
		["Arguments"] = { "Strawberry" }
	}),
	v2.Plant:Use({
		["Target"] = v4.Common[2],
		["Arguments"] = { "Strawberry" }
	}),
	v2.Plant:Use({
		["Target"] = v4.Uncommon[1],
		["Arguments"] = { "Blueberry" }
	}),
	v2.Plant:Use({
		["Target"] = v4.Uncommon[2],
		["Arguments"] = { "Blueberry" }
	}),
	v2.Plant:Use({
		["Target"] = 12,
		["Arguments"] = { "Tomato" }
	}),
	v2.Plant:Use({
		["Target"] = 12,
		["Arguments"] = { "Corn" }
	}),
	v2.Plant:Use({
		["Target"] = 14,
		["Arguments"] = { "Daffodil" }
	}),
	v2.Plant:Use({
		["Target"] = 5,
		["Arguments"] = { "Watermelon" }
	}),
	v2.Plant:Use({
		["Target"] = 5,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Plant:Use({
		["Target"] = 5,
		["Arguments"] = { "Apple" }
	}),
	v2.Plant:Use({
		["Target"] = 25,
		["Arguments"] = { "Bamboo" }
	}),
	v2.Plant:Use({
		["Target"] = 1,
		["Arguments"] = { "Coconut" }
	}),
	v2.Plant:Use({
		["Target"] = 2,
		["Arguments"] = { "Cactus" }
	}),
	v2.Plant:Use({
		["Target"] = 2,
		["Arguments"] = { "Dragon Fruit" }
	}),
	v2.Plant:Use({
		["Target"] = 2,
		["Arguments"] = { "Mango" }
	}),
	v2.Harvest:Use({
		["Target"] = v4.Common[1],
		["Arguments"] = { "Carrot" }
	}),
	v2.Harvest:Use({
		["Target"] = v4.Common[2],
		["Arguments"] = { "Carrot" }
	}),
	v2.Harvest:Use({
		["Target"] = v4.Common[1],
		["Arguments"] = { "Strawberry" }
	}),
	v2.Harvest:Use({
		["Target"] = v4.Common[2],
		["Arguments"] = { "Strawberry" }
	}),
	v2.Harvest:Use({
		["Target"] = v4.Uncommon[1],
		["Arguments"] = { "Blueberry" }
	}),
	v2.Harvest:Use({
		["Target"] = v4.Uncommon[2],
		["Arguments"] = { "Blueberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 30,
		["Arguments"] = { "Tomato" }
	}),
	v2.Harvest:Use({
		["Target"] = 20,
		["Arguments"] = { "Corn" }
	}),
	v2.Harvest:Use({
		["Target"] = 14,
		["Arguments"] = { "Daffodil" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Watermelon" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Harvest:Use({
		["Target"] = 25,
		["Arguments"] = { "Apple" }
	}),
	v2.Harvest:Use({
		["Target"] = 30,
		["Arguments"] = { "Bamboo" }
	}),
	v2.Harvest:Use({
		["Target"] = 50,
		["Arguments"] = { "Coconut" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Cactus" }
	}),
	v2.Harvest:Use({
		["Target"] = 25,
		["Arguments"] = { "Dragon Fruit" }
	}),
	v2.Harvest:Use({
		["Target"] = 25,
		["Arguments"] = { "Mango" }
	})
}
local v_u_6 = {
	{ v3["Seed Pack"]:Use({
			["Amount"] = 1,
			["Type"] = "Normal"
		}) },
	{
		v3.Gear:Use({
			["Type"] = "Watering Can",
			["Amount"] = 10
		}),
		v3.Gear:Use({
			["Type"] = "Advanced Sprinkler",
			["Amount"] = 3
		}),
		v3.Gear:Use({
			["Type"] = "Reclaimer",
			["Amount"] = 5
		}),
		v3.Gear:Use({
			["Type"] = "Recall Wrench",
			["Amount"] = 5
		})
	},
	{ v3["Seed Pack"]:Use({
			["Amount"] = 2,
			["Type"] = "Normal"
		}) },
	{ v3.RandomSeed:Use({
			["Amount"] = 1,
			["Type"] = "Random Seed"
		}) },
	{ v3["Seed Pack"]:Use({
			["Amount"] = 2,
			["Type"] = "Normal"
		}) },
	{
		v3.Gear:Use({
			["Type"] = "Watering Can",
			["Amount"] = 20
		}),
		v3.Gear:Use({
			["Type"] = "Master Sprinkler",
			["Amount"] = 1
		}),
		v3.Gear:Use({
			["Type"] = "Tanning Mirror",
			["Amount"] = 1
		}),
		v3.Gear:Use({
			["Type"] = "Lightning Rod",
			["Amount"] = 1
		}),
		v3.Gear:Use({
			["Type"] = "Harvest Tool",
			["Amount"] = 5
		})
	},
	{ v3["Seed Pack"]:Use({
			["Type"] = "Gardener Seed Pack",
			["Amount"] = 1
		}) }
}
local v21 = {
	["Type"] = "Daily",
	["CustomData"] = {
		["GenerateRewardsForDay"] = function(p7, p8, p9)
			-- upvalues: (copy) v_u_6
			local v10 = Random.new()
			local v11 = table.clone(v_u_6[p7])
			local v12 = {}
			if v11 then
				local v13 = p8 == -1 and #v11 or p8
				if #v11 < v13 and p9 then
					error("DAILY QUEST CONTAINER | GenerateRewardsForDay: Not enough rewards to avoid duplicates for daily quests day " .. p7)
					return {}
				else
					for _ = 1, v13 do
						local v14 = v10:NextInteger(1, #v11)
						local v15 = v11[v14]
						table.insert(v12, v15)
						if p9 then
							table.remove(v11, v14)
						end
					end
					return v12
				end
			else
				error("DAILY QUEST CONTAINER | GenerateRewardsForDay: No rewards set up for day " .. p7)
				return {}
			end
		end
	},
	["Display"] = function(_)
		return "Daily Quests"
	end,
	["Generate"] = function(_, p16)
		-- upvalues: (copy) v_u_5
		local v17 = Random.new()
		local v18 = table.create(6)
		local v19 = table.clone(v_u_5)
		v17:Shuffle(v19)
		for v20 = 1, 6 do
			v18[v20] = table.remove(v19, 1) or v_u_5[v17:NextInteger(1, #v_u_5)]
		end
		return {
			["Quests"] = v18,
			["Rewards"] = type(p16) ~= "function" and {} or p16()
		}
	end
}
return v21
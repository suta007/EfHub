local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v_u_3 = require(v1.Data.QuestData.QuestRewards)
local v_u_4 = {
	["EasyQuests"] = NumberRange.new(1),
	["MediumQuests"] = NumberRange.new(2, 3),
	["HardQuests"] = NumberRange.new(3, 4)
}
local v_u_5 = {
	["PlayTime"] = {
		v2.PlayTime:Use({
			["Target"] = 300
		}),
		v2.PlayTime:Use({
			["Target"] = 600
		}),
		v2.PlayTime:Use({
			["Target"] = 900
		}),
		v2.PlayTime:Use({
			["Target"] = 1800
		})
	},
	["EarnSheckles"] = {
		v2.EarnSheckles:Use({
			["Target"] = 100000
		}),
		v2.EarnSheckles:Use({
			["Target"] = 500000
		}),
		v2.EarnSheckles:Use({
			["Target"] = 1000000
		}),
		v2.EarnSheckles:Use({
			["Target"] = 2000000
		}),
		v2.EarnSheckles:Use({
			["Target"] = 10000000
		})
	},
	["PlayWithFriend"] = { v2.PlayWithFriend:Use({
			["Target"] = 1,
			["Arguments"] = {}
		}) },
	["GiftFruitToFriend"] = { v2.GiftFruitToFriend:Use({
			["Target"] = 25,
			["Arguments"] = {}
		}) },
	["LikeGardens"] = { v2.LikeGardens:Use({
			["Target"] = 3,
			["Arguments"] = {}
		}) }
}
local v_u_6 = {
	v2.Plant:Use({
		["Target"] = 200,
		["Arguments"] = { "Carrot" }
	}),
	v2.Plant:Use({
		["Target"] = 50,
		["Arguments"] = { "Blueberry" }
	}),
	v2.Plant:Use({
		["Target"] = 40,
		["Arguments"] = { "Bamboo" }
	}),
	v2.Plant:Use({
		["Target"] = 30,
		["Arguments"] = { "Daffodil" }
	}),
	v2.Plant:Use({
		["Target"] = 30,
		["Arguments"] = { "Buttercup" }
	}),
	v2.Plant:Use({
		["Target"] = 10,
		["Arguments"] = { "Mushroom" }
	}),
	v2.Plant:Use({
		["Target"] = 5,
		["Arguments"] = { "Pumpkin" }
	}),
	v2.Plant:Use({
		["Target"] = 5,
		["Arguments"] = { "Watermelon" }
	}),
	v2.Plant:Use({
		["Target"] = 4,
		["Arguments"] = { "Mango" }
	}),
	v2.Plant:Use({
		["Target"] = 4,
		["Arguments"] = { "Dragon Fruit" }
	}),
	v2.Harvest:Use({
		["Target"] = 100,
		["Arguments"] = { "Carrot" }
	}),
	v2.Harvest:Use({
		["Target"] = 300,
		["Arguments"] = { "Blueberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 100,
		["Arguments"] = { "Corn" }
	}),
	v2.Harvest:Use({
		["Target"] = 100,
		["Arguments"] = { "Bamboo" }
	}),
	v2.Harvest:Use({
		["Target"] = 150,
		["Arguments"] = { "Tomato" }
	}),
	v2.Harvest:Use({
		["Target"] = 75,
		["Arguments"] = { "Apple" }
	}),
	v2.Harvest:Use({
		["Target"] = 40,
		["Arguments"] = { "Cactus" }
	}),
	v2.Harvest:Use({
		["Target"] = 30,
		["Arguments"] = { "Buttercup" }
	}),
	v2.Harvest:Use({
		["Target"] = 50,
		["Arguments"] = { "Mango" }
	}),
	v2.Harvest:Use({
		["Target"] = 30,
		["Arguments"] = { "Daffodil" }
	})
}
local v_u_7 = {
	v2.Plant:Use({
		["Target"] = 10,
		["Arguments"] = { "Carrot" }
	}),
	v2.Plant:Use({
		["Target"] = 2,
		["Arguments"] = { "Blueberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Strawberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 20,
		["Arguments"] = { "Blueberry" }
	}),
	v2.Harvest:Use({
		["Target"] = 10,
		["Arguments"] = { "Carrot" }
	})
}
return {
	["Type"] = "GardenGames",
	["CustomData"] = {},
	["IsIndividual"] = true,
	["Display"] = function(_)
		return "Garden Games Quest"
	end,
	["Generate"] = function(_, p8)
		-- upvalues: (copy) v_u_5, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7, (copy) v_u_6
		local v9 = Random.new()
		local v10 = {}
		local v11 = {}
		for _, v12 in v_u_5 do
			local v13 = v12[v9:NextInteger(1, #v12)]
			table.insert(v10, v13)
		end
		local v14 = table.clone(v10)
		local v15 = v14[v9:NextInteger(1, #v14)]
		v15.Rewards = { v_u_3.Currency:Use({
				["Type"] = "CarrotCoins",
				["Amount"] = v9:NextInteger(v_u_4.HardQuests.Min, v_u_4.HardQuests.Max)
			}) }
		table.insert(v11, v15)
		local v16 = table.clone(v_u_7)
		local v17 = v16[v9:NextInteger(1, #v16)]
		v17.Rewards = { v_u_3.Currency:Use({
				["Type"] = "CarrotCoins",
				["Amount"] = v9:NextInteger(v_u_4.EasyQuests.Min, v_u_4.EasyQuests.Max)
			}) }
		table.insert(v11, v17)
		local v18 = table.clone(v_u_6)
		for _ = 1, 3 do
			local v19 = v9:NextInteger(1, #v18)
			local v20 = v18[v19]
			v20.Rewards = { v_u_3.Currency:Use({
					["Type"] = "CarrotCoins",
					["Amount"] = v9:NextInteger(v_u_4.MediumQuests.Min, v_u_4.MediumQuests.Max)
				}) }
			table.remove(v18, v19)
			table.insert(v11, v20)
		end
		return {
			["Quests"] = v11,
			["Rewards"] = type(p8) ~= "function" and {} or p8({
				["type"] = "rewards"
			})
		}
	end
}
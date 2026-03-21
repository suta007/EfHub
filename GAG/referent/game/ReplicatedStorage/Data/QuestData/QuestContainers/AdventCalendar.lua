local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v_u_3 = require(v1.Data.ChristmasEvent.AdventCalendarConfigData)
local v_u_4 = {
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
local v_u_5 = {
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
return {
	["Type"] = "AdventCalendar",
	["CustomData"] = {},
	["Display"] = function(_)
		return "Advent Calendar"
	end,
	["Generate"] = function(_, p6)
		-- upvalues: (copy) v_u_3, (copy) v_u_5, (copy) v_u_4
		local v7 = v_u_3.DAILY_QUEST_COUNT
		local v8 = Random.new()
		local v9 = {}
		local v10 = {}
		for _, v11 in v_u_5 do
			table.insert(v9, v11)
		end
		for _, v12 in v_u_4 do
			local v13 = v12[v8:NextNumber(1, #v12)]
			table.insert(v9, v13)
		end
		local v14 = #v9
		for _ = 1, math.min(v7, v14) do
			local v15 = v8:NextInteger(1, #v9)
			local v16 = v9[v15]
			table.insert(v10, v16)
			table.remove(v9, v15)
		end
		return {
			["Quests"] = v10,
			["Rewards"] = type(p6) ~= "function" and {} or p6({
				["type"] = "rewards"
			})
		}
	end
}
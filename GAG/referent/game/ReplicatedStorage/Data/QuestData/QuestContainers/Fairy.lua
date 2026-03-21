local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v3 = require(v1.Data.QuestData.QuestRewards)
local v_u_4 = {}
local v5 = {
	["Quests"] = {
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Strawberry", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Blueberry", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Orange Tulip", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Tomato", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Corn", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Daffodil", "Glimmering" }
		})
	},
	["PossibleRewards"] = { v3.Currency:Use({
			["Type"] = "FairyPoints",
			["Amount"] = 500
		}) }
}
v_u_4[1] = v5
local v6 = {
	["Quests"] = {
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Tomato", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Corn", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Daffodil", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Watermelon", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Pumpkin", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Apple", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Bamboo", "Glimmering" }
		})
	},
	["PossibleRewards"] = { v3.Currency:Use({
			["Type"] = "FairyPoints",
			["Amount"] = 550
		}) }
}
v_u_4[2] = v6
local v7 = {
	["Quests"] = {
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Watermelon", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Pumpkin", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Apple", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Bamboo", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Coconut", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Cactus", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Dragon Fruit", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Mango", "Glimmering" }
		})
	},
	["PossibleRewards"] = { v3.Currency:Use({
			["Type"] = "FairyPoints",
			["Amount"] = 1200
		}) }
}
v_u_4[3] = v7
local v8 = {
	["Quests"] = {
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Coconut", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Cactus", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Dragon Fruit", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Mango", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Grape", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Sunbulb" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Glowthorn" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Mushroom", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Pepper", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Cacao", "Glimmering" }
		})
	},
	["PossibleRewards"] = { v3.Currency:Use({
			["Type"] = "FairyPoints",
			["Amount"] = 2300
		}) }
}
v_u_4[4] = v8
local v9 = {
	["Quests"] = {
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Lightshoot" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Glowthorn" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Grape", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Mushroom", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Pepper", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Cacao", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Beanstalk", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Ember Lily", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Sugar Apple", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Burning Bud", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Giant Pinecone", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Elder Strawberry", "Glimmering" }
		}),
		v2.SubmitFairyFountainFruit:Use({
			["Target"] = 1,
			["Arguments"] = { "Romanesco", "Glimmering" }
		})
	},
	["PossibleRewards"] = { v3.Currency:Use({
			["Type"] = "FairyPoints",
			["Amount"] = 5000
		}) }
}
v_u_4[5] = v9
local v15 = {
	["Type"] = "Fairy",
	["CustomData"] = {
		["QuestSets"] = v_u_4,
		["TierToQuestAmount"] = {
			1,
			1,
			2,
			2,
			3
		}
	},
	["Display"] = function(_)
		return "Fairy Event Quests"
	end,
	["Generate"] = function(_, p10)
		-- upvalues: (copy) v_u_4
		local v11
		if type(p10) == "function" then
			v11 = p10({
				["type"] = "quests"
			})
		else
			v11 = table.clone(v_u_4[1].Quests)
		end
		local v12 = table.create(1)
		v12[1] = table.remove(v11, 1)
		local v13 = {
			["Quests"] = v12
		}
		local v14
		if type(p10) == "function" then
			v14 = p10({
				["type"] = "rewards"
			})
		else
			v14 = table.clone(v_u_4[1].Rewards)
		end
		v13.Rewards = v14
		return v13
	end
}
return v15
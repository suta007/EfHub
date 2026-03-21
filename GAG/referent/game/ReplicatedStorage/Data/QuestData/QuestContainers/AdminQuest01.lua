local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.QuestData.Types)
local v2 = require(v1.Data.QuestData.Quests)
local v3 = require(v1.Data.QuestData.QuestRewards)
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
	["SpendCurrency"] = {
		v2.SpendCurrency:Use({
			["Target"] = 100000,
			["Arguments"] = { "Sheckles" }
		}),
		v2.SpendCurrency:Use({
			["Target"] = 500000,
			["Arguments"] = { "Sheckles" }
		}),
		v2.SpendCurrency:Use({
			["Target"] = 1000000,
			["Arguments"] = { "Sheckles" }
		}),
		v2.SpendCurrency:Use({
			["Target"] = 2000000,
			["Arguments"] = { "Sheckles" }
		}),
		v2.SpendCurrency:Use({
			["Target"] = 10000000,
			["Arguments"] = { "Sheckles" }
		})
	},
	["SellAnyPlant"] = {
		v2.SellAnyPlant:Use({
			["Target"] = 500,
			["Arguments"] = {}
		}),
		v2.SellAnyPlant:Use({
			["Target"] = 1000,
			["Arguments"] = {}
		}),
		v2.SellAnyPlant:Use({
			["Target"] = 1500,
			["Arguments"] = {}
		}),
		v2.SellAnyPlant:Use({
			["Target"] = 2000,
			["Arguments"] = {}
		})
	},
	["WaterPlants"] = {
		v2.WaterPlants:Use({
			["Target"] = 20,
			["Arguments"] = {}
		}),
		v2.WaterPlants:Use({
			["Target"] = 35,
			["Arguments"] = {}
		}),
		v2.WaterPlants:Use({
			["Target"] = 50,
			["Arguments"] = {}
		}),
		v2.WaterPlants:Use({
			["Target"] = 100,
			["Arguments"] = {}
		})
	},
	["AgeAnyPet"] = {
		v2.AgeAnyPet:Use({
			["Target"] = 5,
			["Arguments"] = {}
		}),
		v2.AgeAnyPet:Use({
			["Target"] = 10,
			["Arguments"] = {}
		}),
		v2.AgeAnyPet:Use({
			["Target"] = 20,
			["Arguments"] = {}
		}),
		v2.AgeAnyPet:Use({
			["Target"] = 30,
			["Arguments"] = {}
		}),
		v2.AgeAnyPet:Use({
			["Target"] = 50,
			["Arguments"] = {}
		})
	},
	["HarvestAnyMutation"] = { v2.HarvestMutation:Use({
			["Target"] = 100,
			["Arguments"] = {}
		}), v2.HarvestMutation:Use({
			["Target"] = 200,
			["Arguments"] = {}
		}), v2.HarvestMutation:Use({
			["Target"] = 300,
			["Arguments"] = {}
		}) }
}
local v_u_5 = {
	v2.FeedAnyPetFood:Use({
		["Target"] = 5,
		["Arguments"] = { "Soup" }
	}),
	v2.FeedAnyPet:Use({
		["Target"] = 15,
		["Arguments"] = { "Coconut" }
	}),
	v2.FeedAnyPet:Use({
		["Target"] = 40,
		["Arguments"] = { "Carrot" }
	}),
	v2.FeedAnyPet:Use({
		["Target"] = 20,
		["Arguments"] = { "Apple" }
	}),
	v2.FeedAnyPet:Use({
		["Target"] = 5,
		["Arguments"] = { "Pepper" }
	}),
	v2.FeedAnyPet:Use({
		["Target"] = 10,
		["Arguments"] = { "Mango" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 20,
		["Arguments"] = { "Wet" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 10,
		["Arguments"] = { "Windstruck" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 5,
		["Arguments"] = { "Shocked" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 5,
		["Arguments"] = { "Disco" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 5,
		["Arguments"] = { "Lightcycle" }
	}),
	v2.HarvestMutation:Use({
		["Target"] = 5,
		["Arguments"] = { "Voidtouched" }
	}),
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
	}),
	v2.ObtainPlant:Use({
		["Target"] = 30,
		["Arguments"] = { "Mango" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 30,
		["Arguments"] = { "Pepper" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 30,
		["Arguments"] = { "Dragon Fruit" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 30,
		["Arguments"] = { "Grape" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 15,
		["Arguments"] = { "Giant Pinecone" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 15,
		["Arguments"] = { "Ember Lily" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 3,
		["Arguments"] = { "Romanesco" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 1,
		["Arguments"] = { "Crimson Thorn" }
	}),
	v2.ObtainPlant:Use({
		["Target"] = 25,
		["Arguments"] = { "Beanstalk" }
	}),
	v2.UseInCooking:Use({
		["Target"] = 10,
		["Arguments"] = { "Corn" }
	}),
	v2.UseInCooking:Use({
		["Target"] = 10,
		["Arguments"] = { "Strawberry" }
	}),
	v2.UseInCooking:Use({
		["Target"] = 10,
		["Arguments"] = { "Apple" }
	}),
	v2.UseInCooking:Use({
		["Target"] = 10,
		["Arguments"] = { "Tomato" }
	}),
	v2.UseInCooking:Use({
		["Target"] = 3,
		["Arguments"] = { "Elder Strawberry" }
	}),
	v2.SellPlant:Use({
		["Target"] = 25,
		["Arguments"] = { "Pepper" }
	}),
	v2.SellPlant:Use({
		["Target"] = 25,
		["Arguments"] = { "Cacao" }
	}),
	v2.SellPlant:Use({
		["Target"] = 25,
		["Arguments"] = { "Grape" }
	}),
	v2.SellPlant:Use({
		["Target"] = 40,
		["Arguments"] = { "Bamboo" }
	}),
	v2.SellPlant:Use({
		["Target"] = 20,
		["Arguments"] = { "Sugar Apple" }
	}),
	v2.SellPlant:Use({
		["Target"] = 30,
		["Arguments"] = { "Mango" }
	}),
	v2.SellPlant:Use({
		["Target"] = 30,
		["Arguments"] = { "Mushroom" }
	}),
	v2.SellPlant:Use({
		["Target"] = 5,
		["Arguments"] = { "Burning Bud" }
	}),
	v2.SellPlant:Use({
		["Target"] = 5,
		["Arguments"] = { "Elder Strawberry" }
	}),
	v2.SellPlant:Use({
		["Target"] = 100,
		["Arguments"] = { "Tomato" }
	}),
	v2.SellPlant:Use({
		["Target"] = 80,
		["Arguments"] = { "Daffodil" }
	}),
	v2.SellPlant:Use({
		["Target"] = 200,
		["Arguments"] = { "Carrot" }
	}),
	v2.SellPlant:Use({
		["Target"] = 200,
		["Arguments"] = { "Blueberry" }
	}),
	v2.PlaceObject:Use({
		["Target"] = 15,
		["Arguments"] = { "Basic Sprinkler" }
	}),
	v2.PlaceObject:Use({
		["Target"] = 8,
		["Arguments"] = { "Advanced Sprinkler" }
	}),
	v2.PlaceObject:Use({
		["Target"] = 3,
		["Arguments"] = { "Godly Sprinkler" }
	})
}
local v_u_6 = {
	v3.Seed:Use({
		["Type"] = "Crimson Thorn",
		["Amount"] = 1
	}),
	v3.Gear:Use({
		["Type"] = "Rainbow Lollipop",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Burning Bud",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Beanstalk",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Ember Lily",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Sugar Apple",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Giant Pinecone",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Elder Strawberry",
		["Amount"] = 1
	}),
	v3.Seed:Use({
		["Type"] = "Romanesco",
		["Amount"] = 1
	})
}
local v20 = {
	["Type"] = "AdminQuest01",
	["CustomData"] = {
		["PossibleRewards"] = v_u_6
	},
	["Display"] = function(_)
		return "Admin Quest"
	end,
	["Generate"] = function(_, p7)
		-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_6
		local v8 = Random.new()
		local v9 = {}
		local v10 = 30
		local v11 = {}
		for _, v12 in v_u_5 do
			table.insert(v9, v12)
		end
		for _, v13 in v_u_4 do
			local v14 = v13[v8:NextNumber(1, #v13)]
			table.insert(v9, v14)
		end
		local v15 = #v9
		for _ = 1, math.min(v10, v15) do
			local v16 = v8:NextInteger(1, #v9)
			local v17 = v9[v16]
			table.insert(v11, v17)
			table.remove(v9, v16)
		end
		local v18 = {
			["Quests"] = v11
		}
		local v19
		if type(p7) == "function" then
			v19 = p7({
				["type"] = "rewards"
			})
		else
			v19 = { v_u_6[v8:NextInteger(1, #v_u_6)] }
		end
		v18.Rewards = v19
		return v18
	end
}
if game:GetService("RunService"):IsClient() and (game:GetService("RunService"):IsStudio() and game:GetService("Players").LocalPlayer.UserId == 9099919347) then
	local v21 = require(v1.Modules.CountDictionary)
	print("AdminQuest01 Count: " .. #v_u_5 + v21(v_u_4))
end
return v20
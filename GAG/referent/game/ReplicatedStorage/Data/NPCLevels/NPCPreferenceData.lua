local v1 = game:GetService("ReplicatedStorage")
require(v1.Data.NPCLevels.NPCLevelData.NPCLevelTypes)
local v2 = {}
local v3 = {
	["Likes"] = {
		["Foods"] = { "Burger", "Porridge", "Corndog" },
		["FoodAttributes"] = { "Size" }
	},
	["Dislikes"] = {
		["Foods"] = { "" },
		["FoodAttributes"] = nil
	}
}
v2.Giant = v3
local v4 = {
	["Likes"] = {
		["Foods"] = { "Burger", "Porridge", "Corndog" },
		["FoodAttributes"] = { "Rarity" }
	},
	["Dislikes"] = {
		["Foods"] = { "" },
		["FoodAttributes"] = nil
	}
}
v2.Sam = v4
local v5 = {
	["Likes"] = {
		["Foods"] = { "Burger", "Porridge", "Corndog" },
		["FoodAttributes"] = { "Mutation" }
	},
	["Dislikes"] = {
		["Foods"] = { "" },
		["FoodAttributes"] = nil
	}
}
v2.Eloise = v5
local v6 = {
	["Likes"] = {
		["Foods"] = { "Burger", "Porridge", "Corndog" },
		["FoodAttributes"] = { "Rarity" }
	},
	["Dislikes"] = {
		["Foods"] = { "" },
		["FoodAttributes"] = nil
	}
}
v2.Raphael = v6
local v7 = {
	["Likes"] = {
		["Foods"] = { "Burger", "Porridge", "Corndog" },
		["FoodAttributes"] = { "Rarity" }
	},
	["Dislikes"] = {
		["Foods"] = { "" },
		["FoodAttributes"] = nil
	}
}
v2.Isaac = v7
return v2
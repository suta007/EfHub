game:GetService("ServerScriptService")
game:GetService("Players")
local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.UpdateService)
local v2 = {}
local v3 = {
	["Friendship"] = {
		["TabItems"] = {
			"Skyroot Chest",
			"Can Of Beans",
			"Pet Shard GiantBean",
			"Glowpod",
			"Bouncy Mushroom",
			"Griffin Statue",
			"Beanstalk Painting",
			"Flare Melon",
			"Gnome"
		}
	}
}
v2.Giant = v3
local v4 = {
	["Tier 2"] = {
		["RefreshTime"] = 3600,
		["TabItems"] = {
			"Cocomango",
			"Potato",
			"Broccoli",
			"Brussels Sprout"
		}
	},
	["Daily Deals"] = {
		["RefreshTime"] = 86400,
		["TabItems"] = {}
	}
}
v2.Seed = v4
local v5 = {
	["Tier 2"] = {
		["TabItems"] = { "Pet Name Reroller", "Pet Lead", "Rainbow Lollipop" }
	}
}
v2.Pet = v5
v2["Fairy Genius"] = {}
return v2
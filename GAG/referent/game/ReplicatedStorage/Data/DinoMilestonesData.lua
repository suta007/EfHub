local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Data.QuestData.QuestRewards)
require(v1.Data.QuestData.Types)
local v3 = {
	["ProgresPerQuest"] = 1,
	["RestartShecklesPrice"] = 100000000,
	["RestartRobuxPrice"] = 149,
	["RestartRobuxProduct"] = 3322860121,
	["MaxProgress"] = 21
}
local v4 = {
	[3] = v2.Cosmetic:Use({
		["Amount"] = 1,
		["Type"] = "Volcano"
	}),
	[6] = v2["Seed Pack"]:Use({
		["Type"] = "Ancient Seed Pack",
		["Amount"] = 3
	}),
	[9] = v2.Cosmetic:Use({
		["Type"] = "Long Neck Dino Statue",
		["Amount"] = 1
	}),
	[12] = v2["Seed Pack"]:Use({
		["Type"] = "Ancient Seed Pack",
		["Amount"] = 6
	}),
	[15] = v2.Gear:Use({
		["Type"] = "Mutation Spray Amber",
		["Amount"] = 3
	}),
	[18] = v2["Seed Pack"]:Use({
		["Type"] = "Ancient Seed Pack",
		["Amount"] = 10
	}),
	[21] = v2.Seed:Use({
		["Type"] = "Bone Blossom",
		["Amount"] = 1
	})
}
v3.Rewards = v4
return v3
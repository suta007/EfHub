local v1 = {}
local v2 = {
	["PotType"] = "Friendship Pot"
}
local v3 = {}
local v4 = {
	["DisplayName"] = "Basic Reward",
	["Description"] = "Some basic items",
	["ItemCount"] = NumberRange.new(1, 2),
	["Chance"] = 100,
	["MinDays"] = 0,
	["MaxDays"] = (1 / 0)
}
local v5 = {
	["Carrot Seeds"] = {
		["ItemName"] = "Carrot",
		["ItemType"] = "seed",
		["ItemAmount"] = NumberRange.new(5, 10)
	},
	["Tomato Seeds"] = {
		["ItemName"] = "Tomato",
		["ItemType"] = "seed",
		["ItemAmount"] = NumberRange.new(2, 3)
	}
}
v4.Items = v5
v3.Basic = v4
v2.Rewards = v3
v1["Friendship Pot"] = v2
return v1
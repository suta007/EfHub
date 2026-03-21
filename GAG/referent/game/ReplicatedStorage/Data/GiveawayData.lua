local v1 = {}
local v2 = {
	["NotificationText"] = "You won a Water Buffalo in a giveaway!",
	["RewardType"] = "Pet",
	["RewardData"] = {
		["PetName"] = "Water Buffalo",
		["Level"] = 1
	}
}
local v3 = {
	["UserIDs"] = {
		4234077608,
		8590294385,
		311211385,
		5414402452,
		5495539367,
		8047477009,
		7621521670,
		7543833840
	},
	["Usernames"] = {
		["Curscs"] = true
	}
}
v2.Winners = v3
v1.Water_Buffalo_Giveaway_Test = v2
return v1
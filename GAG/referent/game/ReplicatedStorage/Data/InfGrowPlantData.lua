local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.UpdateService)
local v2 = {}
local v3 = {}
local v4 = {
	["DisplayName"] = "Christmas Tree",
	["BaseWeightIncrease"] = 0.1,
	["CanBeMutated"] = false,
	["MaxScale"] = 20,
	["CollideThresh"] = 10,
	["OfflineIncrease"] = 0.1,
	["ValidSubmissions"] = {
		["Wonder Water"] = true
	},
	["CollectionDate"] = 1766858400
}
v3["Christmas Tree"] = v4
v2.InfGrowPlants = v3
v2.AllValidSubmissions = {
	["Wonder Water"] = true
}
return v2
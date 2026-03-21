local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon)
local v3 = require(v1.Data.NewYearsEvent.AdventCalendarConfigData)
local v4 = v2.Types
local v5 = {
	["FinalReward"] = {
		["Items"] = { v4.Seed:Use("Colorpop Crop", 1) },
		["ImageId"] = "rbxassetid://112676240905133",
		["ItemName"] = "Colorpop Crop Seed"
	}
}
local v6 = {
	{
		["Items"] = { v4.Gear:Use("Dragon\'s Firework", 3) },
		["ImageId"] = "rbxassetid://103343401422538",
		["ItemName"] = "Dragon\'s Firework x3"
	},
	{
		["Items"] = { v4.Egg:Use("New Year\'s Egg", 1) },
		["ImageId"] = "rbxassetid://135452393147569",
		["ItemName"] = "New Year\'s Egg x1"
	},
	{
		["Items"] = { v4.Gear:Use("Dragon\'s Firework", 10) },
		["ImageId"] = "rbxassetid://103343401422538",
		["ItemName"] = "Dragon\'s Firework x10"
	},
	{
		["Items"] = { v4.Egg:Use("New Year\'s Egg", 3) },
		["ImageId"] = "rbxassetid://135452393147569",
		["ItemName"] = "New Year\'s Egg x3"
	},
	{
		["Items"] = { v4.Gear:Use("Dragon\'s Firework", 20) },
		["ImageId"] = "rbxassetid://103343401422538",
		["ItemName"] = "Dragon\'s Firework x20"
	},
	{
		["Items"] = { v4.Egg:Use("New Year\'s Egg", 5) },
		["ImageId"] = "rbxassetid://135452393147569",
		["ItemName"] = "New Year\'s Egg x5"
	}
}
v5.Rewards = v6
if #v5.Rewards < v3.DAY_COUNT then
	warn("Number of rewards is less than the number of days!")
end
for v7 = 1, #v5.Rewards do
	if not v5.Rewards[v7] then
		warn((("Reward data not found for day %*"):format(v7)))
	end
end
return v5
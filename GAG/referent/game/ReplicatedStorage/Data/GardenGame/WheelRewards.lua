local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon).Types
local v3 = {
	{
		["Weight"] = 30,
		["Reward"] = v2.Crate:Use("Carnival Crate", 1),
		["ImageId"] = "rbxassetid://130489605814946"
	},
	{
		["Weight"] = 15,
		["Reward"] = v2.Crate:Use("Carnival Crate", 3),
		["ImageId"] = "rbxassetid://130489605814946"
	},
	{
		["Weight"] = 4,
		["Reward"] = v2.Crate:Use("Carnival Crate", 10),
		["ImageId"] = "rbxassetid://130489605814946"
	},
	{
		["Weight"] = 1,
		["Reward"] = v2.Seed:Use("Kernel Curl", 1),
		["ImageId"] = "rbxassetid://72188256382500"
	},
	{
		["Weight"] = 30,
		["Reward"] = v2.Egg:Use("Carnival Egg", 1),
		["ImageId"] = "rbxassetid://91270408981945"
	},
	{
		["Weight"] = 15,
		["Reward"] = v2.Egg:Use("Carnival Egg", 3),
		["ImageId"] = "rbxassetid://91270408981945"
	},
	{
		["Weight"] = 4,
		["Reward"] = v2.Egg:Use("Carnival Egg", 10),
		["ImageId"] = "rbxassetid://91270408981945"
	},
	{
		["Weight"] = 1,
		["Reward"] = v2.Egg:Use("Carnival Egg", 50),
		["ImageId"] = "rbxassetid://91270408981945"
	}
}
return v3
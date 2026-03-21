local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GiveServiceCommon).Types
local v3 = {}
local v4 = {
	{
		["Items"] = { v2.Cosmetic:Use("Heart Bench", 1) },
		["ImageId"] = "rbxassetid://128917754594343",
		["ItemName"] = "Heart Bench",
		["Price"] = 30
	},
	{
		["Items"] = { v2.Seed:Use("Pink Rose", 1) },
		["ImageId"] = "rbxassetid://140635830048990",
		["ItemName"] = "Pink Rose",
		["Price"] = 200
	},
	{
		["Items"] = { v2.Cosmetic:Use("Valentine Arch", 1) },
		["ImageId"] = "rbxassetid://97219704562929",
		["ItemName"] = "Valentine Arch",
		["Price"] = 700
	},
	{
		["Items"] = { v2.Pet:Use("Pink Panda", 1) },
		["ImageId"] = "rbxassetid://103412834589201",
		["ItemName"] = "Pink Panda",
		["Price"] = 2000
	},
	{
		["Items"] = { v2.Pet:Use("Red Rose Fox", 1) },
		["ImageId"] = "rbxassetid://100539117208884",
		["ItemName"] = "Red Rose Fox",
		["Price"] = 10000
	}
}
v3.Rewards = v4
return v3
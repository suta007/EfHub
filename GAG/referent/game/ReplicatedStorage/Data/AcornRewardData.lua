local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.GiveServiceCommon)
local v_u_2 = Random.new()
local v3 = {}
local v4 = {}
local v5 = {
	["Rewards"] = {
		{
			["Value"] = "Watering Can",
			["Type"] = "Gear",
			["Quantity"] = 15,
			["Chance"] = 15
		},
		{
			["Value"] = "Event Lantern",
			["Type"] = "Gear",
			["Quantity"] = 20,
			["Chance"] = 13
		},
		{
			["Value"] = "Godly Sprinkler",
			["Type"] = "Gear",
			["Quantity"] = 2,
			["Chance"] = 12
		},
		{
			["Value"] = "Reclaimer",
			["Type"] = "Gear",
			["Quantity"] = 3,
			["Chance"] = 11
		},
		{
			["Value"] = "Legendary Egg",
			["Type"] = "Egg",
			["Quantity"] = 1,
			["Chance"] = 12
		},
		{
			["Value"] = "Nutty Crate",
			["Type"] = "Crate",
			["Quantity"] = 1,
			["Chance"] = 9
		},
		{
			["Value"] = "Silver Fertilizer",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 7
		},
		{
			["Value"] = "Nutty Chest",
			["Type"] = "Seed Pack",
			["Quantity"] = 1,
			["Chance"] = 6
		},
		{
			["Value"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 5.5
		},
		{
			["Value"] = "Medium Treat",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 3.5
		},
		{
			["Value"] = "Medium Toy",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 3.5
		},
		{
			["Value"] = "Mythical Egg",
			["Type"] = "Egg",
			["Quantity"] = 1,
			["Chance"] = 3
		},
		{
			["Value"] = "Nutty Chest",
			["Type"] = "Seed Pack",
			["Quantity"] = 2,
			["Chance"] = 2.5
		},
		{
			["Value"] = "Grandmaster Sprinkler",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 2.5
		},
		{
			["Value"] = "Rainbow Fertilizer",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 0.5
		},
		{
			["Value"] = "Pet Shard Nutty",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 0.25
		}
	}
}
local v6 = {
	["Rewards"] = {
		{
			["Value"] = "Watering Can",
			["Type"] = "Gear",
			["Quantity"] = 5,
			["Chance"] = 15
		},
		{
			["Value"] = "Event Lantern",
			["Type"] = "Gear",
			["Quantity"] = 3,
			["Chance"] = 13
		},
		{
			["Value"] = "Harvest Tool",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 11
		},
		{
			["Value"] = "Reclaimer",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 9
		},
		{
			["Value"] = "Godly Sprinkler",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 4
		},
		{
			["Value"] = "Small Treat",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 2
		},
		{
			["Value"] = "Small Toy",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 2
		},
		{
			["Value"] = "Silver Fertilizer",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 1.5
		},
		{
			["Value"] = "Master Sprinkler",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 1
		}
	}
}
__set_list(v4, 1, {v5, v6})
v3.RewardSets = v4
function v3.PickRandom(p7)
	-- upvalues: (copy) v_u_2
	local v8 = 0
	for _, v9 in p7 do
		v8 = v8 + (v9.Chance or 1)
	end
	local v10 = v_u_2:NextNumber(0, v8)
	local v11 = 0
	for _, v12 in p7 do
		v11 = v11 + (v12.Chance or 1)
		if v10 <= v11 then
			return v12
		end
	end
	return p7[1]
end
return v3
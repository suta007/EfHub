local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.GiveServiceCommon)
local v2 = {}
local v3 = {
	["Default"] = {
		{
			["Value"] = "Fall Seed Pack",
			["Type"] = "Seed Pack",
			["Quantity"] = 1,
			["Chance"] = 50
		},
		{
			["Value"] = "Fall Egg",
			["Type"] = "Egg",
			["Quantity"] = 1,
			["Chance"] = 50
		},
		{
			["Value"] = "Fall Crate",
			["Type"] = "Crate",
			["Quantity"] = 1,
			["Chance"] = 30
		},
		{
			["Value"] = "Maple Crate",
			["Type"] = "Crate",
			["Quantity"] = 1,
			["Chance"] = 10
		},
		{
			["Value"] = "Maple Sprinkler",
			["Type"] = "Gear",
			["Quantity"] = 1,
			["Chance"] = 10
		},
		{
			["Value"] = "Rake",
			["Type"] = "Gear",
			["Quantity"] = 10,
			["Chance"] = 10
		},
		{
			["Value"] = "Pet Lead",
			["Type"] = "Gear",
			["Quantity"] = 5,
			["Chance"] = 10
		},
		{
			["Value"] = "Pet Name Reroller",
			["Type"] = "Gear",
			["Quantity"] = 5,
			["Chance"] = 10
		},
		{
			["Value"] = "Reclaimer",
			["Type"] = "Gear",
			["Quantity"] = 10,
			["Chance"] = 5
		},
		{
			["Value"] = "Sheckles",
			["Type"] = "Currency",
			["Quantity"] = 100000,
			["Chance"] = 5
		},
		{
			["Value"] = "Super Leaf Blower",
			["Type"] = "Gear",
			["ItemAmount"] = 1,
			["Chance"] = 3
		},
		{
			["Value"] = "Super Watering Can",
			["Type"] = "Gear",
			["ItemAmount"] = 1,
			["Chance"] = 1
		},
		{
			["Value"] = "Pet Shard Silver",
			["Type"] = "Gear",
			["ItemAmount"] = 1,
			["Chance"] = 1
		},
		{
			["Value"] = "Silver Fertilizer",
			["Type"] = "Gear",
			["ItemAmount"] = 1,
			["Chance"] = 1
		}
	},
	["Set2"] = {
		{
			["Value"] = "Bone Blossom",
			["Type"] = "Seed",
			["ItemAmount"] = 1000,
			["Chance"] = 10
		}
	}
}
v2.RewardSets = v3
function v2.PickRandom(p4)
	local v5 = 0
	for _, v6 in p4 do
		v5 = v5 + (v6.Chance or 1)
	end
	local v7 = Random.new():NextNumber() * v5
	local v8 = 0
	for _, v9 in p4 do
		v8 = v8 + (v9.Chance or 1)
		if v7 <= v8 then
			return v9
		end
	end
end
return v2
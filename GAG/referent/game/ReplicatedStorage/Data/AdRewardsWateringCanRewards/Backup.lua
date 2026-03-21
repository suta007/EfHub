local v1 = game:GetService("ReplicatedStorage")
local _ = require(v1.UserGenerated.ABTests)
local _ = require(v1.UserGenerated.Collections.DropTable)
local v2 = require(v1.UserGenerated.FastFlags)
local v3 = require(v1.UserGenerated.Lang.Asserts)
local _ = require(v1.UserGenerated.Randoms.ISAAC)
require(script.InfinitePackTypes)
local _ = require(script.InfinitePackProductIds)
local v4 = {
	{
		["Name"] = "250,000\194\162",
		["RewardName"] = "Sheckles",
		["Type"] = "Currency",
		["Amount"] = 250000,
		["Chance"] = 80
	},
	{
		["Name"] = "Watering Can x30",
		["RewardName"] = "Watering Can",
		["Type"] = "Gear",
		["Amount"] = 30,
		["Chance"] = 80
	},
	{
		["Name"] = "Silver Fertilizer",
		["RewardName"] = "Silver Fertilizer",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 80
	},
	{
		["Name"] = "Medium Toy",
		["RewardName"] = "Medium Toy",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 30
	},
	{
		["Name"] = "Medium Treat",
		["RewardName"] = "Medium Treat",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 30
	},
	{
		["Name"] = "Magnifying Glass",
		["RewardName"] = "Magnifying Glass",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 30
	},
	{
		["Name"] = "Friendship Pot",
		["RewardName"] = "Friendship Pot",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 30
	},
	{
		["Name"] = "Tropical Mist Sprinkler",
		["RewardName"] = "Tropical Mist Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Sweet Soaker Sprinkler",
		["RewardName"] = "Sweet Soaker Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Stalk Sprout Sprinkler",
		["RewardName"] = "Stalk Sprout Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Spice Spritzer Sprinkler",
		["RewardName"] = "Spice Spritzer Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Master Sprinkler",
		["RewardName"] = "Master Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Statue Crate",
		["RewardName"] = "Statue Crate",
		["Type"] = "Crate",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Fun Crate",
		["RewardName"] = "Fun Crate",
		["Type"] = "Crate",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Outdoors Crate",
		["RewardName"] = "Outdoors Crate",
		["Type"] = "Crate",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Classic Gnome Crate",
		["RewardName"] = "Classic Gnome Crate",
		["Type"] = "Crate",
		["Amount"] = 1,
		["Chance"] = 5
	}
}
local v5 = {
	["Free"] = {},
	["Paid"] = {}
}
local v6 = {
	{
		["Name"] = "1,000,000\194\162",
		["RewardName"] = "Sheckles",
		["Type"] = "Currency",
		["Amount"] = 1000000,
		["Chance"] = 25
	},
	{
		["Name"] = "Super Watering Can",
		["RewardName"] = "Super Watering Can",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 25
	},
	{
		["Name"] = "Large Toy",
		["RewardName"] = "Large Toy",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 25
	},
	{
		["Name"] = "Energy Chew",
		["RewardName"] = "Energy Chew",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Rainbow Fertilizer",
		["RewardName"] = "Rainbow Fertilizer",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Level-Up Lollipop",
		["RewardName"] = "Levelup Lollipop",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Silver Lollipop",
		["RewardName"] = "Silver Lollipop",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Rainbow Lollipop",
		["RewardName"] = "Rainbow Lollipop",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Grandmaster Sprinkler",
		["RewardName"] = "Grandmaster Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Grow All",
		["RewardName"] = "Grow All",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Artisan Container",
		["RewardName"] = "Artisan Container",
		["Type"] = "Seed Pack",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Elemental Container",
		["RewardName"] = "Elemental Container",
		["Type"] = "Seed Pack",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Gem Chest",
		["RewardName"] = "Gem Chest",
		["Type"] = "Seed Pack",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Zen Crate",
		["RewardName"] = "Zen Crate",
		["Type"] = "Crate",
		["Amount"] = 1,
		["Chance"] = 5
	},
	{
		["Name"] = "Bug Egg",
		["RewardName"] = "Bug Egg",
		["Type"] = "Egg",
		["Amount"] = 1,
		["Chance"] = 3
	},
	{
		["Name"] = "Gem Egg",
		["RewardName"] = "Gem Egg",
		["Type"] = "Egg",
		["Amount"] = 1,
		["Chance"] = 3
	}
}
local v7 = {
	{
		["Name"] = "10,000,000\194\162",
		["RewardName"] = "Sheckles",
		["Type"] = "Currency",
		["Amount"] = 10000000,
		["Chance"] = 10
	},
	{
		["Name"] = "Pet Mutation Shard (Gold)",
		["RewardName"] = "Pet Shard Golden",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	},
	{
		["Name"] = "Pet Mutation Shard (Jumbo)",
		["RewardName"] = "Pet Shard JUMBO",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 7
	},
	{
		["Name"] = "Zen Egg",
		["RewardName"] = "Zen Egg",
		["Type"] = "Egg",
		["Amount"] = 1,
		["Chance"] = 0.1
	},
	{
		["Name"] = "Crimson Thorn Seed",
		["RewardName"] = "Crimson Thorn",
		["Type"] = "Seed",
		["Amount"] = 1,
		["Chance"] = 3
	},
	{
		["Name"] = "Zebrazinkle Seed",
		["RewardName"] = "Zebrazinkle",
		["Type"] = "Seed",
		["Amount"] = 1,
		["Chance"] = 3
	},
	{
		["Name"] = "Octobloom Seed",
		["RewardName"] = "Octobloom",
		["Type"] = "Seed",
		["Amount"] = 1,
		["Chance"] = 3
	},
	{
		["Name"] = "Paradise Egg",
		["RewardName"] = "Paradise Egg",
		["Type"] = "Egg",
		["Amount"] = 1,
		["Chance"] = 1
	},
	{
		["Name"] = "Mega Lollipop",
		["RewardName"] = "Mega Lollipop",
		["Type"] = "Gear",
		["Amount"] = 1,
		["MaxAmount"] = 1,
		["Chance"] = 1
	},
	{
		["Name"] = "Pet Mutation Shard (Rainbow)",
		["RewardName"] = "Pet Shard Rainbow",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 0.5
	},
	{
		["Name"] = "Night Egg",
		["RewardName"] = "Night Egg",
		["Type"] = "Egg",
		["Amount"] = 1,
		["MaxAmount"] = 1,
		["Chance"] = 0.1
	}
}
for _, v8 in ipairs(v4) do
	local v9 = v5.Paid
	table.insert(v9, v8)
end
for _, v10 in ipairs(v6) do
	local v11 = v5.Paid
	table.insert(v11, v10)
end
for _, v12 in ipairs(v7) do
	local v13 = v5.Paid
	table.insert(v13, v12)
end
v2.Replicated("ForeverPack.BaseAmount", v3.FiniteNonNegative, 1)
v2.Replicated("ForeverPack.BaseLuck", v3.FiniteNonNegative, 1)
v2.Replicated("ForeverPack.LuckPerPremiumTier", v3.FiniteNonNegative, 1)
v2.Replicated("ForeverPack.InitialFreeSlotsRange", v3.Table({ v3.IntegerNonNegative, v3.IntegerNonNegative }), { 1, 1 })
v2.Replicated("ForeverPack.PremiumFreeSlotsRange", v3.Table({ v3.IntegerNonNegative, v3.IntegerNonNegative }), { 2, 4 })
v2.Replicated("ForeverPack.ItemsRange", v3.Table({ v3.FiniteNonNegative, v3.FiniteNonNegative }), { 1, 2 })
v2.Replicated("ForeverPack.PremiumItemsRange", v3.Table({ v3.FiniteNonNegative, v3.FiniteNonNegative }), { 2, 3 })
v2.Replicated("ForeverPack.PremiumReset", v3.Boolean, true)
v2.Replicated("ForeverPack.PremiumAmountMultRange", v3.Table({ v3.FiniteNonNegative, v3.FiniteNonNegative }), { 3, 6 })
v2.Replicated("ForeverPack.PremiumLuckMult", v3.FiniteNonNegative, 3)
v2.Replicated("ForeverPack.Enabled", v3.Boolean, true)
v2.Replicated("ForeverPack.DropsWeightLow", v3.FiniteNonNegative, 95)
v2.Replicated("ForeverPack.DropsWeightMedium", v3.FiniteNonNegative, 4.99)
v2.Replicated("ForeverPack.DropsWeightHigh", v3.FiniteNonNegative, 0.01)
return {}
local v1 = game:GetService("ReplicatedStorage")
require(v1.Modules.GiveServiceCommon)
local v2 = {
	["WeightMultiplierThreshold"] = 4,
	["VariantChanceCap"] = 25
}
local v3 = {
	["Silver"] = {
		["Base"] = 4,
		["Max"] = 8
	},
	["Gold"] = {
		["Base"] = 2,
		["Max"] = 4
	},
	["Rainbow"] = {
		["Base"] = 0.5,
		["Max"] = 1
	}
}
v2.VariantChances = v3
v2.VariantMultipliers = {
	["Normal"] = 1,
	["Silver"] = 1.5,
	["Gold"] = 2,
	["Rainbow"] = 3
}
local v4 = {}
local v5 = {}
local v6 = {
	["Evo Pumpkin I"] = {
		["NextFruit"] = "Evo Pumpkin II",
		["UniqueReward"] = nil
	},
	["Evo Mushroom I"] = {
		["NextFruit"] = "Evo Mushroom II",
		["UniqueReward"] = nil
	},
	["Evo Beetroot I"] = {
		["NextFruit"] = "Evo Beetroot II",
		["UniqueReward"] = nil
	},
	["Evo Blueberry I"] = {
		["NextFruit"] = "Evo Blueberry II",
		["UniqueReward"] = nil
	}
}
v5.SubmittableFruit = v6
v5.TierRewards = {
	{
		["Type"] = "Gear",
		["Value"] = "Small Toy",
		["Quantity"] = 3
	},
	{
		["Type"] = "Gear",
		["Value"] = "Basic Sprinkler",
		["Quantity"] = 3
	},
	{
		["Type"] = "Gear",
		["Value"] = "Reclaimer",
		["Quantity"] = 3
	},
	{
		["Type"] = "Gear",
		["Value"] = "Event Lantern",
		["Quantity"] = 15
	},
	{
		["Type"] = "Gear",
		["Value"] = "Watering Can",
		["Quantity"] = 10
	},
	{
		["Type"] = "Gear",
		["Value"] = "Harvest Tool",
		["Quantity"] = 10
	},
	{
		["Type"] = "Gear",
		["Value"] = "Advanced Sprinkler",
		["Quantity"] = 1
	},
	{
		["Type"] = "Seed Pack",
		["Value"] = "Normal",
		["Quantity"] = 3
	},
	{
		["Type"] = "Egg",
		["Value"] = "Common Egg",
		["Quantity"] = 2
	},
	{
		["Type"] = "Egg",
		["Value"] = "Uncommon Egg",
		["Quantity"] = 1
	}
}
v4[1] = v5
local v7 = {}
local v8 = {
	["Evo Pumpkin II"] = {
		["NextFruit"] = "Evo Pumpkin III",
		["UniqueReward"] = nil
	},
	["Evo Mushroom II"] = {
		["NextFruit"] = "Evo Mushroom III",
		["UniqueReward"] = nil
	},
	["Evo Beetroot II"] = {
		["NextFruit"] = "Evo Beetroot III",
		["UniqueReward"] = nil
	},
	["Evo Blueberry II"] = {
		["NextFruit"] = "Evo Blueberry III",
		["UniqueReward"] = nil
	}
}
v7.SubmittableFruit = v8
v7.TierRewards = {
	{
		["Type"] = "Gear",
		["Value"] = "Pet Lead",
		["Quantity"] = 3
	},
	{
		["Type"] = "Gear",
		["Value"] = "Godly Sprinkler",
		["Quantity"] = 2
	},
	{
		["Type"] = "Gear",
		["Value"] = "Master Sprinkler",
		["Quantity"] = 1
	},
	{
		["Type"] = "Gear",
		["Value"] = "Pet Name Reroller",
		["Quantity"] = 3
	},
	{
		["Type"] = "Gear",
		["Value"] = "Silver Fertilizer",
		["Quantity"] = 3
	},
	{
		["Type"] = "Seed Pack",
		["Value"] = "Gardener Seed Pack",
		["Quantity"] = 1
	},
	{
		["Type"] = "Egg",
		["Value"] = "Rare Egg",
		["Quantity"] = 2
	},
	{
		["Type"] = "Egg",
		["Value"] = "Legendary Egg",
		["Quantity"] = 1
	}
}
v4[2] = v7
local v9 = {}
local v10 = {
	["Evo Pumpkin III"] = {
		["NextFruit"] = "Evo Pumpkin IV",
		["UniqueReward"] = nil
	},
	["Evo Mushroom III"] = {
		["NextFruit"] = "Evo Mushroom IV",
		["UniqueReward"] = nil
	},
	["Evo Beetroot III"] = {
		["NextFruit"] = "Evo Beetroot IV",
		["UniqueReward"] = nil
	},
	["Evo Blueberry III"] = {
		["NextFruit"] = "Evo Blueberry IV",
		["UniqueReward"] = nil
	}
}
v9.SubmittableFruit = v10
v9.TierRewards = {
	{
		["Type"] = "Seed Pack",
		["Value"] = "Gardener Seed Pack",
		["Quantity"] = 3
	},
	{
		["Type"] = "Gear",
		["Value"] = "Grandmaster Sprinkler",
		["Quantity"] = 1
	},
	{
		["Type"] = "Gear",
		["Value"] = "Levelup Lollipop",
		["Quantity"] = 1
	},
	{
		["Type"] = "Egg",
		["Value"] = "Mythical Egg",
		["Quantity"] = 2
	},
	{
		["Type"] = "Egg",
		["Value"] = "Bug Egg",
		["Quantity"] = 1
	},
	{
		["Type"] = "Egg",
		["Value"] = "Jungle Egg",
		["Quantity"] = 1
	},
	{
		["Type"] = "Seed Pack",
		["Value"] = "Exotic Gardener Seed Pack",
		["Quantity"] = 1
	}
}
v4[3] = v9
v2.Tiers = v4
return v2
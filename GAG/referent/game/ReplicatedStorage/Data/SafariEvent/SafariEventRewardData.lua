local v_u_1 = game:GetService("ReplicatedStorage")
require(v_u_1.Modules.GiveServiceCommon)
require(v_u_1.Data.SeedData)
local v2 = require(v_u_1.Modules.Signal)
local v_u_3 = {
	["EventShopUnlocks"] = {
		["Orange Delight"] = 250000,
		["Explorer\'s Compass"] = 2000000,
		["Safari Crate"] = 20000000,
		["Zebra Whistle"] = 50000000,
		["Safari Egg"] = 125000000,
		["Protea"] = 300000000,
		["Lush Sprinkler"] = 1000000000,
		["Mini Shipping Container"] = 4000000000,
		["Safari Totem Charm"] = 9000000000,
		["Baobab"] = 13000000000,
		["Pet Shard JUMBO"] = 55000000000,
		["Safari Seed Pack"] = 120000000000,
		["Savannah Crate"] = 125000000000,
		["Gecko"] = 130000000000,
		["Hyena"] = 165000000000,
		["Cape Buffalo"] = 195000000000,
		["Hippo"] = 212000000000,
		["Ancestral Horn"] = 216000000000,
		["Crocodile"] = 218000000000,
		["Safari Obelisk Charm"] = 222000000000,
		["Lion"] = 236000000000
	},
	["EventShopRestockCooldown"] = {
		[800000000] = 2700,
		[17000000000] = 1800,
		[25000000000] = 900,
		[240000000000] = 600
	},
	["WeatherUnlocks"] = {
		["SafariRain"] = 500000000,
		["SafariNight"] = 7000000000,
		["SafariDrought"] = 11000000000,
		["SafariOasis"] = 15000000000,
		["SafariStampede"] = 21000000000,
		["SafariTyphoon"] = 45000000000,
		["SafariDusk"] = 145000000000,
		["SafariStorm"] = 206000000000,
		["SafariHunt"] = 208000000000,
		["SafariTour"] = 232000000000
	},
	["EventShopChanceIncreases"] = {
		["Small"] = 35000000000,
		["Medium"] = 80000000000,
		["Large"] = 206000000000
	}
}
local v4 = {}
local v5 = {
	["Index"] = 65000000000,
	["Value"] = {
		["Type"] = "Gear",
		["Value"] = "Mega Lollipop",
		["Quantity"] = 1
	}
}
v4.RL_01 = v5
local v6 = {
	["Index"] = 100000000000,
	["Value"] = {
		["Type"] = "Fences",
		["Value"] = "SAFARIWOOD"
	}
}
v4.SafariWoodFence = v6
local v7 = {
	["Index"] = 222000000000,
	["Value"] = {
		["Type"] = "Egg",
		["Value"] = "Safari Egg",
		["Quantity"] = 10
	}
}
v4.SafariEgg_10 = v7
local v8 = {
	["Index"] = 202000000000,
	["Value"] = {
		["Type"] = "Gear",
		["Value"] = "Mega Lollipop",
		["Quantity"] = 1
	}
}
v4.RL_02 = v8
local v9 = {
	["Index"] = 238000000000,
	["Value"] = {
		["Type"] = "Egg",
		["Value"] = "Safari Egg",
		["Quantity"] = 20
	}
}
v4.SafariEgg_20 = v9
v_u_3.ItemRewards = v4
local v10 = {
	[95000000000] = {
		["HeaderText"] = "Travelling Merchant",
		["RewardText"] = "Safari Traveling Merchant Unlocked AFTER the event",
		["Image"] = "rbxassetid://131315439920630"
	}
}
v_u_3.DummyRewards = v10
v_u_3.SeedShopUnlocks = {
	["Zebrazinkle"] = 160000000000
}
function GetEventShopChanceTierByValue(p11)
	-- upvalues: (copy) v_u_3
	local v12 = nil
	for v13, v14 in v_u_3.EventShopChanceIncreases do
		if v14 <= p11 then
			v12 = v13
		end
	end
	return v12
end
local v15 = {}
local v16 = {
	[0] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 1,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 1,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Crate",
			["Type"] = "Crate",
			["Chance"] = 10,
			["Quantity"] = 1
		},
		{
			["Value"] = "Savannah Crate",
			["Type"] = "Crate",
			["Chance"] = 10,
			["Quantity"] = 1
		}
	},
	[20] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Crate",
			["Type"] = "Crate",
			["Chance"] = 8,
			["Quantity"] = 1
		},
		{
			["Value"] = "Savannah Crate",
			["Type"] = "Crate",
			["Chance"] = 8,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Oxpecker",
			["Type"] = "Gear",
			["Chance"] = 0.5,
			["Quantity"] = 1
		}
	},
	[40] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Crate",
			["Type"] = "Crate",
			["Chance"] = 4,
			["Quantity"] = 1
		},
		{
			["Value"] = "Savannah Crate",
			["Type"] = "Crate",
			["Chance"] = 4,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Oxpecker",
			["Type"] = "Gear",
			["Chance"] = 1,
			["Quantity"] = 1
		}
	},
	[60] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 10,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 10,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Crate",
			["Type"] = "Crate",
			["Chance"] = 1,
			["Quantity"] = 1
		},
		{
			["Value"] = "Savannah Crate",
			["Type"] = "Crate",
			["Chance"] = 1,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Oxpecker",
			["Type"] = "Gear",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Giraffe",
			["Type"] = "Gear",
			["Chance"] = 1,
			["Quantity"] = 1
		}
	},
	[80] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 20,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 20,
			["Quantity"] = 1
		},
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 10,
			["Quantity"] = 2
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 10,
			["Quantity"] = 2
		},
		{
			["Value"] = "Pet Shard Oxpecker",
			["Type"] = "Gear",
			["Chance"] = 4,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Giraffe",
			["Type"] = "Gear",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Rhino",
			["Type"] = "Gear",
			["Chance"] = 0.5,
			["Quantity"] = 1
		}
	},
	[100] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 20,
			["Quantity"] = 2
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 20,
			["Quantity"] = 2
		},
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 10,
			["Quantity"] = 3
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 10,
			["Quantity"] = 3
		},
		{
			["Value"] = "Pet Shard Giraffe",
			["Type"] = "Gear",
			["Chance"] = 4,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Rhino",
			["Type"] = "Gear",
			["Chance"] = 1,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Crocodile",
			["Type"] = "Gear",
			["Chance"] = 0.5,
			["Quantity"] = 1
		}
	},
	[120] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 30,
			["Quantity"] = 3
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 30,
			["Quantity"] = 3
		},
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 10,
			["Quantity"] = 4
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 10,
			["Quantity"] = 4
		},
		{
			["Value"] = "Pet Shard Giraffe",
			["Type"] = "Gear",
			["Chance"] = 8,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Rhino",
			["Type"] = "Gear",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Crocodile",
			["Type"] = "Gear",
			["Chance"] = 1,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Lion",
			["Type"] = "Gear",
			["Chance"] = 0.5,
			["Quantity"] = 1
		}
	},
	[140] = {
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 30,
			["Quantity"] = 3
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 30,
			["Quantity"] = 3
		},
		{
			["Value"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Chance"] = 15,
			["Quantity"] = 4
		},
		{
			["Value"] = "Safari Egg",
			["Type"] = "Egg",
			["Chance"] = 15,
			["Quantity"] = 4
		},
		{
			["Value"] = "Pet Shard Rhino",
			["Type"] = "Gear",
			["Chance"] = 4,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Crocodile",
			["Type"] = "Gear",
			["Chance"] = 2,
			["Quantity"] = 1
		},
		{
			["Value"] = "Pet Shard Lion",
			["Type"] = "Gear",
			["Chance"] = 1,
			["Quantity"] = 1
		}
	}
}
v15.Rewards = v16
function v15.GenerateReward(p17, p18)
	local v19 = 0
	local v20 = nil
	for v21, v22 in p18 do
		if v21 <= p17 and v19 <= v21 then
			v20 = v22
			v19 = v21
		end
	end
	if not v20 then
		warn("SafariEventRewardData:GenerateReward | Could not find valid reward data")
		return nil
	end
	local v23 = v20.TotalOdds
	if not v23 then
		v23 = 0
		for _, v24 in v20 do
			v23 = v23 + v24.Chance
		end
	end
	local v25 = Random.new():NextNumber(0, v23)
	local v26 = 0
	for _, v27 in v20 do
		v26 = v26 + v27.Chance
		if v25 <= v26 then
			return v27
		end
	end
	return nil
end
local v_u_34 = {
	["Rewards"] = {
		{
			["DisplayName"] = "Watering Can",
			["Type"] = "Gear",
			["Value"] = "Watering Can",
			["Quantity"] = 10,
			["Chance"] = 8
		},
		{
			["DisplayName"] = "Event Lantern",
			["Type"] = "Gear",
			["Value"] = "Event Lantern",
			["Quantity"] = 5,
			["Chance"] = 7
		},
		{
			["DisplayName"] = "Silver Fertilizer",
			["Type"] = "Gear",
			["Value"] = "Silver Fertilizer",
			["Quantity"] = 1,
			["Chance"] = 7.5
		},
		{
			["DisplayName"] = "Harvest Tool",
			["Type"] = "Gear",
			["Value"] = "Harvest Tool",
			["Quantity"] = 5,
			["Chance"] = 12
		},
		{
			["DisplayName"] = "Reclaimer",
			["Type"] = "Gear",
			["Value"] = "Reclaimer",
			["Quantity"] = 1,
			["Chance"] = 9
		},
		{
			["DisplayName"] = "Rare Summer Egg",
			["Type"] = "Egg",
			["Value"] = "Rare Summer Egg",
			["Quantity"] = 1,
			["Chance"] = 6.5
		},
		{
			["DisplayName"] = "Gold Fertilizer",
			["Type"] = "Gear",
			["Value"] = "Gold Fertilizer",
			["Quantity"] = 1,
			["Chance"] = 5
		},
		{
			["DisplayName"] = "Safari Crate",
			["Type"] = "Crate",
			["Value"] = "Safari Crate",
			["Quantity"] = 1,
			["Chance"] = 5.1
		},
		{
			["DisplayName"] = "Safari Egg",
			["Type"] = "Egg",
			["Value"] = "Safari Egg",
			["Quantity"] = 1,
			["Chance"] = 5
		},
		{
			["DisplayName"] = "Lush Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Lush Sprinkler",
			["Quantity"] = 1,
			["Chance"] = 5
		},
		{
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 1,
			["Chance"] = 3
		},
		{
			["DisplayName"] = "Bee Egg",
			["Type"] = "Egg",
			["Value"] = "Bee Egg",
			["Quantity"] = 1,
			["Chance"] = 2.5
		},
		{
			["DisplayName"] = "Grandmaster Sprinkler",
			["Type"] = "Gear",
			["Value"] = "Grandmaster Sprinkler",
			["Quantity"] = 1,
			["Chance"] = 2
		},
		{
			["DisplayName"] = "Rainbow Fertilizer",
			["Type"] = "Gear",
			["Value"] = "Rainbow Fertilizer",
			["Quantity"] = 1,
			["Chance"] = 1
		},
		{
			["DisplayName"] = "Safari Egg",
			["Type"] = "Egg",
			["Value"] = "Safari Egg",
			["Quantity"] = 3,
			["Chance"] = 1
		},
		{
			["DisplayName"] = "Levelup Lollipop",
			["Type"] = "Gear",
			["Value"] = "Levelup Lollipop",
			["Quantity"] = 3,
			["Chance"] = 1
		},
		{
			["DisplayName"] = "Paradise Egg",
			["Type"] = "Egg",
			["Value"] = "Paradise Egg",
			["Quantity"] = 1,
			["Chance"] = 1
		},
		{
			["DisplayName"] = "Energy Chew",
			["Type"] = "Gear",
			["Value"] = "Energy Chew",
			["Quantity"] = 1,
			["Chance"] = 0.5
		}
	},
	["Part2Rewards"] = {
		{
			["DisplayName"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Safari Seed Pack",
			["Quantity"] = 1,
			["Chance"] = 5
		},
		{
			["DisplayName"] = "Safari Seed Pack",
			["Type"] = "Seed Pack",
			["Value"] = "Safari Seed Pack",
			["Quantity"] = 3,
			["Chance"] = 1
		}
	},
	["PickRandom"] = function(p28)
		local v29 = 0
		for _, v30 in p28 do
			v29 = v29 + (v30.Chance or 1)
		end
		local v31 = Random.new():NextNumber() * v29
		local v32 = 0
		for _, v33 in p28 do
			v32 = v32 + (v33.Chance or 1)
			if v31 <= v32 then
				return v33
			end
		end
	end
}
local v35 = {}
local function v39(p36, p37)
	-- upvalues: (copy) v_u_3
	local v38 = v_u_3.EventShopUnlocks[p37]
	return not v38 and true or v38 <= p36
end
for v40, v41 in v_u_3.EventShopUnlocks do
	table.insert(v35, {
		["Type"] = "EventShopUnlock",
		["Key"] = v40,
		["Value"] = v40,
		["MilestoneValue"] = v41
	})
end
for v42, v43 in v_u_3.EventShopRestockCooldown do
	local v44 = {
		["Type"] = "EventShopCooldown",
		["Key"] = ("Cooldown_%*"):format(v43),
		["Value"] = v43,
		["MilestoneValue"] = v42
	}
	table.insert(v35, v44)
end
for v45, v46 in v_u_3.WeatherUnlocks do
	table.insert(v35, {
		["Type"] = "WeatherUnlock",
		["Key"] = v45,
		["Value"] = v45,
		["MilestoneValue"] = v46
	})
end
for v47, v48 in v_u_3.ItemRewards do
	local v49 = {
		["Type"] = "ItemReward",
		["Key"] = v47,
		["ID"] = v47,
		["Value"] = v48.Value,
		["MilestoneValue"] = v48.Index
	}
	table.insert(v35, v49)
end
for v50, v51 in v_u_3.EventShopChanceIncreases do
	local v52 = {
		["Type"] = "EventShopChance",
		["Key"] = ("EventShopChance_%*"):format(v50),
		["ID"] = v50,
		["Value"] = v50,
		["MilestoneValue"] = v51
	}
	table.insert(v35, v52)
end
for v53, v54 in v_u_3.DummyRewards do
	local v55 = {
		["Type"] = "DummyReward",
		["Key"] = ("Dummy_%*"):format(v53),
		["RewardText"] = v54.RewardText,
		["HeaderText"] = v54.HeaderText,
		["Image"] = v54.Image,
		["MilestoneValue"] = v53
	}
	table.insert(v35, v55)
end
for v56, v57 in v_u_3.SeedShopUnlocks do
	table.insert(v35, {
		["Type"] = "SeedShopUnlock",
		["Key"] = v56,
		["Value"] = v56,
		["MilestoneValue"] = v57
	})
end
table.sort(v35, function(p58, p59)
	return p58.MilestoneValue < p59.MilestoneValue
end)
local v_u_60 = v2.new()
task.spawn(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_34, (copy) v_u_60
	local v61 = require(v_u_1.Modules.UpdateService)
	if v61:IsHiddenFromUpdate("Safari Part 2") then
		v61.OnUpdated:Wait()
	end
	for _, v62 in v_u_34.Part2Rewards do
		local v63 = v_u_34.Rewards
		table.insert(v63, v62)
	end
	v_u_60:Fire()
end)
return {
	["IndividualRewardsChanged"] = v_u_60,
	["AllMilestonesData"] = v35,
	["MilestoneUnlockData"] = v_u_3,
	["IsUnlockedInEventShop"] = v39,
	["SafariIndividualRewardData"] = v_u_34,
	["SafariJoeRewards"] = v15
}
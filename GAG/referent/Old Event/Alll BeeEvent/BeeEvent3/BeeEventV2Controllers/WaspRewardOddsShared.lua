local v_u_1 = {}
local v_u_2 = {
	["Wasp"] = 1,
	["Razorsting Wasp"] = 2,
	["Acidwing Wasp"] = 3,
	["Dreadhorn Wasp"] = 4,
	["Wasp King"] = 6
}
local v_u_3 = {
	{
		["reward"] = nil,
		["tier"] = 0,
		["weight"] = 145,
		["min"] = 15,
		["max"] = 45,
		["reward"] = {
			["Type"] = "Currency",
			["Value"] = "HoneyCoins"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 1,
		["weight"] = 28,
		["min"] = 3,
		["max"] = 8,
		["reward"] = {
			["Type"] = "Currency",
			["Value"] = "RoyalJelly"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 1,
		["weight"] = 28,
		["min"] = 1,
		["max"] = 2,
		["reward"] = {
			["Type"] = "Seed",
			["Value"] = "Stinger Reed"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 2,
		["weight"] = 12,
		["min"] = 1,
		["max"] = 1,
		["reward"] = {
			["Type"] = "Gear",
			["Value"] = "Common Bee Egg"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 2,
		["weight"] = 10,
		["min"] = 1,
		["max"] = 1,
		["reward"] = {
			["Type"] = "Seed Pack",
			["Value"] = "Honey Hive Seed Pack"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 2,
		["weight"] = 7,
		["min"] = 1,
		["max"] = 1,
		["reward"] = {
			["Type"] = "Seed",
			["Value"] = "Spiketail"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 3,
		["weight"] = 3,
		["min"] = 1,
		["max"] = 1,
		["minPower"] = 2,
		["reward"] = {
			["Type"] = "Gear",
			["Value"] = "Rare Bee Egg"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 4,
		["weight"] = 1,
		["min"] = 1,
		["max"] = 1,
		["minPower"] = 3,
		["reward"] = {
			["Type"] = "Gear",
			["Value"] = "Mythical Bee Egg"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 5,
		["weight"] = 0.35,
		["min"] = 1,
		["max"] = 1,
		["minPower"] = 4,
		["reward"] = {
			["Type"] = "Gear",
			["Value"] = "Transcendent Bee Egg"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 5,
		["weight"] = 0.25,
		["min"] = 1,
		["max"] = 1,
		["minPower"] = 5,
		["reward"] = {
			["Type"] = "Seed",
			["Value"] = "Royal Rose"
		}
	},
	{
		["reward"] = nil,
		["tier"] = 5,
		["weight"] = 0.08,
		["min"] = 1,
		["max"] = 1,
		["minPower"] = 5,
		["reward"] = {
			["Type"] = "Pet",
			["Value"] = "Prince Wasp"
		}
	}
}
function v_u_1.GetPower(p4) -- name: GetPower
	-- upvalues: (copy) v_u_2
	return v_u_2[p4] or 1
end
function v_u_1.GetBonusRollCount(p5) -- name: GetBonusRollCount
	-- upvalues: (copy) v_u_1
	local v6 = v_u_1.GetPower(p5) / 2
	return math.floor(v6) + 1
end
function v_u_1.GetGuaranteedCoins(p7) -- name: GetGuaranteedCoins
	-- upvalues: (copy) v_u_1
	local v8 = 35 * v_u_1.GetPower(p7)
	return math.round(v8)
end
function v_u_1.GetQuantityScale(p9) -- name: GetQuantityScale
	-- upvalues: (copy) v_u_1
	return 1 + 0.25 * (v_u_1.GetPower(p9) - 1)
end
function v_u_1.GetLuck(p10, p11) -- name: GetLuck
	-- upvalues: (copy) v_u_1
	return 1 + 0.2 * (v_u_1.GetPower(p10) - 1) + (p11 or 0)
end
function v_u_1.GetWeightedEntries(p12, p13) -- name: GetWeightedEntries
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	local v14 = v_u_1.GetPower(p12)
	local v15 = v_u_1.GetLuck(p12, p13)
	local v16 = 0
	local v17 = {}
	for _, v18 in v_u_3 do
		if not v18.minPower or v14 >= v18.minPower then
			local v19 = v18.weight * (1 + (v15 - 1) * v18.tier)
			if v19 > 0 then
				v16 = v16 + v19
				table.insert(v17, {
					["Entry"] = v18,
					["Weight"] = v19
				})
			end
		end
	end
	return v17, v16
end
function v_u_1.GetOdds(p20, p21) -- name: GetOdds
	-- upvalues: (copy) v_u_1
	local v22, v23 = v_u_1.GetWeightedEntries(p20, p21)
	local v24 = v_u_1.GetBonusRollCount(p20)
	local v25 = {}
	if v23 <= 0 then
		return v25
	end
	for _, v26 in v22 do
		local v27 = v26.Entry
		local v28 = v26.Weight / v23
		local v29 = 1 - (1 - v28) ^ v24
		local v30 = {
			["Type"] = v27.reward.Type,
			["Value"] = v27.reward.Value,
			["Tier"] = v27.tier,
			["Min"] = v27.min,
			["Max"] = v27.max,
			["PerRollChance"] = v28,
			["PerCrateChance"] = v29,
			["EffectiveWeight"] = v26.Weight
		}
		table.insert(v25, v30)
	end
	table.sort(v25, function(p31, p32)
		if p31.Tier == p32.Tier then
			return p31.PerCrateChance > p32.PerCrateChance
		else
			return p31.Tier < p32.Tier
		end
	end)
	return v25
end
local v_u_33 = {
	[0] = 1,
	[1] = 1,
	[2] = 2,
	[3] = 3,
	[4] = 4,
	[5] = 4
}
function v_u_1.GetRewardTier(p34, p35) -- name: GetRewardTier
	-- upvalues: (copy) v_u_3
	for _, v36 in v_u_3 do
		if v36.reward.Type == p34 and v36.reward.Value == p35 then
			return v36.tier
		end
	end
	return 0
end
function v_u_1.GetChestTier(p37) -- name: GetChestTier
	-- upvalues: (copy) v_u_1, (copy) v_u_33
	local v38 = 0
	for _, v39 in p37 do
		local v40 = v_u_1.GetRewardTier(v39.Type, v39.Value)
		if v38 < v40 then
			v38 = v40
		end
	end
	return v_u_33[v38] or 1
end
return v_u_1
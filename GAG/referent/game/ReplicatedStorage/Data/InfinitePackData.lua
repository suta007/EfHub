local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.ABTests)
local v_u_3 = require(v1.UserGenerated.Collections.DropTable)
local v_u_4 = require(v1.UserGenerated.FastFlags)
local v5 = require(v1.UserGenerated.Lang.Asserts)
local v_u_6 = require(v1.UserGenerated.Randoms.ISAAC)
require(script.InfinitePackTypes)
local v_u_7 = require(script.InfinitePackProductIds)
local v_u_8 = {
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
local v9 = {
	["Free"] = {},
	["Paid"] = {}
}
local v_u_10 = {
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
local v_u_11 = {
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
for _, v12 in ipairs(v_u_8) do
	local v13 = v9.Paid
	table.insert(v13, v12)
end
for _, v14 in ipairs(v_u_10) do
	local v15 = v9.Paid
	table.insert(v15, v14)
end
for _, v16 in ipairs(v_u_11) do
	local v17 = v9.Paid
	table.insert(v17, v16)
end
local v_u_18 = v_u_4.Replicated("ForeverPack.BaseAmount", v5.FiniteNonNegative, 1)
local v_u_19 = v_u_4.Replicated("ForeverPack.BaseLuck", v5.FiniteNonNegative, 1)
local v_u_20 = v_u_4.Replicated("ForeverPack.LuckPerPremiumTier", v5.FiniteNonNegative, 1)
local v_u_21 = v_u_4.Replicated("ForeverPack.InitialFreeSlotsRange", v5.Table({ v5.IntegerNonNegative, v5.IntegerNonNegative }), { 1, 1 })
local v_u_22 = v_u_4.Replicated("ForeverPack.PremiumFreeSlotsRange", v5.Table({ v5.IntegerNonNegative, v5.IntegerNonNegative }), { 2, 4 })
local v_u_23 = v_u_4.Replicated("ForeverPack.ItemsRange", v5.Table({ v5.FiniteNonNegative, v5.FiniteNonNegative }), { 1, 2 })
local v_u_24 = v_u_4.Replicated("ForeverPack.PremiumItemsRange", v5.Table({ v5.FiniteNonNegative, v5.FiniteNonNegative }), { 2, 3 })
local v_u_25 = v_u_4.Replicated("ForeverPack.PremiumReset", v5.Boolean, true)
local v_u_26 = v_u_4.Replicated("ForeverPack.PremiumAmountMultRange", v5.Table({ v5.FiniteNonNegative, v5.FiniteNonNegative }), { 3, 6 })
local v_u_27 = v_u_4.Replicated("ForeverPack.PremiumLuckMult", v5.FiniteNonNegative, 3)
local v_u_28 = v_u_4.Replicated("ForeverPack.Enabled", v5.Boolean, true)
local v_u_29 = v_u_4.Replicated("ForeverPack.DropsWeightLow", v5.FiniteNonNegative, 95)
local v_u_30 = v_u_4.Replicated("ForeverPack.DropsWeightMedium", v5.FiniteNonNegative, 4.99)
local v_u_31 = v_u_4.Replicated("ForeverPack.DropsWeightHigh", v5.FiniteNonNegative, 0.01)
local function v_u_41(p32, p33, p34, p35)
	local v36 = p32:Pick(1 - (1 - p33:NextDouble()) ^ (1 / p34))
	local v37 = table.clone(v36)
	local v38 = v37.Amount * p35
	local v39 = math.floor(v38)
	if v38 - v39 > p33:NextDouble() then
		v39 = v39 + 1
	end
	local v40 = v37.MaxAmount or (1 / 0)
	v37.Amount = math.clamp(v39, 1, v40)
	return v37
end
local v72 = {
	["Rewards"] = v9,
	["GetRewardsAsync"] = function(p42, p43, p44)
		-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_28, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_24, (copy) v_u_25, (copy) v_u_26, (copy) v_u_27, (copy) v_u_18, (copy) v_u_19, (copy) v_u_20, (copy) v_u_29, (copy) v_u_30, (copy) v_u_31, (copy) v_u_6, (copy) v_u_8, (copy) v_u_10, (copy) v_u_11, (copy) v_u_3, (copy) v_u_7, (copy) v_u_41
		if not v_u_4.IsLoaded() then
			v_u_4.Loaded:Wait()
		end
		if not v_u_2.IsLoaded() then
			v_u_2.Loaded:Wait()
		end
		if not v_u_28:Get() then
			return {}
		end
		local v45 = {
			["InitialFreeSlotsRange"] = v_u_2.GetAttribute(p42, "ForeverPack.InitialFreeSlotsRange", v_u_21:Get()),
			["PremiumFreeSlotsRange"] = v_u_2.GetAttribute(p42, "ForeverPack.PremiumFreeSlotsRange", v_u_22:Get()),
			["ItemsRange"] = v_u_2.GetAttribute(p42, "ForeverPack.ItemsRange", v_u_23:Get()),
			["PremiumItemsRange"] = v_u_2.GetAttribute(p42, "ForeverPack.PremiumItemsRange", v_u_24:Get()),
			["PremiumReset"] = v_u_2.GetAttribute(p42, "ForeverPack.PremiumReset", v_u_25:Get()),
			["PremiumAmountMultRange"] = v_u_2.GetAttribute(p42, "ForeverPack.PremiumAmountMultRange", v_u_26:Get()),
			["PremiumLuckMult"] = v_u_2.GetAttribute(p42, "ForeverPack.PremiumLuckMult", v_u_27:Get()),
			["BaseAmount"] = v_u_2.GetAttribute(p42, "ForeverPack.BaseAmount", v_u_18:Get()),
			["BaseLuck"] = v_u_2.GetAttribute(p42, "ForeverPack.BaseLuck", v_u_19:Get()),
			["LuckPerPremiumTier"] = v_u_2.GetAttribute(p42, "ForeverPack.LuckPerPremiumTier", v_u_20:Get()),
			["DropsWeightLow"] = v_u_2.GetAttribute(p42, "ForeverPack.DropsWeightLow", v_u_29:Get()),
			["DropsWeightMedium"] = v_u_2.GetAttribute(p42, "ForeverPack.DropsWeightMedium", v_u_30:Get()),
			["DropsWeightHigh"] = v_u_2.GetAttribute(p42, "ForeverPack.DropsWeightHigh", v_u_31:Get())
		}
		local v46 = v_u_6.new({ p42.UserId, p43 })
		local v_u_47 = {}
		local function v55(p48, p49)
			-- upvalues: (copy) v_u_47
			local v50 = 0
			for _, v51 in ipairs(p48) do
				v50 = v50 + v51.Chance
			end
			if v50 ~= 0 then
				for _, v52 in ipairs(p48) do
					local v53 = v_u_47
					local v54 = {
						["Weight"] = v52.Chance * p49 / v50,
						["Value"] = v52
					}
					table.insert(v53, v54)
				end
			end
		end
		v55(v_u_8, v45.DropsWeightLow)
		v55(v_u_10, v45.DropsWeightMedium)
		v55(v_u_11, v45.DropsWeightHigh)
		local v56 = v_u_3.new(v_u_47)
		local v57 = v45.InitialFreeSlotsRange
		local v58 = v46:NextInteger(v57[1], v57[2])
		local v59 = 0
		local v60 = 0
		local v61 = {}
		for v62 = 1, p44 do
			local v63 = nil
			if v58 <= v59 then
				if v60 < #v_u_7 or v45.PremiumReset then
					v60 = v60 + 1
				end
				v59 = 0
				if v60 <= #v_u_7 then
					v63 = v_u_7[v60][1]
					local v64 = v45.PremiumFreeSlotsRange
					v58 = v46:NextInteger(v64[1], v64[2])
				else
					local v65 = v45.InitialFreeSlotsRange
					v58 = v46:NextInteger(v65[1], v65[2])
					v60 = 0
				end
			end
			if not v63 then
				v59 = v59 + 1
			end
			local v66 = v45.ItemsRange
			local v67 = v45.BaseAmount
			local v68 = v45.BaseLuck + v60 * v45.LuckPerPremiumTier
			if v63 then
				v66 = v45.PremiumItemsRange
				local v69 = v45.PremiumAmountMultRange
				v67 = v67 * v46:NextInteger(v69[1], v69[2])
				v68 = v68 * v45.PremiumLuckMult
			end
			v46:NextInteger(v66[1], v66[2])
			local v70 = {}
			for _ = 1, 1 do
				local v71 = v_u_41(v56, v46, v68, v67)
				table.insert(v70, v71)
			end
			v61[v62] = {
				["Rewards"] = v70,
				["ProductId"] = v63
			}
		end
		return v61
	end,
	["FallbackPrices"] = {
		[3483219975] = 39,
		[3483220099] = 79,
		[3483220200] = 119,
		[3483220270] = 159,
		[3483220356] = 199,
		[3483220437] = 279,
		[3483221023] = 399,
		[3483221092] = 639,
		[3483221165] = 759,
		[3483221217] = 959,
		[3483221290] = 1199
	}
}
return v72
local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.UserGenerated.ABTests)
local v_u_3 = require(v1.UserGenerated.Collections.DropTable)
local v_u_4 = require(v1.UserGenerated.FastFlags)
local v5 = require(v1.UserGenerated.Lang.Asserts)
local v_u_6 = require(v1.UserGenerated.Randoms.ISAAC)
require(script.InfinitePackTypes)
local v_u_7 = require(script.InfinitePackProductIds)
local v_u_8 = game:GetService("ConfigService")
local v_u_9 = {
	{
		["Name"] = "Watering Can",
		["RewardName"] = "Watering Can",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 100
	},
	{
		["Name"] = "Basic Sprinkler",
		["RewardName"] = "Basic Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 50
	}
}
local v_u_10 = {
	{
		["Name"] = "Super Watering Can",
		["RewardName"] = "Super Watering Can",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 40
	},
	{
		["Name"] = "Advanced Sprinkler",
		["RewardName"] = "Advanced Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 60
	}
}
local v_u_11 = {
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
	}
}
local v12 = 90
local v13 = 9
local v14 = 1
local v15, v_u_16 = pcall(function()
	-- upvalues: (copy) v_u_8
	return v_u_8:GetConfigAsync()
end)
local v17 = script:FindFirstChild("UseCreatorHubConfig")
if v15 and (v_u_16 and v17) then
	local v18, v19 = pcall(function()
		-- upvalues: (copy) v_u_16
		return v_u_16:GetValue("Wateringcan_Rewards")
	end)
	if v18 and (v19 and v17.Value == true) then
		print("(Watering Can) Using configuration rewards")
		v_u_9 = v19.lowValueItems
		v_u_10 = v19.mediumValueItems
		v_u_11 = v19.highValueItems
		v12 = v19.WeightLow
		v13 = v19.WeightMedium
		v14 = v19.WeightHigh
	else
		print("(Watering Can) Using default rewards")
	end
end
local v20 = {
	["Free"] = {},
	["Paid"] = {}
}
for _, v21 in ipairs(v_u_9) do
	local v22 = v20.Paid
	table.insert(v22, v21)
end
for _, v23 in ipairs(v_u_10) do
	local v24 = v20.Paid
	table.insert(v24, v23)
end
for _, v25 in ipairs(v_u_11) do
	local v26 = v20.Paid
	table.insert(v26, v25)
end
local v_u_27 = v_u_4.Replicated("WateringCanAdRewards.BaseAmount", v5.FiniteNonNegative, 1)
local v_u_28 = v_u_4.Replicated("WateringCanAdRewards.BaseLuck", v5.FiniteNonNegative, 1)
local v_u_29 = v_u_4.Replicated("WateringCanAdRewards.LuckPerPremiumTier", v5.FiniteNonNegative, 1)
local v_u_30 = v_u_4.Replicated("WateringCanAdRewards.InitialFreeSlotsRange", v5.Table({ v5.IntegerNonNegative, v5.IntegerNonNegative }), { 1, 1 })
local v_u_31 = v_u_4.Replicated("WateringCanAdRewards.PremiumFreeSlotsRange", v5.Table({ v5.IntegerNonNegative, v5.IntegerNonNegative }), { 2, 4 })
local v_u_32 = v_u_4.Replicated("WateringCanAdRewards.ItemsRange", v5.Table({ v5.FiniteNonNegative, v5.FiniteNonNegative }), { 1, 2 })
local v_u_33 = v_u_4.Replicated("WateringCanAdRewards.PremiumItemsRange", v5.Table({ v5.FiniteNonNegative, v5.FiniteNonNegative }), { 2, 3 })
local v_u_34 = v_u_4.Replicated("WateringCanAdRewards.PremiumReset", v5.Boolean, true)
local v_u_35 = v_u_4.Replicated("WateringCanAdRewards.PremiumAmountMultRange", v5.Table({ v5.FiniteNonNegative, v5.FiniteNonNegative }), { 3, 6 })
local v_u_36 = v_u_4.Replicated("WateringCanAdRewards.PremiumLuckMult", v5.FiniteNonNegative, 3)
local v_u_37 = v_u_4.Replicated("WateringCanAdRewards.Enabled", v5.Boolean, true)
local v_u_38 = v_u_4.Replicated("WateringCanAdRewards.DropsWeightLow", v5.FiniteNonNegative, v12)
local v_u_39 = v_u_4.Replicated("WateringCanAdRewards.DropsWeightMedium", v5.FiniteNonNegative, v13)
local v_u_40 = v_u_4.Replicated("WateringCanAdRewards.DropsWeightHigh", v5.FiniteNonNegative, v14)
local function v_u_47(p41)
	-- upvalues: (copy) v_u_3
	local v42 = 0
	local v43 = {}
	for _, v44 in ipairs(p41) do
		v42 = v42 + v44.Chance
	end
	if v42 == 0 then
		return nil
	end
	for _, v45 in ipairs(p41) do
		local v46 = {
			["Weight"] = v45.Chance,
			["Value"] = v45
		}
		table.insert(v43, v46)
	end
	return v_u_3.new(v43)
end
local v87 = {
	["Rewards"] = v20,
	["GetRewardsAsync"] = function(p48, p49, p50)
		-- upvalues: (copy) v_u_4, (copy) v_u_2, (copy) v_u_37, (copy) v_u_30, (copy) v_u_31, (copy) v_u_32, (copy) v_u_33, (copy) v_u_34, (copy) v_u_35, (copy) v_u_36, (copy) v_u_27, (copy) v_u_28, (copy) v_u_29, (copy) v_u_38, (copy) v_u_39, (copy) v_u_40, (copy) v_u_6, (copy) v_u_47, (ref) v_u_9, (ref) v_u_10, (ref) v_u_11, (copy) v_u_7
		if not v_u_4.IsLoaded() then
			v_u_4.Loaded:Wait()
		end
		if not v_u_2.IsLoaded() then
			v_u_2.Loaded:Wait()
		end
		if not v_u_37:Get() then
			return {}
		end
		local v_u_51 = {
			["InitialFreeSlotsRange"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.InitialFreeSlotsRange", v_u_30:Get()),
			["PremiumFreeSlotsRange"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.PremiumFreeSlotsRange", v_u_31:Get()),
			["ItemsRange"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.ItemsRange", v_u_32:Get()),
			["PremiumItemsRange"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.PremiumItemsRange", v_u_33:Get()),
			["PremiumReset"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.PremiumReset", v_u_34:Get()),
			["PremiumAmountMultRange"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.PremiumAmountMultRange", v_u_35:Get()),
			["PremiumLuckMult"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.PremiumLuckMult", v_u_36:Get()),
			["BaseAmount"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.BaseAmount", v_u_27:Get()),
			["BaseLuck"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.BaseLuck", v_u_28:Get()),
			["LuckPerPremiumTier"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.LuckPerPremiumTier", v_u_29:Get()),
			["DropsWeightLow"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.DropsWeightLow", v_u_38:Get()),
			["DropsWeightMedium"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.DropsWeightMedium", v_u_39:Get()),
			["DropsWeightHigh"] = v_u_2.GetAttribute(p48, "WateringCanAdRewards.DropsWeightHigh", v_u_40:Get())
		}
		local v_u_52 = v_u_6.new({ p48.UserId, p49 })
		local v_u_53 = v_u_47(v_u_9)
		local v_u_54 = v_u_47(v_u_10)
		local v_u_55 = v_u_47(v_u_11)
		local v56 = v_u_51.InitialFreeSlotsRange
		local v57 = v_u_52:NextInteger(v56[1], v56[2])
		local v58 = 0
		local v59 = 0
		local function v75(p60)
			-- upvalues: (copy) v_u_53, (copy) v_u_52, (copy) v_u_51, (copy) v_u_54, (copy) v_u_55
			if p60 == 1 then
				return v_u_53
			elseif p60 == 2 then
				local v61 = v_u_52
				local v62 = v_u_53
				local v63 = v_u_51.DropsWeightLow
				local v64 = v_u_54
				local v65 = v_u_51.DropsWeightMedium
				local v66 = 0
				if v62 and v63 > 0 then
					v66 = v66 + v63
				end
				if v64 and v65 > 0 then
					v66 = v66 + v65
				end
				if v66 <= 0 then
					return v62 or v64
				else
					local v67 = v61:NextDouble() * v66
					if v62 and (v63 > 0 and v67 < v63) then
						return v62
					else
						return v64
					end
				end
			elseif p60 == 3 then
				return v_u_54
			elseif p60 == 4 then
				local v68 = v_u_52
				local v69 = v_u_54
				local v70 = v_u_51.DropsWeightMedium
				local v71 = v_u_55
				local v72 = v_u_51.DropsWeightHigh
				local v73 = 0
				if v69 and v70 > 0 then
					v73 = v73 + v70
				end
				if v71 and v72 > 0 then
					v73 = v73 + v72
				end
				if v73 <= 0 then
					return v69 or v71
				else
					local v74 = v68:NextDouble() * v73
					if v69 and (v70 > 0 and v74 < v70) then
						return v69
					else
						return v71
					end
				end
			elseif p60 == 5 then
				return v_u_53
			else
				return v_u_53 or (v_u_54 or v_u_55)
			end
		end
		local v76 = {}
		for v77 = 1, math.min(p50, 5) do
			local v78 = nil
			if v57 <= v58 then
				if v59 < #v_u_7 or v_u_51.PremiumReset then
					v59 = v59 + 1
				end
				v58 = 0
				if v59 <= #v_u_7 then
					v78 = v_u_7[v59][1]
					local v79 = v_u_51.PremiumFreeSlotsRange
					v57 = v_u_52:NextInteger(v79[1], v79[2])
				else
					local v80 = v_u_51.InitialFreeSlotsRange
					v57 = v_u_52:NextInteger(v80[1], v80[2])
					v59 = 0
				end
			end
			if not v78 then
				v58 = v58 + 1
			end
			local v81 = v_u_51.ItemsRange
			local v82 = v_u_51.BaseLuck + v59 * v_u_51.LuckPerPremiumTier
			if v78 then
				v81 = v_u_51.PremiumItemsRange
				v82 = v82 * v_u_51.PremiumLuckMult
			end
			v_u_52:NextInteger(v81[1], v81[2])
			local v83 = v75(v77) or (v_u_53 or (v_u_54 or v_u_55))
			local v84 = {}
			for _ = 1, 1 do
				local v85 = v83:Pick(1 - (1 - v_u_52:NextDouble()) ^ (1 / v82))
				local v86 = table.clone(v85)
				table.insert(v84, v86)
			end
			v76[v77] = {
				["Rewards"] = v84,
				["ProductId"] = v78
			}
		end
		return v76
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
return v87
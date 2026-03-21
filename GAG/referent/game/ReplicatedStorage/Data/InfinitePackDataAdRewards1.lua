local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("ConfigService")
local v3 = game:GetService("RunService")
local v_u_4 = game:GetService("HttpService")
local v_u_5 = require(v1.UserGenerated.ABTests)
local v_u_6 = require(v1.UserGenerated.Collections.DropTable)
local v_u_7 = require(v1.UserGenerated.FastFlags)
local v8 = require(v1.UserGenerated.Lang.Asserts)
local v_u_9 = require(v1.UserGenerated.Randoms.ISAAC)
require(script.InfinitePackTypes)
local v_u_10 = require(script.InfinitePackProductIds)
local v_u_11 = {
	{
		["Name"] = "Magnifying Glass",
		["RewardName"] = "Magnifying Glass",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 30
	}
}
local v_u_12 = {
	{
		["Name"] = "Spice Spritzer Sprinkler",
		["RewardName"] = "Spice Spritzer Sprinkler",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	}
}
local v_u_13 = {
	{
		["Name"] = "Rainbow Fertilizer",
		["RewardName"] = "Rainbow Fertilizer",
		["Type"] = "Gear",
		["Amount"] = 1,
		["Chance"] = 10
	}
}
local v_u_14 = 90
local v_u_15 = 9
local v_u_16 = 1
local function v24(p17)
	-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16
	if type(p17) == "table" then
		local v18 = p17.lowValueItems
		if type(v18) == "table" then
			v_u_11 = p17.lowValueItems
		end
		local v19 = p17.mediumValueItems
		if type(v19) == "table" then
			v_u_12 = p17.mediumValueItems
		end
		local v20 = p17.highValueItems
		if type(v20) == "table" then
			v_u_13 = p17.highValueItems
		end
		local v21 = p17.WeightLow
		if type(v21) == "number" then
			v_u_14 = p17.WeightLow
		end
		local v22 = p17.WeightMedium
		if type(v22) == "number" then
			v_u_15 = p17.WeightMedium
		end
		local v23 = p17.WeightHigh
		if type(v23) == "number" then
			v_u_16 = p17.WeightHigh
		end
	end
end
local function v37()
	-- upvalues: (ref) v_u_11, (ref) v_u_12, (ref) v_u_13, (ref) v_u_14, (ref) v_u_15, (ref) v_u_16, (copy) v_u_2
	local v25 = {
		["lowValueItems"] = v_u_11,
		["mediumValueItems"] = v_u_12,
		["highValueItems"] = v_u_13,
		["WeightLow"] = v_u_14,
		["WeightMedium"] = v_u_15,
		["WeightHigh"] = v_u_16
	}
	local v26 = script:FindFirstChild("UseCreatorHubConfig")
	local v27, v_u_28 = pcall(function()
		-- upvalues: (ref) v_u_2
		return v_u_2:GetConfigAsync()
	end)
	if v27 and (v_u_28 and (v26 and v26.Value == true)) then
		local v29, v30 = pcall(function()
			-- upvalues: (copy) v_u_28
			return v_u_28:GetValue("DailyDeals_Rewards")
		end)
		if not v29 or type(v30) ~= "table" then
			print("(Daily Deals) Using default rewards (config missing/invalid)")
			return v25
		end
		print("(Daily Deals) Using configuration rewards")
		local v31 = v30.lowValueItems
		if type(v31) == "table" then
			v25.lowValueItems = v30.lowValueItems
		end
		local v32 = v30.mediumValueItems
		if type(v32) == "table" then
			v25.mediumValueItems = v30.mediumValueItems
		end
		local v33 = v30.highValueItems
		if type(v33) == "table" then
			v25.highValueItems = v30.highValueItems
		end
		local v34 = v30.WeightLow
		if type(v34) == "number" then
			v25.WeightLow = v30.WeightLow
		end
		local v35 = v30.WeightMedium
		if type(v35) == "number" then
			v25.WeightMedium = v30.WeightMedium
		end
		local v36 = v30.WeightHigh
		if type(v36) == "number" then
			v25.WeightHigh = v30.WeightHigh
			return v25
		end
	end
	return v25
end
if v3:IsServer() then
	local v38 = v37()
	v24(v38)
	local v39 = script:FindFirstChild("DailyDealsConfigJson")
	if not v39 then
		v39 = Instance.new("StringValue")
		v39.Name = "DailyDealsConfigJson"
		v39.Parent = script
	end
	v39.Value = v_u_4:JSONEncode(v38)
else
	local v_u_40 = script:WaitForChild("DailyDealsConfigJson")
	local v41, v42 = pcall(function()
		-- upvalues: (copy) v_u_4, (copy) v_u_40
		return v_u_4:JSONDecode(v_u_40.Value)
	end)
	if v41 and type(v42) == "table" then
		v24(v42)
	end
end
local v_u_43 = v_u_11
local v44 = v_u_16
local v45 = v_u_15
local v46 = v_u_14
local v_u_47 = v_u_13
local v_u_48 = v_u_12
local v49 = {
	["Free"] = {},
	["Paid"] = {}
}
for _, v50 in ipairs(v_u_11) do
	local v51 = v49.Paid
	table.insert(v51, v50)
end
for _, v52 in ipairs(v_u_48) do
	local v53 = v49.Paid
	table.insert(v53, v52)
end
for _, v54 in ipairs(v_u_47) do
	print("High Value Items: ", v_u_47, v54)
	local v55 = v49.Paid
	table.insert(v55, v54)
end
local v_u_56 = v_u_7.Replicated("ForeverPackAdRewards.BaseAmount", v8.FiniteNonNegative, 1)
local v_u_57 = v_u_7.Replicated("ForeverPackAdRewards.BaseLuck", v8.FiniteNonNegative, 1)
local v_u_58 = v_u_7.Replicated("ForeverPackAdRewards.LuckPerPremiumTier", v8.FiniteNonNegative, 1)
local v_u_59 = v_u_7.Replicated("ForeverPackAdRewards.InitialFreeSlotsRange", v8.Table({ v8.IntegerNonNegative, v8.IntegerNonNegative }), { 1, 1 })
local v_u_60 = v_u_7.Replicated("ForeverPackAdRewards.PremiumFreeSlotsRange", v8.Table({ v8.IntegerNonNegative, v8.IntegerNonNegative }), { 2, 4 })
local v_u_61 = v_u_7.Replicated("ForeverPackAdRewards.ItemsRange", v8.Table({ v8.FiniteNonNegative, v8.FiniteNonNegative }), { 1, 2 })
local v_u_62 = v_u_7.Replicated("ForeverPackAdRewards.PremiumItemsRange", v8.Table({ v8.FiniteNonNegative, v8.FiniteNonNegative }), { 2, 3 })
local v_u_63 = v_u_7.Replicated("ForeverPackAdRewards.PremiumReset", v8.Boolean, true)
local v_u_64 = v_u_7.Replicated("ForeverPackAdRewards.PremiumAmountMultRange", v8.Table({ v8.FiniteNonNegative, v8.FiniteNonNegative }), { 3, 6 })
local v_u_65 = v_u_7.Replicated("ForeverPackAdRewards.PremiumLuckMult", v8.FiniteNonNegative, 3)
local v_u_66 = v_u_7.Replicated("ForeverPackAdRewards.Enabled", v8.Boolean, true)
local v_u_67 = v_u_7.Replicated("ForeverPackAdRewards.DropsWeightLow", v8.FiniteNonNegative, v46)
local v_u_68 = v_u_7.Replicated("ForeverPackAdRewards.DropsWeightMedium", v8.FiniteNonNegative, v45)
local v_u_69 = v_u_7.Replicated("ForeverPackAdRewards.DropsWeightHigh", v8.FiniteNonNegative, v44)
local function v_u_78(p70, p71, p72, _)
	local v73 = p70:Pick(1 - (1 - p71:NextDouble()) ^ (1 / p72))
	local v74 = table.clone(v73)
	local v75 = v74.Amount
	local v76 = math.floor(v75)
	if v75 - v76 > p71:NextDouble() then
		v76 = v76 + 1
	end
	local v77 = v74.MaxAmount or (1 / 0)
	math.clamp(v76, 1, v77)
	v74.Amount = v75
	return v74
end
local v109 = {
	["Rewards"] = v49,
	["GetRewardsAsync"] = function(p79, p80, p81)
		-- upvalues: (copy) v_u_7, (copy) v_u_5, (copy) v_u_66, (copy) v_u_59, (copy) v_u_60, (copy) v_u_61, (copy) v_u_62, (copy) v_u_63, (copy) v_u_64, (copy) v_u_65, (copy) v_u_56, (copy) v_u_57, (copy) v_u_58, (copy) v_u_67, (copy) v_u_68, (copy) v_u_69, (copy) v_u_9, (ref) v_u_43, (ref) v_u_48, (ref) v_u_47, (copy) v_u_6, (copy) v_u_10, (copy) v_u_78
		if not v_u_7.IsLoaded() then
			v_u_7.Loaded:Wait()
		end
		if not v_u_5.IsLoaded() then
			v_u_5.Loaded:Wait()
		end
		if not v_u_66:Get() then
			return {}
		end
		local v82 = {
			["InitialFreeSlotsRange"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.InitialFreeSlotsRange", v_u_59:Get()),
			["PremiumFreeSlotsRange"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.PremiumFreeSlotsRange", v_u_60:Get()),
			["ItemsRange"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.ItemsRange", v_u_61:Get()),
			["PremiumItemsRange"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.PremiumItemsRange", v_u_62:Get()),
			["PremiumReset"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.PremiumReset", v_u_63:Get()),
			["PremiumAmountMultRange"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.PremiumAmountMultRange", v_u_64:Get()),
			["PremiumLuckMult"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.PremiumLuckMult", v_u_65:Get()),
			["BaseAmount"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.BaseAmount", v_u_56:Get()),
			["BaseLuck"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.BaseLuck", v_u_57:Get()),
			["LuckPerPremiumTier"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.LuckPerPremiumTier", v_u_58:Get()),
			["DropsWeightLow"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.DropsWeightLow", v_u_67:Get()),
			["DropsWeightMedium"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.DropsWeightMedium", v_u_68:Get()),
			["DropsWeightHigh"] = v_u_5.GetAttribute(p79, "ForeverPackAdRewards.DropsWeightHigh", v_u_69:Get())
		}
		local v83 = v_u_9.new({ p79.UserId, p80 })
		local v_u_84 = {}
		local function v92(p85, p86)
			-- upvalues: (copy) v_u_84
			local v87 = 0
			for _, v88 in ipairs(p85) do
				v87 = v87 + v88.Chance
			end
			if v87 ~= 0 then
				for _, v89 in ipairs(p85) do
					local v90 = v_u_84
					local v91 = {
						["Weight"] = v89.Chance * p86 / v87,
						["Value"] = v89
					}
					table.insert(v90, v91)
				end
			end
		end
		v92(v_u_43, v82.DropsWeightLow)
		v92(v_u_48, v82.DropsWeightMedium)
		v92(v_u_47, v82.DropsWeightHigh)
		local v93 = v_u_6.new(v_u_84)
		local v94 = v82.InitialFreeSlotsRange
		local v95 = v83:NextInteger(v94[1], v94[2])
		local v96 = 0
		local v97 = 0
		local v98 = {}
		for v99 = 1, p81 do
			local v100 = nil
			if v95 <= v96 then
				if v97 < #v_u_10 or v82.PremiumReset then
					v97 = v97 + 1
				end
				v96 = 0
				if v97 <= #v_u_10 then
					v100 = v_u_10[v97][1]
					local v101 = v82.PremiumFreeSlotsRange
					v95 = v83:NextInteger(v101[1], v101[2])
				else
					local v102 = v82.InitialFreeSlotsRange
					v95 = v83:NextInteger(v102[1], v102[2])
					v97 = 0
				end
			end
			if not v100 then
				v96 = v96 + 1
			end
			local v103 = v82.ItemsRange
			local v104 = v82.BaseAmount
			local v105 = v82.BaseLuck + v97 * v82.LuckPerPremiumTier
			if v100 then
				v103 = v82.PremiumItemsRange
				local v106 = v82.PremiumAmountMultRange
				v104 = v104 * v83:NextInteger(v106[1], v106[2])
				v105 = v105 * v82.PremiumLuckMult
			end
			v83:NextInteger(v103[1], v103[2])
			local v107 = {}
			for _ = 1, 1 do
				local v108 = v_u_78(v93, v83, v105, v104)
				table.insert(v107, v108)
			end
			v98[v99] = {
				["Rewards"] = v107,
				["ProductId"] = v100
			}
		end
		return v98
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
return v109
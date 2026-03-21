local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("TweenService")
local v3 = v1:WaitForChild("Data")
require(v3:WaitForChild("DefaultData"))
local v_u_4 = require(v1.Modules.UpdateService)
local v_u_5 = {
	["MaxMasteryLevel"] = 5
}
local v6 = {}
local v7 = {
	["HarvestWeight"] = 2,
	["PlantWeight"] = 4,
	["SaleWeight"] = 1,
	["ProgressRequired"] = 12000
}
local v8 = {
	[0] = {
		["WeightMultiplier"] = 1,
		["GrowSpeedMultiplier"] = 1
	},
	[1] = {
		["WeightMultiplier"] = 1.02,
		["GrowSpeedMultiplier"] = 1.02
	},
	[2] = {
		["WeightMultiplier"] = 1.03,
		["GrowSpeedMultiplier"] = 1.03
	},
	[3] = {
		["WeightMultiplier"] = 1.04,
		["GrowSpeedMultiplier"] = 1.04
	},
	[4] = {
		["WeightMultiplier"] = 1.06,
		["GrowSpeedMultiplier"] = 1.06
	},
	[5] = {
		["WeightMultiplier"] = 1.15,
		["GrowSpeedMultiplier"] = 1.15
	}
}
v7.Levels = v8
v6.Default = v7
v_u_5.InitialData = v6
v_u_5.ResolvedCrops = {}
function v_u_5.GetCropConfig(p9, p10)
	return p9.ResolvedCrops[p10] or p9.ResolvedCrops.Default
end
function v_u_5.GetMasteryProgress(p11, p12, p13)
	-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	if v_u_4:IsHiddenFromUpdate("Crop Mastery") then
		return 0
	end
	if not p12.CropMastery then
		return 0
	end
	local v14 = p12.CropMastery.PlantData
	if not v14 then
		return 0
	end
	local v15 = v14[p13]
	if not v15 then
		return 0
	end
	local v16 = v_u_5:GetCropConfig(p13)
	local v17 = v15.PlantedCount or 0
	local v18 = v15.HarvestCount or 0
	local v19 = v15.SoldCount or 0
	local v20 = v17 * v16.PlantWeight + v18 * v16.HarvestWeight + v19 * v16.SaleWeight
	local v21 = v16.ProgressRequired
	local v22 = p11.MaxMasteryLevel
	local v23 = v20 / v21
	local v24 = v_u_2:GetValue(math.clamp(v23, 0, 1), Enum.EasingStyle.Sine, Enum.EasingDirection.Out) * v22
	local v25 = p11.MaxMasteryLevel
	return math.min(v24, v25)
end
function v_u_5.GetMasteryLevel(p26, p27, p28)
	-- upvalues: (copy) v_u_4
	if v_u_4:IsHiddenFromUpdate("Crop Mastery") then
		return 0
	end
	local v29 = p26:GetMasteryProgress(p27, p28)
	return math.floor(v29)
end
function v_u_5.GetMultipliers(_, p30, p31)
	-- upvalues: (copy) v_u_4, (copy) v_u_5
	if v_u_4:IsHiddenFromUpdate("Crop Mastery") then
		return {
			["WeightMultiplier"] = 1,
			["GrowSpeedMultiplier"] = 1
		}
	end
	local v32 = v_u_5:GetCropConfig(p30)
	local v33 = v32.Levels[p31] or v32.Levels[1]
	return {
		["WeightMultiplier"] = v33.WeightMultiplier or 1,
		["GrowSpeedMultiplier"] = v33.GrowSpeedMultiplier or 1
	}
end
local function v_u_42(p34, p35)
	-- upvalues: (copy) v_u_42
	local v36 = {}
	for v37, v38 in pairs(p34) do
		if type(v38) == "table" then
			v36[v37] = v_u_42(v38, {})
		else
			v36[v37] = v38
		end
	end
	for v39, v40 in pairs(p35) do
		if type(v40) == "table" then
			local v41 = v36[v39]
			if type(v41) ~= "table" then
				goto l9
			end
			v36[v39] = v_u_42(v36[v39], v40)
		else
			::l9::
			v36[v39] = v40
		end
	end
	return v36
end
local v43 = v_u_5.InitialData.Default
for v44, v45 in pairs(v_u_5.InitialData) do
	if v44 == "Default" then
		v_u_5.ResolvedCrops[v44] = v_u_42(v43, {})
	else
		v_u_5.ResolvedCrops[v44] = v_u_42(v43, v45)
	end
end
return v_u_5
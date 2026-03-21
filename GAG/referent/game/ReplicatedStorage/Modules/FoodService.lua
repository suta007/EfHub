local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.MutationHandler)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_3 = require(v1.Modules.CalculatePlantValue)
local v_u_4 = require(v1.Calculate_Weight)
local v_u_5 = require(v1.Item_Module)
local v_u_6 = require(v1.Modules.SeedCombine)
local v_u_7 = require(v1.Modules.UpdateService)
local v_u_8 = require(v1.Data.SeedData)
local v_u_9 = v_u_5.Return_All_Seed_Rarities()
local v_u_10 = {
	["IndexedRarities"] = {}
}
local v_u_11 = {
	["Normal"] = 0,
	["Silver"] = 1,
	["Gold"] = 1,
	["Rainbow"] = 3,
	["Diamond"] = 3
}
for v12, v13 in ipairs(v_u_9) do
	v_u_10.IndexedRarities[v13[1]] = v12
end
local v_u_14 = {
	["Soup"] = true
}
function v_u_10.GetRootPlants(p15, p16, p17)
	local v18 = {}
	if p17.ItemType == "Holdable" then
		if p16 then
			v18[p16] = p17
			return v18
		else
			warn("SOMEHOW no UUID for holdable/plant >", p17)
			return v18
		end
	else
		local v19 = p17.ItemData.Ingredients
		if not v19 then
			return v18
		end
		for v20, v21 in v19 do
			for v22, v23 in p15:GetRootPlants(v20, v21) do
				v18[v22] = v23
			end
		end
		return v18
	end
end
function v_u_10.GetMaxRootDepth(p24, _, p25)
	if p25.ItemType == "Holdable" then
		return 1
	end
	local v26 = p25.ItemData.Ingredients
	if not v26 then
		return 1
	end
	local v27 = 0
	for v28, v29 in v26 do
		local v30 = p24:GetMaxRootDepth(v28, v29)
		if v27 < v30 then
			v27 = v30
		end
	end
	return v27 + 1
end
function v_u_10.CalculateFoodScale(_, p31, p32)
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_5
	local v33 = 0
	local v34 = 0
	for _, v35 in v_u_10:GetRootPlants(p31, p32) do
		local v36 = v35.ItemData
		if v36 then
			local v37 = v36.ItemName
			local v38 = (v_u_4.Calculate_Weight(v36.Seed, v36.ItemName) or 0) * v36.WeightMultiplier
			local v39 = v_u_5.Return_Data(v37)
			if v39 and #v39 >= 2 then
				v33 = v33 + v38 / v39[2]
				v34 = v34 + 1
			else
				warn("ItemData is invalid for plant:", v37)
			end
		else
			warn("PlantData is missing for item:", v35.ItemType)
		end
	end
	return (v34 == 0 or v33 == 0) and 1 or v33 / v34
end
function v_u_10.CalculateFoodValue(_, p40, p41)
	-- upvalues: (copy) v_u_10, (copy) v_u_4, (copy) v_u_2, (copy) v_u_3
	local v42 = 0
	for _, v43 in v_u_10:GetRootPlants(p40, p41) do
		local v44 = v43.ItemData
		local v45 = (v_u_4.Calculate_Weight(v44.Seed, v44.ItemName) or 0) * v44.WeightMultiplier * 100
		local v46 = math.round(v45) / 100
		local v47 = v_u_2:CalcValueMultiFromMuts((v_u_2:ExtractMutationsFromString(v44.MutationString)))
		v42 = v42 + v_u_3({
			["name"] = v44.ItemName,
			["variant"] = v44.Variant,
			["weight"] = v46,
			["mutationMultiplier"] = v47,
			["fruitVersion"] = v44.FruitVersion
		})
	end
	return v42
end
local function v_u_60(p48, p49)
	-- upvalues: (copy) v_u_10, (copy) v_u_8, (copy) v_u_11, (copy) v_u_14, (copy) v_u_9
	local v50 = 0
	local v51 = 0
	for _, v52 in v_u_10:GetRootPlants(p48, p49) do
		local v53 = v52.ItemData
		local v54 = v_u_8[v53.ItemName]
		local v55 = v54 == nil and "Common" or v54.SeedRarity
		v50 = v50 + ((v_u_10.IndexedRarities[v55] or 1) + (v_u_11[v53.Variant] or 0))
		v51 = v51 + 1
	end
	local v56 = math.max(1, v50) / math.max(1, v51) + (v51 >= 4 and 1 or 0)
	local v57 = p49.ItemData.ItemName
	if not v57 then
		warn("FoodService:CalculateRarity | No Food Name Found!")
	end
	if v_u_14[v57] then
		v56 = math.max(0.001, v56) / 2
	end
	local v58 = math.floor(v56)
	local v59 = #v_u_9
	return math.clamp(v58, 1, v59)
end
function v_u_10.CalculateFoodRarityString(_, p61, p62)
	-- upvalues: (copy) v_u_60, (copy) v_u_9
	local v63 = v_u_60(p61, p62)
	local v64 = v_u_9
	local v65 = #v_u_9
	local v66 = v64[math.min(v63, v65)]
	return not v66 and "Sloppy" or v66[1]
end
function v_u_10.CalculateFoodRarityNumber(_, p67, p68)
	-- upvalues: (copy) v_u_60
	return v_u_60(p67, p68)
end
function v_u_10.CalculateSeed(_, p69, p70)
	-- upvalues: (copy) v_u_10, (copy) v_u_6
	local v71 = {}
	for _, v72 in v_u_10:GetRootPlants(p69, p70) do
		local v73 = v72.ItemData.Seed
		table.insert(v71, v73)
	end
	return v_u_6:SeedCombine32(v71)
end
local function v_u_78(p74)
	local v75 = 5381
	for v76 = 1, #p74 do
		local v77 = v75 * 33 + p74:byte(v76)
		v75 = bit32.band(v77, 4294967295)
	end
	return v75
end
function v_u_10.CalculateMutations(_, p79, p80)
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_2, (copy) v_u_78
	if v_u_7:IsHiddenFromUpdate("CookingMutations") then
		return "", {}
	end
	local v81 = {}
	for _, v82 in v_u_10:GetRootPlants(p79, p80) do
		local v83 = v82.ItemData
		for _, v84 in v_u_2:ExtractMutationsFromString(v83.MutationString) do
			v81[v84.Name] = v81[v84.Name] or {}
			local v85 = v81[v84.Name]
			local v86 = v83.Seed
			table.insert(v85, v86)
		end
	end
	local v87 = p80.ItemData.MadeDuringKitchenStorm and 0.2 or 0
	local v88 = {}
	local v89 = {}
	for v90, v91 in v81 do
		local v92 = #v91
		local v93 = v_u_78(v90)
		local v94 = 1
		for _, v95 in v91 do
			local v96 = Random.new((bit32.bxor(v95, v93))):NextNumber()
			if v96 < v94 then
				v94 = v96
			end
		end
		local v97
		if v92 <= 0 then
			v97 = 0
		else
			local v98 = (0.2 + (v87 or 0)) * v92
			v97 = 1 - (1 - math.clamp(v98, 0, 1)) ^ (1 / v92)
		end
		v88[v90] = 1 - (1 - v97) ^ v92
		if v94 <= v97 then
			table.insert(v89, v90)
		end
	end
	table.sort(v89)
	return table.concat(v89, ", "), v88
end
return v_u_10
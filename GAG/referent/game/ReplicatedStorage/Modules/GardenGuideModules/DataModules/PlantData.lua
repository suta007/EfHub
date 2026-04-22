local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.SeedData)
local v_u_3 = require(v1.Data.SeedShopData)
local v_u_4 = require(v1.Data.SeedPackData)
local v_u_5 = require(v1.Modules.PlantTraitsData)
require(v1.Data.TravelingMerchant.TravelingMerchantData.SummerMerchantShopData)
local v_u_6 = require(v1.Data.CropMasteryData)
local v_u_7 = require(v1.Modules.DataService)
local v_u_8 = require(v1.Data.GrowableData.MaxAges)
local v9 = require(v1.Data.GrowableData)
local v_u_10 = require(v1.Data.GardenGuideData)
require(v1.Data.GardenGuideData.GardenGuideTypes)
local v_u_11 = require(v1.Modules.NumberUtil)
local v_u_12 = require(v1.Modules.UpdateService)
local v_u_13 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local v_u_14 = {
	["Data"] = {},
	["Total"] = 0,
	["Unlocked"] = {}
}
local v_u_15 = v9:GetAllPlantData()
local v_u_16 = {}
local v_u_17 = {}
local function v_u_50(p18, p19, p20, p21)
	-- upvalues: (copy) v_u_7, (copy) v_u_11, (copy) v_u_3, (copy) v_u_6, (copy) v_u_16, (copy) v_u_8, (copy) v_u_15
	local v22 = v_u_7:GetData()
	if v22 then
		local v23 = "(Record not set)"
		local v24
		if p20 then
			if p20.MaxWeight then
				local v25 = p20.MaxWeight * 100
				v24 = ("%*kg"):format(math.round(v25) / 100) or "-"
			else
				v24 = "-"
			end
			if p20.MaxWeightTime then
				v23 = os.date("%B %d %Y", p20.MaxWeightTime)
			elseif p20.MaxWeight then
				v23 = os.date("%B %d %Y", os.time())
			end
		else
			v24 = "-"
		end
		local v26 = "(Record not set)"
		local v27
		if p20 then
			v27 = p20.MostValue and (v_u_11.FormatCompactPrice(p20.MostValue) or "-") or "-"
			if p20.MostValueTime then
				v26 = os.date("%B %d %Y", p20.MostValueTime)
			elseif p20.MostValue then
				v26 = os.date("%B %d %Y", os.time())
			end
		else
			v27 = "-"
		end
		local v28 = "(Record not set)"
		local v29
		if p20 then
			local _ = p20.BestVariant
			local _ = p20.BestMutations
			local v30 = {
				[""] = true,
				["Normal"] = true
			}
			local v31 = {}
			for _, v32 in { p20.BestVariant, p20.BestMutations } do
				if v32 and not v30[v32] then
					table.insert(v31, v32)
				end
			end
			v29 = #v31 > 0 and table.concat(v31, ", ") or "-"
			if p20.BestMutationsTime or p20.BestVariantTime then
				local v33 = p20.BestMutationsTime or 0
				local v34 = p20.BestVariantTime or 0
				local v35 = math.max(v33, v34)
				v28 = os.date("%B %d %Y", v35)
			elseif p20.BestMutations or p20.BestVariant then
				v28 = os.date("%B %d %Y", os.time())
			end
		else
			v29 = "-"
		end
		local v36 = p21.Source
		local v37 = v_u_3[p18]
		local v38 = not v37 and "Event Exclusive" or (not v37.DisplayInShop and v37.StockChance < 1 and "Event Exclusive" or v36)
		local v39 = v_u_6.MaxMasteryLevel
		local v40 = v_u_6:GetMasteryLevel(v22, p18)
		local v41 = v_u_6:GetMasteryProgress(v22, p18)
		local v42 = v39 <= v40
		if not v_u_16[p18] or #v_u_16[p18] <= 0 then
			warn((("[!] %* has no plant traits. Won\'t show in GG until traits assigned..."):format(p18)))
		end
		local v43 = {
			["ImageId"] = p19.FruitIcon or "",
			["Name"] = p18,
			["Rarity"] = p19.SeedRarity
		}
		local v44
		if p20 then
			v44 = p20.NewPlant or false
		else
			v44 = false
		end
		v43.New = v44
		v43.Seen = p20 and true or false
		v43.Description = p19.AbilityDescription or ""
		v43.HarvestType = p21.ParentInfo and "Multi" or "Single"
		local v45 = v_u_11.compactFormat
		local v46 = v_u_8[p18]
		local v47
		if v46 and v_u_15[p18] then
			local v48 = v_u_15[p18].PlantData.GrowTickTime
			local v49
			if typeof(v48) == "NumberRange" then
				v49 = (v48.Max + v48.Min) / 2
			else
				warn("Argument 1 expected NumberRange, got " .. typeof(v48))
				v49 = 0
			end
			v47 = v46 / v_u_15[p18].PlantData.GrowRate * v49
		else
			v47 = 0
		end
		v43.Time = v45(v47)
		v43.Source = v38
		v43.Mastered = v42
		v43.MasteryLevel = v40 or "-"
		v43.MasteryProgress = v41 or "-"
		v43.Traits = v_u_16[p18] or "-"
		v43.HarvestedCount = p20 and (p20.HarvestCount or 0) or 0
		v43.PlantedCount = p20 and (p20.PlantedCount or 0) or 0
		v43.SoldCount = p20 and p20.SoldCount or 0
		v43.Records = {
			{
				["RecordName"] = "Heaviest Harvest",
				["RecordData"] = v24,
				["RecordDate"] = v23
			},
			{
				["RecordName"] = "Most Valuable",
				["RecordData"] = v27,
				["RecordDate"] = v26
			},
			{
				["RecordName"] = "Best Mutations",
				["RecordData"] = v29,
				["RecordDate"] = v28
			}
		}
		return v43
	end
	warn("No player data in PlantData")
end
local function v_u_55()
	-- upvalues: (copy) v_u_2, (copy) v_u_13, (copy) v_u_14
	local v_u_51 = {}
	for v52, _ in v_u_2 do
		if not v_u_13.PlantBlacklist[v52] then
			local v53 = v_u_14
			v53.Total = v53.Total + 1
			table.insert(v_u_51, v52)
			if not v_u_14.Data[v52] then
				v_u_14.UpdateData(v52)
			end
		end
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_51, (ref) v_u_14
		for _, v54 in v_u_51 do
			local _ = v_u_14.Data[v54]
		end
	end)
end
function v_u_14.UpdateData(p56)
	-- upvalues: (copy) v_u_7, (copy) v_u_10, (copy) v_u_2, (copy) v_u_13, (copy) v_u_12, (copy) v_u_14, (copy) v_u_50
	local v57 = v_u_7:GetData()
	if v57 then
		local v58 = v_u_10.Entries[p56]
		if v58 then
			local v59 = v_u_2[p56]
			if v59 then
				local v60 = v57.GardenGuide.PlantData[p56]
				if v_u_13.PlantBlacklist[p56] then
					return
				elseif v_u_12:IsUpdateDone() or not v_u_12:IsHiddenFromUpdate(p56) then
					v_u_14.Data[p56] = v_u_50(p56, v59, v60, v58)
					if v60 and not table.find(v_u_14.Unlocked, p56) then
						local v61 = v_u_14.Unlocked
						table.insert(v61, p56)
					end
				end
			else
				warn((("PlantData | No SeedData for plant %*"):format(p56)))
				return
			end
		else
			warn((("PlantData | No GardenGuideEntry for plant %*"):format(p56)))
			return
		end
	else
		warn("No player data in PlantData")
		return
	end
end
function v_u_14.RegatherData()
	-- upvalues: (copy) v_u_14, (copy) v_u_55
	v_u_14.Total = 0
	v_u_55()
end
(function()
	-- upvalues: (copy) v_u_4, (copy) v_u_17
	for v62, v63 in v_u_4.Packs do
		if not (string.find(v62, "Rainbow Exotic") or string.find(v62, "Rainbow")) then
			for _, v64 in v63.Items do
				if (v64.Type == "Seed" or (v64.Type == "RainbowSeed" or v64.Type == "SilverSeed")) and not v_u_17[v64.RewardId] then
					v_u_17[v64.RewardId] = v63.DisplayName
				end
			end
		end
	end
end)();
(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_5, (copy) v_u_13, (copy) v_u_16
	for v65, _ in v_u_2 do
		local v66 = v_u_5.GetTraitsAsString(v65)
		for v67, _ in v_u_13.PlantTraitsBlacklist do
			if string.find(v66, v67) then
				local v68 = string.split(v66, ", ")
				local v69 = table.find(v68, "<font color=\"#FFFFFF\">Apple</font>")
				if v69 then
					table.remove(v68, v69)
				end
				v66 = table.concat(v68, ", ")
			end
		end
		v_u_16[v65] = v66
	end
end)()
v_u_55()
return v_u_14
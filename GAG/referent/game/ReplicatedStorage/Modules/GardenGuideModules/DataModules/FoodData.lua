local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.SeedData)
local v_u_3 = require(v1.Data.FoodRecipeData)
local v4 = require(v1.Modules.DataService)
require(v1.Data.GardenGuideData)
require(v1.Data.GardenGuideData.GardenGuideTypes)
local v_u_5 = require(v1.Modules.NumberUtil)
local v_u_6 = require(v1.Modules.UpdateService)
local v_u_7 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local v_u_8 = {
	["Data"] = {},
	["Total"] = 0,
	["Unlocked"] = {}
}
local v_u_9 = v4:GetData()
local function v_u_19(p10)
	-- upvalues: (copy) v_u_9, (copy) v_u_3, (copy) v_u_2
	local v11 = {
		["SpecificIngr"] = {},
		["BroadIngr"] = {}
	}
	local v12 = v_u_9.GardenGuide.PlantData
	local v13 = v_u_3.Recipes[p10]
	if not v13 then
		warn((("No recipe data for %*"):format(p10)))
		return v11
	end
	if v13.Requires.Ingredients then
		for v14, v15 in v13.Requires.Ingredients do
			if #v15 == 1 and v12[v14] then
				v11.SpecificIngr[v14] = {
					["Name"] = v14,
					["ImageId"] = v_u_2[v14].FruitIcon
				}
			else
				if not v11.BroadIngr[v14] then
					v11.BroadIngr[v14] = {}
				end
				for _, v16 in v15 do
					if v12[v16] and not v11.BroadIngr[v14][v16] then
						v11.BroadIngr[v14][v16] = v16
					end
				end
			end
		end
		return v11
	end
	if p10 ~= "Soup" then
		warn("no ingredients in", p10)
		return v11
	end
	local v17 = {}
	local v18 = {
		[p10] = {
			["Name"] = "Any Plant",
			["ImageId"] = ""
		}
	}
	v17.SpecificIngr = v18
	v17.BroadIngr = {}
	return v17
end
local function v_u_32(p20, p21, p22)
	-- upvalues: (copy) v_u_5, (copy) v_u_19
	local v23 = "(Record not set)"
	local v24
	if p22 then
		if p22.MaxScale then
			local v25 = p22.MaxScale * 100
			v24 = ("%*kg"):format(math.round(v25) / 100) or "-"
		else
			v24 = "-"
		end
		if p22.MaxScaleTime then
			v23 = os.date("%B %d %Y", p22.MaxScaleTime)
		elseif p22.MaxScale then
			v23 = os.date("%B %d %Y", os.time())
		end
	else
		v24 = "-"
	end
	local v26 = "(Record not set)"
	local v27
	if p22 then
		v27 = p22.MostValue and (v_u_5.FormatCompactPrice(p22.MostValue) or "-") or "-"
		if p22.MostValueTime then
			v26 = os.date("%B %d %Y", p22.MostValueTime)
		elseif p22.MostValue then
			v26 = os.date("%B %d %Y", os.time())
		end
	else
		v27 = "-"
	end
	local v28 = "(Record not set)"
	local v29
	if p22 then
		v29 = p22.BestMutations or "-"
		if p22.BestMutationsTime then
			v28 = os.date("%B %d %Y", p22.BestMutationsTime)
		elseif p22.BestMutations then
			v28 = os.date("%B %d %Y", os.time())
		end
	else
		v29 = "-"
	end
	local v30 = {
		["ImageId"] = p21 and (p21.ImageId or "") or "",
		["Name"] = p20
	}
	local v31
	if p22 then
		v31 = p22.NewFood or false
	else
		v31 = false
	end
	v30.New = v31
	v30.Seen = p22 and true or false
	v30.HarvestedCount = p22 and (p22.CookCount or 0) or 0
	v30.Progress = p22 and (p22.CookCount or 0) or 0
	v30.Time = v_u_5.compactFormat(p21.BaseTime)
	v30.RecipeData = v_u_19(p20)
	v30.Records = {
		{
			["RecordName"] = "Heaviest Cooked",
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
	return v30
end
local function v_u_35()
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8
	for v33, _ in v_u_3.RecipeNames do
		if not v_u_7.FoodBlacklist[v33] then
			local v34 = v_u_8
			v34.Total = v34.Total + 1
			if not v_u_8.Data[v33] then
				v_u_8.UpdateData(v33)
			end
		end
	end
end
function v_u_8.UpdateData(p36)
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_32
	local v37 = v_u_3.Recipes[p36]
	if v37 then
		local v38 = v_u_9.GardenGuide.FoodData[p36]
		if v_u_7.FoodBlacklist[p36] then
			return
		elseif v_u_6:IsUpdateDone() or not v_u_6:IsHiddenFromUpdate(p36) then
			v_u_8.Data[p36] = v_u_32(p36, v37, v38)
			if v38 and not table.find(v_u_8.Unlocked, p36) then
				local v39 = v_u_8.Unlocked
				table.insert(v39, p36)
			end
		end
	else
		warn((("FoodData | No FoodData for food %*"):format(p36)))
		return
	end
end
function v_u_8.RegatherData()
	-- upvalues: (copy) v_u_8, (copy) v_u_35
	v_u_8.Total = 0
	v_u_35()
end
v_u_35()
return v_u_8
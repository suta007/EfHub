local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.DataService)
require(v1.Data.GardenGuideData)
require(v1.Data.GardenGuideData.GardenGuideTypes)
require(v1.Modules.NumberUtil)
local v_u_3 = require(v1.Modules.MutationHandler)
local v_u_4 = require(v1.Data.PetRegistry.PetMutationRegistry)
local v_u_5 = require(v1.Modules.MutationHandler.MutationCombos)
local v_u_6 = require(v1.Modules.UpdateService)
local v_u_7 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local v_u_8 = {
	["Data"] = {},
	["Total"] = 0,
	["Unlocked"] = {}
}
local v_u_9 = v2:GetData()
local function v_u_18(p10, p11)
	-- upvalues: (copy) v_u_9
	local v12 = {
		["SpecificIngr"] = {},
		["BroadIngr"] = {}
	}
	local _ = v_u_9.GardenGuide.PlantData
	if not p11.Data then
		return v12
	end
	if p11.Type == "Fusion Combo" then
		for _, v13 in p11.Data.Requires do
			if #v13 == 1 then
				v12.SpecificIngr[v13[1]] = {
					["Name"] = v13[1],
					["ImageId"] = ""
				}
			else
				local v14 = p11.Data.LargerArrayName
				if v14 and not v12.BroadIngr[v14] then
					v12.BroadIngr[v14] = {}
				end
				for _, v15 in v13 do
					v12.BroadIngr[v14][v15] = v15
				end
			end
		end
		return v12
	end
	if p11.Type == "Chain Combo" then
		local v16 = p11.Data.Order
		for v17 = #v16, 1, -1 do
			if v16[v17] == p10 then
				v12.SpecificIngr[v16[v17]] = {
					["Name"] = v16[v17],
					["ImageId"] = ""
				}
				return v12
			end
			v12.SpecificIngr[v16[v17]] = {
				["Name"] = v16[v17],
				["ImageId"] = ""
			}
		end
		return v12
	end
end
local function v_u_35(p19, p20, p21, p22)
	-- upvalues: (copy) v_u_5, (copy) v_u_18
	local v23 = {}
	local v24 = {}
	local v25 = nil
	local v26 = "None"
	for v27, v28 in {
		["Plant"] = p20,
		["Pet"] = p21
	} do
		if v28 then
			table.insert(v23, v27)
			v24[v27] = ("x%*"):format(v28.ValueMulti)
			if not v25 then
				v25 = v28.Color
			end
		end
	end
	local v29 = v25 or Color3.fromRGB(80, 80, 80)
	if #v23 > 0 then
		v26 = table.concat(v23, ", ")
	end
	local v30 = v_u_5.GetComboData(p19)
	local v31 = v30 and (v30.Type or "No Combo") or "No Combo"
	local v32 = {
		["ImageId"] = "",
		["DisplayName"] = p19:gsub("(%l)(%u)", "%1 %2"),
		["Name"] = p19
	}
	local v33
	if p22 then
		v33 = p22.NewMutation or false
	else
		v33 = false
	end
	v32.New = v33
	v32.Seen = p22 and true or false
	v32.Source = "???"
	v32.Applicable = v26
	v32.ValueMultis = v24
	v32.ComboType = v31 or "No Combo"
	local v34
	if v30 then
		v34 = v_u_18(p19, v30)
	else
		v34 = nil
	end
	v32.RecipeData = v34
	v32.Color = v29
	v32.HarvestedCount = p22 and (p22.HarvestCount or 0) or 0
	v32.AppliedCount = p22 and (p22.AppliedCount or 0) or 0
	v32.SoldCount = p22 and p22.SoldCount or 0
	return v32
end
local function v_u_40()
	-- upvalues: (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_4
	for v36, _ in v_u_3.MutationNames do
		if not v_u_7.MutationBlacklist[v36] then
			local v37 = v_u_8
			v37.Total = v37.Total + 1
			if not v_u_8.Data[v36] then
				v_u_8.UpdateData(v36)
			end
		end
	end
	for v38, _ in v_u_4.PetMutationRegistry do
		if not (v_u_7.MutationBlacklist[v38] or v_u_8.Data[v38]) then
			local v39 = v_u_8
			v39.Total = v39.Total + 1
			v_u_8.UpdateData(v38)
		end
	end
end
function v_u_8.UpdateData(p41)
	-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_35
	local v42 = v_u_3.GetMutations()[p41]
	local v43 = v_u_4.PetMutationRegistry[p41]
	if v42 or v43 then
		local v44
		if v_u_9.GardenGuide.MutationData then
			v44 = v_u_9.GardenGuide.MutationData[p41] or nil
		else
			v44 = nil
		end
		if v_u_7.MutationBlacklist[p41] then
			return
		elseif v_u_6:IsUpdateDone() or not v_u_6:IsHiddenFromUpdate(p41) then
			v_u_8.Data[p41] = v_u_35(p41, v42, v43, v44)
			if v44 and not table.find(v_u_8.Unlocked, p41) then
				local v45 = v_u_8.Unlocked
				table.insert(v45, p41)
			end
		end
	else
		warn((("MutationData | No MutationData or PetMutationData for mutation %*"):format(p41)))
		return
	end
end
function v_u_8.RegatherData()
	-- upvalues: (copy) v_u_8, (copy) v_u_40
	v_u_8.Total = 0
	v_u_40()
end
v_u_40()
return v_u_8
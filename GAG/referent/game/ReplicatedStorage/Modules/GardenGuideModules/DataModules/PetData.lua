local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.PetRegistry.PetList)
local v_u_3 = require(v1.Data.PetRegistry.PetEggs)
local v_u_4 = require(v1.Data.PetEggData)
local v_u_5 = require(v1.Data.SeedPackData)
local v6 = require(v1.Modules.DataService)
require(v1.Data.GardenGuideData)
require(v1.Data.GardenGuideData.GardenGuideTypes)
local v_u_7 = require(v1.Modules.NumberUtil)
local v_u_8 = require(v1.Modules.UpdateService)
local v_u_9 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local v_u_10 = {
	["Data"] = {},
	["Total"] = 0,
	["Unlocked"] = {}
}
local v_u_11 = v6:GetData()
local v_u_12 = {}
local v_u_13 = {}
local function v_u_25(p14, p15, p16)
	-- upvalues: (copy) v_u_7, (copy) v_u_4, (copy) v_u_12
	local v17 = "(Record not set)"
	local v18
	if p16 then
		if p16.MaxBaseWeight then
			local v19 = p16.MaxBaseWeight * 100
			v18 = ("%*kg"):format(math.round(v19) / 100) or "-"
		else
			v18 = "-"
		end
		if p16.MaxBaseWeightTime then
			v17 = os.date("%B %d %Y", p16.MaxBaseWeightTime)
		elseif p16.MaxBaseWeight then
			v17 = os.date("%B %d %Y", os.time())
		end
	else
		v18 = "-"
	end
	local v20 = "(Record not set)"
	local v21
	if p16 then
		v21 = p16.MaxLevel and (v_u_7.FormatCompactPrice(p16.MaxLevel) or "-") or "-"
		if p16.MaxLevelTime then
			v20 = os.date("%B %d %Y", p16.MaxLevelTime)
		elseif p16.MaxLevel then
			v20 = os.date("%B %d %Y", os.time())
		end
	else
		v21 = "-"
	end
	local v22 = v_u_4[v_u_12[p14].EggType] and "Pet Shop" or "Event Exclusive"
	local v23 = {
		["ImageId"] = p15.Icon or "",
		["Name"] = p14,
		["Rarity"] = p15.Rarity,
		["Description"] = p15.Description or ""
	}
	local v24
	if p16 then
		v24 = p16.NewPet or false
	else
		v24 = false
	end
	v23.New = v24
	v23.Seen = p16 and true or false
	v23.HarvestedCount = p16 and (p16.HatchCount or 0) or 0
	v23.Progress = p16 and (p16.HatchCount or 0) or 0
	v23.Time = v_u_7.compactFormat(v_u_12[p14].HatchTime)
	v23.Source = v22
	v23.Records = {
		{
			["RecordName"] = "Heaviest Hatched",
			["RecordData"] = v18,
			["RecordDate"] = v17
		},
		{
			["RecordName"] = "Highest Level",
			["RecordData"] = v21,
			["RecordDate"] = v20
		},
		{
			["RecordName"] = "-",
			["RecordData"] = "-",
			["RecordDate"] = "-"
		}
	}
	return v23
end
local function v_u_28()
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_10
	for v26, _ in v_u_2 do
		if not v_u_9.PetBlacklist[v26] then
			local v27 = v_u_10
			v27.Total = v27.Total + 1
			if not v_u_10.Data[v26] then
				v_u_10.UpdateData(v26)
			end
		end
	end
end
function v_u_10.UpdateData(p29)
	-- upvalues: (copy) v_u_2, (copy) v_u_11, (copy) v_u_9, (copy) v_u_8, (copy) v_u_10, (copy) v_u_25
	local v30 = v_u_2[p29]
	if v30 then
		local v31 = v_u_11.GardenGuide.PetData[p29]
		if v_u_9.PetBlacklist[p29] then
			return
		elseif v_u_8:IsUpdateDone() or not v_u_8:IsHiddenFromUpdate(p29) then
			v_u_10.Data[p29] = v_u_25(p29, v30, v31)
			if v31 and not table.find(v_u_10.Unlocked, p29) then
				local v32 = v_u_10.Unlocked
				table.insert(v32, p29)
			end
		end
	else
		warn((("PetData | No PetList data for pet %*"):format(p29)))
		return
	end
end
function v_u_10.RegatherData()
	-- upvalues: (copy) v_u_10, (copy) v_u_28
	v_u_10.Total = 0
	v_u_28()
end
(function()
	-- upvalues: (copy) v_u_5, (copy) v_u_13
	for v33, v34 in v_u_5.Packs do
		if string.find(v33, "Chest") and not string.find(v33, "Rainbow Exotic") then
			for _, v35 in v34.Items do
				if v35.Type == "Pet" and not v_u_13[v35.RewardId] then
					v_u_13[v35.RewardId] = v33
				end
			end
		end
	end
end)();
(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_12, (copy) v_u_13
	for v36, _ in v_u_2 do
		for v37, v38 in v_u_3 do
			if v37 ~= "Fake Egg" and v38.RarityData.Items[v36] then
				v_u_12[v36] = {
					["EggType"] = v37,
					["HatchTime"] = v38.HatchTime
				}
				break
			end
		end
		if not v_u_12[v36] then
			v_u_12[v36] = {
				["EggType"] = v_u_13[v36] or "Event Exclusive",
				["HatchTime"] = 0
			}
		end
	end
end)()
v_u_28()
return v_u_10
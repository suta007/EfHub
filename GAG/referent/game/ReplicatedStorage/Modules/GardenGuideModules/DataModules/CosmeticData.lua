local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Data.CosmeticRegistry.CosmeticList)
local v_u_3 = require(v1.Data.CosmeticCrateRegistry.CosmeticCrates)
local v_u_4 = require(v1.Data.CosmeticCrateShopData)
local v_u_5 = require(v1.Data.CosmeticItemShopData)
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
local function v_u_19(p13, p14, p15)
	-- upvalues: (copy) v_u_4, (copy) v_u_12, (copy) v_u_5, (copy) v_u_7
	local v16 = (v_u_4[v_u_12[p13].CrateType] or v_u_5[p13]) and "Cosmetic Shop" or "Admin/Event Exclusive"
	local v17 = {
		["ImageId"] = p14.Icon or "",
		["Name"] = p13,
		["Rarity"] = p14.Rarity,
		["Description"] = p14.Description or ""
	}
	local v18
	if p15 then
		v18 = p15.NewCosmetic or false
	else
		v18 = false
	end
	v17.New = v18
	v17.Seen = p15 and true or false
	v17.HarvestedCount = p15 and (p15.OwnCount or 0) or 0
	v17.Progress = p15 and (p15.OwnCount or 0) or 0
	v17.Time = v_u_7.compactFormat(v_u_12[p13].OpenTime)
	v17.Source = v16
	v17.Records = {
		{
			["RecordName"] = "Heaviest Harvest",
			["RecordData"] = nil,
			["RecordDate"] = nil
		},
		{
			["RecordName"] = "Most Valuable",
			["RecordData"] = nil,
			["RecordDate"] = nil
		},
		{
			["RecordName"] = "Best Mutations",
			["RecordData"] = nil,
			["RecordDate"] = nil
		}
	}
	return v17
end
local function v_u_22()
	-- upvalues: (copy) v_u_2, (copy) v_u_9, (copy) v_u_10
	for v20, _ in v_u_2 do
		if not v_u_9.CosmeticBlacklist[v20] then
			local v21 = v_u_10
			v21.Total = v21.Total + 1
			if not v_u_10.Data[v20] then
				v_u_10.UpdateData(v20)
			end
		end
	end
end
function v_u_10.UpdateData(p23)
	-- upvalues: (copy) v_u_2, (copy) v_u_11, (copy) v_u_9, (copy) v_u_8, (copy) v_u_10, (copy) v_u_19
	local v24 = v_u_2[p23]
	if v24 then
		local v25 = v_u_11.GardenGuide.CosmeticData[p23]
		if v_u_9.CosmeticBlacklist[p23] then
			return
		elseif v_u_8:IsUpdateDone() or not v_u_8:IsHiddenFromUpdate(p23) then
			v_u_10.Data[p23] = v_u_19(p23, v24, v25)
			if v25 and not table.find(v_u_10.Unlocked, p23) then
				local v26 = v_u_10.Unlocked
				table.insert(v26, p23)
			end
		end
	else
		warn((("CosmeticData | No CosmeticData for item %*"):format(p23)))
		return
	end
end
function v_u_10.RegatherData()
	-- upvalues: (copy) v_u_10, (copy) v_u_22
	v_u_10.Total = 0
	v_u_22()
end
(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_12
	for v27, _ in v_u_2 do
		for v28, v29 in v_u_3 do
			if v29.CosmeticRolls.Items[v27] then
				v_u_12[v27] = {
					["CrateType"] = v28,
					["OpenTime"] = v29.OpenTime
				}
				break
			end
		end
		if not v_u_12[v27] then
			v_u_12[v27] = {
				["CrateType"] = "Unknown",
				["OpenTime"] = 0
			}
		end
	end
end)()
v_u_22()
return v_u_10
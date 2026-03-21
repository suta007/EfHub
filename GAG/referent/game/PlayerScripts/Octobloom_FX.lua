game:GetService("RunService")
local v_u_1 = game:GetService("CollectionService")
local v_u_2 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v3 = require(game.ReplicatedStorage.Modules.DataService)
require(game.ReplicatedStorage.Modules.IsInTradeWorld)
require(game.ReplicatedStorage.Modules.OptimisationControllers.FPSHandler)
local v_u_4 = require(game.ReplicatedStorage.Modules.OptimisationControllers.IsMobile)
local v_u_5 = not v_u_2:GetSetting("PerformanceMode")
v_u_2:GetSetting("LowerPlantFXQuality")
local v_u_6 = v_u_4() and 0.1 or 0.016666666666666666
local v_u_7 = v_u_2:GetSetting("LowerPlantFXQuality")
if v_u_7 then
	v_u_6 = v_u_4() and 0.2 or 0.05
else
	v_u_6 = v_u_4() and 0.1 or 0.016666666666666666
end
local v_u_8 = nil
v_u_8 = v3:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_7, (copy) v_u_2, (ref) v_u_6, (copy) v_u_4, (ref) v_u_5, (ref) v_u_8
	v_u_7 = v_u_2:GetSetting("LowerPlantFXQuality")
	if v_u_7 then
		v_u_6 = v_u_4() and 0.2 or 0.05
	else
		v_u_6 = v_u_4() and 0.1 or 0.016666666666666666
	end
	v_u_5 = not v_u_2:GetSetting("PerformanceMode")
	if not v_u_5 then
		if v_u_8 then
			v_u_8:Disconnect()
			v_u_8 = nil
		end
	end
end)
local v_u_9 = { Color3.fromRGB(155, 0, 255), Color3.fromRGB(255, 60, 190), Color3.fromRGB(30, 140, 255) }
local function v_u_15(p10, p11, p12)
	local v13 = p10 or Color3.fromRGB(155, 0, 255)
	local v14 = p11 or Color3.fromRGB(155, 0, 255)
	return Color3.new(v13.R + (v14.R - v13.R) * p12, v13.G + (v14.G - v13.G) * p12, v13.B + (v14.B - v13.B) * p12)
end
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = 0
local function v_u_26(p19)
	-- upvalues: (copy) v_u_17, (ref) v_u_18, (copy) v_u_16
	if p19:IsDescendantOf(workspace) then
		local v20 = p19.Parent
		if v20 and (v20:IsA("Model") and (v_u_17[v20] and v_u_17[v20][p19])) then
			return
		elseif p19:IsA("Model") or (p19:IsA("Folder") or p19:HasTag("OctobloomParent")) then
			if not v_u_17[p19] then
				v_u_18 = v_u_18 + 1
				v_u_17[p19] = {}
			end
			for _, v21 in ipairs(p19:GetDescendants()) do
				if v21:IsA("BasePart") then
					local v22 = v21.Name
					local v23 = tonumber(v22)
					if v23 then
						v_u_17[p19][v21] = v23 / 6
					end
				end
			end
		elseif p19:IsA("BasePart") then
			local v24 = p19.Name
			local v25 = tonumber(v24)
			if not v25 then
				return
			end
			if v20 and v20:HasTag("OctobloomParent") then
				if not v_u_17[v20] then
					v_u_18 = v_u_18 + 1
					v_u_17[v20] = {}
				end
				v_u_17[v20][p19] = v25 / 6
				return
			end
			v_u_16[p19] = v25 / 6
		end
	else
		return
	end
end
local function v_u_30(p27)
	-- upvalues: (copy) v_u_17, (ref) v_u_18, (copy) v_u_16
	local v28 = p27.Parent
	if p27:IsA("Model") or (p27:IsA("Folder") or p27:HasTag("OctobloomParent")) then
		if v_u_17[p27] then
			v_u_18 = v_u_18 - 1
			for _, v29 in ipairs(p27:GetDescendants()) do
				if v29:IsA("BasePart") then
					v_u_17[p27][v29] = nil
				end
			end
			table.clear(v_u_17[p27])
			v_u_17[p27] = nil
		end
	else
		if p27:IsA("BasePart") then
			if v28 and p27:HasTag("OctobloomParent") then
				v_u_17[v28][p27] = nil
				return
			end
			v_u_16[p27] = nil
		end
		return
	end
end
local v_u_31 = {}
local function v_u_33(p_u_32)
	-- upvalues: (copy) v_u_31, (copy) v_u_26, (copy) v_u_30
	if p_u_32 then
		if not v_u_31[p_u_32] then
			v_u_31[p_u_32] = p_u_32.AncestryChanged:Connect(function()
				-- upvalues: (copy) p_u_32, (ref) v_u_26, (ref) v_u_30
				if p_u_32:IsDescendantOf(workspace) then
					v_u_26(p_u_32)
				else
					v_u_30(p_u_32)
				end
			end)
			p_u_32.Destroying:Once(function()
				-- upvalues: (ref) v_u_31, (copy) p_u_32
				if v_u_31[p_u_32] then
					v_u_31[p_u_32]:Disconnect()
					v_u_31[p_u_32] = nil
				end
			end)
			if p_u_32:IsDescendantOf(workspace) then
				v_u_26(p_u_32)
			end
		end
	else
		return
	end
end
v_u_1:GetInstanceAddedSignal("Octobloom"):Connect(v_u_26)
v_u_1:GetInstanceRemovedSignal("Octobloom"):Connect(v_u_30)
v_u_1:GetInstanceAddedSignal("OctobloomParent"):Connect(v_u_33)
v_u_1:GetInstanceRemovedSignal("OctobloomParent"):Connect(v_u_30);
(function()
	-- upvalues: (copy) v_u_1, (copy) v_u_33, (copy) v_u_26
	for _, v34 in ipairs(v_u_1:GetTagged("OctobloomParent")) do
		v_u_33(v34)
	end
	for _, v35 in ipairs(v_u_1:GetTagged("Octobloom")) do
		v_u_26(v35)
	end
end)()
local v_u_36 = 60
local v_u_37 = 0
local v_u_38 = nil
v_u_38 = game.Players.LocalPlayer:GetAttributeChangedSignal("AverageFPSAfterLoad"):Connect(function()
	-- upvalues: (ref) v_u_36, (ref) v_u_38
	if game.Players.LocalPlayer:GetAttribute("AverageFPSAfterLoad") >= 0 then
		v_u_36 = game.Players.LocalPlayer:GetAttribute("AverageFPSAfterLoad")
		v_u_38:Disconnect()
		v_u_38 = nil
	end
end)
task.spawn(function()
	-- upvalues: (ref) v_u_5, (copy) v_u_16, (copy) v_u_9, (copy) v_u_15, (copy) v_u_17, (ref) v_u_36, (ref) v_u_7, (ref) v_u_6, (ref) v_u_18, (ref) v_u_37
	while v_u_5 do
		local v39 = tick() * 0.5
		for v40, v41 in pairs(v_u_16) do
			if v40.Parent then
				local v42 = (v39 + v41 / 6) % 2 - 1
				local v43 = math.abs(v42) * 3
				local v44 = math.floor(v43)
				local v45 = v43 % 1
				v40.Color = v_u_15(v_u_9[v44 + 1], v_u_9[v44 + 2 > 3 and 1 or v44 + 2], v45)
			else
				v_u_16[v40] = nil
			end
		end
		for _, v46 in v_u_17 do
			local v47 = tick() * 0.5
			for v48, v49 in v46 do
				local v50 = (v47 + v49 / 6) % 2 - 1
				local v51 = math.abs(v50) * 3
				local v52 = math.floor(v51)
				local v53 = v51 % 1
				v48.Color = v_u_15(v_u_9[v52 + 1], v_u_9[v52 + 2 > 3 and 1 or v52 + 2], v53)
			end
			if v_u_36 < 20 or v_u_7 then
				task.wait((v_u_6 == 0 or v_u_18 == 0) and 0 or v_u_6 / v_u_18)
			elseif v_u_36 < 30 and v_u_37 >= 3 then
				v_u_37 = 0
				task.wait()
			end
			if v_u_36 >= 20 and v_u_36 < 30 then
				v_u_37 = v_u_37 + 1
			end
		end
		task.wait(v_u_6)
	end
end)
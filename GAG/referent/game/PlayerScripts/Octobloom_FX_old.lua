game:GetService("RunService")
local v1 = game:GetService("CollectionService")
local v_u_2 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v3 = require(game.ReplicatedStorage.Modules.DataService)
local v4 = require(game.ReplicatedStorage.Modules.OptimisationControllers.IsMobile)
local v_u_5 = not v_u_2:GetSetting("PerformanceMode")
local v_u_6 = v4() and 0.1 or 0
local v_u_7 = nil
v_u_7 = v3:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_5, (copy) v_u_2, (ref) v_u_7
	v_u_5 = not v_u_2:GetSetting("PerformanceMode")
	if not v_u_5 then
		if v_u_7 then
			v_u_7:Disconnect()
			v_u_7 = nil
		end
	end
end)
local v_u_8 = { Color3.fromRGB(155, 0, 255), Color3.fromRGB(255, 60, 190), Color3.fromRGB(30, 140, 255) }
local v_u_9 = {}
local function v16(p10)
	-- upvalues: (copy) v_u_9
	if p10:IsA("Model") or p10:IsA("Folder") then
		for _, v11 in ipairs(p10:GetDescendants()) do
			if v11:IsA("BasePart") then
				local v12 = v11.Name
				local v13 = tonumber(v12)
				if v13 then
					v_u_9[v11] = v13 / 6
				end
			end
		end
	elseif p10:IsA("BasePart") then
		local v14 = p10.Name
		local v15 = tonumber(v14)
		if not v15 then
			return
		end
		v_u_9[p10] = v15 / 6
	end
end
local function v19(p17)
	-- upvalues: (copy) v_u_9
	if p17:IsA("Model") or p17:IsA("Folder") then
		for _, v18 in ipairs(p17:GetDescendants()) do
			if v18:IsA("BasePart") then
				v_u_9[v18] = nil
			end
		end
	elseif p17:IsA("BasePart") then
		v_u_9[p17] = nil
	end
end
for _, v20 in ipairs(v1:GetTagged("Octobloom")) do
	v16(v20)
end
v1:GetInstanceAddedSignal("Octobloom"):Connect(v16)
v1:GetInstanceRemovedSignal("Octobloom"):Connect(v19)
task.spawn(function()
	-- upvalues: (ref) v_u_5, (copy) v_u_9, (copy) v_u_8, (copy) v_u_6
	while v_u_5 do
		local v21 = tick() * 0.5
		for v22, v23 in pairs(v_u_9) do
			if v22.Parent then
				local v24 = (v21 + v23 / 6) % 2 - 1
				local v25 = math.abs(v24) * 3
				local v26 = math.floor(v25)
				local v27 = v25 % 1
				local v28 = v_u_8[v26 + 1]
				local v29 = v_u_8[v26 + 2 > 3 and 1 or v26 + 2]
				v22.Color = Color3.new(v28.R + (v29.R - v28.R) * v27, v28.G + (v29.G - v28.G) * v27, v28.B + (v29.B - v28.B) * v27)
			else
				v_u_9[v22] = nil
			end
		end
		task.wait(v_u_6)
	end
end)
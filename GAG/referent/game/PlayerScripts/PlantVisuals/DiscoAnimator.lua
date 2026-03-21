local v_u_1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("TweenService")
game:GetService("RunService")
require(game.ReplicatedStorage.Modules.CreateTagHandler)
local v3 = require(game.ReplicatedStorage.Modules.CreateTagHandlerWithAncestry)
require(game.ReplicatedStorage.Modules.Task.ThrottledTaskQueue)
require(game.ReplicatedStorage.Modules.Task)
local v4 = game.ReplicatedStorage.GameEvents.DiscoSetColor_RE
local v_u_5 = TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local v_u_6 = TweenInfo.new(2, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut)
local v_u_7 = 1
local v_u_8 = {
	Color3.fromHex("#ff50b3"),
	Color3.fromHex("#fff94a"),
	Color3.fromHex("#49ff46"),
	Color3.fromHex("#4ee2ff"),
	Color3.fromHex("#ff4646")
}
local v_u_9 = require(game.ReplicatedStorage.Modules.Settings.SettingsService)
local v10 = require(game.ReplicatedStorage.Modules.DataService)
local v_u_11 = not v_u_9:GetSetting("PerformanceMode")
local v_u_12 = nil
v_u_12 = v10:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_11, (copy) v_u_9, (ref) v_u_12
	v_u_11 = not v_u_9:GetSetting("PerformanceMode")
	if not v_u_11 then
		if v_u_12 then
			v_u_12:Disconnect()
			v_u_12 = nil
		end
	end
end)
local function v_u_20(p_u_13)
	-- upvalues: (ref) v_u_11, (copy) v_u_2, (copy) v_u_5, (copy) v_u_1, (copy) v_u_8, (ref) v_u_7, (copy) v_u_6
	if v_u_11 then
		local v14 = {
			Color3.fromHex("#FF007F"),
			Color3.fromHex("#FFD700"),
			Color3.fromHex("#00FFFF"),
			Color3.fromHex("#7FFF00"),
			Color3.fromHex("#8A2BE2")
		}
		local v15 = nil
		if workspace:GetAttribute(p_u_13) then
			v_u_2:Create(game.Lighting.ColorCorrection, v_u_5, {
				["Saturation"] = 0.3
			}):Play()
			task.spawn(function()
				-- upvalues: (copy) p_u_13, (ref) v_u_1, (ref) v_u_8, (ref) v_u_7
				while workspace:GetAttribute(p_u_13) == true do
					local v16 = v_u_1:GetTagged("Discofied")
					local v17 = v_u_8[v_u_7]
					for _, v18 in v16 do
						v18.Color = v17
					end
					task.wait(1)
					v_u_7 = v_u_7 + 1
					if v_u_7 > 5 then
						v_u_7 = 1
					end
				end
			end)
			while v_u_11 and workspace:GetAttribute(p_u_13) == true do
				for _, v19 in v14 do
					v_u_2:Create(game.Lighting, v_u_6, {
						["ColorShift_Top"] = v19
					}):Play()
					task.wait(1)
					if workspace:GetAttribute(p_u_13) ~= true then
						break
					end
				end
			end
		else
			if v15 then
				v15:Cancel()
			end
			v_u_2:Create(game.Lighting.ColorCorrection, v_u_5, {
				["Saturation"] = 0
			}):Play()
			task.delay(1.5, function()
				-- upvalues: (ref) v_u_2, (ref) v_u_5
				v_u_2:Create(game.Lighting, v_u_5, {
					["ColorShift_Top"] = Color3.fromRGB(0, 0, 0)
				}):Play()
			end)
		end
	end
end
local v_u_21 = {}
local v_u_22 = true
local v_u_23 = v3({
	["Tag"] = "Discofied",
	["RequiredAncestor"] = workspace,
	["OnInstanceAdded"] = function(_)
		-- upvalues: (ref) v_u_22
		v_u_22 = true
	end,
	["OnInstanceRemoved"] = function(_)
		-- upvalues: (ref) v_u_22
		v_u_22 = true
	end
})
task.spawn(function()
	-- upvalues: (ref) v_u_11, (ref) v_u_22, (copy) v_u_21, (copy) v_u_23, (copy) v_u_8, (ref) v_u_7
	while v_u_11 do
		if v_u_22 then
			table.clear(v_u_21)
			for v24, _ in v_u_23.GetTrackedInstances() do
				local v25 = v_u_21
				table.insert(v25, v24)
			end
			v_u_22 = false
		end
		local v26 = v_u_8[v_u_7]
		local v27 = #v_u_21
		if v27 > 0 then
			local v28 = v27 / 10
			local v29 = math.ceil(v28)
			local v30 = os.clock()
			for v31 = 0, 9 do
				local v32 = v31 * v29 + 1
				local v33 = v32 + v29 - 1
				for v34 = v32, math.min(v33, v27) do
					v_u_21[v34].Color = v26
				end
				if v31 < 9 then
					task.wait(0.05)
				end
			end
			local v35 = 1 - (os.clock() - v30)
			if v35 > 0 then
				task.wait(v35)
			end
		else
			task.wait(1)
		end
		v_u_7 = v_u_7 + 1
		if v_u_7 > 5 then
			v_u_7 = 1
		end
	end
end)
workspace:GetAttributeChangedSignal("DiscoEvent"):Connect(function()
	-- upvalues: (copy) v_u_20
	v_u_20("DiscoEvent")
end)
workspace:GetAttributeChangedSignal("SuperStorm"):Connect(function()
	-- upvalues: (copy) v_u_20
	v_u_20("SuperStorm")
end)
v4.OnClientEvent:Connect(function(p36)
	-- upvalues: (ref) v_u_11
	if p36 then
		if v_u_11 then
			for _, v37 in p36 do
				local v38 = v37.Part
				if v38 then
					local v39 = v37.Color
					if v39 then
						v38.Color = v39
					end
				end
			end
		end
	else
		return
	end
end)
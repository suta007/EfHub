game:GetService("CollectionService")
game:GetService("RunService")
local v_u_1 = game:GetService("Players")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
v2:WaitForChild("Modules")
local v4 = require(v2.Modules.CreateTagHandler)
local v_u_5 = {}
local v_u_6 = require(v2.Modules.Settings.SettingsService)
local v7 = require(v2.Modules.DataService)
local v_u_8 = not v_u_6:GetSetting("PerformanceMode")
local v_u_9 = nil
v_u_9 = v7:GetPathSignal("Settings/@"):Connect(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_6, (ref) v_u_9
	v_u_8 = not v_u_6:GetSetting("PerformanceMode")
	if not v_u_8 then
		if v_u_9 then
			v_u_9:Disconnect()
			v_u_9 = nil
		end
	end
end)
local function v_u_12(p10)
	-- upvalues: (copy) v_u_5
	v_u_5[p10] = {
		["Pupil"] = nil,
		["MainEye"] = nil,
		["Origin"] = CFrame.new(),
		["PupilOrigin"] = CFrame.new()
	}
	for _, v11 in p10:GetChildren() do
		if v11:GetAttribute("Pupil") then
			v_u_5[p10].Pupil = v11
			v_u_5[p10].PupilOrigin = v11.CFrame
		end
		if v11:GetAttribute("MainEye") then
			v_u_5[p10].MainEye = v11
			v_u_5[p10].Origin = v11.CFrame
		end
	end
end
v4({
	["Tag"] = "SeerModel",
	["OnInstanceAdded"] = function(p13)
		-- upvalues: (copy) v_u_12
		task.wait(2)
		v_u_12(p13)
	end,
	["OnInstanceRemoved"] = function(p14)
		-- upvalues: (copy) v_u_5
		v_u_5[p14] = nil
	end
})
local function v_u_21(p15)
	-- upvalues: (copy) v_u_1
	local v16 = 40
	local v17 = nil
	for _, v18 in v_u_1:GetPlayers() do
		local v19 = v18.Character
		if v19 then
			local v20 = (v19.PrimaryPart.Position - p15).Magnitude
			if v20 < v16 then
				v17 = v19
				v16 = v20
			end
		end
	end
	return v17
end
task.spawn(function()
	-- upvalues: (ref) v_u_8, (copy) v_u_5, (copy) v_u_21, (copy) v_u_3
	while v_u_8 do
		for v22, v23 in v_u_5 do
			local v24 = v22:FindFirstChild("Grow")
			if v24 then
				local v25 = v22:GetAttribute("MaxAge")
				if v25 and (v23.Pupil and (v23.Origin and v24.Age.Value >= v25)) then
					local v26 = v_u_21(v22.PrimaryPart.Position)
					if v26 then
						local v27 = v26.PrimaryPart.Position
						local v28 = (v23.MainEye.Size.Z - v23.Pupil.Size.Z) / 2
						local v29 = v23.Origin:PointToObjectSpace(v27)
						local v30 = v29.X
						local v31 = -v28
						local v32 = math.clamp(v30, v31, v28)
						local v33 = v29.Z
						local v34 = -v28
						local v35 = math.clamp(v33, v34, v28)
						local v36 = {
							["CFrame"] = v23.Origin * CFrame.new(v32, 0, v35)
						}
						v_u_3:Create(v23.Pupil, TweenInfo.new(0.4), v36):Play()
					else
						v_u_3:Create(v23.Pupil, TweenInfo.new(0.4), {
							["CFrame"] = v23.PupilOrigin
						}):Play()
					end
				end
			end
		end
		task.wait(0.4)
	end
end)
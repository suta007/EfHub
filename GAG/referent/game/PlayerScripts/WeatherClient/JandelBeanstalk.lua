local v1 = {}
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game:GetService("ReplicatedStorage")
game:GetService("SoundService")
local v_u_6 = require(v_u_5.Modules.SkyboxManager)
require(v_u_5.Modules.Notification)
local v_u_7 = require(v_u_5.Code.CameraShaker)
local v_u_8 = require(v_u_5.Code.Bezier)
local v_u_9 = require(v_u_5.Modules.SoundPlayer)
local v_u_10 = require(v_u_5.Data.SoundData)
local v_u_11 = require(v_u_5.Modules.WeatherMusicManager)
local v_u_12 = script:FindFirstChild("Sky")
if v_u_12 then
	v_u_6.AddSkybox(v_u_12, 0)
end
local v_u_13 = game.Lighting.ColorCorrection:Clone()
v_u_13.Name = script.Name
v_u_13.Parent = game.Lighting
local v_u_15 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p14)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p14
end)
v_u_15:Start()
local v_u_16 = {}
local v_u_17 = Color3.new(1, 1, 1)
local function v_u_20(p18)
	-- upvalues: (copy) v_u_17
	if p18:IsA("Model") or p18:IsA("BasePart") then
		if not p18:FindFirstChildWhichIsA("Highlight") then
			local v19 = Instance.new("Highlight")
			v19.FillColor = v_u_17
			v19.OutlineColor = v_u_17
			v19.FillTransparency = 0.75
			v19.OutlineTransparency = 0
			v19.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			v19.Adornee = p18
			v19.Parent = p18
		end
	else
		return
	end
end
local v_u_21 = {
	["RollOffMaxDistance"] = 60000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 0.75,
	["PlaybackSpeed"] = 1,
	["Looped"] = true
}
local v_u_22 = {
	["RollOffMaxDistance"] = 5000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 0.75,
	["PlaybackSpeed"] = 1
}
local v_u_23 = false
local v_u_24 = ""
local v_u_25 = {}
local v_u_26 = {}
local v_u_27 = nil
local v_u_28 = nil
local v_u_29 = nil
local function v_u_32()
	-- upvalues: (copy) v_u_25, (copy) v_u_26
	for _, v30 in v_u_25 do
		task.cancel(v30)
	end
	for _, v31 in v_u_26 do
		v31:Disconnect()
	end
	table.clear(v_u_25)
	table.clear(v_u_26)
end
local function v_u_42(p33)
	-- upvalues: (ref) v_u_29
	if not v_u_29 then
		local v34 = (math.random() * 2 - 1) * 120
		local v35 = p33 or 8 + math.random() * 17
		local v36 = (math.random() * 2 - 1) * 120
		return Vector3.new(v34, v35, v36)
	end
	local v37 = v_u_29.Position
	local v38 = v_u_29.Size * 0.5
	local v39 = v37.X + (math.random() * 2 - 1) * v38.X
	local v40 = p33 or v37.Y + 8 + math.random() * 17
	local v41 = v37.Z + (math.random() * 2 - 1) * v38.Z
	return Vector3.new(v39, v40, v41)
end
local function v_u_65(p_u_43)
	-- upvalues: (copy) v_u_15, (copy) v_u_7, (ref) v_u_27, (copy) v_u_8, (copy) v_u_2, (copy) v_u_4, (copy) v_u_3, (copy) v_u_9, (copy) v_u_10, (copy) v_u_22
	v_u_15:Shake(v_u_7.Presets.Bump)
	local v44
	if v_u_27 then
		v44 = v_u_27:IsA("BasePart") and v_u_27.Position or v_u_27:GetPivot().Position
	else
		local v45 = p_u_43.X
		local v46 = p_u_43.Z
		v44 = Vector3.new(v45, 30, v46)
	end
	local v47 = v_u_8.new
	local v48 = v44 + Vector3.new(0, 10, 0)
	local v49 = p_u_43.X
	local v50 = v44.Y * 0.25
	local v51 = p_u_43.Z
	local v_u_52 = v47(v44, v48, Vector3.new(v49, v50, v51), p_u_43)
	if v_u_27 then
		local v_u_53 = v_u_27:Clone()
		v_u_53:PivotTo(CFrame.new(v44))
		v_u_53.Parent = workspace.WeatherVisuals
		local v_u_54 = v_u_53:IsA("BasePart")
		local v_u_55 = v44
		local v_u_56 = 0
		local v_u_57 = nil
		v_u_57 = v_u_2.Heartbeat:Connect(function(p58)
			-- upvalues: (ref) v_u_56, (copy) v_u_52, (copy) v_u_54, (ref) v_u_55, (copy) v_u_53, (ref) v_u_57
			local v59 = v_u_56 + p58 / 0.55
			v_u_56 = math.min(v59, 1)
			local v60 = v_u_52:Get(v_u_56)
			if v_u_54 then
				local v61 = v60 - v_u_55
				if v61.Magnitude > 0.01 then
					v_u_53.CFrame = CFrame.lookAt(v60, v60 + v61)
				else
					v_u_53.Position = v60
				end
			else
				v_u_53:PivotTo(CFrame.new(v60))
			end
			v_u_55 = v60
			if v_u_56 >= 1 then
				v_u_57:Disconnect()
			end
		end)
		v_u_4:AddItem(v_u_53, 0.65)
	end
	task.delay(0.55, function()
		-- upvalues: (copy) p_u_43, (ref) v_u_4, (ref) v_u_3, (ref) v_u_9, (ref) v_u_10, (ref) v_u_22
		local v62 = Instance.new("Attachment")
		v62.WorldPosition = p_u_43
		v62.Parent = workspace.Terrain
		if script:FindFirstChild("DustSprinkle") then
			local v63 = script.DustSprinkle:Clone()
			v63.Parent = v62
			v63:Emit(40)
			v_u_4:AddItem(v63, 3)
		else
			local v64 = Instance.new("Part")
			v64.Shape = Enum.PartType.Ball
			v64.Size = Vector3.new(1, 1, 1)
			v64.Position = p_u_43
			v64.Anchored = true
			v64.CanCollide = false
			v64.Material = Enum.Material.Neon
			v64.Color = Color3.fromRGB(255, 180, 255)
			v64.CastShadow = false
			v64.Parent = workspace.WeatherVisuals
			v_u_3:Create(v64, TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
				["Size"] = Vector3.new(8, 8, 8),
				["Transparency"] = 1
			}):Play()
			v_u_4:AddItem(v64, 1)
		end
		v_u_9:PlaySound(v_u_10.Weather.JandelBeanstalk.Sprinkle, v_u_22, nil, v62)
		v_u_4:AddItem(v62, 4)
	end)
end
local function v_u_84()
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (copy) v_u_12, (copy) v_u_6, (ref) v_u_27, (ref) v_u_28, (copy) v_u_9, (copy) v_u_10, (copy) v_u_21, (ref) v_u_23, (ref) v_u_24, (copy) v_u_25, (copy) v_u_42, (copy) v_u_8, (copy) v_u_2
	v_u_3:Create(v_u_13, TweenInfo.new(2), {
		["Brightness"] = 0.08,
		["TintColor"] = Color3.fromRGB(230, 210, 255)
	}):Play()
	v_u_3:Create(game.Lighting, TweenInfo.new(2), {
		["Ambient"] = Color3.fromRGB(120, 80, 160)
	}):Play()
	v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Haze"] = 1.2,
		["Density"] = 0.2,
		["Color"] = Color3.fromRGB(180, 140, 255),
		["Decay"] = Color3.fromRGB(200, 160, 255)
	}):Play()
	if v_u_12 then
		v_u_6.UpdateSkybox(v_u_12, 2)
	end
	if script:FindFirstChild("PixieFairy") then
		v_u_27 = script.PixieFairy:Clone()
	else
		v_u_27 = Instance.new("Part")
		v_u_27.Name = "PixieFairy"
		v_u_27.Shape = Enum.PartType.Ball
		v_u_27.Size = Vector3.new(3, 3, 3)
		v_u_27.Material = Enum.Material.Neon
		v_u_27.Color = Color3.fromRGB(255, 100, 255)
		v_u_27.Anchored = true
		v_u_27.CanCollide = false
		v_u_27.CastShadow = false
	end
	v_u_27.Parent = workspace.WeatherVisuals
	local v66 = script:FindFirstChild("Particles")
	if v66 then
		local v67 = Instance.new("Attachment")
		v67.Name = "ParticleAttachment"
		v67.Parent = v_u_27
		for _, v68 in v66:GetDescendants() do
			v68:Clone().Parent = v67
		end
	else
		warn("[JB:Pixie] script.Particles folder not found - no orb particles")
	end
	v_u_28 = v_u_9:PlaySound(v_u_10.Weather.JandelBeanstalk.PixieFly, v_u_21, nil, v_u_27)
	local v_u_69 = Instance.new("PointLight")
	v_u_69.Color = Color3.fromRGB(200, 130, 255)
	v_u_69.Brightness = 3
	v_u_69.Range = 24
	v_u_69.Parent = v_u_27
	local v70 = task.spawn(function()
		-- upvalues: (ref) v_u_23, (ref) v_u_24, (ref) v_u_3, (copy) v_u_69
		while v_u_23 and v_u_24 == "Pixie" do
			v_u_3:Create(v_u_69, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				["Brightness"] = 6,
				["Range"] = 40
			}):Play()
			task.wait(0.4)
			v_u_3:Create(v_u_69, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				["Brightness"] = 2,
				["Range"] = 20
			}):Play()
			task.wait(0.4)
		end
	end)
	local v71 = v_u_25
	table.insert(v71, v70)
	local v82 = task.spawn(function()
		-- upvalues: (ref) v_u_42, (ref) v_u_27, (ref) v_u_23, (ref) v_u_24, (ref) v_u_8, (ref) v_u_2, (ref) v_u_3
		local v72 = v_u_42()
		if v_u_27:IsA("BasePart") then
			v_u_27.Position = v72
		else
			v_u_27:PivotTo(CFrame.new(v72))
		end
		while v_u_23 and v_u_24 == "Pixie" do
			local v73 = v_u_42()
			local v74 = v_u_8.new(v72, v_u_42(), v_u_42(), v73)
			local v75 = 1.8 + math.random() * 2.2
			local v76 = os.clock()
			local v77 = 0
			while v77 < 1 and (v_u_23 and v_u_24 == "Pixie") do
				v_u_2.Heartbeat:Wait()
				local v78 = os.clock()
				local v79 = v77 + (v78 - v76) / v75
				v77 = math.min(v79, 1)
				local v80 = v74:Get(v77)
				if v_u_27:IsA("BasePart") then
					local v81 = v80 - v_u_27.Position
					if v81.Magnitude > 0.01 then
						v_u_27.CFrame = CFrame.lookAt(v80, v80 + v81)
						v76 = v78
					else
						v_u_27.Position = v80
						v76 = v78
					end
				else
					v_u_27:PivotTo(CFrame.new(v80))
					v76 = v78
				end
			end
			v72 = v73
		end
		if v_u_27 and v_u_27:IsA("BasePart") then
			v_u_3:Create(v_u_27, TweenInfo.new(1.5), {
				["Size"] = Vector3.new(0, 0, 0),
				["Transparency"] = 1
			}):Play()
			task.wait(1.6)
		end
		if v_u_27 then
			v_u_27:Destroy()
			v_u_27 = nil
		end
	end)
	local v83 = v_u_25
	table.insert(v83, v82)
end
local function v_u_87()
	-- upvalues: (copy) v_u_32, (ref) v_u_24, (copy) v_u_15, (copy) v_u_7, (copy) v_u_3, (copy) v_u_13, (copy) v_u_25
	v_u_32()
	v_u_24 = "Beanstalk"
	v_u_15:Shake(v_u_7.Presets.Explosion)
	v_u_3:Create(v_u_13, TweenInfo.new(1.5), {
		["Brightness"] = 0.12,
		["TintColor"] = Color3.fromRGB(255, 230, 180)
	}):Play()
	v_u_3:Create(game.Lighting, TweenInfo.new(1.5), {
		["Ambient"] = Color3.fromRGB(60, 110, 50)
	}):Play()
	local v85 = task.spawn(function()
		-- upvalues: (ref) v_u_3
		task.wait(4.4)
		v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(3), {
			["FieldOfView"] = 60
		}):Play()
		task.wait(5.5)
		v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(2), {
			["FieldOfView"] = 70
		}):Play()
	end)
	local v86 = v_u_25
	table.insert(v86, v85)
end
local v_u_88 = game:GetService("Players").LocalPlayer
local function v_u_91()
	-- upvalues: (copy) v_u_88, (copy) v_u_3, (copy) v_u_4, (copy) v_u_15, (copy) v_u_7, (copy) v_u_13
	local v89 = Instance.new("ScreenGui")
	v89.Name = "JB_SummitFlash"
	v89.ResetOnSpawn = false
	v89.IgnoreGuiInset = true
	v89.DisplayOrder = 200
	v89.Parent = v_u_88.PlayerGui
	local v90 = Instance.new("Frame")
	v90.Size = UDim2.new(1, 0, 1, 0)
	v90.BackgroundColor3 = Color3.fromRGB(255, 230, 100)
	v90.BackgroundTransparency = 0
	v90.BorderSizePixel = 0
	v90.Parent = v89
	v_u_3:Create(v90, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
		["BackgroundTransparency"] = 1
	}):Play()
	v_u_4:AddItem(v89, 2.2)
	v_u_15:Shake(v_u_7.Presets.Explosion)
	v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(0.2), {
		["FieldOfView"] = 85
	}):Play()
	task.delay(0.3, function()
		-- upvalues: (ref) v_u_3
		v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(1.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["FieldOfView"] = 70
		}):Play()
	end)
	v_u_3:Create(v_u_13, TweenInfo.new(0.2), {
		["TintColor"] = Color3.fromRGB(255, 220, 100),
		["Brightness"] = 0.4,
		["Saturation"] = 0.3
	}):Play()
	task.delay(1, function()
		-- upvalues: (ref) v_u_3, (ref) v_u_13
		v_u_3:Create(v_u_13, TweenInfo.new(2), {
			["TintColor"] = Color3.fromRGB(255, 240, 200),
			["Brightness"] = 0.18,
			["Saturation"] = 0
		}):Play()
	end)
end
local function v_u_92()
	-- upvalues: (copy) v_u_3, (copy) v_u_13, (ref) v_u_23, (ref) v_u_24
	v_u_3:Create(game.Lighting, TweenInfo.new(1.5), {
		["Ambient"] = Color3.fromRGB(163, 151, 109)
	}):Play()
	v_u_3:Create(v_u_13, TweenInfo.new(1.5), {
		["Brightness"] = 0.18,
		["TintColor"] = Color3.fromRGB(255, 240, 200)
	}):Play()
	task.spawn(function()
		-- upvalues: (ref) v_u_23, (ref) v_u_24, (ref) v_u_3, (ref) v_u_13
		while v_u_23 and v_u_24 == "Jandel" do
			v_u_3:Create(v_u_13, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				["Brightness"] = 0.25
			}):Play()
			task.wait(0.8)
			v_u_3:Create(v_u_13, TweenInfo.new(0.8, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
				["Brightness"] = 0.12
			}):Play()
			task.wait(0.8)
		end
	end)
end
local function v_u_94()
	-- upvalues: (ref) v_u_24, (copy) v_u_84, (copy) v_u_87, (copy) v_u_92
	local v93 = workspace:GetAttribute("JandelBeanstalk_Phase")
	if v93 then
		v_u_24 = v93
		if v93 == "Pixie" then
			v_u_84()
			return
		elseif v93 == "Beanstalk" then
			v_u_87()
		elseif v93 == "Jandel" then
			task.spawn(v_u_92)
		end
	else
		return
	end
end
local function v_u_118()
	-- upvalues: (ref) v_u_23, (copy) v_u_11, (copy) v_u_10, (ref) v_u_29, (copy) v_u_5, (copy) v_u_65, (copy) v_u_16, (copy) v_u_20, (copy) v_u_91, (copy) v_u_94, (ref) v_u_24, (copy) v_u_84, (copy) v_u_87, (copy) v_u_92
	if v_u_23 then
		return
	else
		v_u_23 = true
		v_u_11.Start("JandelBeanstalk", {
			["soundId"] = v_u_10.Weather.JandelBeanstalk.Music,
			["priority"] = 12,
			["volume"] = 0.6
		})
		v_u_29 = workspace:FindFirstChild("PixieDustBounds")
		local v95 = v_u_5.GameEvents:FindFirstChild("JB_Sprinkle")
		if v95 then
			local v100 = v95.OnClientEvent:Connect(function(p96)
				-- upvalues: (ref) v_u_65
				local v97 = v_u_65
				local v98 = p96.X
				local v99 = p96.Z
				v97((Vector3.new(v98, 0.5, v99)))
			end)
			local v101 = v_u_16
			table.insert(v101, v100)
		else
			warn("[JandelBeanstalk] JB_Sprinkle RemoteEvent not found - dust bursts won\'t fire")
		end
		local v102 = workspace:FindFirstChild("JB_WorldPlants")
		if v102 then
			for _, v103 in v102:GetChildren() do
				v_u_20(v103)
			end
			local v104 = v102.ChildAdded:Connect(v_u_20)
			local v105 = v_u_16
			table.insert(v105, v104)
		else
			local v110 = workspace.ChildAdded:Connect(function(p106)
				-- upvalues: (ref) v_u_20, (ref) v_u_16
				if p106.Name == "JB_WorldPlants" then
					for _, v107 in p106:GetChildren() do
						v_u_20(v107)
					end
					local v108 = p106.ChildAdded:Connect(v_u_20)
					local v109 = v_u_16
					table.insert(v109, v108)
				end
			end)
			local v111 = v_u_16
			table.insert(v111, v110)
		end
		local v112 = v_u_5.GameEvents:FindFirstChild("JB_Summit")
		if v112 then
			local v113 = v112.OnClientEvent:Connect(function()
				-- upvalues: (ref) v_u_91
				v_u_91()
			end)
			local v114 = v_u_16
			table.insert(v114, v113)
		end
		local v115 = workspace:GetAttributeChangedSignal("JandelBeanstalk_Phase"):Connect(v_u_94)
		local v116 = v_u_16
		table.insert(v116, v115)
		local v117 = workspace:GetAttribute("JandelBeanstalk_Phase")
		if v117 then
			v_u_24 = v117
			if v117 == "Pixie" then
				v_u_84()
				return
			elseif v117 == "Beanstalk" then
				v_u_87()
			elseif v117 == "Jandel" then
				task.spawn(v_u_92)
			end
		else
			return
		end
	end
end
local function v_u_121()
	-- upvalues: (ref) v_u_23, (ref) v_u_24, (copy) v_u_32, (copy) v_u_16, (copy) v_u_11, (ref) v_u_28, (copy) v_u_3, (copy) v_u_13, (copy) v_u_12, (copy) v_u_6, (ref) v_u_27, (copy) v_u_4
	if v_u_23 then
		v_u_23 = false
		v_u_24 = ""
		v_u_32()
		for _, v119 in v_u_16 do
			v119:Disconnect()
		end
		table.clear(v_u_16)
		v_u_11.Stop("JandelBeanstalk")
		if v_u_28 then
			v_u_28:Stop()
			v_u_28 = nil
		end
		v_u_3:Create(v_u_13, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = game.Lighting:GetAttribute("DefaultOutdoorAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Haze"] = 0,
			["Density"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		v_u_3:Create(workspace.CurrentCamera, TweenInfo.new(1.5), {
			["FieldOfView"] = 70
		}):Play()
		if v_u_12 then
			v_u_6.UpdateSkybox(v_u_12, 0)
		end
		if v_u_27 then
			v_u_27:Destroy()
			v_u_27 = nil
		end
		for _, v120 in workspace.WeatherVisuals:GetChildren() do
			if v120.Name:find("JB_") or v120.Name == "PixieFairy" then
				v_u_4:AddItem(v120, 2)
			end
		end
	end
end
workspace:GetAttributeChangedSignal("JandelBeanstalk"):Connect(function()
	-- upvalues: (copy) v_u_118, (copy) v_u_121
	if workspace:GetAttribute("JandelBeanstalk") == true then
		v_u_118()
	else
		v_u_121()
	end
end)
if workspace:GetAttribute("JandelBeanstalk") == true then
	task.defer(v_u_118)
else
	v_u_121()
end
return v1
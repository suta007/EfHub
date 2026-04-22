local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = require(v5.Modules.SoundPlayer)
local v_u_7 = require(v5.Data.SoundData)
local v_u_8 = require(v5.Modules.WeatherMusicManager)
local v_u_9 = script.Sky
local v_u_10 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_10.AddSkybox(v_u_9)
local v_u_11 = game.Lighting.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = game.Lighting
local v_u_12 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_13 = game:GetService("Debris")
local v_u_14 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_16 = v_u_14.new(Enum.RenderPriority.Camera.Value, function(p15)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p15
end)
v_u_16:Start()
local v_u_17 = nil
local v_u_18 = nil
local v_u_19 = {
	["RollOffMaxDistance"] = 50000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 5,
	["PlaybackSpeed"] = 0.65
}
local v_u_20 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 1.5,
	["PlaybackSpeed"] = 0.5
}
local v_u_21 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 0.001,
	["PlaybackSpeed"] = 1,
	["TimePosition"] = 2
}
local v_u_22 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 4,
	["PlaybackSpeed"] = 1.3,
	["TimePosition"] = 0.3
}
local v_u_23 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 5,
	["PlaybackSpeed"] = 1.3,
	["TimePosition"] = 0
}
local function v_u_42(p24, p25, p26)
	-- upvalues: (copy) v_u_13
	local v27 = p26 or 5
	for _ = 1, p25 or 20 do
		local v28 = Instance.new("Part")
		local v29 = math.random(1, 3)
		local v30 = math.random(1, 3)
		local v31 = math.random
		v28.Size = Vector3.new(v29, v30, v31(1, 3))
		local v32 = CFrame.new
		local v33 = math.random(-5, 5)
		local v34 = math.random
		v28.CFrame = v32(p24 + Vector3.new(v33, 0, v34(-5, 5)))
		v28.Anchored = false
		v28.CanCollide = false
		v28.Material = Enum.Material.Plastic
		v28.Color = Color3.fromRGB(91, 154, 76)
		local v35 = math.random(-360, 360)
		local v36 = math.random(-360, 360)
		local v37 = math.random
		v28.AssemblyAngularVelocity = Vector3.new(v35, v36, v37(-360, 360))
		local v38 = Instance.new("BodyVelocity")
		local v39 = math.random(-125, 125)
		local v40 = math.random(90, 130)
		local v41 = math.random
		v38.Velocity = Vector3.new(v39, v40, v41(-125, 125))
		v38.P = 1000
		v38.MaxForce = Vector3.new(100000, 100000, 100000)
		v38.Parent = v28
		v28.Parent = workspace
		v_u_13:AddItem(v38, 0.2)
		v_u_13:AddItem(v28, v27)
	end
end
local function v_u_78(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_12, (copy) v_u_3, (copy) v_u_11, (copy) v_u_10, (copy) v_u_9, (copy) v_u_16, (copy) v_u_14, (copy) v_u_6, (copy) v_u_7, (copy) v_u_19, (copy) v_u_20, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_42, (ref) v_u_17, (ref) v_u_18, (copy) v_u_4, (copy) v_u_13
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_8.Start("BoomboxParty", {
			["priority"] = 12
		})
		v_u_12:CreateNotification("IT\'S PARTY TIME!")
		v_u_3:Create(v_u_11, TweenInfo.new(2), {
			["Brightness"] = 0.1
		}):Play()
		v_u_3:Create(game.Lighting, TweenInfo.new(2), {
			["Ambient"] = Color3.fromRGB(60, 162, 230),
			["Brightness"] = 1
		}):Play()
		v_u_3:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
			["Haze"] = 2.5,
			["Density"] = 0.5,
			["Offset"] = 1,
			["Color"] = Color3.fromRGB(0, 0, 0),
			["Decay"] = Color3.fromRGB(0, 0, 0)
		}):Play()
		v_u_10.UpdateSkybox(v_u_9, 2)
		local v_u_43 = script["Boombox\'s"]:Clone()
		v_u_43.Parent = workspace.WeatherVisuals
		local v44 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v45 = script.Parent.Dissonant.InvertedSphere:Clone()
		v45.Name = "BOXSPHERE"
		v45.Parent = workspace.WeatherVisuals
		v_u_3:Create(v45, v44, {
			["Transparency"] = 0.6
		}):Play()
		task.wait(2)
		v_u_16:Shake(v_u_14.Presets.Bump)
		local v46 = {}
		for _, v47 in v_u_43:GetChildren() do
			v47.Attachment.Flash:Emit(1)
			v47.Smoke:Emit(3)
			v_u_6:PlaySound(v_u_7.Weather.BoomboxParty.Boomboxs.Poof, v_u_19, nil, v47)
			v_u_6:PlaySound(v_u_7.Weather.BoomboxParty.Boomboxs.PopSound, v_u_20, nil, v47)
			local v48 = v_u_6:PlaySound(v_u_7.Weather.BoomboxParty.Boomboxs.Air, v_u_21, nil, v47)
			table.insert(v46, v48)
			local v49 = TweenInfo.new(1, Enum.EasingStyle.Back, Enum.EasingDirection.Out, 0, false, 0)
			v_u_3:Create(v47.Mesh, v49, {
				["Scale"] = Vector3.new(128, 113, 168)
			}):Play()
		end
		task.wait(1)
		v_u_43["1"].Lines.Enabled = true
		v_u_43["2"].Lines.Enabled = true
		local v50 = TweenInfo.new(1.3, Enum.EasingStyle.Exponential, Enum.EasingDirection.In, 0, false, 0)
		v_u_3:Create(v_u_43["1"].Lines, v50, {
			["TimeScale"] = 1
		}):Play()
		v_u_3:Create(v_u_43["2"].Lines, v50, {
			["TimeScale"] = 1
		}):Play()
		for _, v51 in v46 do
			v_u_3:Create(v51, v50, {
				["Volume"] = 6
			}):Play()
		end
		v_u_3:Create(v_u_43["1"], v50, {
			["CFrame"] = CFrame.new(-104.5, 24.5, 178.5)
		}):Play()
		v_u_3:Create(v_u_43["2"], v50, {
			["CFrame"] = CFrame.new(-104.5, 24.5, -205.5) * CFrame.Angles(0, -3.141592653589793, 0)
		}):Play()
		local v_u_52 = workspace.CurrentCamera
		v_u_3:Create(v_u_52, v50, {
			["FieldOfView"] = 63
		}):Play()
		task.wait(0.3)
		v_u_16:ShakeSustain(v_u_14.Presets.Earthquake)
		task.wait(1)
		v_u_16:StopSustained()
		v_u_16:Shake(v_u_14.Presets.Bump)
		local v53 = 1
		for _, v54 in v_u_43:GetChildren() do
			v_u_6:PlaySound(v_u_7.Weather.BoomboxParty.Boomboxs.Land, v_u_22, nil, v54)
			v_u_6:PlaySound(v_u_7.Weather.BoomboxParty.Boomboxs.Land2, v_u_23, nil, v54)
			v54.Sparkles:Emit(15)
			v54.Attachment.Flash:Emit(1)
			v46[v53]:Stop()
			v53 = v53 + 1
			v54.Attachment.Smoke:Emit(40)
			v54.Attachment.Shockwave:Emit(1)
			v54.Attachment.Smoke3D:Emit(20)
			v54.Lines.Enabled = false
			local v55 = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, true, 0)
			v_u_3:Create(v54.Mesh, v55, {
				["Scale"] = Vector3.new(179.2, 67.8, 235.2)
			}):Play()
			v_u_3:Create(v54, v55, {
				["CFrame"] = v54.CFrame * CFrame.new(0, -9.8, 0)
			}):Play()
			v_u_42(v54.Position, 20, 6)
		end
		local v56 = workspace.BasePlate.TopBaseplate
		local v57 = script.Sparkles:Clone()
		v57.Parent = v56
		v57:Emit(35)
		v57.Enabled = true
		v_u_3:Create(v_u_52, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
			["FieldOfView"] = 80
		}):Play()
		v_u_17 = v_u_8.Start("BoomboxParty", {
			["soundId"] = v_u_7.Weather.BoomboxParty.Music,
			["priority"] = 12,
			["volume"] = 1,
			["playbackSpeed"] = 1,
			["timePosition"] = 0.25,
			["fadeIn"] = 0.25
		})
		task.delay(0.25, function()
			-- upvalues: (ref) v_u_3, (copy) v_u_52
			v_u_3:Create(v_u_52, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.InOut, 0, false, 0), {
				["FieldOfView"] = 70
			}):Play()
		end)
		v_u_52.FieldOfView = 70
		local v_u_58 = 70
		if v_u_18 then
			v_u_18:Disconnect()
			v_u_18 = nil
		end
		v_u_18 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_17, (ref) v_u_58, (copy) v_u_43, (copy) v_u_52
			if v_u_17 and v_u_17.IsPlaying then
				local v59 = (v_u_17.PlaybackLoudness or 0) / 1000
				local v60 = math.clamp(v59, 0, 1)
				local v61 = v60 * 15 + 70
				local v62 = v60 * 1.5 + 1
				v_u_58 = v_u_58 + (v61 - v_u_58) * 0.2
				local v63 = v_u_43["1"]
				local v64 = v62 * 24.5
				v63.Position = Vector3.new(-104.5, v64, 178.5)
				local v65 = v_u_43["2"]
				local v66 = v62 * 24.5
				v65.Position = Vector3.new(-104.5, v66, -205.5)
				local v67 = v_u_43["1"].Mesh
				local v68 = v62 * 128
				local v69 = v62 * 113
				local v70 = v62 * 168
				v67.Scale = Vector3.new(v68, v69, v70)
				local v71 = v_u_43["2"].Mesh
				local v72 = v62 * 128
				local v73 = v62 * 113
				local v74 = v62 * 168
				v71.Scale = Vector3.new(v72, v73, v74)
				v_u_52.FieldOfView = v_u_58
			end
		end)
		local v75 = 0
		while v_u_2 == true do
			v75 = (v75 + 0.01) % 1
			v56.Color = Color3.fromHSV(v75, 1, 0.6)
			game.Lighting.Ambient = Color3.fromHSV(v75, 1, 0.6)
			game.Lighting.OutdoorAmbient = Color3.fromHSV(v75, 1, 0.6)
			task.wait(0.05)
		end
		v56.Color = Color3.fromRGB(91, 154, 76)
		if v57 then
			v57.Enabled = false
		end
		if v_u_18 then
			v_u_18:Disconnect()
			v_u_18 = nil
		end
		game.Lighting:SetAttribute("DefaultOutdoorAmbient", Color3.fromRGB(128, 128, 128))
		v_u_52.FieldOfView = 70
		for _, v76 in v_u_43:GetChildren() do
			local v77 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
			v_u_3:Create(v76.Mesh, v77, {
				["Scale"] = Vector3.new(0, 0, 0)
			}):Play()
		end
		v_u_13:AddItem(v_u_43, 2)
		v_u_13:AddItem(v57, 5)
	end
end
local function v_u_80(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_18, (ref) v_u_17, (copy) v_u_8, (copy) v_u_10, (copy) v_u_9, (copy) v_u_3, (copy) v_u_11
	if v_u_2 ~= false then
		v_u_2 = false
		if v_u_18 then
			v_u_18:Disconnect()
			v_u_18 = nil
		end
		v_u_17 = nil
		v_u_8.Stop("BoomboxParty")
		v_u_10.UpdateSkybox(v_u_9, 0)
		local v79 = workspace.WeatherVisuals:FindFirstChild("BOXSPHERE")
		if v79 then
			v_u_3:Create(v79, TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
				["Transparency"] = 1
			}):Play()
			task.wait(2)
			if v79 then
				v79:Destroy()
			end
		end
		game.TweenService:Create(v_u_11, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = game.Lighting:GetAttribute("DefaultOutdoorAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Haze"] = 0,
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
	end
end
workspace:GetAttributeChangedSignal("BoomboxParty"):Connect(function()
	-- upvalues: (copy) v_u_78, (copy) v_u_80
	if workspace:GetAttribute("BoomboxParty") == true then
		v_u_78()
	else
		v_u_80()
	end
end)
if workspace:GetAttribute("BoomboxParty") then
	task.defer(function()
		-- upvalues: (copy) v_u_78
		v_u_78(true)
	end)
else
	v_u_80(true)
end
return v1
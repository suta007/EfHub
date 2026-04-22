local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = script.Sky
local v_u_5 = require(game.ReplicatedStorage.Modules.SkyboxManager)
v_u_5.AddSkybox(v_u_4)
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v7 = game:GetService("ReplicatedStorage")
local v_u_8 = require(v7.Modules.SoundPlayer)
local v_u_9 = require(v7.Data.SoundData)
local v_u_10 = require(v7.Modules.WeatherMusicManager)
local v_u_11 = game.SoundService.Music.Tunes
local v_u_12 = nil
local v_u_13 = Color3.new(1, 1, 1)
local v_u_14 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 10,
	["PlaybackSpeed"] = 0.65
}
local v_u_15 = {
	["RollOffMaxDistance"] = 10000,
	["RollOffMinDistance"] = 10,
	["RollOffMode"] = Enum.RollOffMode.Inverse,
	["Volume"] = 10,
	["PlaybackSpeed"] = 1.3
}
local function v_u_23(p16, p17, p18, p19, p20, p21)
	-- upvalues: (copy) v_u_8
	p17.PlaybackSpeed = p17.PlaybackSpeed + math.random(p18 * 1000, p19 * 1000) / 1000
	local v_u_22 = v_u_8:PlaySound(p16, p17, nil, p20)
	if not p21 then
		task.delay(8, function()
			-- upvalues: (copy) v_u_22
			if v_u_22 then
				v_u_22:Destroy()
			end
		end)
	end
end
local v_u_24 = require(game.ReplicatedStorage.Modules.ScreenShakeCore)
local function v_u_40(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_11, (copy) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_3, (copy) v_u_5, (copy) v_u_4, (copy) v_u_24, (copy) v_u_23, (copy) v_u_14, (copy) v_u_15, (ref) v_u_12, (ref) v_u_13
	if v_u_2 ~= true then
		v_u_2 = true
		local v25 = {
			["RollOffMaxDistance"] = 10000,
			["RollOffMinDistance"] = 10,
			["RollOffMode"] = Enum.RollOffMode.Inverse,
			["SoundGroup"] = v_u_11,
			["Looped"] = true,
			["Volume"] = 0.15
		}
		v_u_10.Start("DiscoParty", {
			["priority"] = 12
		})
		sound = v_u_8:PlaySound(v_u_9.Weather.DiscoParty.Music, v25)
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
		task.wait(0.9)
		v_u_5.UpdateSkybox(v_u_4, 2)
		local v_u_26 = script.DiscoSphere:Clone()
		v_u_26:WaitForChild("AnimationController")
		v_u_26.Parent = workspace.WeatherVisuals
		v_u_26.AnimationController:WaitForChild("Animator"):LoadAnimation(script.DiscoSpin):Play(nil, nil, 0.6)
		v_u_26.Sphere.Smoke:Emit(3)
		v_u_26.Sphere.Sparkles:Emit(8)
		v_u_26.Sphere.Flashes:Emit(4)
		v_u_24:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3)
		v_u_24:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6)
		v_u_23(v_u_9.Weather.DiscoParty.Poof, v_u_14, -0.2, 0.2, v_u_26)
		v_u_23(v_u_9.Weather.DiscoParty.Poof2, v_u_15, -0.2, 0.2, v_u_26)
		local v27 = game.Players.LocalPlayer.Character
		local v28 = v27 and v27:FindFirstChild("Humanoid") ~= nil and v27.Humanoid:FindFirstChild("Animator")
		if v28 then
			v_u_12 = v28:LoadAnimation(script.Dances["Dance" .. math.random(1, 3)])
			v_u_12:Play()
			v_u_12.Priority = Enum.AnimationPriority.Action4
		end
		local function v30()
			-- upvalues: (copy) v_u_26
			for _, v29 in v_u_26.Discs:GetChildren() do
				v29.Color = Color3.fromHSV(math.random(), 1, 1)
			end
		end
		local v_u_31 = workspace.CurrentCamera
		v_u_31.FieldOfView = 70
		local v_u_32 = 70
		local v36 = game:GetService("RunService").RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_32, (copy) v_u_31
			if sound.IsPlaying then
				local v33 = (sound.PlaybackLoudness or 0) / 1000
				local v34 = math.clamp(v33, 0, 1)
				local v35 = v34 * 15 + 70
				local _ = v34 * 1.5 + 1
				v_u_32 = v_u_32 + (v35 - v_u_32) * 0.2
				v_u_31.FieldOfView = v_u_32
			end
		end)
		local v37 = 0.4
		local v38 = workspace.BasePlate.TopBaseplate
		local v39 = 0
		v_u_13 = v38.Color
		while v_u_2 == true do
			v39 = (v39 + 0.01) % 1
			v38.Color = Color3.fromHSV(v39, 1, 0.6)
			game.Lighting.Ambient = Color3.fromHSV(v39, 1, 0.6)
			game.Lighting.OutdoorAmbient = Color3.fromHSV(v39, 1, 0.6)
			v37 = v37 - 0.05
			if v37 <= 0 then
				v30()
				v37 = 0.4
			end
			task.wait(0.05)
		end
		if v_u_12 then
			v_u_12:Stop()
		end
		v_u_12 = nil
		if v36 then
			v36:Disconnect()
		end
		v_u_31.FieldOfView = 70
		v38.Color = v_u_13
	end
end
local function v_u_43(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_10, (copy) v_u_5, (copy) v_u_4, (copy) v_u_6, (copy) v_u_24, (copy) v_u_23, (copy) v_u_9, (copy) v_u_14, (copy) v_u_15
	if v_u_2 ~= false then
		v_u_2 = false
		v_u_10.Stop("DiscoParty")
		v_u_5.UpdateSkybox(v_u_4, 0)
		game.TweenService:Create(v_u_6, TweenInfo.new(3), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		sound:Stop()
		local v41 = workspace.WeatherVisuals:FindFirstChild("DiscoSphere")
		if v41 then
			v41.Sphere.Smoke:Emit(3)
			v41.Sphere.Sparkles:Emit(8)
			v41.Sphere.Flashes:Emit(4)
			v_u_24:ScreenShake("Normal", { "Vector" }, 3, 0.5, 0.3)
			v_u_24:ScreenShake("Normal", { "Tilt", 8 }, 8, 0.7, 0.6)
			v_u_23(v_u_9.Weather.DiscoParty.Poof, v_u_14, -0.2, 0.2, v41)
			v_u_23(v_u_9.Weather.DiscoParty.Poof2, v_u_15, -0.2, 0.2, v41)
			for _, v42 in v41:GetDescendants() do
				if v42:IsA("BasePart") then
					v42.Transparency = 1
				elseif v42:IsA("Beam") then
					v42:Destroy()
				end
			end
		end
		task.wait(5)
		if v41 then
			v41:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("DiscoParty"):Connect(function()
	-- upvalues: (copy) v_u_40, (copy) v_u_43
	if workspace:GetAttribute("DiscoParty") then
		v_u_40()
	else
		v_u_43()
	end
end)
if workspace:GetAttribute("DiscoParty") then
	task.defer(function()
		-- upvalues: (copy) v_u_40
		v_u_40(true)
	end)
else
	v_u_43(true)
end
return v1
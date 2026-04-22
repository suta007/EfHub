local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("ReplicatedStorage")
local v_u_6 = script.Sky
local v_u_7 = require(v_u_5.Modules.SkyboxManager)
local v_u_8 = require(v_u_5.Modules.SoundPlayer)
local v_u_9 = require(v_u_5.Data.SoundData)
local v_u_10 = nil
v_u_7.AddSkybox(v_u_6)
local v_u_11 = game.Lighting.ColorCorrection:Clone()
v_u_11.Name = script.Name
v_u_11.Parent = game.Lighting
local v_u_12 = require(v_u_5.Modules.Notification)
local v_u_13 = workspace.CurrentCamera
local v_u_14 = {}
local v_u_15 = nil
local v_u_16 = nil
local v_u_17 = {
	Color3.fromRGB(255, 25, 25),
	Color3.fromRGB(19, 121, 255),
	Color3.fromRGB(85, 255, 0),
	Color3.fromRGB(166, 23, 255),
	Color3.fromRGB(255, 255, 127),
	Color3.fromRGB(255, 119, 0)
}
local function v_u_56(p18)
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_11, (copy) v_u_7, (copy) v_u_6, (ref) v_u_10, (copy) v_u_8, (copy) v_u_9, (copy) v_u_13, (copy) v_u_4, (copy) v_u_17, (ref) v_u_2
	if p18 == true then
		v_u_12:CreateNotification("All the signs have been activated!")
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
		v_u_7.UpdateSkybox(v_u_6, 2)
		local v19 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v20 = script.Parent.Dissonant.InvertedSphere:Clone()
		v20.Name = "STROBESPHERE"
		v20.Parent = workspace.WeatherVisuals
		v_u_3:Create(v20, v19, {
			["Transparency"] = 0.6
		}):Play()
		local v21 = workspace.BasePlate.TopBaseplate
		local v22 = script.Sparkles:Clone()
		v22.Name = "STROBEPARTYSPARKLES"
		v22.Parent = v21
		v22:Emit(35)
		v22.Enabled = true
		v_u_10 = v_u_8:PlaySound(v_u_9.Weather.StrobePartyMinigame.Music, {
			["TimePosition"] = 17,
			["Volume"] = 1
		}, nil, nil, { "LazyLoadSound" })
		local v_u_23 = v_u_10
		v_u_13.FieldOfView = 70
		local v_u_24 = 70
		local v28 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_23, (ref) v_u_24, (ref) v_u_13
			if v_u_23.IsPlaying then
				local v25 = (v_u_23.PlaybackLoudness or 0) / 1000
				local v26 = math.clamp(v25, 0, 1)
				local v27 = v26 * 15 + 70
				local _ = v26 * 1.5 + 1
				v_u_24 = v_u_24 + (v27 - v_u_24) * 0.2
				v_u_13.FieldOfView = v_u_24
			end
		end)
		local v_u_29 = script.StrobeBeams:Clone()
		v_u_29.Parent = workspace.WeatherVisuals
		local v30 = TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v31 = 1
		for _, v32 in v_u_29:GetChildren() do
			local v33 = ColorSequence.new(v_u_17[v31])
			v32:SetAttribute("OriginalCF", v32.CFrame)
			v32.Beam.Enabled = true
			v32.Sparkles.Color = v33
			v32.Attachment.Wave.Color = v33
			v32.Attachment.Wave2.Color = v33
			v32.Sparkles:Emit(10)
			v32.Attachment.Wave:Emit(1)
			v32.Attachment.Wave2:Emit(1)
			v32.Beam.Color = v33
			local v34 = v31 + 1
			v31 = #v_u_17 < v34 and 1 or v34
			v_u_8:PlaySound(v_u_9.Weather.StrobePartyMinigame.Spotlight, {
				["PlaybackSpeed"] = 0.75 + math.random(-300, 300) / 1000,
				["Volume"] = 0.8
			}, nil, v32, { "LazyLoadSound" })
			v_u_3:Create(v32.End, v30, {
				["Position"] = Vector3.new(0, 0, 200)
			}):Play()
			task.wait(0.05)
		end
		local v_u_35 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
		local v36 = 0
		local v_u_37 = 0
		while v_u_2 == true do
			v36 = (v36 + 0.01) % 1
			v21.Color = Color3.fromHSV(v36, 1, 0.6)
			game.Lighting.Ambient = Color3.fromHSV(v36, 1, 0.6)
			game.Lighting.OutdoorAmbient = Color3.fromHSV(v36, 1, 0.6)
			task.wait(0.05)
			task.spawn(function()
				-- upvalues: (ref) v_u_37, (copy) v_u_29, (ref) v_u_3, (copy) v_u_35
				v_u_37 = v_u_37 + 0.05
				if v_u_37 >= 1 then
					v_u_37 = 0
					local v38 = v_u_29:GetChildren()
					for _, v39 in ipairs(v38) do
						local v40 = v_u_3
						local v41 = v_u_35
						local v42 = {}
						local v43 = v39:GetAttribute("OriginalCF")
						local v44 = CFrame.Angles
						local v45 = math.random(-20, 20)
						local v46 = math.rad(v45)
						local v47 = math.random(-20, 20)
						local v48 = math.rad(v47)
						local v49 = math.random(-20, 20)
						v42.CFrame = v43 * v44(v46, v48, (math.rad(v49)))
						v40:Create(v39, v41, v42):Play()
						task.wait(1 / #v38)
					end
				end
			end)
		end
		if v28 then
			v28:Disconnect()
		end
		v_u_13.FieldOfView = 70
		v21.Color = Color3.fromRGB(91, 154, 76)
	else
		game.Lighting:SetAttribute("DefaultOutdoorAmbient", Color3.fromRGB(128, 128, 128))
		v_u_7.UpdateSkybox(v_u_6, 0)
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
			["Density"] = 0,
			["Offset"] = 0,
			["Color"] = Color3.fromRGB(215, 244, 255),
			["Decay"] = Color3.fromRGB(190, 238, 255)
		}):Play()
		local v50 = workspace.BasePlate.TopBaseplate:FindFirstChild("STROBEPARTYSPARKLES")
		if v50 then
			v50.Enabled = false
		end
		local v51 = workspace.WeatherVisuals:FindFirstChild("StrobeBeams")
		if v51 then
			for _, v52 in v51:GetChildren() do
				local v53 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
				v_u_3:Create(v52.End, v53, {
					["Position"] = Vector3.new(0, 0, 0)
				}):Play()
			end
		end
		local v54 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		v_u_3:Create(v_u_10, v54, {
			["Volume"] = 0
		}):Play()
		local v55 = workspace.WeatherVisuals:FindFirstChild("STROBESPHERE")
		if v55 then
			v_u_3:Create(v55, v54, {
				["Transparency"] = 1
			}):Play()
		end
		task.wait(2)
		if v51 then
			v51:Destroy()
		end
		if v55 then
			v55:Destroy()
		end
		if v50 then
			v50:Destroy()
		end
		v_u_10:Stop()
	end
end
local function v_u_76(_)
	-- upvalues: (ref) v_u_2, (copy) v_u_12, (ref) v_u_14, (ref) v_u_16, (copy) v_u_5, (copy) v_u_56, (ref) v_u_15, (copy) v_u_3, (copy) v_u_17, (copy) v_u_8, (copy) v_u_9
	if v_u_2 ~= true then
		v_u_2 = true
		v_u_12:CreateNotification("4 Signs have appeared around the map. Find them!")
		for _, v57 in v_u_14 do
			v57:Disconnect()
		end
		table.clear(v_u_14)
		v_u_14 = {}
		v_u_16 = v_u_5:WaitForChild("StrobePartySignData")
		local v59 = v_u_16:GetAttributeChangedSignal("Activated"):Connect(function()
			-- upvalues: (ref) v_u_16, (ref) v_u_14, (ref) v_u_56
			if v_u_16:GetAttribute("Activated") == true then
				for _, v58 in v_u_14 do
					v58:Disconnect()
				end
				table.clear(v_u_14)
				v_u_14 = {}
				warn("ACTIVATEEEEE")
				v_u_56(true)
			end
		end)
		local v60 = v_u_14
		table.insert(v60, v59)
		v_u_15 = v_u_5.Assets.StrobeSigns:Clone()
		for v_u_61 = 1, 4 do
			local v_u_62 = v_u_15:WaitForChild((tostring(v_u_61)))
			local v_u_63 = v_u_62.Button.CFrame
			local v68 = v_u_16:GetAttributeChangedSignal("Sign" .. v_u_61 .. "Color"):Connect(function()
				-- upvalues: (ref) v_u_3, (copy) v_u_62, (copy) v_u_63, (ref) v_u_17, (ref) v_u_16, (copy) v_u_61, (ref) v_u_8, (ref) v_u_9, (ref) v_u_15
				local v64 = TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
				v_u_3:Create(v_u_62.Button, v64, {
					["CFrame"] = v_u_63 * CFrame.new(0.19, 0, 0),
					["Color"] = v_u_17[v_u_16:GetAttribute("Sign" .. v_u_61 .. "Color")]
				}):Play()
				v_u_8:PlaySound(v_u_9.Weather.StrobePartyMinigame.ButtonPress, {
					["PlaybackSpeed"] = 1.5 + math.random(-300, 300) / 1000,
					["Volume"] = 0.8
				}, nil, v_u_62.Button, { "LazyLoadSound" })
				if v_u_16:GetAttribute("Sign" .. v_u_61 .. "Color") == v_u_16:GetAttribute("Sign" .. v_u_61 .. "ColorReq") then
					local v_u_65 = script.Confetti:Clone()
					v_u_65.Parent = v_u_62.Button
					v_u_8:PlaySound(v_u_9.Weather.StrobePartyMinigame.Activate, {
						["PlaybackSpeed"] = 1 + math.random(-300, 300) / 1000,
						["Volume"] = 1
					}, nil, v_u_62.Button, { "LazyLoadSound" })
					local v66 = v_u_61
					v_u_15[tostring(v66)].Button.Prompt.Enabled = false
					task.spawn(function()
						-- upvalues: (copy) v_u_65
						v_u_65:Emit(7)
						v_u_65.Enabled = true
						task.wait(0.2)
						if v_u_65 then
							v_u_65.Enabled = false
						end
						task.wait(0.5)
						if v_u_65 then
							v_u_65:Destroy()
						end
					end)
				end
				task.wait(0.25)
				local v67 = {
					["CFrame"] = v_u_63
				}
				v_u_3:Create(v_u_62.Button, v64, v67):Play()
			end)
			local v69 = v_u_14
			table.insert(v69, v68)
		end
		v_u_15.Parent = workspace
		for _, v_u_70 in v_u_15:GetChildren() do
			local v71 = v_u_70.Name
			local v_u_72 = tonumber(v71)
			v_u_70:WaitForChild("Button")
			v_u_70:WaitForChild("ColorReq")
			v_u_70.Button.Color = v_u_17[v_u_16:GetAttribute("Sign" .. v_u_72 .. "Color")]
			v_u_70.ColorReq.Color = v_u_17[v_u_16:GetAttribute("Sign" .. v_u_72 .. "ColorReq")]
			local v_u_73 = false
			local v74 = v_u_70.Button.Prompt.Triggered:Connect(function()
				-- upvalues: (ref) v_u_73, (copy) v_u_70, (ref) v_u_5, (copy) v_u_72, (ref) v_u_16
				if v_u_73 == false then
					v_u_73 = true
					v_u_70.Button.Prompt.Enabled = false
					v_u_5.GameEvents.StrobePartyWeather:FireServer("ToggleSignColor", v_u_72)
					task.wait(0.6)
					if v_u_16:GetAttribute("Sign" .. v_u_72 .. "Activated") == false then
						v_u_70.Button.Prompt.Enabled = true
					end
					v_u_73 = false
				end
			end)
			local v75 = v_u_14
			table.insert(v75, v74)
			if v_u_16:GetAttribute("Sign" .. v_u_72 .. "Activated") == false then
				v_u_70.Button.Prompt.Enabled = true
			end
			v_u_70.Main.Smoke:Emit(3)
			v_u_8:PlaySound(v_u_9.Weather.StrobePartyMinigame.Poof, {
				["PlaybackSpeed"] = 0.65 + math.random(-300, 300) / 1000,
				["Volume"] = 2
			}, nil, v_u_70.Main, { "LazyLoadSound" })
		end
	end
end
local function v_u_78(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_14, (ref) v_u_15, (copy) v_u_56
	if v_u_2 ~= false then
		v_u_2 = false
		for _, v77 in v_u_14 do
			v77:Disconnect()
		end
		table.clear(v_u_14)
		v_u_14 = {}
		if v_u_15 then
			v_u_15:Destroy()
		end
		v_u_15 = nil
		v_u_56(false)
	end
end
workspace:GetAttributeChangedSignal("StrobePartyMinigame"):Connect(function()
	-- upvalues: (copy) v_u_76, (copy) v_u_78
	if workspace:GetAttribute("StrobePartyMinigame") then
		v_u_76()
	else
		v_u_78()
	end
end)
if workspace:GetAttribute("StrobePartyMinigame") then
	task.defer(function()
		-- upvalues: (copy) v_u_76
		v_u_76(true)
	end)
else
	v_u_78(true)
end
return v1
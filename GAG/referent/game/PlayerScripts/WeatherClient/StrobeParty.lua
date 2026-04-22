local v1 = {}
local v_u_2 = false
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("RunService")
local v_u_5 = game:GetService("ReplicatedStorage")
local v_u_6 = script.Sky
local v_u_7 = require(v_u_5.Modules.SkyboxManager)
v_u_7.AddSkybox(v_u_6)
local v_u_8 = game.Lighting.ColorCorrection:Clone()
v_u_8.Name = script.Name
v_u_8.Parent = game.Lighting
require(v_u_5.Modules.Notification)
local v_u_9 = require(v_u_5.Modules.SoundPlayer)
local v_u_10 = require(v_u_5.Data.SoundData)
local v_u_11 = nil
local v_u_12 = workspace.CurrentCamera
local v_u_13 = {}
local v_u_14 = nil
local v_u_15 = nil
local v_u_16 = {
	Color3.fromRGB(255, 25, 25),
	Color3.fromRGB(19, 121, 255),
	Color3.fromRGB(85, 255, 0),
	Color3.fromRGB(166, 23, 255),
	Color3.fromRGB(255, 255, 127),
	Color3.fromRGB(255, 119, 0)
}
local function v_u_55(p17)
	-- upvalues: (copy) v_u_3, (copy) v_u_8, (copy) v_u_7, (copy) v_u_6, (ref) v_u_11, (copy) v_u_9, (copy) v_u_10, (copy) v_u_12, (copy) v_u_4, (copy) v_u_16, (ref) v_u_2
	if p17 == true then
		v_u_3:Create(v_u_8, TweenInfo.new(2), {
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
		local v18 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v19 = script.Parent.Dissonant.InvertedSphere:Clone()
		v19.Name = "STROBESPHERE"
		v19.Parent = workspace.WeatherVisuals
		v_u_3:Create(v19, v18, {
			["Transparency"] = 0.6
		}):Play()
		local v20 = workspace.BasePlate.TopBaseplate
		local v21 = script.Sparkles:Clone()
		v21.Name = "STROBEPARTYSPARKLES"
		v21.Parent = v20
		v21:Emit(35)
		v21.Enabled = true
		v_u_11 = v_u_9:PlaySound(v_u_10.Weather.StrobeParty.Music, {
			["Volume"] = 1
		})
		local v_u_22 = v_u_11
		v_u_12.FieldOfView = 70
		local v_u_23 = 70
		local v27 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_22, (ref) v_u_23, (ref) v_u_12
			if v_u_22.IsPlaying then
				local v24 = (v_u_22.PlaybackLoudness or 0) / 1000
				local v25 = math.clamp(v24, 0, 1)
				local v26 = v25 * 15 + 70
				local _ = v25 * 1.5 + 1
				v_u_23 = v_u_23 + (v26 - v_u_23) * 0.2
				v_u_12.FieldOfView = v_u_23
			end
		end)
		local v_u_28 = script.StrobeBeams:Clone()
		v_u_28.Parent = workspace.WeatherVisuals
		local v29 = TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		local v30 = 1
		for _, v31 in v_u_28:GetChildren() do
			local v32 = ColorSequence.new(v_u_16[v30])
			v31:SetAttribute("OriginalCF", v31.CFrame)
			v31.Beam.Enabled = true
			v31.Sparkles.Color = v32
			v31.Attachment.Wave.Color = v32
			v31.Attachment.Wave2.Color = v32
			v31.Sparkles:Emit(10)
			v31.Attachment.Wave:Emit(1)
			v31.Attachment.Wave2:Emit(1)
			v31.Beam.Color = v32
			local v33 = v30 + 1
			v30 = #v_u_16 < v33 and 1 or v33
			v_u_9:PlaySound(v_u_10.Weather.StrobeParty.Spotlight, {
				["PlaybackSpeed"] = 0.75 + math.random(-300, 300) / 1000,
				["Volume"] = 0.75
			}, nil, v31, { "LazyLoadSound" })
			v_u_3:Create(v31.End, v29, {
				["Position"] = Vector3.new(0, 0, 200)
			}):Play()
			task.wait(0.05)
		end
		local v_u_34 = TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, false, 0)
		local v35 = 0
		local v_u_36 = 0
		while v_u_2 == true do
			v35 = (v35 + 0.01) % 1
			v20.Color = Color3.fromHSV(v35, 1, 0.6)
			game.Lighting.Ambient = Color3.fromHSV(v35, 1, 0.6)
			game.Lighting.OutdoorAmbient = Color3.fromHSV(v35, 1, 0.6)
			task.wait(0.05)
			task.spawn(function()
				-- upvalues: (ref) v_u_36, (copy) v_u_28, (ref) v_u_3, (copy) v_u_34
				v_u_36 = v_u_36 + 0.05
				if v_u_36 >= 1 then
					v_u_36 = 0
					local v37 = v_u_28:GetChildren()
					for _, v38 in ipairs(v37) do
						local v39 = v_u_3
						local v40 = v_u_34
						local v41 = {}
						local v42 = v38:GetAttribute("OriginalCF")
						local v43 = CFrame.Angles
						local v44 = math.random(-20, 20)
						local v45 = math.rad(v44)
						local v46 = math.random(-20, 20)
						local v47 = math.rad(v46)
						local v48 = math.random(-20, 20)
						v41.CFrame = v42 * v43(v45, v47, (math.rad(v48)))
						v39:Create(v38, v40, v41):Play()
						task.wait(1 / #v37)
					end
				end
			end)
		end
		if v27 then
			v27:Disconnect()
		end
		v_u_12.FieldOfView = 70
		v20.Color = Color3.fromRGB(91, 154, 76)
	else
		game.Lighting:SetAttribute("DefaultOutdoorAmbient", Color3.fromRGB(128, 128, 128))
		v_u_7.UpdateSkybox(v_u_6, 0)
		game.TweenService:Create(v_u_8, TweenInfo.new(3), {
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
		local v49 = workspace.BasePlate.TopBaseplate:FindFirstChild("STROBEPARTYSPARKLES")
		if v49 then
			v49.Enabled = false
		end
		local v50 = workspace.WeatherVisuals:FindFirstChild("StrobeBeams")
		if v50 then
			for _, v51 in v50:GetChildren() do
				local v52 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
				v_u_3:Create(v51.End, v52, {
					["Position"] = Vector3.new(0, 0, 0)
				}):Play()
			end
		end
		local v53 = TweenInfo.new(2, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		v_u_3:Create(v_u_11, v53, {
			["Volume"] = 0
		}):Play()
		local v54 = workspace.WeatherVisuals:FindFirstChild("STROBESPHERE")
		if v54 then
			v_u_3:Create(v54, v53, {
				["Transparency"] = 1
			}):Play()
		end
		task.wait(2)
		if v50 then
			v50:Destroy()
		end
		if v54 then
			v54:Destroy()
		end
		if v49 then
			v49:Destroy()
		end
		v_u_11:Stop()
	end
end
local function v_u_57(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_13, (copy) v_u_55, (ref) v_u_15, (copy) v_u_5
	if v_u_2 ~= true then
		v_u_2 = true
		for _, v56 in v_u_13 do
			v56:Disconnect()
		end
		table.clear(v_u_13)
		v_u_13 = {}
		v_u_55(true)
		v_u_15 = v_u_5:WaitForChild("StrobePartySignData")
	end
end
local function v_u_59(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_13, (ref) v_u_14, (copy) v_u_55
	if v_u_2 ~= false then
		v_u_2 = false
		for _, v58 in v_u_13 do
			v58:Disconnect()
		end
		table.clear(v_u_13)
		v_u_13 = {}
		if v_u_14 then
			v_u_14:Destroy()
		end
		v_u_14 = nil
		v_u_55(false)
	end
end
workspace:GetAttributeChangedSignal("StrobeParty"):Connect(function()
	-- upvalues: (copy) v_u_57, (copy) v_u_59
	if workspace:GetAttribute("StrobeParty") then
		v_u_57()
	else
		v_u_59()
	end
end)
if workspace:GetAttribute("StrobeParty") then
	task.defer(function()
		-- upvalues: (copy) v_u_57
		v_u_57(true)
	end)
else
	v_u_59(true)
end
return v1
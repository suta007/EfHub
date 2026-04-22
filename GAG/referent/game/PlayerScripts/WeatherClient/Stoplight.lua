local v1 = {}
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v_u_4 = false
local v_u_5 = game.Lighting.ColorCorrection:Clone()
v_u_5.Name = script.Name
v_u_5.Parent = game.Lighting
local v_u_6 = require(v3.Modules.SkyboxManager)
local v_u_7 = script.Sky
v_u_6.AddSkybox(v_u_7)
local v_u_8 = require(v3:WaitForChild("Cutscene_Module"))
local v_u_9 = require(v3.Field_Of_View_Module)
require(v3.Code.BodyShaker)
local v_u_10 = require(v3.Code.CameraShaker)
local v_u_11 = require(v3.Modules.Spring)
local v_u_12 = require(v3.Modules.Maid)
local v_u_13 = require(v3.Modules.SoundPlayer)
local v_u_14 = require(v3.Data.SoundData)
local v_u_15 = nil
local v_u_17 = v_u_10.new(Enum.RenderPriority.Camera.Value, function(p16)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p16
end)
local function v_u_18()
	-- upvalues: (copy) v_u_11, (copy) v_u_5, (copy) v_u_6, (copy) v_u_7, (ref) v_u_15, (copy) v_u_13, (copy) v_u_14
	v_u_11.target(game.Lighting, 1, 4, {
		["ClockTime"] = 16
	})
	game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
		["Ambient"] = Color3.fromRGB(176, 206, 255),
		["Brightness"] = 0.75,
		["ClockTime"] = 16,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(170, 203, 255),
		["ExposureCompensation"] = 0.25,
		["GeographicLatitude"] = 18.774,
		["ShadowSoftness"] = 0.025,
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128)
	}):Play()
	game.TweenService:Create(v_u_5, TweenInfo.new(0.1), {
		["Brightness"] = -0.1,
		["Contrast"] = 0
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(0.1), {
		["Density"] = 0.356
	}):Play()
	game.Lighting.SunRays.Intensity = 0.028
	v_u_6.UpdateSkybox(v_u_7, 2)
	v_u_15 = v_u_13:PlaySound(v_u_14.Weather.Stoplight.Ambience, {
		["Looped"] = true,
		["Volume"] = 0.1
	}, nil, nil, { "LazyLoadSound" })
end
local function v_u_59()
	-- upvalues: (copy) v_u_12, (ref) v_u_4, (copy) v_u_13, (copy) v_u_14, (copy) v_u_17, (copy) v_u_10, (copy) v_u_9, (copy) v_u_8, (copy) v_u_18, (copy) v_u_2, (copy) v_u_5, (ref) v_u_15, (copy) v_u_6, (copy) v_u_7
	local v19 = v_u_12.new()
	v_u_4 = true
	local v_u_20 = v_u_13:PlaySound(v_u_14.Weather.Stoplight.Teleport)
	v_u_20.SoundGroup = game.SoundService.Music
	v19:GiveTask(v_u_20)
	local v_u_21 = v_u_13:PlaySound(v_u_14.Weather.Stoplight.LightTransition)
	v_u_21.SoundGroup = game.SoundService.Music
	v19:GiveTask(v_u_21)
	v_u_17:Start()
	v_u_17:ShakeSustain(v_u_10.Presets.Earthquake)
	task.delay(3, function()
		-- upvalues: (ref) v_u_17
		v_u_17:StopSustained(2)
	end)
	local v_u_22 = nil
	v_u_22 = workspace:GetAttributeChangedSignal("Stoplight_Howling"):Connect(function()
		-- upvalues: (ref) v_u_22, (ref) v_u_17, (ref) v_u_10, (ref) v_u_9, (copy) v_u_21, (ref) v_u_8, (ref) v_u_18
		v_u_22:Disconnect()
		if workspace:GetAttribute("Stoplight") then
			local v_u_23 = script.Particles:Clone()
			v_u_23.Parent = game.Workspace
			task.spawn(function()
				-- upvalues: (copy) v_u_23, (ref) v_u_17, (ref) v_u_10
				task.wait(0.5)
				for _ = 1, 4 do
					for _, v24 in v_u_23.SlamVFX:GetChildren() do
						v24:Emit(v24:GetAttribute("EmitCount"))
					end
					v_u_17:Shake(v_u_10.Presets.VerySmallExplosion)
					task.wait(0.5)
				end
			end)
			task.delay(1.5, function()
				-- upvalues: (copy) v_u_23, (ref) v_u_9, (ref) v_u_21, (ref) v_u_8, (ref) v_u_18
				game:GetService("Debris"):AddItem(v_u_23, 12)
				local _ = game.Players.LocalPlayer.Character
				v_u_9.Change_FOV(50, 0.5)
				task.wait(0.5)
				v_u_21:Play()
				v_u_8.Flash(1.5)
				v_u_9.Change_FOV(70, 0.5)
				task.wait(1)
				v_u_18()
			end)
		end
	end)
	local v_u_25 = nil
	v_u_25 = workspace:GetAttributeChangedSignal("Stoplight_OwlLand"):Once(function()
		-- upvalues: (ref) v_u_17, (ref) v_u_10, (ref) v_u_25
		v_u_17:Shake(v_u_10.Presets.SmallExplosion)
		v_u_25:Disconnect()
	end)
	local v_u_26 = script.Screen_Effect:Clone()
	local v27 = Instance.new("ScreenGui")
	v27.ScreenInsets = Enum.ScreenInsets.None
	v27.Parent = game.Players.LocalPlayer.PlayerGui
	v_u_26.Parent = v27
	task.spawn(function()
		game.TweenService:Create(game.Lighting, TweenInfo.new(0.5), {
			["ClockTime"] = 21
		}):Play()
	end)
	local function v_u_37(p28)
		if p28 and p28:FindFirstChild("HumanoidRootPart") then
			local v29 = game.Workspace:WaitForChild("Stoplight_Scene"):FindFirstChild("FlyTo")
			if v29 and v29:IsA("BasePart") then
				local v30 = v29.Size
				local v31 = v29.Position
				local v32 = math.random() * v30.X - v30.X / 2
				local v33 = math.random() * v30.Y - v30.Y / 2
				local v34 = math.random() * v30.Z - v30.Z / 2
				local v35 = Vector3.new(v32, v33, v34)
				local v36 = v31 + v29.CFrame:VectorToWorldSpace(v35)
				p28:FindFirstChild("Humanoid").WalkSpeed = 25
				p28:MoveTo(v36)
			end
		else
			return
		end
	end
	local v_u_38 = Vector3.new(inf, inf, inf)
	local v_u_39 = nil
	local v_u_40 = tick()
	v19:GiveTask(game:GetService("RunService").Heartbeat:Connect(function()
		-- upvalues: (ref) v_u_38, (ref) v_u_39, (ref) v_u_40, (copy) v_u_37
		if workspace:GetAttribute("Stoplight_StopMovement") then
			if not game.Players.LocalPlayer:GetAttribute("Stoplight_Victory") then
				local v41 = game.Players.LocalPlayer.Character
				if v41 and v41:FindFirstChild("HumanoidRootPart") then
					local v42 = v41.HumanoidRootPart.Position
					if v_u_38 and (v42 - v_u_38).magnitude > 0.1 then
						local v43 = workspace:FindFirstChild("Stoplight_Scene")
						if not v43 then
							return
						end
						if v42.X > v43.Line.Position.X then
							return
						end
						if v42.X < v43.FinishLine.Position.X then
							return
						end
						if v_u_39 == "Red" and (v_u_40 and tick() - v_u_40 >= 0.5) then
							game.Players.LocalPlayer:SetAttribute("Stoplight_Caught", true)
							v_u_37(v41)
						end
					end
					v_u_38 = v42
				end
			end
		else
			return
		end
	end))
	local v50 = game.Players.LocalPlayer:GetAttributeChangedSignal("Stoplight_Caught"):Connect(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_20
		local v44 = script.RedLightCaught:Clone()
		v44.Parent = workspace
		v44.Position = game.Players.LocalPlayer.Character.PrimaryPart.Position
		if game.Players.LocalPlayer.Character:FindFirstChild("StopLight_Highlight") then
			game.Players.LocalPlayer.Character:FindFirstChild("StopLight_Highlight"):Destroy()
		end
		local v45 = Instance.new("Highlight")
		v45.Name = "StopLight_Highlight"
		v45.FillColor = Color3.fromRGB(255, 0, 0)
		v45.FillTransparency = 0.15
		v45.OutlineTransparency = 1
		v45.Parent = game.Players.LocalPlayer.Character
		v_u_2:Create(v45, TweenInfo.new(1), {
			["FillTransparency"] = 1
		}):Play()
		v_u_20:Play()
		local v46 = next
		local v47, v48 = v44:GetDescendants()
		for _, v49 in v46, v47, v48 do
			if v49:IsA("ParticleEmitter") then
				v49:Emit(v49:GetAttribute("EmitCount"))
			end
		end
		game.Players.LocalPlayer:SetAttribute("Stoplight_Caught", nil)
		game:GetService("Debris"):AddItem(v44, 4)
		game:GetService("Debris"):AddItem(v45, 4)
	end)
	local v54 = workspace:GetAttributeChangedSignal("Stoplight_CurrentLight"):Connect(function()
		-- upvalues: (copy) v_u_26, (ref) v_u_2, (ref) v_u_5, (ref) v_u_39, (ref) v_u_40
		local v51 = {
			["Red"] = Color3.fromRGB(255, 0, 0),
			["Green"] = Color3.fromRGB(0, 255, 0)
		}
		local v52 = {
			["Red"] = Color3.fromRGB(255, 202, 192),
			["Yellow"] = Color3.fromRGB(255, 255, 207),
			["Green"] = Color3.fromRGB(212, 247, 205)
		}
		local v53 = workspace:GetAttribute("Stoplight_CurrentLight")
		if v51[v53] then
			v_u_26.ImageColor3 = v51[v53]
			v_u_26.ImageTransparency = 0.8
			v_u_2:Create(v_u_26, TweenInfo.new(0.8), {
				["ImageTransparency"] = 1
			}):Play()
			v_u_2:Create(game.Lighting, TweenInfo.new(0.8), {
				["Ambient"] = v52[v53]
			}):Play()
		end
		v_u_5.TintColor = v53 == "Red" and Color3.fromRGB(255, 175, 176) or Color3.fromRGB(187, 255, 189)
		v_u_39 = v53
		if v53 == "Red" then
			v_u_40 = tick()
			v_u_2:Create(v_u_5, TweenInfo.new(0.3), {
				["Brightness"] = 0.05
			}):Play()
			task.wait(0.5)
			v_u_2:Create(v_u_5, TweenInfo.new(0.75), {
				["Brightness"] = -0.1
			}):Play()
			v_u_2:Create(v_u_5, TweenInfo.new(0.75), {
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
		elseif v53 == "Green" then
			v_u_2:Create(v_u_5, TweenInfo.new(0.3), {
				["Brightness"] = 0.05
			}):Play()
			task.wait(0.5)
			v_u_2:Create(v_u_5, TweenInfo.new(0.75), {
				["Brightness"] = -0.1
			}):Play()
			v_u_2:Create(v_u_5, TweenInfo.new(0.75), {
				["TintColor"] = Color3.fromRGB(255, 255, 255)
			}):Play()
		end
	end)
	local v55 = game.Workspace:GetAttributeChangedSignal("Stoplight_StopMovement"):Once(function()
		-- upvalues: (copy) v_u_37
		v_u_37(game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait())
	end)
	local v56, v57
	if game.Workspace:GetAttribute("Stoplight_StopMovement") then
		v_u_37(game.Players.LocalPlayer.Character or game.Players.LocalPlayer.CharacterAdded:Wait())
		v56 = v_u_25
		v57 = v_u_22
	else
		v56 = v_u_25
		v57 = v_u_22
	end
	repeat
		task.wait()
	until v_u_4 == false
	v19:Destroy()
	if v50 then
		v50:Disconnect()
	end
	if v57 then
		v57:Disconnect()
	end
	if v54 then
		v54:Disconnect()
	end
	if v56 then
		v56:Disconnect()
	end
	if v55 then
		v55:Disconnect()
	end
	v_u_8.Flash(1.5)
	task.wait(1)
	local v58 = game.Lighting
	v_u_2:Create(game.Lighting.Atmosphere, TweenInfo.new(1), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	v_u_2:Create(v_u_5, TweenInfo.new(1), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_2:Create(v58, TweenInfo.new(1), {
		["Ambient"] = v58:GetAttribute("DefaultAmbient"),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["ExposureCompensation"] = 0,
		["Brightness"] = v58:GetAttribute("DefaultBrightness"),
		["ClockTime"] = 14,
		["GeographicLatitude"] = 29.475
	}):Play()
	task.delay(1, function()
		-- upvalues: (ref) v_u_15
		v_u_15:Stop()
	end)
	v_u_6.UpdateSkybox(v_u_7, 0)
	if v_u_26 then
		v_u_26:Destroy()
	end
end
workspace:GetAttributeChangedSignal("Stoplight"):Connect(function()
	-- upvalues: (copy) v_u_59, (ref) v_u_4
	if workspace:GetAttribute("Stoplight") then
		v_u_59()
	else
		v_u_4 = false
	end
end)
if workspace:GetAttribute("Stoplight") then
	task.defer(v_u_59)
else
	v_u_4 = false
end
return v1
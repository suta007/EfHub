game:GetService("CollectionService")
local v_u_1 = game:GetService("TweenService")
local v2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v4 = require(v2.Modules.Maid)
local v_u_5 = require(v2.Modules.SoundPlayer)
local v6 = require(v2.Data.SoundData)
local v_u_7 = require(v2.Modules.SelectiveAssetReplication)
local v_u_8 = require(v2.Modules.TweenModel)
local v_u_9 = workspace:WaitForChild("BasePlate"):WaitForChild("TopBaseplate")
local v10 = v2.GameEvents.ChristmasEvent.ChristmasCrackerEventOpenedCracker
local v_u_11 = v2.GameEvents.ChristmasEvent.ChristmasCrackerEventOpenPresent
local v_u_12 = game.Lighting.ColorCorrection:Clone()
v_u_12.Name = script.Name
v_u_12.Parent = game.Lighting
local v_u_13 = v6.Weather.ChristmasCrackers.bangSound
local v_u_14 = v6.Weather.ChristmasCrackers.spawnSound
local v_u_15 = Random.new()
local v_u_16 = false
local v17 = {}
local _ = script.Sky
local v_u_18 = v4.new()
local function v_u_21()
	-- upvalues: (copy) v_u_18, (copy) v_u_9
	local v19 = script.SnowParticles:Clone()
	local v20 = Instance.new("Part")
	v_u_18:GiveTask(v20)
	v20.Parent = workspace.Visuals
	v20.Name = "SnowParticleHolder"
	v20.Anchored = true
	v20.CanCollide = false
	v20.CanQuery = false
	v20.CanTouch = false
	v20.CFrame = v_u_9.CFrame * CFrame.new(0, 100, 0) * CFrame.Angles(0, 0, 3.141592653589793)
	v20.Parent = workspace
	v20.Size = v_u_9.Size
	v20.Transparency = 1
	v19.Parent = v20
end
local function v_u_41(p22, p_u_23, p_u_24)
	-- upvalues: (ref) v_u_16, (copy) v_u_7, (copy) v_u_8, (copy) v_u_15, (copy) v_u_1, (copy) v_u_11, (copy) v_u_18
	if v_u_16 and p22 then
		local v25 = CFrame.Angles(1.5707963267948966, 0, 0)
		local v_u_26 = v_u_7:GetAssetAsync("SeedPackModels", p_u_23):Clone()
		v_u_26.Parent = workspace.Visuals
		local v_u_27 = v_u_26.PrimaryPart
		v_u_27.Anchored = true
		v_u_26:ScaleTo(0.1)
		v_u_26:PivotTo(p22 * v25)
		local v28 = v_u_8(v_u_26, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
			["Scale"] = 1
		})
		v28:Play()
		local v_u_29 = script.ConfettiPuff:Clone()
		v_u_29.Parent = v_u_26.PrimaryPart
		v_u_29.Enabled = true
		task.delay(0.5, function()
			-- upvalues: (copy) v_u_29
			if v_u_29 and v_u_29.Parent then
				v_u_29.Enabled = false
				task.wait(2)
				if v_u_29 and v_u_29.Parent then
					v_u_29:Destroy()
				end
			end
		end)
		local v30 = CFrame.new
		local v31 = p22.Position
		local v32 = v_u_15:NextNumber(0.5, 2.5)
		local v33 = v_u_15:NextNumber(7.5, 12.5)
		local v34 = v_u_15
		local v35 = v30(v31 + Vector3.new(v32, v33, v34:NextNumber(0.5, 2.5))) * v25
		local v_u_36 = CFrame.new(v35.X, 0, v35.Z) * v25
		local v37 = v_u_1:Create(v_u_27, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["CFrame"] = v35 * CFrame.Angles(0, 0, 1.5707963267948966)
		})
		v37:Play()
		v37.Completed:Connect(function()
			-- upvalues: (ref) v_u_1, (copy) v_u_27, (copy) v_u_36
			v_u_1:Create(v_u_27, TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), {
				["CFrame"] = v_u_36 * CFrame.Angles(0, 0, -1.5707963267948966)
			}):Play()
		end)
		v28.Completed:Connect(function()
			-- upvalues: (copy) v_u_26, (copy) p_u_23, (ref) v_u_11, (copy) p_u_24
			local v38 = Instance.new("Attachment")
			v38.Parent = v_u_26.PrimaryPart
			v38.Position = v38.Position + Vector3.new(0, 0, -3)
			local v39 = Instance.new("ProximityPrompt")
			v39.Parent = v38
			v39:SetAttribute("Theme", "ShadowedPrompt")
			v39.Style = Enum.ProximityPromptStyle.Custom
			v39.ActionText = "Pick up"
			v39.ObjectText = p_u_23
			v39.RequiresLineOfSight = false
			v39.HoldDuration = 0.5
			v39.Triggered:Connect(function()
				-- upvalues: (ref) v_u_26, (ref) v_u_11, (ref) p_u_24
				local v40 = v_u_26:GetPivot().Position
				if v_u_26 then
					v_u_26:Destroy()
				end
				v_u_11:FireServer(p_u_24, v40)
			end)
		end)
		v_u_18:GiveTask(v_u_26)
		if v_u_16 == false then
			v_u_18:DoCleaning()
		end
	end
end
v10.OnClientEvent:Connect(function(p42, p43, p44)
	-- upvalues: (copy) v_u_41
	v_u_41(p42, p43, p44)
end)
game.CollectionService:GetInstanceAddedSignal("CrackerSpawned"):Connect(function(p_u_45)
	-- upvalues: (copy) v_u_5, (copy) v_u_14, (copy) v_u_8, (copy) v_u_3, (copy) v_u_13
	v_u_5:PlaySound(v_u_14, {
		["RollOffMaxDistance"] = 1000,
		["RollOffMinDistance"] = 1,
		["RollOffMode"] = Enum.RollOffMode.Linear,
		["Volume"] = 1,
		["PlaybackSpeed"] = math.random(5, 8) / 10
	})
	local v_u_46 = script.Poof_VFX:Clone()
	v_u_46.Parent = p_u_45.PrimaryPart
	v_u_46.Enabled = true
	task.delay(0.25, function()
		-- upvalues: (copy) v_u_46
		if v_u_46 and v_u_46.Parent then
			v_u_46.Enabled = false
			task.wait(2)
			if v_u_46 and v_u_46.Parent then
				v_u_46:Destroy()
			end
		end
	end)
	p_u_45:GetAttributeChangedSignal("Opened"):Connect(function()
		-- upvalues: (copy) p_u_45, (ref) v_u_8, (ref) v_u_3, (ref) v_u_5, (ref) v_u_13
		local v_u_47 = p_u_45:GetPivot()
		local v_u_48 = 0
		local v_u_49 = {
			["RollOffMaxDistance"] = 1000,
			["RollOffMinDistance"] = 1,
			["RollOffMode"] = Enum.RollOffMode.Linear,
			["Volume"] = 1,
			["PlaybackSpeed"] = math.random(5, 8) / 10
		}
		local v50 = p_u_45.LeftSide:GetPivot() * CFrame.new(3.5, 0, 0)
		local v51 = CFrame.Angles
		local v52 = math.random(-32, 32)
		local v53 = math.rad(v52)
		local v54 = math.random(-8, 8)
		local v55 = v50 * v51(0, v53, (math.rad(v54)))
		local v56 = TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
		local v_u_57 = v_u_8(p_u_45.LeftSide, v56, {
			["CFrame"] = v55
		})
		local v58 = p_u_45.RightSide:GetPivot() * CFrame.new(3.5, 0, 0)
		local v59 = CFrame.Angles
		local v60 = math.random(-32, 32)
		local v61 = math.rad(v60)
		local v62 = math.random(-8, 8)
		local v63 = {
			["CFrame"] = v58 * v59(0, v61, (math.rad(v62)))
		}
		local v_u_64 = v_u_8(p_u_45.RightSide, v56, v63)
		local v65 = TweenInfo.new(0.7, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
		v_u_8(p_u_45.Base, v65, {
			["Scale"] = 1.5
		}):Play()
		local v_u_66 = nil
		v_u_66 = v_u_3.RenderStepped:Connect(function(p67)
			-- upvalues: (ref) v_u_48, (ref) p_u_45, (copy) v_u_47, (ref) v_u_66, (copy) v_u_64, (copy) v_u_57, (ref) v_u_5, (ref) v_u_13, (copy) v_u_49
			v_u_48 = v_u_48 + p67
			if v_u_48 >= 0.7 then
				p_u_45:PivotTo(v_u_47)
				v_u_66:Disconnect()
				v_u_64:Play()
				v_u_57:Play()
				p_u_45.Base:Destroy()
				v_u_5:PlaySound(v_u_13, v_u_49)
			else
				local v68 = v_u_48 * 50
				local v69 = math.sin(v68) * 0.5
				p_u_45:PivotTo(v_u_47 * CFrame.new(v69, 0, 0))
			end
		end)
	end)
end)
local function v_u_70()
	-- upvalues: (ref) v_u_16, (copy) v_u_21, (copy) v_u_1, (copy) v_u_12, (copy) v_u_18
	v_u_16 = true
	v_u_21()
	v_u_1:Create(game.Lighting, TweenInfo.new(5), {
		["Ambient"] = Color3.fromRGB(252, 144, 144)
	}):Play()
	v_u_1:Create(v_u_12, TweenInfo.new(5), {
		["Brightness"] = 0.05,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0.3,
		["Glare"] = 0.8,
		["Haze"] = 1.25,
		["Offset"] = 1,
		["Color"] = Color3.fromRGB(255, 0, 0),
		["Decay"] = Color3.fromRGB(255, 207, 207)
	}):Play()
	repeat
		task.wait()
	until v_u_16 == false
	v_u_18:DoCleaning()
	game.TweenService:Create(v_u_12, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(3), {
		["Density"] = 0,
		["Glare"] = 0,
		["Haze"] = 0,
		["Offset"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255)
	}):Play()
	game.TweenService:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
	}):Play()
	task.delay(3, function()
		game.Workspace.Terrain.Clouds.Enabled = false
	end)
end
workspace:GetAttributeChangedSignal("ChristmasCrackersEvent"):Connect(function()
	-- upvalues: (copy) v_u_70, (ref) v_u_16
	if workspace:GetAttribute("ChristmasCrackersEvent") then
		v_u_70()
	else
		v_u_16 = false
	end
end)
if workspace:GetAttribute("ChristmasCrackersEvent") then
	task.defer(v_u_70)
else
	v_u_16 = false
end
return v17
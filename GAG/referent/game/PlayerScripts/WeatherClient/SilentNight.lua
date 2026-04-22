local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("Players")
local v_u_4 = game:GetService("Debris")
local v5 = game:GetService("ReplicatedStorage")
local v_u_6 = v3.LocalPlayer
local v_u_7 = workspace.CurrentCamera
local v8 = require(v5.Modules.Trove)
local v9 = v5:FindFirstChild("Assets"):FindFirstChild("EventAssets")
if not v9 then
	warn("[SilentNight] EventAssets folder not found!")
end
local v_u_10
if v9 then
	v_u_10 = v9:FindFirstChild("SnowWalk")
else
	v_u_10 = nil
end
local v_u_11 = script:FindFirstChild("SnowParticle")
local v_u_12 = script:FindFirstChild("Sky")
local v_u_13 = require(v5.Modules.SkyboxManager)
local v_u_14 = game.Lighting:FindFirstChild("SnowColorCorrection")
if not v_u_14 then
	v_u_14 = Instance.new("ColorCorrectionEffect")
	v_u_14.Name = "SnowColorCorrection"
	v_u_14.Brightness = 0
	v_u_14.Parent = game.Lighting
end
local v_u_15 = false
local v_u_16 = nil
local v_u_17 = {}
local v_u_18 = nil
local v_u_19 = v8.new()
local function v_u_26()
	-- upvalues: (ref) v_u_15, (copy) v_u_11, (ref) v_u_16, (copy) v_u_19, (ref) v_u_17, (copy) v_u_1, (copy) v_u_7, (copy) v_u_12, (copy) v_u_13, (copy) v_u_2, (ref) v_u_14, (copy) v_u_6, (ref) v_u_10, (ref) v_u_18
	if not v_u_15 and v_u_11 then
		v_u_15 = true
		v_u_16 = Instance.new("Part")
		v_u_16.Size = Vector3.new(300, 5, 300)
		v_u_16.Anchored = true
		v_u_16.CanCollide = false
		v_u_16.CanQuery = false
		v_u_16.CanTouch = false
		v_u_16.Transparency = 1
		v_u_16.Parent = workspace
		v_u_19:Add(v_u_16)
		v_u_17 = {}
		for _, v20 in ipairs(v_u_11:GetChildren()) do
			if v20:IsA("ParticleEmitter") then
				local v21 = v_u_19:Clone(v20)
				v21.Parent = v_u_16
				v21.Enabled = true
				local v22 = v_u_17
				table.insert(v22, v21)
			end
		end
		v_u_19:Add((v_u_1.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_15, (ref) v_u_16, (ref) v_u_7
			if v_u_15 and v_u_16 then
				v_u_16.CFrame = CFrame.new(v_u_7.CFrame.Position) + Vector3.new(0, 35, 0)
			end
		end)))
		if v_u_12 then
			v_u_13.AddSkybox(v_u_12)
			v_u_13.UpdateSkybox(v_u_12, 5)
		end
		v_u_2:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = Color3.fromRGB(211, 213, 252),
			["ExposureCompensation"] = 0.1,
			["Brightness"] = 0.4
		}):Play()
		v_u_2:Create(v_u_14, TweenInfo.new(5), {
			["Brightness"] = 0.05,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		local v23 = v_u_6.Character or v_u_6.CharacterAdded:Wait()
		local v_u_24 = v23:WaitForChild("Humanoid")
		local v25 = v23:WaitForChild("HumanoidRootPart")
		if v_u_10 then
			v_u_18 = v_u_10:Clone()
			v_u_18.Volume = 0
			v_u_18.Parent = v25
			v_u_2:Create(v_u_18, TweenInfo.new(5), {
				["Volume"] = v_u_10.Volume
			}):Play()
		end
		walkingConnection = v_u_1.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_24, (ref) v_u_18
			if v_u_24.MoveDirection.Magnitude > 0 then
				if v_u_18 and not v_u_18.IsPlaying then
					v_u_18:Play()
					return
				end
			elseif v_u_18 and v_u_18.IsPlaying then
				v_u_18:Stop()
			end
		end)
		v_u_19:Add(walkingConnection)
	end
end
local function v_u_28()
	-- upvalues: (ref) v_u_15, (copy) v_u_19, (ref) v_u_17, (copy) v_u_4, (copy) v_u_2, (ref) v_u_14, (copy) v_u_12, (copy) v_u_13, (ref) v_u_18
	if v_u_15 then
		v_u_15 = false
		v_u_19:Clean()
		for _, v27 in ipairs(v_u_17) do
			v27.Enabled = false
			v_u_4:AddItem(v27, 5)
		end
		v_u_17 = {}
		v_u_2:Create(v_u_14, TweenInfo.new(5), {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
		v_u_2:Create(game.Lighting, TweenInfo.new(5), {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}):Play()
		if v_u_12 then
			v_u_13.UpdateSkybox(v_u_12, 0)
		end
		if v_u_18 then
			v_u_2:Create(v_u_18, TweenInfo.new(5), {
				["Volume"] = 0
			}):Play()
			task.delay(5, function()
				-- upvalues: (ref) v_u_18
				if v_u_18 then
					v_u_18:Destroy()
				end
			end)
		end
	end
end
workspace:GetAttributeChangedSignal("SilentNight"):Connect(function()
	-- upvalues: (copy) v_u_26, (copy) v_u_28
	if workspace:GetAttribute("SilentNight") then
		v_u_26()
	else
		v_u_28()
	end
end)
if workspace:GetAttribute("SilentNight") then
	v_u_26()
end
return {}
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = workspace.CurrentCamera
local v_u_4 = game:GetService("Debris")
local v_u_5 = false
local v_u_6 = nil
local v_u_7 = {}
local v_u_8 = script:FindFirstChild("BlizzardParticle")
local v_u_9 = game.Lighting:FindFirstChild("SnowColorCorrection")
if not v_u_9 then
	v_u_9 = Instance.new("ColorCorrectionEffect")
	v_u_9.Name = "SnowColorCorrection"
	v_u_9.Brightness = 0
	v_u_9.Parent = game.Lighting
end
local v_u_10 = script:FindFirstChild("Sky")
local v_u_11 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local function v_u_15()
	-- upvalues: (ref) v_u_5, (copy) v_u_8, (ref) v_u_6, (ref) v_u_7, (copy) v_u_1, (copy) v_u_3, (copy) v_u_10, (copy) v_u_11, (copy) v_u_2, (ref) v_u_9
	if not v_u_5 and v_u_8 then
		v_u_5 = true
		v_u_6 = Instance.new("Part")
		v_u_6.Size = Vector3.new(300, 5, 300)
		v_u_6.Anchored = true
		v_u_6.CanCollide = false
		v_u_6.Transparency = 1
		v_u_6.Parent = workspace
		v_u_7 = {}
		for _, v12 in ipairs(v_u_8:GetChildren()) do
			if v12:IsA("ParticleEmitter") then
				local v13 = v12:Clone()
				v13.Parent = v_u_6
				v13.Enabled = true
				local v14 = v_u_7
				table.insert(v14, v13)
			end
		end
		v_u_1.RenderStepped:Connect(function()
			-- upvalues: (ref) v_u_5, (ref) v_u_6, (ref) v_u_3
			if v_u_5 and v_u_6 then
				v_u_6.CFrame = CFrame.new(v_u_3.CFrame.Position) + Vector3.new(0, 35, 0)
			end
		end)
		if v_u_10 then
			v_u_11.AddSkybox(v_u_10)
			v_u_11.UpdateSkybox(v_u_10, 2)
		end
		v_u_2:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = Color3.fromRGB(210, 240, 255),
			["ExposureCompensation"] = 0.2,
			["Brightness"] = 0.6
		}):Play()
		v_u_2:Create(v_u_9, TweenInfo.new(4), {
			["Brightness"] = 0.05,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}):Play()
	end
end
local function v_u_17()
	-- upvalues: (ref) v_u_5, (ref) v_u_7, (copy) v_u_4, (ref) v_u_6, (copy) v_u_2, (ref) v_u_9, (copy) v_u_10, (copy) v_u_11
	v_u_5 = false
	for _, v16 in ipairs(v_u_7) do
		v16.Enabled = false
		v_u_4:AddItem(v16, 5)
	end
	v_u_7 = {}
	if v_u_6 then
		v_u_6:Destroy()
		v_u_6 = nil
	end
	v_u_2:Create(v_u_9, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_2:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
	}):Play()
	if v_u_10 then
		v_u_11.UpdateSkybox(v_u_10, 0)
	end
end
workspace:GetAttributeChangedSignal("SnowDay"):Connect(function()
	-- upvalues: (copy) v_u_15, (copy) v_u_17
	if workspace:GetAttribute("SnowDay") == true then
		v_u_15()
	else
		v_u_17()
	end
end)
if workspace:GetAttribute("SnowDay") then
	v_u_15()
end
return {}
local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v_u_3 = workspace.CurrentCamera
local v_u_4 = game:GetService("Debris")
local v_u_5 = script:FindFirstChild("WarmFog")
local v_u_6 = script:FindFirstChild("ChristmasParticles")
local v_u_7 = script:FindFirstChild("Sky")
local v_u_8 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_9 = false
local v_u_10 = nil
local v_u_11 = {}
local v_u_12 = nil
local v_u_13 = game.Lighting:FindFirstChild("SnowColorCorrection")
if not v_u_13 then
	v_u_13 = Instance.new("ColorCorrectionEffect")
	v_u_13.Name = "SnowColorCorrection"
	v_u_13.Brightness = 0
	v_u_13.Parent = game.Lighting
end
local function v_u_18()
	-- upvalues: (ref) v_u_9, (copy) v_u_6, (ref) v_u_10, (ref) v_u_11, (ref) v_u_12, (copy) v_u_1, (copy) v_u_3, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2, (ref) v_u_13
	if not v_u_9 then
		v_u_9 = true
		if v_u_6 then
			v_u_10 = Instance.new("Part")
			v_u_10.Size = Vector3.new(300, 5, 300)
			v_u_10.Anchored = true
			v_u_10.CanCollide = false
			v_u_10.Transparency = 1
			v_u_10.Parent = workspace
			v_u_11 = {}
			for _, v14 in ipairs({
				"P2",
				"ChickenLeg",
				"Gingerbread",
				"Wreath"
			}) do
				local v15 = v_u_6:FindFirstChild(v14)
				if v15 and v15:IsA("ParticleEmitter") then
					local v16 = v15:Clone()
					v16.Parent = v_u_10
					v16.Enabled = true
					local v17 = v_u_11
					table.insert(v17, v16)
				end
			end
			v_u_12 = v_u_1.RenderStepped:Connect(function()
				-- upvalues: (ref) v_u_9, (ref) v_u_10, (ref) v_u_3
				if v_u_9 and v_u_10 then
					v_u_10.CFrame = CFrame.new(v_u_3.CFrame.Position) + Vector3.new(0, 35, 0)
				end
			end)
		end
		if v_u_7 then
			v_u_8.AddSkybox(v_u_7)
			v_u_8.UpdateSkybox(v_u_7, 2)
		end
		if v_u_5 then
			v_u_5.Parent = game.Lighting
			v_u_2:Create(v_u_5, TweenInfo.new(4), {
				["Density"] = 0.15,
				["Haze"] = 2.5
			}):Play()
		end
		v_u_2:Create(game.Lighting, TweenInfo.new(4), {
			["Ambient"] = Color3.fromRGB(249, 246, 221),
			["ExposureCompensation"] = 0.1,
			["Brightness"] = 1.1
		}):Play()
		v_u_2:Create(v_u_13, TweenInfo.new(4), {
			["Brightness"] = 0.1,
			["TintColor"] = Color3.fromRGB(255, 244, 230)
		}):Play()
	end
end
local function v_u_20()
	-- upvalues: (ref) v_u_9, (ref) v_u_11, (copy) v_u_4, (ref) v_u_10, (ref) v_u_12, (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_2, (ref) v_u_13
	v_u_9 = false
	for _, v19 in ipairs(v_u_11) do
		v19.Enabled = false
		v_u_4:AddItem(v19, 5)
	end
	v_u_11 = {}
	if v_u_10 then
		v_u_10:Destroy()
		v_u_10 = nil
	end
	if v_u_12 then
		v_u_12:Disconnect()
		v_u_12 = nil
	end
	if v_u_7 then
		v_u_8.UpdateSkybox(v_u_7, 0)
	end
	if v_u_5 then
		v_u_2:Create(v_u_5, TweenInfo.new(3), {
			["Density"] = 0,
			["Haze"] = 0
		}):Play()
	end
	v_u_2:Create(v_u_13, TweenInfo.new(3), {
		["Brightness"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	v_u_2:Create(game.Lighting, TweenInfo.new(3), {
		["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
		["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
		["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
	}):Play()
end
workspace:GetAttributeChangedSignal("ChristmasDinner"):Connect(function()
	-- upvalues: (copy) v_u_18, (copy) v_u_20
	if workspace:GetAttribute("ChristmasDinner") == true then
		v_u_18()
	else
		v_u_20()
	end
end)
if workspace:GetAttribute("ChristmasDinner") then
	v_u_18()
end
return {}
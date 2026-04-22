local v1 = {}
local _ = game.ReplicatedStorage.SnowParticle
Random.new()
local _ = workspace.CurrentCamera
local v2 = RaycastParams.new()
v2.FilterDescendantsInstances = { workspace.Terrain, workspace }
v2.FilterType = Enum.RaycastFilterType.Include
local v_u_3 = false
local v_u_4 = game.Lighting.ColorCorrection:Clone()
v_u_4.Name = script.Name
v_u_4.Parent = game.Lighting
local v5 = script.Sky
local v_u_6 = require(game.ReplicatedStorage.Field_Of_View_Module)
require(game.ReplicatedStorage.Code.BodyShaker)
require(game.ReplicatedStorage.Modules.SkyboxManager).AddSkybox(v5)
local v_u_7 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_9 = v_u_7.new(Enum.RenderPriority.Camera.Value, function(p8)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p8
end)
local function v_u_18()
	-- upvalues: (ref) v_u_3, (copy) v_u_4, (copy) v_u_9, (copy) v_u_7, (copy) v_u_6
	v_u_3 = true
	game.TweenService:Create(game.Lighting, TweenInfo.new(2), {
		["Ambient"] = Color3.fromRGB(70, 70, 70),
		["Brightness"] = 2,
		["ColorShift_Bottom"] = Color3.fromRGB(153, 153, 153),
		["ColorShift_Top"] = Color3.fromRGB(171, 255, 170),
		["OutdoorAmbient"] = Color3.fromRGB(172, 172, 172),
		["ClockTime"] = 3.277,
		["ExposureCompensation"] = 0.75
	}):Play()
	game.Lighting.Atmosphere.Color = Color3.fromRGB(41, 91, 39)
	game.Lighting.Atmosphere.Decay = Color3.fromRGB(255, 255, 255)
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0.1,
		["Haze"] = 2.05,
		["Glare"] = 0.32
	}):Play()
	game.TweenService:Create(v_u_4, TweenInfo.new(2), {
		["Brightness"] = 0,
		["Contrast"] = 0.1,
		["Saturation"] = 0.15,
		["TintColor"] = Color3.fromRGB(201, 201, 255)
	}):Play()
	game.TweenService:Create(workspace.Terrain.Clouds, TweenInfo.new(5), {
		["Cover"] = 0.623,
		["Density"] = 0.145,
		["Color"] = Color3.fromRGB(25, 93, 24)
	}):Play()
	v_u_9:Start()
	v_u_9:ShakeSustain(v_u_7.Presets.Earthquake)
	task.delay(3, function()
		-- upvalues: (ref) v_u_9
		v_u_9:StopSustained(2)
	end)
	local v10 = script:WaitForChild("ZombieWindEffect"):Clone()
	v10.Parent = workspace
	if not workspace:GetAttribute("JandelZombie_Slam_Started") then
		workspace:GetAttributeChangedSignal("JandelZombie_Slam_Started"):Once(function()
			-- upvalues: (ref) v_u_9, (ref) v_u_7
			if workspace:GetAttribute("JandelZombie_Slam_Started") then
				v_u_9:ShakeSustain(v_u_7.Presets.Earthquake)
				task.wait(5)
				v_u_9:StopSustained(2)
			end
		end)
	end
	if not workspace:GetAttribute("JandelZombie_Slam") then
		workspace:GetAttributeChangedSignal("JandelZombie_Slam"):Once(function()
			-- upvalues: (ref) v_u_6, (ref) v_u_9, (ref) v_u_7
			if workspace:GetAttribute("JandelZombie_Slam") then
				local v11 = workspace:FindFirstChild("ZombieDirtSpawners")
				if v11 then
					for _, v12 in v11:GetChildren() do
						for _, v13 in v12.Attachment:GetChildren() do
							if v13:IsA("ParticleEmitter") then
								v13:Emit(v13:GetAttribute("EmitCount") or 1)
							end
						end
					end
				end
				local v14 = script.SlamVfx:Clone()
				v14.Parent = workspace
				for _, v15 in v14:GetChildren() do
					v15:Emit(v15:GetAttribute("EmitCount"))
				end
				game:GetService("Debris"):AddItem(v14, 3)
				local v_u_16 = game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
				if v_u_16 then
					v_u_16 = game.Players.LocalPlayer.Character
				end
				if v_u_16 then
					v_u_16.Humanoid.JumpPower = 200
					v_u_16.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.delay(0.1, function()
						-- upvalues: (copy) v_u_16
						v_u_16.Humanoid.JumpPower = 50
					end)
				end
				v_u_6.Change_FOV(50, 0.5)
				v_u_9:Shake(v_u_7.Presets.Explosion)
				task.wait(0.5)
				v_u_6.Change_FOV(70, 0.5)
			end
		end)
	end
	repeat
		task.wait()
	until v_u_3 == false
	game.TweenService:Create(game.Lighting, TweenInfo.new(0.1), {
		["Ambient"] = Color3.fromRGB(138, 138, 138),
		["Brightness"] = 2,
		["ColorShift_Bottom"] = Color3.fromRGB(0, 0, 0),
		["ColorShift_Top"] = Color3.fromRGB(0, 0, 0),
		["OutdoorAmbient"] = Color3.fromRGB(128, 128, 128),
		["ClockTime"] = 14,
		["ExposureCompensation"] = 0
	}):Play()
	for _, v17 in v10:GetChildren() do
		v17.Enabled = false
	end
	v_u_9:StopSustained(2)
	game.Debris:AddItem(v10, 4)
	game.TweenService:Create(v_u_4, TweenInfo.new(3), {
		["Brightness"] = 0,
		["Contrast"] = 0,
		["Saturation"] = 0,
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
	game.TweenService:Create(game.Lighting.Atmosphere, TweenInfo.new(2), {
		["Density"] = 0,
		["Haze"] = 0,
		["Color"] = Color3.fromRGB(215, 244, 255),
		["Decay"] = Color3.fromRGB(190, 238, 255),
		["Glare"] = 0
	}):Play()
	game.TweenService:Create(workspace.Terrain.Clouds, TweenInfo.new(2), {
		["Cover"] = 0.646,
		["Density"] = 0,
		["Color"] = Color3.fromRGB(22, 40, 70)
	}):Play()
end
workspace:GetAttributeChangedSignal("JandelZombie"):Connect(function()
	-- upvalues: (copy) v_u_18, (ref) v_u_3
	if workspace:GetAttribute("JandelZombie") then
		v_u_18()
	else
		v_u_3 = false
	end
end)
if workspace:GetAttribute("JandelZombie") then
	task.defer(v_u_18)
else
	v_u_3 = false
end
return v1
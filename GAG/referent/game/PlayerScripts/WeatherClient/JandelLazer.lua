local v1 = {}
local v_u_2 = false
local v_u_3 = script.Sky
local v_u_4 = require(game.ReplicatedStorage.Modules.SkyboxManager)
local v_u_5 = require(game.ReplicatedStorage.Code.CameraShaker)
local v_u_6 = game.Lighting.ColorCorrection:Clone()
v_u_6.Name = script.Name
v_u_6.Parent = game.Lighting
local v_u_8 = v_u_5.new(Enum.RenderPriority.Camera.Value, function(p7)
	workspace.CurrentCamera.CFrame = workspace.CurrentCamera.CFrame * p7
end)
local function v_u_40()
	-- upvalues: (ref) v_u_2, (copy) v_u_8, (copy) v_u_5, (copy) v_u_6, (copy) v_u_4, (copy) v_u_3
	v_u_2 = true
	v_u_8:Start()
	tick()
	task.spawn(function()
		-- upvalues: (ref) v_u_8, (ref) v_u_5, (ref) v_u_6
		v_u_8:Shake(v_u_5.Presets.Explosion)
		game.TweenService:Create(v_u_6, TweenInfo.new(0.3), {
			["TintColor"] = Color3.fromRGB(255, 219, 201),
			["Brightness"] = 0.5
		}):Play()
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(0.5), {
			["FieldOfView"] = 90
		}):Play()
		task.wait(0.3)
		game.TweenService:Create(game.Workspace.CurrentCamera, TweenInfo.new(3), {
			["FieldOfView"] = 70
		}):Play()
		game.TweenService:Create(v_u_6, TweenInfo.new(3), {
			["TintColor"] = Color3.fromRGB(255, 255, 255),
			["Brightness"] = 0
		}):Play()
	end)
	local v_u_9 = workspace:FindFirstChild("BW_JANDEL") or workspace.Visuals:WaitForChild("jandel")
	local v_u_10 = v_u_9:GetPivot()
	local v_u_11 = game.ReplicatedStorage.LazerEyes:Clone()
	v_u_11.Parent = workspace.Visuals
	local v_u_12 = game.ReplicatedStorage.Assets.beamTrail:Clone()
	v_u_12.Parent = workspace.Visuals
	local _ = v_u_9:GetPivot().Position
	local v13 = v_u_11:FindFirstChild("LeftEye", true)
	local v14 = v_u_11:FindFirstChild("RightEye", true)
	local function v_u_28(p15)
		-- upvalues: (copy) v_u_11, (copy) v_u_9, (copy) v_u_12
		local v16 = RaycastParams.new()
		v16.FilterDescendantsInstances = { workspace.BasePlate.TopBaseplate }
		v16.FilterType = Enum.RaycastFilterType.Include
		if workspace.Visuals:FindFirstChild("LazerSpot") then
			local v17 = v_u_11:GetPivot():Lerp(workspace.Visuals.LazerSpot.CFrame, p15 * 5)
			local v18 = CFrame.new(v17.Position, v_u_9:GetPivot().p)
			local v19 = v_u_9:GetPivot()
			local v20 = CFrame.new(v19.Position, workspace.Visuals.LazerSpot.Position)
			local v21 = (v_u_9.Head.CFrame.LookVector + CFrame.new(v_u_9.Head.Position, v17.Position).LookVector * 150).Unit
			local v22 = (v_u_9.Head.Position - workspace.Visuals.LazerSpot.Position).Magnitude * 1.2
			local v23 = workspace:Raycast(v_u_9.Head.CFrame.Position, v21 * v22, v16)
			if not v23 then
				v_u_9:PivotTo(v19:Lerp(v20, p15 * 5))
				v_u_11:PivotTo(v18)
				for _, v24 in v_u_12:GetChildren() do
					if v24:IsA("Trail") then
						v24.Enabled = false
					end
				end
				v_u_12.CFrame = CFrame.new(v_u_11:GetPivot().Position) * CFrame.new(0, 0, -0.1)
				return
			end
			v_u_9:PivotTo(v19:Lerp(v20, p15 * 5))
			v_u_11:PivotTo(CFrame.new(v23.Position, v_u_9:GetPivot().p) * CFrame.Angles(0, 4.71238898038469, 0))
			for _, v25 in v_u_12:GetChildren() do
				if v25:IsA("Trail") then
					v25.Enabled = true
				end
			end
			local v26 = v_u_12.CFrame
			local v27 = CFrame.new(v_u_11:GetPivot().Position, v26.Position).LookVector * Vector3.new(1, 0, 1)
			v_u_12.CFrame = CFrame.new(v_u_11:GetPivot().Position, v_u_11:GetPivot().Position + v23.Normal + v27) * CFrame.new(0, 0, -0.1)
		end
	end
	for _, v29 in v13:GetDescendants() do
		if v29:IsA("Beam") then
			v29.Attachment0 = v_u_9:FindFirstChild("LeftEye", true)
			if workspace:FindFirstChild("BW_JANDEL") then
				v29.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0)) })
			end
		end
	end
	for _, v30 in v14:GetDescendants() do
		if v30:IsA("Beam") then
			v30.Attachment0 = v_u_9:FindFirstChild("RightEye", true)
			if workspace:FindFirstChild("BW_JANDEL") then
				v30.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 255, 0)), ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 255, 0)) })
			end
		end
	end
	v_u_28(1)
	task.spawn(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_28, (copy) v_u_9, (copy) v_u_10, (copy) v_u_11, (copy) v_u_12, (ref) v_u_4, (ref) v_u_3, (ref) v_u_6
		while v_u_2 do
			v_u_28((game:GetService("RunService").Heartbeat:Wait()))
		end
		if v_u_9 then
			v_u_9:PivotTo(v_u_10)
		end
		v_u_11:Destroy()
		game.Debris:AddItem(v_u_12, 10)
		v_u_4.UpdateSkybox(v_u_3, 0)
		local v31 = game.TweenService
		local v32 = v_u_6
		local v33 = TweenInfo.new(3)
		local v34 = {
			["Brightness"] = 0,
			["TintColor"] = Color3.fromRGB(255, 255, 255)
		}
		v31:Create(v32, v33, v34):Play()
		local v35 = game.TweenService
		local v36 = game.Lighting
		local v37 = TweenInfo.new(3)
		local v38 = {
			["Ambient"] = game.Lighting:GetAttribute("DefaultAmbient"),
			["ExposureCompensation"] = game.Lighting:GetAttribute("DefaultExposure"),
			["Brightness"] = game.Lighting:GetAttribute("DefaultBrightness")
		}
		v35:Create(v36, v37, v38):Play()
		local v39 = {
			["Cover"] = 0,
			["Density"] = 0
		}
		game.TweenService:Create(game.Workspace.Terrain.Clouds, TweenInfo.new(3), v39):Play()
		task.delay(3, function()
			game.Workspace.Terrain.Clouds.Enabled = false
		end)
	end)
	repeat
		task.wait()
	until v_u_2 == false
	game.Debris:AddItem(v_u_12, 3)
	v_u_11:Destroy()
end
workspace:GetAttributeChangedSignal("JandelLazer"):Connect(function()
	-- upvalues: (copy) v_u_40, (ref) v_u_2
	if workspace:GetAttribute("JandelLazer") then
		v_u_40()
	else
		v_u_2 = false
	end
end)
if workspace:GetAttribute("JandelLazer") then
	task.defer(v_u_40)
else
	v_u_2 = false
end
return v1
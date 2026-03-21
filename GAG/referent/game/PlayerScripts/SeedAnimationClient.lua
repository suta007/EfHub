local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("TweenService")
local v3 = v1.GameEvents.PlantSeedAnimation
local v_u_4 = script:WaitForChild("SeedTemplate")
local v_u_5 = game.Players.LocalPlayer.PlayerGui:WaitForChild("ReplicatedAssets")
v3.OnClientEvent:Connect(function(p_u_6, p7)
	-- upvalues: (copy) v_u_5, (copy) v_u_4, (copy) v_u_2
	if p_u_6 then
		local v8 = v_u_5 and (p7 and v_u_5:FindFirstChild(p7))
		if v8 then
			v8 = v8:Clone()
			v8.Anchored = true
			v8.CanCollide = false
			v8.Parent = nil
		end
		if not v8 then
			v8 = v_u_4:Clone()
			v8.Anchored = true
			v8.CanCollide = false
			v8.Parent = nil
		end
		local v_u_9 = Instance.new("Model")
		v_u_9.Name = "SeedModel"
		v8.Parent = v_u_9
		v_u_9.PrimaryPart = v8
		v_u_9.Parent = game.Workspace.WeatherVisuals
		game:GetService("Debris"):AddItem(v_u_9, 5)
		v8.CastShadow = false
		for _, v10 in v8:GetChildren() do
			if v10:IsA("BasePart") then
				v10.CastShadow = false
			else
				v10:Destroy()
			end
		end
		if v8.Name ~= "SeedTemplate" then
			for _, v11 in script.SeedTemplate:GetChildren() do
				v11:Clone().Parent = v8
			end
		end
		for _, v12 in ipairs(v8:GetDescendants()) do
			if v12:IsA("BasePart") and v12 ~= v8 then
				v12.Anchored = false
				v12.Massless = true
				v12.CanCollide = false
				local v13 = Instance.new("WeldConstraint")
				v13.Part0 = v8
				v13.Part1 = v12
				v13.Parent = v8
			end
		end
		local v14 = v8:WaitForChild("A1")
		local v15 = v8:WaitForChild("A2")
		v14.Position = Vector3.new(-0, -0.3, -0)
		v15.Position = Vector3.new(0, 0.3, 0)
		for _, v16 in v8:GetDescendants() do
			if v16:IsA("ParticleEmitter") or v16:IsA("Trail") then
				v16.Color = ColorSequence.new(v8.Color)
			end
		end
		local v17 = p_u_6 + Vector3.new(0, 6, 0)
		v8.Size = Vector3.new(0.6, 0.6, 0.6)
		v_u_9:PivotTo(CFrame.new(v17))
		local v_u_18 = Instance.new("CFrameValue")
		game:GetService("Debris"):AddItem(v_u_18, 5)
		v_u_18.Value = v_u_9:GetPivot()
		local v_u_19 = v_u_18:GetPropertyChangedSignal("Value"):Connect(function()
			-- upvalues: (copy) v_u_9, (copy) v_u_18
			if v_u_9 and v_u_9.Parent then
				v_u_9:PivotTo(v_u_18.Value)
			end
		end)
		local v20 = v_u_2:Create(v_u_18, TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Value"] = CFrame.new(p_u_6)
		})
		v20:Play()
		task.delay(0.1, function()
			-- upvalues: (copy) p_u_6, (ref) v_u_2
			local v21 = math.random(7, 8)
			local v22 = { Color3.fromRGB(112, 66, 37) }
			for _ = 1, v21 do
				local v_u_23 = Instance.new("Part")
				local v24 = math.random(2, 3) / 10
				v_u_23.Size = Vector3.new(v24, v24, v24)
				v_u_23.Color = v22[1]
				v_u_23.Material = Enum.Material.Plastic
				v_u_23.Anchored = true
				v_u_23.CanCollide = false
				v_u_23.Massless = true
				v_u_23.Position = p_u_6 + Vector3.new(0, -0.1, 0)
				local v25 = math.random(-180, 180)
				local v26 = math.random(-180, 180)
				local v27 = math.random
				v_u_23.Orientation = Vector3.new(v25, v26, v27(-180, 180))
				v_u_23.Parent = game.Workspace.WeatherVisuals
				local v28 = math.random(-100, 100) / 100
				local v29 = math.random(-100, 100) / 100
				local v30 = Vector3.new(v28, 0, v29).Unit
				local v31 = math.random(2, 3)
				local v32 = math.random(1, 2.5)
				local v_u_33 = v_u_23.Position + v30 * (v32 * 0.4) + Vector3.new(0, v31, 0)
				local v_u_34 = v_u_23.Position + v30 * v32 + Vector3.new(0, -0.1, 0)
				task.spawn(function()
					-- upvalues: (copy) v_u_23, (copy) v_u_33, (copy) v_u_34, (ref) v_u_2
					for v35 = 0, 1, 0.05 do
						v_u_23.Position = (1 - v35) ^ 2 * v_u_23.Position + (1 - v35) * 2 * v35 * v_u_33 + v35 ^ 2 * v_u_34
						local v36 = v_u_23
						local v37 = v36.Orientation
						local v38 = math.random(-8, 8)
						local v39 = math.random(-12, 12)
						local v40 = math.random
						v36.Orientation = v37 + Vector3.new(v38, v39, v40(-8, 8))
						task.wait(0.012)
					end
					v_u_2:Create(v_u_23, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
						["Transparency"] = 1,
						["Size"] = v_u_23.Size * 0.3
					}):Play()
					task.delay(0.55, function()
						-- upvalues: (ref) v_u_23
						v_u_23:Destroy()
					end)
				end)
			end
		end)
		v20.Completed:Wait()
		for _, v41 in v8:GetDescendants() do
			if v41:IsA("BasePart") then
				local v42 = v_u_2
				local v43 = TweenInfo.new(0.1, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
				local v44 = {}
				local v45 = v41.Size.X * 1.3
				local v46 = v41.Size.Y * 0.55
				local v47 = v41.Size.Z * 1.3
				v44.Size = Vector3.new(v45, v46, v47)
				v42:Create(v41, v43, v44):Play()
			end
		end
		task.wait(0.1)
		v_u_2:Create(v_u_18, TweenInfo.new(1, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut), {
			["Value"] = CFrame.new(p_u_6 + Vector3.new(0, -0.35, 0))
		}):Play()
		task.delay(0.4, function()
			-- upvalues: (copy) v_u_9, (ref) v_u_2
			for _, v48 in v_u_9:GetDescendants() do
				if v48:IsA("BasePart") or (v48:IsA("Decal") or v48:IsA("Texture")) then
					v_u_2:Create(v48, TweenInfo.new(0.8), {
						["Transparency"] = 1
					}):Play()
				end
			end
		end)
		task.delay(2.3, function()
			-- upvalues: (copy) v_u_19, (copy) v_u_18, (copy) v_u_9
			v_u_19:Disconnect()
			v_u_18:Destroy()
			if v_u_9 and v_u_9.Parent then
				v_u_9:Destroy()
			end
		end)
	end
end)
local v_u_1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("CollectionService")
local function v_u_12(p3, p4)
	local v5 = p4.Fruit_Spawn
	if not p4:HasTag("CSP_GeneratedFruitSpawns") then
		repeat
			task.wait()
		until p4:HasTag("CSP_GeneratedFruitSpawns")
	end
	if v5 and #v5:GetChildren() ~= 0 then
		local v6 = p3:GetAttribute("FruitSpawnIndex") or math.random(1, #v5:GetChildren())
		local v7 = v5:GetChildren()[v6]
		if v7 then
			local v8 = v7.CFrame
			if not p4:GetAttribute("SkipRotation") then
				math.randomseed(p3.Item_Seed.Value)
				local v9 = CFrame.Angles
				local v10 = math.random(-180, 180)
				v8 = v8 * v9(0, math.rad(v10), 0)
			end
			p3:PivotTo(v8)
			for _, v11 in p3:GetDescendants() do
				if v11:IsA("BasePart") then
					v11.CanCollide = false
					v11.CastShadow = false
				end
			end
		else
			warn((("Failed to fetch spawn part at index %*!"):format(v6)))
			p3:PivotTo(p4:GetPivot())
		end
	else
		p3:PivotTo(p4:GetPivot())
		return
	end
end
local function v_u_23(p_u_13, p14)
	-- upvalues: (copy) v_u_1, (copy) v_u_12, (copy) v_u_23
	if p_u_13:IsDescendantOf(workspace) then
		local v15 = p_u_13:GetAttribute("GrowthType")
		if v15 == "Fruit" and not p14 then
			return
		elseif not p_u_13:HasTag("CSP_Registered") then
			p_u_13:AddTag("CSP_Registered")
			local v16 = require(v_u_1.PlantGrowthModules[p_u_13.Name])[v15]
			repeat
				task.wait()
			until p_u_13:HasTag("CSP_Ready")
			v16.Init(p_u_13)
			task.spawn(v16.StartListening, p_u_13)
			if v15 == "Fruit" then
				v_u_12(p_u_13, p14)
				local v17 = p_u_13:FindFirstChildWhichIsA("ProximityPrompt", true)
				if v17 then
					v17.Triggered:Connect(function()
						-- upvalues: (ref) v_u_1, (copy) p_u_13
						local v18 = { p_u_13 }
						v_u_1.GameEvents.Crops.Collect:FireServer(v18)
						local v19
						if p_u_13.Variant.Value == "Normal" then
							v19 = game.SoundService.Collect.Name
						else
							v19 = p_u_13.Variant.Value
						end
						game.ReplicatedStorage.GameEvents.PickupEvent:Fire(v19)
					end)
				end
			end
			local v20 = p_u_13:FindFirstChild("Fruits")
			if v20 then
				for _, v21 in v20:GetChildren() do
					v_u_23(v21, p_u_13)
				end
				v20.ChildAdded:Connect(function(p22)
					-- upvalues: (ref) v_u_23, (copy) p_u_13
					v_u_23(p22, p_u_13)
				end)
			end
		end
	else
		return
	end
end
v_u_2:GetInstanceAddedSignal("CLIENT_GROWTH_ENABLED"):Connect(v_u_23)
workspace.DescendantAdded:Connect(function(p24)
	-- upvalues: (copy) v_u_23
	if p24:IsA("Model") then
		if p24:HasTag("CLIENT_GROWTH_ENABLED") then
			v_u_23(p24)
		end
	else
		return
	end
end)
task.spawn(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_23
	game.Loaded:Wait()
	for _, v25 in v_u_2:GetTagged("CLIENT_GROWTH_ENABLED") do
		v_u_23(v25)
	end
end)
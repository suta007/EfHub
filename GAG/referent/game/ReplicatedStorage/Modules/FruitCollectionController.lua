local v1 = {}
if game:GetService("RunService"):IsClient() then
	require(game.ReplicatedStorage.Modules.Maid)
	local v_u_2 = require(game.ReplicatedStorage.Item_Module)
	local v_u_3 = require(game.ReplicatedStorage.Data.SeedData)
	local function v_u_9(p4)
		if p4 and p4:IsA("Model") then
			local v5 = p4.PrimaryPart
			if v5 then
				local v6 = p4:GetDescendants()
				for _, v7 in pairs(v6) do
					v7.Anchored = false
					v7.CanCollide = false
					local v8 = Instance.new("WeldConstraint")
					v8.Part0 = v5
					v8.Part1 = v7
					v8.Parent = v5
				end
				v5.Anchored = false
			end
		else
			return
		end
	end
	local function v_u_13(p10)
		-- upvalues: (copy) v_u_3, (copy) v_u_2
		local v11 = v_u_3[p10]
		if v11 then
			local v12 = v_u_2.Return_Rarity_Data(v11.SeedRarity)
			if v12 then
				return Color3.new(v12[2])
			else
				return Color3.fromRGB(255, 255, 255)
			end
		else
			return Color3.fromRGB(255, 255, 255)
		end
	end
	local function v_u_29(p14)
		-- upvalues: (copy) v_u_13
		local v15 = v_u_13(p14.Name)
		local v16 = script.Trails.Trail:Clone()
		local v17 = script.Trails.Trail2:Clone()
		local v18 = script.Trails.A1:Clone()
		local v19 = script.Trails.A0:Clone()
		local v20 = script.Trails.Stars:Clone()
		local v21 = {}
		local v22 = 0
		for _, v23 in pairs(p14:GetDescendants()) do
			if v23:IsA("BasePart") then
				local v24 = v23.BrickColor.Color
				v21[v24] = (v21[v24] or 0) + 1
				v22 = v22 + 1
			end
		end
		local v25 = Color3.fromRGB(255, 255, 255)
		if next(v21) then
			local v26 = 0
			for v27, v28 in pairs(v21) do
				if v26 < v28 then
					v25 = v27
					v26 = v28
				end
			end
		else
			p14:GetAttribute("Rarity")
			v25 = v25 or Color3.new(v15)
		end
		v16.Color = ColorSequence.new(v25)
		v17.Color = ColorSequence.new(v25)
		v20.Color = ColorSequence.new(v25)
		v19.Parent = p14.PrimaryPart
		v18.Parent = p14.PrimaryPart
		v16.Attachment0 = v19
		v16.Attachment1 = v18
		v17.Attachment0 = v19
		v17.Attachment1 = v18
		v16.Parent = p14.PrimaryPart
		v17.Parent = p14.PrimaryPart
		v20.Parent = p14.PrimaryPart
	end
	local function v_u_51(p_u_30)
		local v31 = require(game.ReplicatedStorage.Code.Bezier_2)
		local v32 = game.Players.LocalPlayer.Character.PrimaryPart
		local v33 = p_u_30.PrimaryPart.Position
		local v34 = v32.Position
		local v35 = math.random(8, 12)
		local v36 = v34 + Vector3.new(0, v35, 0)
		local v37 = math.random(-25, 25)
		local v38 = math.random
		local v39 = v36 + Vector3.new(v37, 0, v38(-25, 25))
		local v40 = v32.Position
		local v41 = math.random(4, 6)
		local v42 = v40 + Vector3.new(0, v41, 0)
		local v43 = math.random(-25, 25)
		local v44 = math.random
		local v45 = v42 + Vector3.new(v43, 0, v44(-25, 25))
		local v46 = v31.new(v33, v39, v45, v32)
		p_u_30.Parent = game.Workspace
		local v47 = TweenInfo.new(0.65, Enum.EasingStyle.Sine, Enum.EasingDirection.In, 0, false, 0)
		local v48 = v46:CreateCFrameTween(p_u_30.PrimaryPart, { "CFrame" }, v47)
		if p_u_30:GetAttribute("ActualSize") > 5 then
			local v_u_49 = Instance.new("NumberValue")
			v_u_49.Value = p_u_30:GetScale()
			v_u_49.Parent = p_u_30
			v_u_49.Changed:Connect(function()
				-- upvalues: (copy) p_u_30, (copy) v_u_49
				p_u_30:ScaleTo(v_u_49.Value)
			end)
			game:GetService("TweenService"):Create(v_u_49, v47, {
				["Value"] = 0.2
			}):Play()
		end
		v48:Play()
		v48.Completed:Connect(function()
			-- upvalues: (copy) p_u_30
			for _, v50 in p_u_30:GetDescendants() do
				if v50:IsA("BasePart") then
					v50.Transparency = 1
					v50.Anchored = true
				elseif v50:IsA("ParticleEmitter") then
					v50.Enabled = false
				end
			end
			game:GetService("Debris"):AddItem(p_u_30, 1.2)
		end)
	end
	function v1.StartCollection(_, p52)
		-- upvalues: (copy) v_u_9, (copy) v_u_29, (copy) v_u_51
		game:GetService("Debris"):AddItem(p52, 5)
		local v53, v54 = p52:GetBoundingBox()
		local v55 = Instance.new("Part")
		v55.Name = "PrimaryPart"
		v55.Size = v54
		v55.CFrame = v53
		v55.Anchored = true
		v55.CanCollide = false
		v55.Transparency = 1
		v55.Parent = p52
		p52.PrimaryPart = v55
		p52:SetAttribute("ActualSize", v54.Magnitude)
		v_u_9(p52)
		p52.Parent = game.Workspace
		v_u_29(p52)
		v_u_51(p52)
	end
end
return v1
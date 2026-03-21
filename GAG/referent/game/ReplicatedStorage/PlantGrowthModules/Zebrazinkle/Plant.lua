game:GetService("RunService"):IsServer()
return {
	["Init"] = function(p1)
		math.randomseed(p1.Item_Seed.Value)
		local v2 = p1.Trunk
		v2.Name = "1"
		local v3 = math.random(3, 4)
		local v4 = v3 + 1
		local v5 = math.random(2, 4) + v3
		local v6 = v3 + 1
		v2.Size = Vector3.new(v4, v5, v6)
		local v7 = { Color3.new(0, 0.666667, 0), Color3.new(0.0980392, 0.666667, 0), Color3.new(0.0666667, 0.666667, 0.0666667) }
		local v8 = v7[math.random(1, #v7)]
		local v9 = 1
		local v10 = {}
		local v11 = {}
		table.insert(v11, v2)
		if math.random(1, 2) == 1 then
			local v12 = math.random(-7, 7)
			local v13 = math.rad(v12)
			local v14 = math.random(-7, 7)
			local v15 = math.rad(v14)
			for _ = 1, v3 do
				local v16 = v2:Clone()
				v9 = v9 + 1
				v16.Name = tostring(v9)
				v16.Parent = p1
				local v17 = math.random(7, 11) - v3 * 0.1
				local v18 = v2.Size.X * 0.7
				local v19 = v2.Size.Z * 0.7
				v16.Size = Vector3.new(v18, v17, v19)
				v13 = v13 * 1.25
				v15 = v15 * 1.25
				v16.CFrame = v2.CFrame * CFrame.new(0, v2.Size.Y / 2, 0) * CFrame.Angles(v13, 0, v15) * CFrame.new(0, v16.Size.Y / 2, 0)
				v16.CFrame = v16.CFrame * CFrame.new(0, -0.25, 0)
				table.insert(v11, v16)
				v2 = v16
			end
		else
			for _ = 1, v3 do
				local v20 = v2:Clone()
				v9 = v9 + 1
				v20.Name = tostring(v9)
				v20.Parent = p1
				local v21 = math.random(7, 11)
				local v22 = v2.Size.X * 0.7
				local v23 = v2.Size.Z * 0.7
				v20.Size = Vector3.new(v22, v21, v23)
				local v24 = math.random(-7, 7)
				local v25 = math.rad(v24)
				local v26 = math.random(-7, 7)
				local v27 = math.rad(v26)
				v20.CFrame = v2.CFrame * CFrame.new(0, v2.Size.Y / 2, 0) * CFrame.Angles(v25, 0, v27) * CFrame.new(0, v20.Size.Y / 2, 0)
				v20.CFrame = v20.CFrame * CFrame.new(0, -0.25, 0)
				table.insert(v11, v20)
				v2 = v20
			end
		end
		task.spawn(function() end)
		if v2 then
			local v28 = math.random(5, 7)
			local v29 = 360 / v28
			local v30 = math.random(4, 5)
			local v31 = 0
			while v28 >= 1 do
				v28 = v28 - 1
				v31 = v31 + v29
				local v32 = v30 * math.random(8, 12) * 0.1
				local v33 = v2.CFrame * CFrame.new(0, v2.Size.Y / 2, 0)
				local v34 = v2:Clone()
				v9 = v9 + 1
				v34.Name = tostring(v9)
				v34.Parent = p1
				v34.Color = Color3.new(0, 0.666667, 0)
				v34.Size = Vector3.new(v32, 1, 2)
				v34.CFrame = v33
				v34.CFrame = v34.CFrame * CFrame.Angles(0, math.rad(v31), 0.4363323129985824)
				v34.CFrame = v34.CFrame * CFrame.new(v34.Size.X / 2, 0, 0)
				v34.Color = v8
				table.insert(v10, v34)
				for _ = 1, 3 do
					local v35 = v34:Clone()
					v9 = v9 + 1
					v35.Name = tostring(v9)
					v35.Parent = p1
					math.random(7, 11)
					local v36 = v34.Size.Y * 1
					local v37 = v34.Size.Z * 1
					v35.Size = Vector3.new(v32, v36, v37)
					local v38 = v32 * 5
					local v39 = math.rad(v38)
					v35.CFrame = v34.CFrame * CFrame.new(v34.Size.X / 2, 0, 0) * CFrame.Angles(0, 0, -v39) * CFrame.new(v35.Size.X / 2, 0, 0)
					v35.Color = v8
					table.insert(v10, v35)
					v34 = v35
				end
			end
		end
		for v40, v41 in pairs(v10) do
			local v42 = v41.Size.Y
			local v43 = v41.Size.X
			local v44 = v41.Size.Z
			v41.Size = Vector3.new(v42, v43, v44)
			v41.CFrame = v41.CFrame * CFrame.Angles(0, 0, 1.5707963267948966)
			v41.CFrame = v41.CFrame * CFrame.Angles(3.141592653589793, 0, 0)
			local v45 = p1.Fruit_Spawn:FindFirstChild((("Spawn_Point_%*"):format(v40))) or Instance.new("Part")
			v45.Size = Vector3.new(1, 1, 1)
			v45.Anchored = true
			v45.CanCollide = false
			v45.Transparency = 1
			v45.CFrame = v41.CFrame * CFrame.new(-v41.Size.X / 2, 0, 0)
			v45.Name = "Spawn_Point"
			v45.Parent = p1.Fruit_Spawn
			v45.CFrame = v45.CFrame * CFrame.Angles(0, 0, -1.5707963267948966)
		end
		return true
	end,
	["StartListening"] = function(p_u_46)
		math.randomseed(p_u_46.Item_Seed.Value)
		local v47 = require(game.ReplicatedStorage.Item_Module).Return_Data(p_u_46.Name)
		local v48 = require(game.ReplicatedStorage.Calculate_Weight).Calculate_Weight(p_u_46.Item_Seed.Value, p_u_46.Name) * (p_u_46:GetAttribute("WeightMulti") or 1)
		p_u_46.Weight.Value = v48
		require(game.ReplicatedStorage.Scale_Module)
		if v47 then
			p_u_46:ScaleTo(p_u_46.Weight.Value / v47[2])
			p_u_46:AddTag("PlantScaled")
		end
		local v49 = {}
		for _, v50 in pairs(p_u_46:GetDescendants()) do
			if v50:IsA("BasePart") and v50 ~= p_u_46.PrimaryPart then
				table.insert(v49, v50)
			end
		end
		local v_u_51 = p_u_46.PrimaryPart
		local v_u_52 = {}
		for _, v53 in pairs(v49) do
			v_u_51.CFrame:ToObjectSpace(v53.CFrame)
		end
		local v_u_54 = {}
		local function v_u_60(p55)
			-- upvalues: (copy) v_u_52, (copy) v_u_51, (copy) v_u_54
			if p55.Parent then
				if p55.Parent.Name ~= "Fruit_Spawn" then
					p55.Transparency = 1
					local v56 = v_u_52
					local v57 = { p55, p55.Size, v_u_51.CFrame:ToObjectSpace(p55.CFrame) }
					table.insert(v56, v57)
				end
				if p55.Parent.Name == "Fruit_Spawn" then
					local v58 = v_u_54
					local v59 = {
						["Part"] = p55,
						["CFrame"] = p55.CFrame
					}
					table.insert(v58, v59)
				end
			end
		end
		p_u_46.DescendantAdded:Connect(function(p61)
			-- upvalues: (copy) v_u_60
			if p61:IsA("BasePart") then
				local v62 = p61:FindFirstAncestorWhichIsA("Model")
				if game:GetService("CollectionService"):HasTag(v62, "Harvestable") and true or v62.Parent.Name == "Fruits" then
					return
				elseif not p61:HasTag("Effect") then
					p61.Transparency = 1
					v_u_60(p61)
				end
			else
				return
			end
		end)
		for _, v63 in pairs(v49) do
			if v63 ~= v_u_51 then
				local v64 = v63:FindFirstAncestorWhichIsA("Model")
				if not game:GetService("CollectionService"):HasTag(v64, "Harvestable") and v64.Parent.Name ~= "Fruits" then
					v_u_60(v63)
				end
			end
		end
		local v65 = 0
		for _, v66 in pairs(p_u_46:GetDescendants()) do
			if v66:IsA("BasePart") and v66.Parent.Name ~= "Fruit_Spawn" then
				local v67 = v66.Name
				if tonumber(v67) ~= nil then
					local v68 = v66.Name
					if tonumber(v68) then
						local v69 = v66.Name
						if v65 <= tonumber(v69) then
							local v70 = v66.Name
							v65 = tonumber(v70)
						end
					end
				end
			end
		end
		local function v90()
			-- upvalues: (copy) p_u_46, (copy) v_u_54, (copy) v_u_52, (copy) v_u_51
			local v71 = p_u_46.Grow.Age.Value + 1
			for _, v72 in v_u_54 do
				v72.Part.CFrame = v72.CFrame
			end
			for _, v73 in v_u_52 do
				local v74 = v73[1]
				local v75 = v74.Name
				local v76 = tonumber(v75)
				if v76 then
					local v77 = v71 - v76
					local v78 = math.clamp(v77, 0, 1)
					if v73[3] ~= nil and v73[2] ~= nil then
						local v79 = v73[2]
						local v80 = v_u_51.CFrame * v73[3]
						if v78 >= 1 then
							v74.Size = v79
							v74.CFrame = v80
							v74.Transparency = 0
							v74.CanCollide = true
						elseif v78 <= 0.025 then
							v74.Transparency = 1
							local v81 = v79.X
							local v82 = v79.Y * v78
							local v83 = v79.Z
							v74.Size = Vector3.new(v81, v82, v83)
							v74.CFrame = v80 * CFrame.new(0, (v74.Size.Y - v79.Y) / 2, 0)
							v74.CanCollide = false
						else
							v74.CFrame = v80 * CFrame.new(0, (v74.Size.Y - v79.Y) / 2, 0)
							local v84 = v79.X
							local v85 = v79.Y * v78
							local v86 = v79.Z
							v74.Size = Vector3.new(v84, v85, v86)
							local v87 = 0.1 - v78
							v74.Transparency = math.clamp(v87, 0, 1)
							v74.CanCollide = false
						end
						if v74:FindFirstChild("ClimbPart") then
							for _, v88 in v74:GetChildren() do
								local v89 = v88:GetAttribute("StudHeight")
								if v89 then
									if v89 <= v74.Size.Y and (v74.Size.Y > 1 and v74.Transparency ~= 1) then
										v88.CanCollide = true
									else
										v88.CanCollide = false
									end
								else
									v88.CanCollide = false
								end
							end
						end
					end
				end
			end
		end
		v90()
		p_u_46.Grow.Age:GetPropertyChangedSignal("Value"):Connect(v90)
	end
}
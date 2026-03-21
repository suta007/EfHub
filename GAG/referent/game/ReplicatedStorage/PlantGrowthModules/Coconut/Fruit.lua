return {
	["Init"] = function(_) end,
	["StartListening"] = function(p_u_1)
		math.randomseed(p_u_1.Item_Seed.Value)
		local v2 = require(game.ReplicatedStorage.Item_Module).Return_Data(p_u_1.Name)
		local v3 = require(game.ReplicatedStorage.Calculate_Weight).Calculate_Weight(p_u_1.Item_Seed.Value, p_u_1.Name) * (p_u_1:GetAttribute("WeightMulti") or 1)
		p_u_1.Weight.Value = v3
		require(game.ReplicatedStorage.Scale_Module)
		local v_u_4 = nil
		for _, v5 in pairs(p_u_1:GetDescendants()) do
			if v5:IsA("ProximityPrompt") then
				v_u_4 = v5
			end
		end
		local v6 = v_u_4.MaxActivationDistance
		if v2 then
			local v7 = p_u_1.Weight.Value / v2[2] * 3
			local v8 = math.sqrt(v7)
			p_u_1:ScaleTo((math.clamp(v8, 0.1, 2.5)))
			v_u_4.MaxActivationDistance = v6
			p_u_1:AddTag("PlantScaled")
		end
		local v9 = {}
		for _, v10 in pairs(p_u_1:GetDescendants()) do
			if v10:IsA("BasePart") and v10 ~= p_u_1.PrimaryPart then
				table.insert(v9, v10)
			end
		end
		local v_u_11 = {}
		local v_u_12 = p_u_1.PrimaryPart
		if not p_u_1:GetAttribute("NotRan") then
			p_u_1:SetAttribute("NotRan", true)
			for _, v13 in pairs(v9) do
				v_u_12.CFrame:ToObjectSpace(v13.CFrame)
			end
		end
		for _, v14 in pairs(v9) do
			local v15 = { v14, v14.Size, v_u_12.CFrame:ToObjectSpace(v14.CFrame) }
			table.insert(v_u_11, v15)
		end
		task.wait(1)
		game:GetService("TweenService")
		TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local v_u_16 = 0
		for _, v17 in pairs(p_u_1:GetDescendants()) do
			if not v17:HasTag("Effect") and v17:IsA("BasePart") then
				local v18 = v17.Name
				if tonumber(v18) ~= nil then
					local v19 = v17.Name
					if tonumber(v19) then
						local v20 = v17.Name
						if v_u_16 <= tonumber(v20) then
							local v21 = v17.Name
							v_u_16 = tonumber(v21)
						end
					end
				end
			end
		end
		function UPD()
			-- upvalues: (copy) p_u_1, (ref) v_u_16, (ref) v_u_4, (copy) v_u_11, (copy) v_u_12
			local v22 = {}
			local v23 = p_u_1.Grow.Age.Value + 1
			if v_u_16 + 1 <= v23 then
				v_u_4.Enabled = true
			else
				v_u_4.Enabled = false
			end
			for v24, v25 in v_u_11 do
				local v26 = v25[1]
				local v27 = v26.Name
				local v28 = tonumber(v27)
				if v28 then
					local v29 = v23 - v28
					local v30 = math.clamp(v29, 0, 1)
					if v30 >= 1 then
						v26.Size = v25[2]
						v26.CFrame = v_u_12.CFrame * v25[3]
						v26.Transparency = 0
						v26.CanCollide = true
						table.insert(v22, v24)
					elseif v30 <= 0.025 then
						v26.Transparency = 1
						local v31 = v25[2].X
						local v32 = v25[2].Y * v30
						local v33 = v25[2].Z
						v26.Size = Vector3.new(v31, v32, v33)
						v26.CFrame = v_u_12.CFrame * v25[3] * CFrame.new(0, (v26.Size.Y - v25[2].Y) / 2, 0)
						v26.CanCollide = false
					else
						v26.CFrame = v_u_12.CFrame * v25[3] * CFrame.new(0, (v26.Size.Y - v25[2].Y) / 2, 0)
						local v34 = v25[2].X
						local v35 = v25[2].Y * v30
						local v36 = v25[2].Z
						v26.Size = Vector3.new(v34, v35, v36)
						local v37 = 0.1 - v30
						v26.Transparency = math.clamp(v37, 0, 1)
						v26.CanCollide = false
					end
				end
			end
			for _, v38 in v22 do
				table.remove(v_u_11, v38)
			end
		end
		UPD()
		p_u_1.Grow.Age:GetPropertyChangedSignal("Value"):Connect(UPD)
	end
}
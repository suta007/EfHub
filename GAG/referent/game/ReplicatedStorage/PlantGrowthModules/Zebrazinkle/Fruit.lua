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
			p_u_1:ScaleTo(p_u_1.Weight.Value / v2[2])
			v_u_4.MaxActivationDistance = v6
			p_u_1:AddTag("PlantScaled")
		end
		local v7 = {}
		for _, v8 in pairs(p_u_1:GetDescendants()) do
			if v8:IsA("BasePart") and v8 ~= p_u_1.PrimaryPart then
				table.insert(v7, v8)
			end
		end
		local v_u_9 = {}
		local v_u_10 = p_u_1.PrimaryPart
		if not p_u_1:GetAttribute("NotRan") then
			p_u_1:SetAttribute("NotRan", true)
			for _, v11 in pairs(v7) do
				v_u_10.CFrame:ToObjectSpace(v11.CFrame)
			end
		end
		for _, v12 in pairs(v7) do
			local v13 = { v12, v12.Size, v_u_10.CFrame:ToObjectSpace(v12.CFrame) }
			table.insert(v_u_9, v13)
		end
		task.wait(1)
		game:GetService("TweenService")
		TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
		local v_u_14 = 0
		for _, v15 in pairs(p_u_1:GetDescendants()) do
			if not v15:HasTag("Effect") and v15:IsA("BasePart") then
				local v16 = v15.Name
				if tonumber(v16) ~= nil then
					local v17 = v15.Name
					if tonumber(v17) then
						local v18 = v15.Name
						if v_u_14 <= tonumber(v18) then
							local v19 = v15.Name
							v_u_14 = tonumber(v19)
						end
					end
				end
			end
		end
		function UPD()
			-- upvalues: (copy) p_u_1, (ref) v_u_14, (ref) v_u_4, (copy) v_u_9, (copy) v_u_10
			local v20 = {}
			local v21 = p_u_1.Grow.Age.Value + 1
			if v_u_14 + 1 <= v21 then
				v_u_4.Enabled = true
			else
				v_u_4.Enabled = false
			end
			for v22, v23 in v_u_9 do
				local v24 = v23[1]
				local v25 = v24.Name
				local v26 = tonumber(v25)
				if v26 then
					local v27 = v21 - v26
					local v28 = math.clamp(v27, 0, 1)
					if v28 >= 1 then
						v24.Size = v23[2]
						v24.CFrame = v_u_10.CFrame * v23[3]
						v24.Transparency = 0
						v24.CanCollide = true
						table.insert(v20, v22)
					elseif v28 <= 0.025 then
						v24.Transparency = 1
						local v29 = v23[2].X
						local v30 = v23[2].Y * v28
						local v31 = v23[2].Z
						v24.Size = Vector3.new(v29, v30, v31)
						v24.CFrame = v_u_10.CFrame * v23[3] * CFrame.new(0, (v24.Size.Y - v23[2].Y) / 2, 0)
						v24.CanCollide = false
					else
						v24.CFrame = v_u_10.CFrame * v23[3] * CFrame.new(0, (v24.Size.Y - v23[2].Y) / 2, 0)
						local v32 = v23[2].X
						local v33 = v23[2].Y * v28
						local v34 = v23[2].Z
						v24.Size = Vector3.new(v32, v33, v34)
						local v35 = 0.1 - v28
						v24.Transparency = math.clamp(v35, 0, 1)
						v24.CanCollide = false
					end
				end
			end
			for _, v36 in v20 do
				table.remove(v_u_9, v36)
			end
		end
		UPD()
		p_u_1.Grow.Age:GetPropertyChangedSignal("Value"):Connect(UPD)
	end
}
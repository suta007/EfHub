local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
local v3 = game:GetService("ReplicatedStorage")
local _ = v3.Assets
local v_u_4 = game:GetService("RunService")
local v5 = v3.Assets.VFX.Firefly
local v_u_6 = v5.VFX
local v_u_7 = v5.JarBreakParts
local v_u_8 = v5.Firefly
local function v_u_11(p9)
	for _, v10 in p9:GetDescendants() do
		if v10:IsA("ParticleEmitter") then
			v10.Enabled = false
		end
	end
end
local function v_u_20(p12)
	for _, v13 in p12:GetDescendants() do
		if v13:IsA("BasePart") or v13:IsA("UnionOperation") then
			local v14 = math.random(-10, 10)
			local v15 = math.random(15, 20)
			local v16 = math.random
			v13.AssemblyLinearVelocity = Vector3.new(v14, v15, v16(-10, 10))
			local v17 = math.random(-10, 10)
			local v18 = math.random(-10, 10)
			local v19 = math.random
			v13.AssemblyAngularVelocity = Vector3.new(v17, v18, v19(-10, 10))
		end
	end
end
local function v_u_25(p21, p22)
	-- upvalues: (copy) v_u_1
	local v23 = TweenInfo.new(p22, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	for _, v24 in ipairs(p21:GetDescendants()) do
		if v24:IsA("BasePart") then
			v_u_1:Create(v24, v23, {
				["Transparency"] = 1
			}):Play()
		end
	end
end
local function v_u_54(p_u_26, p_u_27, p_u_28, p_u_29, p30)
	-- upvalues: (copy) v_u_4
	if p_u_26.PrimaryPart then
		local v_u_31 = p30 or 5
		local v_u_32 = 0
		local v_u_33 = 0
		local v_u_53 = v_u_4.Heartbeat:Connect(function(p34)
			-- upvalues: (ref) v_u_33, (ref) v_u_32, (copy) p_u_29, (copy) p_u_28, (ref) v_u_31, (copy) p_u_27, (copy) p_u_26
			v_u_33 = v_u_33 + p34
			v_u_32 = v_u_32 + p_u_29 * p34
			local v35 = p_u_28
			local v36 = v_u_33 / v_u_31
			local v37 = math.clamp(v36, 0, 1)
			local v38 = math.lerp(0, v35, v37)
			local v39 = v_u_33 / v_u_31
			local v40 = math.clamp(v39, 0, 1)
			local v41 = math.lerp(0, 10, v40)
			local v42 = v_u_32
			local v43 = math.cos(v42) * v38
			local v44 = v_u_32
			local v45 = math.sin(v44) * v38
			local v46 = p_u_27 + Vector3.new(v43, v41, v45)
			local v47 = v_u_32
			local v48 = -math.sin(v47)
			local v49 = v_u_32
			local v50 = math.cos(v49)
			local v51 = Vector3.new(v48, 0, v50).Unit
			local v52 = CFrame.new(v46, v46 + v51)
			if p_u_26 then
				p_u_26:PivotTo(v52)
			end
		end)
		task.delay(v_u_31, function()
			-- upvalues: (ref) v_u_53
			v_u_53:Disconnect()
		end)
	else
		warn("Model needs a PrimaryPart set!")
	end
end
v3.GameEvents.FireflyJarVisual.OnClientEvent:Connect(function(p55)
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_7, (copy) v_u_20, (copy) v_u_8, (copy) v_u_54, (copy) v_u_25, (copy) v_u_11
	if p55 == nil then
		print("No part")
		return
	else
		local v56 = p55["Firefly Jar"]
		local v57 = v_u_6:Clone()
		v57.Parent = v56
		v57.Position = Vector3.new(0, -1, 0)
		local v58 = v57:FindFirstChild("Break")
		if v58 then
			v58:Emit(3)
		end
		v_u_2:AddItem(v57, 3)
		local v59 = v_u_7:Clone()
		v59.Parent = workspace.Visuals
		v59:PivotTo(v56:GetPivot())
		v_u_20(v59)
		v_u_2:AddItem(v59, 3)
		local v60 = v_u_8:Clone()
		v60.Parent = workspace.Visuals
		v60.AnimationController.Animator:LoadAnimation(v60.Walk):Play()
		v60:PivotTo(v56.Firefly:GetPivot())
		v_u_54(v60, v56.Firefly:GetPivot().Position, 5, 4, 10)
		task.delay(5, function() end)
		v_u_25(v60, 8)
		v_u_2:AddItem(v60, 10)
		task.wait(3)
		if v57 then
			v_u_11(v57)
		end
	end
end)
return {}
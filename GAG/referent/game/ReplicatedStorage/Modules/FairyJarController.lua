local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("Debris")
local v3 = game:GetService("ReplicatedStorage")
local _ = v3.Assets
local v_u_4 = game:GetService("RunService")
local v_u_5 = require(v3.Modules.SoundPlayer)
local v_u_6 = require(v3.Data.SoundData)
local v7 = v3.Assets.VFX.Fairy
local v_u_8 = v7.VFX
local v_u_9 = v7.JarBreakParts
local v_u_10 = v7.Pixie
local function v_u_13(p11)
	for _, v12 in p11:GetDescendants() do
		if v12:IsA("ParticleEmitter") then
			v12.Enabled = false
		end
	end
end
local function v_u_22(p14)
	for _, v15 in p14:GetDescendants() do
		if v15:IsA("BasePart") or v15:IsA("UnionOperation") then
			local v16 = math.random(-10, 10)
			local v17 = math.random(15, 20)
			local v18 = math.random
			v15.AssemblyLinearVelocity = Vector3.new(v16, v17, v18(-10, 10))
			local v19 = math.random(-10, 10)
			local v20 = math.random(-10, 10)
			local v21 = math.random
			v15.AssemblyAngularVelocity = Vector3.new(v19, v20, v21(-10, 10))
		end
	end
end
local function v_u_27(p23, p24)
	-- upvalues: (copy) v_u_1
	local v25 = TweenInfo.new(p24, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	for _, v26 in ipairs(p23:GetDescendants()) do
		if v26:IsA("BasePart") then
			v_u_1:Create(v26, v25, {
				["Transparency"] = 1
			}):Play()
		end
	end
end
local function v_u_30(p28, p29)
	-- upvalues: (copy) v_u_1
	if p28 then
		v_u_1:Create(p28, TweenInfo.new(p29, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
			["Rate"] = 0
		}):Play()
	end
end
local function v_u_59(p_u_31, p_u_32, p_u_33, p_u_34, p35)
	-- upvalues: (copy) v_u_4
	if p_u_31.PrimaryPart then
		local v_u_36 = p35 or 5
		local v_u_37 = 0
		local v_u_38 = 0
		local v_u_58 = v_u_4.Heartbeat:Connect(function(p39)
			-- upvalues: (ref) v_u_38, (ref) v_u_37, (copy) p_u_34, (copy) p_u_33, (ref) v_u_36, (copy) p_u_32, (copy) p_u_31
			v_u_38 = v_u_38 + p39
			v_u_37 = v_u_37 + p_u_34 * p39
			local v40 = p_u_33
			local v41 = v_u_38 / v_u_36
			local v42 = math.clamp(v41, 0, 1)
			local v43 = math.lerp(0, v40, v42)
			local v44 = v_u_38 / v_u_36
			local v45 = math.clamp(v44, 0, 1)
			local v46 = math.lerp(0, 10, v45)
			local v47 = v_u_37
			local v48 = math.cos(v47) * v43
			local v49 = v_u_37
			local v50 = math.sin(v49) * v43
			local v51 = p_u_32 + Vector3.new(v48, v46, v50)
			local v52 = v_u_37
			local v53 = -math.sin(v52)
			local v54 = v_u_37
			local v55 = math.cos(v54)
			local v56 = Vector3.new(v53, 0, v55).Unit
			local v57 = CFrame.new(v51, v51 + v56)
			if p_u_31 then
				p_u_31:PivotTo(v57)
			end
		end)
		task.delay(v_u_36, function()
			-- upvalues: (ref) v_u_58
			v_u_58:Disconnect()
		end)
	else
		warn("Model needs a PrimaryPart set!")
	end
end
v3.GameEvents.FairyJarVisual.OnClientEvent:Connect(function(p60)
	-- upvalues: (copy) v_u_8, (copy) v_u_2, (copy) v_u_9, (copy) v_u_22, (copy) v_u_10, (copy) v_u_59, (copy) v_u_5, (copy) v_u_6, (copy) v_u_30, (copy) v_u_27, (copy) v_u_13
	if p60 == nil then
		print("No part")
		return
	else
		local v61 = p60["Fairy Jar"]
		local v62 = v_u_8:Clone()
		v62.Parent = v61
		v62.Position = Vector3.new(0, -1, 0)
		local v63 = v62:FindFirstChild("Break")
		if v63 then
			v63:Emit(3)
		end
		v_u_2:AddItem(v62, 3)
		local v64 = v_u_9:Clone()
		v64.Parent = workspace.Visuals
		v64:PivotTo(v61:GetPivot())
		v_u_22(v64)
		v_u_2:AddItem(v64, 3)
		local v65 = v_u_10:Clone()
		v65.Parent = workspace.Visuals
		v65:PivotTo(v61.Pixie:GetPivot())
		v_u_59(v65, v61.Pixie:GetPivot().Position, 5, 4, 10)
		v_u_5:PlaySound(v_u_6.Tools.FairyJar.Sparkle, nil, nil, v65.PrimaryPart)
		local v_u_66 = v65.Head
		task.delay(5, function()
			-- upvalues: (copy) v_u_66
			v_u_66.TrailAttachment0.Trail.Enabled = false
		end)
		for v67 = 1, 4 do
			v_u_30(v_u_66[("CirclesTest%*"):format(v67)], 8)
		end
		v_u_27(v65, 8)
		v_u_2:AddItem(v65, 10)
		task.wait(3)
		if v62 then
			v_u_13(v62)
		end
	end
end)
return {}
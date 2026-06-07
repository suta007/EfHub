local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("SoundService")
local v_u_3 = game:GetService("Players")
local v_u_4 = game:GetService("TweenService")
local v_u_5 = require(v1.Modules.BeeEventV2Controllers.BeeColonyStateController)
local v_u_6 = require(v1.Data.BeeEvent.BeeRegistry)
local v_u_7 = require(v1.Modules.Notification)
local v_u_8 = require(v1.Modules.TimeHelper)
local v_u_9 = v1.Assets.VFX.WaspTimer
local v_u_10 = Color3.fromRGB(255, 150, 10)
local v_u_11 = Color3.fromRGB(255, 220, 150)
local v_u_12 = v_u_3.LocalPlayer.PlayerGui:WaitForChild("WaspBossUI")
local v_u_13 = nil
local v14 = {}
local function v_u_20(p15, p16) -- name: playSound
	-- upvalues: (copy) v_u_2
	local v17 = v_u_2:FindFirstChild("EvilWasp")
	if v17 then
		local v18 = v17:FindFirstChild(p15)
		if v18 then
			local v_u_19 = v18:Clone()
			v_u_19.Parent = p16 or v_u_2
			v_u_19:Play()
			v_u_19.Ended:Once(function()
				-- upvalues: (copy) v_u_19
				v_u_19:Destroy()
			end)
			return v_u_19
		end
	end
end
local function v_u_32(p21, p_u_22, p23, p24, p_u_25) -- name: createPulse
	-- upvalues: (copy) v_u_4
	local v_u_26 = p21:Clone()
	v_u_26.Name = "WaspEggHologram"
	local v27 = {}
	for _, v28 in v_u_26:GetDescendants() do
		if v28:IsA("BasePart") then
			if v28.Transparency < 1 then
				v28.Material = Enum.Material.Neon
				v28.Color = p24
				v28.Transparency = p23
				v28.CanCollide = false
				v28.CanQuery = false
				v28.CanTouch = false
				table.insert(v27, v28)
			end
		elseif v28:IsA("Decal") then
			v28.Transparency = 1
		end
	end
	v_u_26:PivotTo(p21:GetPivot())
	v_u_26.Parent = workspace
	for _, v29 in v27 do
		v_u_4:Create(v29, TweenInfo.new(p_u_25, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Transparency"] = 1
		}):Play()
	end
	task.spawn(function()
		-- upvalues: (copy) v_u_26, (copy) p_u_22, (copy) p_u_25
		for v30 = 1, 12 do
			local v31 = 1 - (1 - v30 / 12) ^ 2
			v_u_26:ScaleTo((p_u_22 - 1) * v31 + 1)
			task.wait(p_u_25 / 12)
		end
		v_u_26:Destroy()
	end)
end
local function v_u_35(p33) -- name: createRing
	-- upvalues: (copy) v_u_10, (copy) v_u_4
	local v_u_34 = Instance.new("Part")
	v_u_34.Shape = Enum.PartType.Cylinder
	v_u_34.Size = Vector3.new(0.2, 0.5, 0.5)
	v_u_34.CFrame = CFrame.new(p33) * CFrame.Angles(0, 0, 1.5707963267948966)
	v_u_34.Material = Enum.Material.Neon
	v_u_34.Color = v_u_10
	v_u_34.Transparency = 0.3
	v_u_34.Anchored = true
	v_u_34.CanCollide = false
	v_u_34.CanQuery = false
	v_u_34.CanTouch = false
	v_u_34.Parent = workspace
	v_u_4:Create(v_u_34, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
		["Size"] = Vector3.new(0.2, 10, 10),
		["Transparency"] = 1
	}):Play()
	task.delay(0.4, function()
		-- upvalues: (copy) v_u_34
		v_u_34:Destroy()
	end)
end
local function v_u_41(p36) -- name: playSpawnAnimation
	-- upvalues: (copy) v_u_20, (copy) v_u_32, (copy) v_u_11, (copy) v_u_10, (copy) v_u_35, (copy) v_u_4
	task.wait(0.1)
	if p36.Parent then
		local v37 = p36.PrimaryPart or p36:FindFirstChildWhichIsA("BasePart")
		local v38 = p36:GetPivot().Position
		v_u_20("Wasp_EggSpawn", v37 or p36)
		v_u_32(p36, 1.12, 0.4, v_u_11, 0.3)
		task.wait(0.05)
		v_u_32(p36, 1.2, 0.6, v_u_10, 0.4)
		v_u_35(v38)
		local v39 = Instance.new("Highlight")
		v39.FillColor = v_u_10
		v39.FillTransparency = 0.6
		v39.OutlineColor = v_u_11
		v39.OutlineTransparency = 0
		v39.Parent = p36
		local v40 = Instance.new("PointLight")
		v40.Color = v_u_10
		v40.Brightness = 4
		v40.Range = 12
		if v37 then
			v40.Parent = v37
		end
		v_u_4:Create(v39, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["FillTransparency"] = 1,
			["OutlineTransparency"] = 1
		}):Play()
		v_u_4:Create(v40, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {
			["Brightness"] = 0
		}):Play()
		task.wait(0.4)
		v39:Destroy()
		v40:Destroy()
	end
end
local function v_u_47(p42) -- name: formatNumber
	local v43 = p42 * 100
	local v44 = math.floor(v43) / 100
	local v45 = tostring(v44)
	local v46 = string.gsub(string.reverse(v45), "(%d%d%d)", "%1,")
	return string.gsub(string.reverse(v46), "^,", "")
end
function v14.Start(_) -- name: Start
	-- upvalues: (copy) v_u_7, (copy) v_u_41, (copy) v_u_9, (copy) v_u_8, (copy) v_u_6, (copy) v_u_5, (copy) v_u_12, (copy) v_u_47, (copy) v_u_20, (copy) v_u_3, (copy) v_u_4, (ref) v_u_13
	local v_u_48 = nil
	workspace.ChildAdded:Connect(function(p_u_49)
		-- upvalues: (ref) v_u_7, (ref) v_u_41, (ref) v_u_9, (ref) v_u_8
		if p_u_49.Name == "WaspEgg" and p_u_49:IsA("Model") then
			v_u_7:CreateNotification("A Wasp Wave has spawned! Find the egg and defeat the Wasps!")
			task.spawn(v_u_41, p_u_49)
			task.spawn(function()
				-- upvalues: (copy) p_u_49, (ref) v_u_9, (ref) v_u_8
				local v50 = nil
				while p_u_49.Parent do
					local v51 = p_u_49:GetAttribute("WaveEndTime")
					local v52 = v51 and v51 - workspace:GetServerTimeNow() or (1 / 0)
					if v52 <= 120 then
						if not v50 then
							v50 = v_u_9:Clone()
							v50.Adornee = p_u_49.PrimaryPart or p_u_49:FindFirstChildWhichIsA("BasePart")
							v50.Parent = p_u_49
							v50.StudsOffsetWorldSpace = -v50.StudsOffsetWorldSpace
						end
						local v53 = v50.TimeLabel
						local v54 = v_u_8
						local v55 = math.ceil(v52)
						v53.Text = v54:GenerateColonFormatFromTime((math.max(0, v55)))
					elseif v50 then
						v50:Destroy()
						v50 = nil
					end
					task.wait(0.5)
				end
				if v50 then
					v50:Destroy()
				end
			end)
		end
	end)
	local v_u_56 = v_u_6["Wasp King"].Stats.MaxHealth
	v_u_5.OnBeeCreated:Connect(function(p57, p58)
		-- upvalues: (ref) v_u_7, (ref) v_u_12, (ref) v_u_47, (copy) v_u_56, (ref) v_u_20, (ref) v_u_3, (ref) v_u_4, (ref) v_u_48
		if p58.Server.BeeName == "Wasp King" then
			v_u_7:CreateNotification("A Wasp King has spawned!")
			v_u_12.BossHealthbar.Main.HealthAmount.Text = ("%* / %*"):format(v_u_47(v_u_56), (v_u_47(v_u_56)))
			v_u_12.BossHealthbar.Main.Bar.Size = UDim2.new(1, 0, 1, 0)
			local v_u_59 = v_u_20("WaspCombatLoop", p58.Client.Hitbox)
			local v_u_60 = nil
			local v_u_61 = 0
			local v_u_62 = 4
			task.spawn(function()
				-- upvalues: (copy) v_u_59, (copy) v_u_61, (copy) v_u_62, (ref) v_u_3, (ref) v_u_60, (ref) v_u_4
				while v_u_59 and v_u_59.Parent do
					local v63 = v_u_61 + math.random() * (v_u_62 - v_u_61)
					local v64 = 1 + math.random() * 4
					local v65 = not v_u_3.LocalPlayer:GetAttribute("InWaspCombat") and 0 or v63
					if v_u_60 then
						v_u_60:Cancel()
					end
					v_u_60 = v_u_4:Create(v_u_59, TweenInfo.new(v64, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
						["Volume"] = v65
					})
					v_u_60:Play()
					v_u_60.Completed:Wait()
					task.wait(math.random() * 2)
				end
			end)
			v_u_48 = p57
		end
	end)
	v_u_5.OnBeeDestroyed:Connect(function(_, p66)
		-- upvalues: (ref) v_u_12, (ref) v_u_13, (ref) v_u_20
		if p66.Server.BeeName == "Wasp King" then
			v_u_12.Enabled = false
			if v_u_13 then
				v_u_13:Destroy()
				v_u_13 = nil
			end
			task.delay(0.5, v_u_20, "Wasp_Victory")
		end
	end)
	local v_u_67 = nil
	v_u_5.OnBeeStateUpdate:Connect(function(_, p68, p69, p70)
		-- upvalues: (ref) v_u_67, (ref) v_u_4, (ref) v_u_12, (copy) v_u_56, (ref) v_u_47
		if p68.Server.BeeName == "Wasp King" and p69 == "Health" then
			if v_u_67 then
				v_u_67:Cancel()
			end
			local v71 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
			v_u_67 = v_u_4:Create(v_u_12.BossHealthbar.Main.Bar, v71, {
				["Size"] = UDim2.new(p70 / v_u_56, 0, 1, 0)
			})
			v_u_67:Play()
			v_u_12.BossHealthbar.Main.HealthAmount.Text = ("%* / %*"):format(v_u_47(p70), (v_u_47(v_u_56)))
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_48, (ref) v_u_5, (ref) v_u_3, (ref) v_u_12, (ref) v_u_13, (ref) v_u_4, (ref) v_u_20
		while true do
			while true do
				task.wait(0.2)
				if not v_u_48 then
					break
				end
				local v72 = v_u_5:GetEntry("wasp-colony", v_u_48)
				if v72 then
					if v_u_3.LocalPlayer:GetAttribute("ShovelOnCooldown") then
						v_u_12.Enabled = true
					elseif v_u_3.LocalPlayer:GetAttribute("InWaspCombat") then
						if not v_u_13 then
							v_u_13 = v_u_20("WaspBossMusic")
							local v73 = v_u_13.Volume
							v_u_13.Volume = 0
							v_u_4:Create(v_u_13, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {
								["Volume"] = v73
							}):Play()
						end
						local v74 = ((v72.Client.SmoothedCFrame or (v72.Client.PredictedCFrame or v72.Server.CFrame)).Position - v_u_3.LocalPlayer.Character:GetPivot().Position).Magnitude
						v_u_12.Enabled = v74 < 50
						workspace:SetAttribute("WaspBoss", v74 < 50)
					else
						v_u_12.Enabled = false
						if v_u_13 then
							v_u_4:Create(v_u_13, TweenInfo.new(3, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								["Volume"] = 0
							}):Play()
							task.delay(3, function()
								-- upvalues: (ref) v_u_13
								if v_u_13 then
									v_u_13:Destroy()
									v_u_13 = nil
								end
							end)
						end
					end
				else
					workspace:SetAttribute("WaspBoss", nil)
				end
			end
			workspace:SetAttribute("WaspBoss", nil)
		end
	end)
end
task.spawn(v14.Start, v14)
return v14
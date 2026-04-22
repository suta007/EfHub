local v1 = {}
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = game:GetService("Players")
local v_u_5 = game:GetService("RunService")
local v_u_6 = false
local v_u_7 = v_u_4.LocalPlayer
local v_u_8 = {}
local v_u_9 = false
local v_u_10 = require(game.ReplicatedStorage.Modules.Notification)
local v_u_11 = require(v_u_2.Modules.ScreenShakeCore)
local function v_u_18(p12, p13, p14, p15, p16)
	local v_u_17 = p12:Clone()
	v_u_17.PlaybackSpeed = v_u_17.PlaybackSpeed + math.random(p13 * 1000, p14 * 1000) / 1000
	v_u_17.Parent = p15
	v_u_17:Play()
	if not p16 then
		task.delay(8, function()
			-- upvalues: (copy) v_u_17
			if v_u_17 then
				v_u_17:Destroy()
			end
		end)
	end
end
local function v_u_34(p19, p20, p21)
	local v22 = Instance.new("Part"):Clone()
	v22.Name = "SpinnerPillar"
	v22.Color = p21
	v22.Material = "Glacier"
	v22.MaterialVariant = "2022 Stud"
	v22.Size = Vector3.new(10, 60, 10)
	v22.Position = p19
	v22.CanCollide = false
	v22.CanQuery = false
	v22.CanTouch = false
	v22.Transparency = 1
	v22.Anchored = true
	v22.Parent = p20
	local v23 = v22:Clone()
	local v24 = v22:Clone()
	local v25 = v22:Clone()
	local v26 = v22:Clone()
	v23.Size = Vector3.new(12, 5, 12)
	v23.Position = p19 - Vector3.new(0, 32.5, 0)
	v23.Parent = v22
	v24.Size = Vector3.new(12, 3, 12)
	v24.Position = p19 + Vector3.new(0, 31.5, 0)
	v24.Parent = v22
	v25.Size = Vector3.new(12, 5, 12)
	v25.Position = p19 + Vector3.new(0, 22.5, 0)
	v25.Parent = v22
	v26.Size = Vector3.new(12, 5, 12)
	v26.Position = p19 + Vector3.new(0, 7.5, 0)
	v26.Parent = v22
	local v27, v28, v29 = p21:ToHSV()
	local v30 = v29 + 0.25
	local v31 = math.clamp(v30, 0, 1)
	local v32 = Color3.fromHSV(v27, v28, v31)
	v23.Color = v32
	v24.Color = v32
	v25.Color = v32
	v26.Color = v32
	local v33 = script.BARRIER:Clone()
	v33:PivotTo(CFrame.new(v24.Position))
	v33.Parent = v22
	return v22
end
local function v_u_66(_)
	-- upvalues: (ref) v_u_9, (copy) v_u_7, (copy) v_u_34, (copy) v_u_8, (copy) v_u_4, (copy) v_u_18, (copy) v_u_3, (copy) v_u_11, (copy) v_u_10
	if v_u_9 ~= true then
		v_u_9 = true
		v_u_7:WaitForChild("PlayerGui"):WaitForChild("Teleport_UI").Enabled = false
		local v35 = Instance.new("Model")
		v35.Name = "SPINNERGAME"
		v35.Parent = workspace.WeatherVisuals
		local v36 = script.Parent.Dissonant.InvertedSphere:Clone()
		v36.Name = "SpinnerSphere"
		v36.Size = Vector3.new(800, 800, 800)
		v36.Position = Vector3.new(-219, 30, -891)
		v36.Transparency = 0.5
		v36.Color = Color3.fromRGB(67, 63, 103)
		v36.Parent = v35
		v_u_34(Vector3.new(-219, 30, -891), v35, Color3.fromRGB(105, 63, 63))
		table.clear(v_u_8)
		local v37 = v_u_8
		local v38 = v_u_34(Vector3.new(-219, 30, -891), v35, Color3.fromRGB(105, 63, 63))
		table.insert(v37, v38)
		local v39 = v_u_8
		local v40 = v_u_34(Vector3.new(-139, 30, -891), v35, Color3.fromRGB(105, 58, 58))
		table.insert(v39, v40)
		local v41 = v_u_8
		local v42 = v_u_34(Vector3.new(-299, 30, -891), v35, Color3.fromRGB(20, 79, 27))
		table.insert(v41, v42)
		local v43 = v_u_8
		local v44 = v_u_34(Vector3.new(-219, 30, -811), v35, Color3.fromRGB(60, 57, 105))
		table.insert(v43, v44)
		local v45 = v_u_8
		local v46 = v_u_34(Vector3.new(-219, 30, -971), v35, Color3.fromRGB(105, 77, 44))
		table.insert(v45, v46)
		for _, v47 in v_u_4:GetPlayers() do
			if v47.Character and v47.Character:FindFirstChild("HumanoidRootPart") ~= nil then
				local v_u_48 = script.Flash:Clone()
				v_u_48.Parent = v47.Character.HumanoidRootPart.RootAttachment
				v_u_48:Emit(1)
				local v_u_49 = script.Flash2:Clone()
				v_u_49.Parent = v47.Character.HumanoidRootPart
				v_u_49:Emit(6)
				task.delay(4, function()
					-- upvalues: (copy) v_u_48, (copy) v_u_49
					if v_u_48 then
						v_u_48:Destroy()
					end
					if v_u_49 then
						v_u_49:Destroy()
					end
				end)
				v_u_18(script.FlashS, -0.2, 0.2, v47.Character.HumanoidRootPart)
			end
		end
		local v50 = workspace:GetAttribute("SpinPlayer" .. v_u_7.Name) + 1
		v_u_7.Character:PivotTo(CFrame.lookAt(v_u_8[v50].Position + Vector3.new(0, 40, 0), Vector3.new(-219, 30, -891), Vector3.new(0, 1, 0)))
		task.wait(1)
		local v_u_51 = TweenInfo.new(0.3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		for _, v_u_52 in v_u_8 do
			v_u_52.Transparency = 0
			local v53 = v_u_52.Size
			v_u_52.Size = v_u_52.Size + Vector3.new(2, 2, 2)
			v_u_3:Create(v_u_52, v_u_51, {
				["Size"] = v53
			}):Play()
			v_u_11:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.25)
			v_u_11:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.4)
			v_u_18(script.Budge, -0.3, 0.3, v_u_52)
			local v54 = script.Dust:Clone()
			v54.Parent = v_u_52
			v54:Emit(6)
			local v55 = v_u_52.Position
			for _ = 1, 8 do
				local v56 = math.random(-2, 2) / 7
				local v57 = math.random(-2, 2) / 7
				v_u_52.Position = v55 + Vector3.new(v56, 0, v57)
				task.wait(0.01)
			end
			v_u_52.Position = v55
			task.spawn(function()
				-- upvalues: (copy) v_u_52, (ref) v_u_11, (ref) v_u_18, (ref) v_u_3, (copy) v_u_51
				for _, v58 in v_u_52:GetDescendants() do
					if v58.Name ~= "BARRIER" and v58:IsA("BasePart") then
						v58.Transparency = 0
						local v59 = script.Dust:Clone()
						v59.Parent = v58
						v59:Emit(6)
						v_u_11:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.25)
						v_u_11:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.4)
						v_u_18(script.Budge, -0.3, 0.3, v58)
						local v60 = v58.Size
						v58.Size = v58.Size + Vector3.new(2, 2, 2)
						v_u_3:Create(v58, v_u_51, {
							["Size"] = v60
						}):Play()
						local v61 = v58.Position
						for _ = 1, 8 do
							local v62 = math.random(-2, 2) / 5
							local v63 = math.random(-2, 2) / 5
							v58.Position = v61 + Vector3.new(v62, 0, v63)
							task.wait(0.01)
						end
						v58.Position = v61
					end
				end
			end)
		end
		task.wait(1)
		local v64 = Instance.new("Part")
		v64.Name = "RED"
		v64.Anchored = true
		v64.Material = "Neon"
		v64.Color = Color3.fromRGB(255, 74, 74)
		v64.Position = Vector3.new(-219, 65.5, -891)
		v64.Orientation = Vector3.new(0, 45, 0)
		v64.Size = Vector3.new(0, 0, 0)
		v64.Parent = v35
		v_u_18(script.SpinnerSpawn, -0.1, 0.1, v64)
		local v65 = script.Zap:Clone()
		v65.Enabled = true
		v65.Parent = v64
		v_u_3:Create(v64, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0), {
			["Size"] = Vector3.new(1.5, 1.5, 190)
		}):Play()
		task.wait(1)
		v_u_10:CreateNotification("Jump over the spinner and last until the end to get a reward!")
	end
end
v_u_2.GameEvents.SpinnerGame.OnClientEvent:Connect(function(p_u_67)
	-- upvalues: (copy) v_u_10, (ref) v_u_6, (copy) v_u_7, (copy) v_u_18, (copy) v_u_3, (copy) v_u_11, (copy) v_u_4, (copy) v_u_5, (copy) v_u_2
	local v_u_68 = workspace.WeatherVisuals.SPINNERGAME.RED
	local v_u_69 = v_u_68.CFrame
	local v70 = p_u_67 - workspace:GetServerTimeNow()
	local v71 = math.max(0, v70) / 3
	v_u_10:CreateNotification("3")
	task.wait(v71)
	v_u_10:CreateNotification("2")
	task.wait(v71)
	v_u_10:CreateNotification("1")
	task.wait(v71)
	v_u_6 = false
	local v_u_72 = false
	v_u_68.Touched:Connect(function(p73)
		-- upvalues: (ref) v_u_6, (ref) v_u_7, (ref) v_u_18, (ref) v_u_3, (ref) v_u_11, (ref) v_u_72, (ref) v_u_4
		if v_u_6 == false and p73.Parent == v_u_7.Character then
			v_u_6 = true
			v_u_18(script.BigHit, -0.2, 0.2, p73)
			local v74 = TweenInfo.new(0.7, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
			v_u_3:Create(script.Music, v74, {
				["PlaybackSpeed"] = 0
			}):Play()
			v_u_11:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.35)
			v_u_11:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.6)
			local v_u_75 = p73.Parent
			v_u_75.Humanoid.PlatformStand = true
			local v_u_76 = Instance.new("BodyVelocity")
			v_u_76.MaxForce = Vector3.new(100000, 100000, 100000)
			v_u_76.Velocity = Vector3.new(0, 90, 0)
			v_u_76.Parent = v_u_75.HumanoidRootPart
			local v_u_77 = Instance.new("BodyAngularVelocity")
			v_u_77.MaxTorque = Vector3.new(100000, 100000, 100000)
			local v78 = math.random(-30, 30)
			local v79 = math.random(-30, 30)
			local v80 = math.random
			v_u_77.AngularVelocity = Vector3.new(v78, v79, v80(-30, 30))
			v_u_77.Parent = v_u_75.HumanoidRootPart
			task.delay(0.2, function()
				-- upvalues: (copy) v_u_76, (copy) v_u_77, (copy) v_u_75, (ref) v_u_7, (ref) v_u_18
				if v_u_76 then
					v_u_76:Destroy()
				end
				if v_u_77 then
					v_u_77:Destroy()
				end
				task.wait(0.5)
				script.Music:Stop()
				if v_u_75 and v_u_75:FindFirstChild("HumanoidRootPart") then
					v_u_75.Humanoid.PlatformStand = false
					v_u_75.HumanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
					v_u_7:WaitForChild("PlayerGui"):WaitForChild("Teleport_UI").Enabled = true
					local v81 = v_u_75
					local v82 = CFrame.new
					local v83 = math.random(-15, 15)
					local v84 = math.random
					local v85 = v82(Vector3.new(-23, 11.5, -10) + Vector3.new(v83, 0, v84(-15, 15)))
					local v86 = CFrame.Angles
					local v87 = math.random(-360, 360)
					v81:PivotTo(v85 * v86(0, math.rad(v87), 0))
					if v_u_75:FindFirstChild("HumanoidRootPart") ~= nil then
						local v_u_88 = script.Flash:Clone()
						v_u_88.Parent = v_u_75.HumanoidRootPart.RootAttachment
						v_u_88:Emit(1)
						local v_u_89 = script.Flash2:Clone()
						v_u_89.Parent = v_u_75.HumanoidRootPart
						v_u_89:Emit(6)
						task.delay(4, function()
							-- upvalues: (copy) v_u_88, (copy) v_u_89
							if v_u_88 then
								v_u_88:Destroy()
							end
							if v_u_89 then
								v_u_89:Destroy()
							end
						end)
						v_u_18(script.FlashS, -0.2, 0.2, v_u_75.HumanoidRootPart)
					end
				end
			end)
		elseif v_u_72 == false and v_u_4:GetPlayerFromCharacter(p73.Parent) ~= nil then
			v_u_72 = true
			v_u_18(script.BigHit, -0.2, 0.2, p73)
			task.wait(0.2)
			v_u_72 = false
		end
	end)
	local v_u_90 = nil
	local v_u_91 = 0
	script.Music.PlaybackSpeed = 0
	script.Music:Play()
	local v92 = TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
	v_u_3:Create(script.Music, v92, {
		["PlaybackSpeed"] = 0.7
	}):Play()
	local v98 = v_u_5.RenderStepped:Connect(function()
		-- upvalues: (copy) p_u_67, (ref) v_u_90, (ref) v_u_91, (copy) v_u_68, (copy) v_u_69
		local v93 = workspace:GetServerTimeNow()
		local v94 = v93 - p_u_67
		local v95 = math.max(0, v94)
		local v96
		if v95 < 48 then
			v96 = 0.2617993877991494 + v95 / 6 * 0.2617993877991494
		elseif v95 < 58 then
			local v97 = (v95 - 48) / 10
			v96 = (1 - math.clamp(v97, 0, 1)) ^ 2 * 2.356194490192345
		else
			v96 = -((v95 - 58) / 6 * 0.2617993877991494)
		end
		if v_u_90 then
			v_u_91 = v_u_91 + v96 * (v93 - v_u_90)
		end
		v_u_90 = v93
		v_u_68.CFrame = v_u_69 * CFrame.Angles(0, v_u_91, 0)
	end)
	for _ = 1, 7 do
		task.wait(6)
		if v_u_6 == false then
			local v99 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
			v_u_3:Create(script.Music, v99, {
				["PlaybackSpeed"] = script.Music.PlaybackSpeed + 0.05
			}):Play()
			v_u_10:CreateNotification("SPEEDING UP")
		end
	end
	task.wait(6)
	if v_u_6 == false then
		local v100 = TweenInfo.new(8, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		v_u_3:Create(script.Music, v100, {
			["PlaybackSpeed"] = 0
		}):Play()
		v_u_10:CreateNotification("SLOWING DOWN")
	end
	task.wait(10)
	if v_u_6 == false then
		v_u_10:CreateNotification("SPEEDING UP")
		local v101 = TweenInfo.new(3, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		v_u_3:Create(script.Music, v101, {
			["PlaybackSpeed"] = 0.7
		}):Play()
	end
	for _ = 1, 8 do
		task.wait(6)
		if v_u_6 == false then
			local v102 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
			v_u_3:Create(script.Music, v102, {
				["PlaybackSpeed"] = script.Music.PlaybackSpeed + 0.05
			}):Play()
			v_u_10:CreateNotification("SPEEDING UP")
		end
	end
	local v103 = TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
	v_u_3:Create(script.Music, v103, {
		["PlaybackSpeed"] = 0
	}):Play()
	if v_u_6 == false then
		script.Reward:Play()
		v_u_10:CreateNotification("Received 1 \"Admin Pack\" for winning!")
		v_u_2.GameEvents.SpinnerGame:FireServer()
	end
	if v98 then
		v98:Disconnect()
	end
	if v_u_68 and v_u_6 == false then
		v_u_68.Transparency = 1
		v_u_68.CanCollide = false
		local v104 = script.SpinnerExplode:Clone()
		v104.Parent = v_u_68
		v104:Emit(30)
		v_u_68.Zap.Enabled = false
		v_u_68.Zap:Emit(30)
		v_u_18(script.SpinnerBurst, -0.2, 0.2, v_u_68)
		v_u_11:ScreenShake("Normal", { "Vector" }, 1, 0.5, 0.45)
		v_u_11:ScreenShake("Normal", { "Tilt", 5 }, 5, 0.75, 0.7)
	end
	v_u_6 = true
	task.wait(1)
	script.Music:Stop()
end)
local function v_u_119(_)
	-- upvalues: (ref) v_u_9, (copy) v_u_8, (ref) v_u_6, (copy) v_u_11, (copy) v_u_18, (copy) v_u_3, (copy) v_u_4, (copy) v_u_7
	if v_u_9 ~= false then
		v_u_9 = false
		local v_u_105 = TweenInfo.new(0.1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
		for _, v_u_106 in v_u_8 do
			if v_u_6 == false then
				v_u_11:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.25)
				v_u_11:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.4)
			end
			v_u_18(script.Budge, -0.3, 0.3, v_u_106)
			v_u_3:Create(v_u_106, v_u_105, {
				["Size"] = Vector3.new(0, 0, 0)
			}):Play()
			task.wait(0.1)
			v_u_106.Transparency = 1
			v_u_106.Dust:Emit(6)
			task.spawn(function()
				-- upvalues: (copy) v_u_106, (ref) v_u_6, (ref) v_u_11, (ref) v_u_18, (ref) v_u_3, (copy) v_u_105
				for _, v107 in v_u_106:GetDescendants() do
					if v107.Name ~= "BARRIER" and v107:IsA("BasePart") then
						if v_u_6 == false then
							v_u_11:ScreenShake("Normal", { "Vector" }, 1, 0.2, 0.25)
							v_u_11:ScreenShake("Normal", { "Tilt", 2 }, 5, 0.2, 0.4)
						end
						v_u_18(script.Budge, -0.3, 0.3, v107)
						v_u_3:Create(v107, v_u_105, {
							["Size"] = Vector3.new(0, 0, 0)
						}):Play()
						task.wait(0.1)
						v107.Transparency = 1
						v107.Dust:Emit(6)
					end
				end
			end)
		end
		task.wait(0.5)
		table.clear(v_u_8)
		if v_u_6 == false then
			for _, v108 in v_u_4:GetPlayers() do
				if v108.Character and v108.Character:FindFirstChild("HumanoidRootPart") ~= nil then
					local v_u_109 = script.Flash:Clone()
					v_u_109.Parent = v108.Character.HumanoidRootPart.RootAttachment
					v_u_109:Emit(1)
					local v_u_110 = script.Flash2:Clone()
					v_u_110.Parent = v108.Character.HumanoidRootPart
					v_u_110:Emit(6)
					task.delay(4, function()
						-- upvalues: (copy) v_u_109, (copy) v_u_110
						if v_u_109 then
							v_u_109:Destroy()
						end
						if v_u_110 then
							v_u_110:Destroy()
						end
					end)
					v_u_18(script.FlashS, -0.2, 0.2, v108.Character.HumanoidRootPart)
				end
			end
			local v111 = v_u_7.Character
			local v112 = CFrame.new
			local v113 = math.random(-15, 15)
			local v114 = math.random
			local v115 = v112(Vector3.new(-23, 11.5, -10) + Vector3.new(v113, 0, v114(-15, 15)))
			local v116 = CFrame.Angles
			local v117 = math.random(-360, 360)
			v111:PivotTo(v115 * v116(0, math.rad(v117), 0))
		end
		v_u_7:WaitForChild("PlayerGui"):WaitForChild("Teleport_UI").Enabled = true
		local v118 = workspace.WeatherVisuals:FindFirstChild("SPINNERGAME")
		if v118 then
			v118:Destroy()
		end
	end
end
workspace:GetAttributeChangedSignal("SpinnerGame"):Connect(function()
	-- upvalues: (copy) v_u_66, (copy) v_u_119
	if workspace:GetAttribute("SpinnerGame") then
		v_u_66()
	else
		v_u_119()
	end
end)
if workspace:GetAttribute("SpinnerGame") then
	task.defer(function()
		-- upvalues: (ref) v_u_6, (copy) v_u_66
		v_u_6 = true
		v_u_66(true)
	end)
else
	v_u_119(true)
end
return v1
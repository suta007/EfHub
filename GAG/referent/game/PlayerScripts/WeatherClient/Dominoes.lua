local v1 = {}
local v_u_2 = false
game:GetService("TweenService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Debris")
local v_u_5 = game.Players.LocalPlayer
local v6 = game:GetService("ReplicatedStorage")
local v_u_7 = require(v6.Modules.ScreenShakeCore)
local v8 = v6:WaitForChild("GameEvents")
local v9 = v8:WaitForChild("DominoesLayout")
local v10 = v8:WaitForChild("DominoesFell")
local v11 = v8:WaitForChild("DominoesStart")
local v_u_12 = v8:WaitForChild("DominoesReportFall")
local v_u_13 = script:WaitForChild("Domino")
local v_u_14 = script:WaitForChild("HitOther")
local v_u_15 = script:WaitForChild("HitFloor")
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_19 = Color3.fromRGB(91, 154, 76)
local function v_u_46(p20, p21, p22)
	-- upvalues: (copy) v_u_19, (copy) v_u_4
	local v23 = p21 / 80
	local v24 = math.clamp(v23, 0.1, 1)
	local v25 = v24 * 16 + 4
	local v26 = math.floor(v25)
	local v27 = v24 * 90 + 40
	local v28 = v24 * 80 + 20
	local v29 = v24 * 2 + 0.5
	local v30 = p22 / 2
	local v31 = v24 * 3 + 1
	for _ = 1, v26 do
		local v32 = Instance.new("Part")
		local v33 = v29 * (0.5 + math.random() * 0.5)
		local v34 = v29 * (0.5 + math.random() * 0.5)
		local v35 = v29 * (0.5 + math.random() * 0.5)
		v32.Size = Vector3.new(v33, v34, v35)
		local v36 = CFrame.new
		local v37 = (math.random() - 0.5) * v30 * 2
		local v38 = (math.random() - 0.5) * v31 * 2
		v32.CFrame = v36(p20 + Vector3.new(v37, 0.5, v38))
		v32.Anchored = false
		v32.CanCollide = false
		v32.CanQuery = false
		v32.CanTouch = false
		v32.Material = Enum.Material.Grass
		v32.Color = v_u_19
		local v39 = math.random(-360, 360)
		local v40 = math.random(-360, 360)
		local v41 = math.random
		v32.AssemblyAngularVelocity = Vector3.new(v39, v40, v41(-360, 360))
		local v42 = Instance.new("BodyVelocity")
		local v43 = (math.random() - 0.5) * v28 * 2
		local v44 = math.random() * v27 + v27 * 0.3
		local v45 = (math.random() - 0.5) * v28 * 2
		v42.Velocity = Vector3.new(v43, v44, v45)
		v42.P = 1000
		v42.MaxForce = Vector3.new(100000, 100000, 100000)
		v42.Parent = v32
		v32.Parent = workspace.WeatherVisuals
		v_u_4:AddItem(v42, 0.2)
		v_u_4:AddItem(v32, 3 + math.random() * 2)
	end
end
local v_u_47 = false
local v_u_48 = nil
local function v_u_61(p49)
	-- upvalues: (copy) v_u_13
	local v50 = p49.size.Y / 20
	local v51 = v_u_13:Clone()
	v51:ScaleTo(v50)
	for _, v52 in v51:GetDescendants() do
		if v52:IsA("BasePart") then
			v52.CanCollide = true
			v52.CanQuery = false
			v52.CanTouch = false
		end
	end
	local v53 = math.random(0, 6)
	local v54 = math.random(0, 6)
	for v55 = v53 + 1, 6 do
		local v56 = v51:FindFirstChild("Top" .. v55, true)
		if v56 then
			v56:Destroy()
		end
	end
	for v57 = v54 + 1, 6 do
		local v58 = v51:FindFirstChild("Bottom" .. v57, true)
		if v58 then
			v58:Destroy()
		end
	end
	local v59 = v51.PrimaryPart
	if v59 and p49.rewardDecal then
		local v60 = v59:FindFirstChild("Attachment")
		if v60 then
			v60 = v60:FindFirstChild("BillboardGui")
		end
		if v60 then
			v60 = v60:FindFirstChild("Icon")
		end
		if v60 then
			v60.Image = p49.rewardDecal
		end
	end
	v51:PivotTo(p49.cf)
	v51.Parent = workspace.WeatherVisuals
	return v51
end
local function v_u_71(p62, p63, p64, p65)
	-- upvalues: (copy) v_u_4
	local v66 = p63.PrimaryPart or p63:FindFirstChildWhichIsA("BasePart")
	if v66 then
		local v67 = p62:Clone()
		local v68 = (p64 - 4) / 76
		local v69 = math.clamp(v68, 0, 1)
		if p65 then
			v67.PlaybackSpeed = v69 * -3.2 + 4
			v67.Volume = 0.25
		else
			v67.PlaybackSpeed = v69 * -0.5 + 1
			local v70 = p64 / 20
			v67.Volume = math.clamp(v70, 0.3, 1.5)
		end
		v67.Parent = v66
		v67:Play()
		v_u_4:AddItem(v67, v67.TimeLength / v67.PlaybackSpeed + 1)
	end
end
local function v_u_142(p_u_72, p73)
	-- upvalues: (copy) v_u_17, (copy) v_u_16, (copy) v_u_18, (copy) v_u_12, (copy) v_u_71, (copy) v_u_15, (copy) v_u_46, (copy) v_u_5, (copy) v_u_7, (copy) v_u_3, (ref) v_u_2, (copy) v_u_14, (copy) v_u_142
	local v74 = v_u_17[p_u_72]
	if v74 then
		local v_u_75 = v_u_16[p_u_72]
		if v_u_75 then
			local v_u_76 = v74.cf
			local v_u_77 = v74.size
			local v_u_78 = v_u_77.Y
			local v79 = v_u_77.Z
			local v80 = v_u_77.Z
			local v_u_81 = v_u_76.Position + v_u_76.LookVector * (v80 / 2)
			local v_u_82 = v_u_76.RightVector
			local v83 = (v_u_78 / 2) ^ 2 + (v79 / 2) ^ 2
			local v_u_84 = math.sqrt(v83)
			local v85 = v79 / 2
			local v86 = v_u_78 / 2
			local v_u_87 = math.atan2(v85, v86)
			local v_u_88 = v_u_84 ^ 2 + (v_u_78 ^ 2 + v79 ^ 2) / 12
			local v_u_89 = {
				["theta"] = p73 > 0.01 and 0 or 0.3,
				["omega"] = p73,
				["phase"] = "FREE_FALL"
			}
			v_u_18[p_u_72] = v_u_89
			local v_u_90 = 1.5707963267948966
			local v_u_91 = v_u_17[p_u_72 + 1]
			local v_u_92 = 0
			local v_u_93 = 0
			local v_u_94 = false
			if v_u_91 then
				local v95 = v_u_91.cf.Position - v_u_91.cf.LookVector * (v_u_91.size.Z / 2) - v_u_81
				local v96 = v_u_76.LookVector:Dot(v95)
				if v96 > 0 and v96 < v_u_78 * 0.95 then
					local v97 = v96 / v_u_78
					local v98 = math.clamp(v97, 0, 0.99)
					v_u_90 = math.asin(v98)
					v_u_92 = v_u_78 * math.cos(v_u_90)
					local v99 = v_u_92 / v_u_78
					v_u_93 = math.clamp(v99, 0.3, 0.95)
					v_u_94 = true
				end
			end
			local v_u_100 = v_u_94 and 1.5107963267948965 or 1.5707963267948966
			local function v_u_112()
				-- upvalues: (copy) v_u_89, (ref) v_u_100, (ref) v_u_12, (copy) p_u_72, (ref) v_u_71, (ref) v_u_15, (copy) v_u_75, (copy) v_u_78, (copy) v_u_81, (copy) v_u_76, (ref) v_u_46, (copy) v_u_77, (ref) v_u_5, (ref) v_u_7
				v_u_89.phase = "FALLEN"
				v_u_89.theta = v_u_100
				v_u_89.omega = 0
				v_u_12:FireServer(p_u_72)
				v_u_71(v_u_15, v_u_75, v_u_78, true)
				local v101 = v_u_75.PrimaryPart
				if v101 then
					local v102 = v101:FindFirstChild("Attachment")
					if v102 then
						v102 = v102:FindFirstChild("BillboardGui")
					end
					if v102 then
						v102.Enabled = false
					end
				end
				local v103 = v_u_81 + v_u_76.LookVector * v_u_78
				local v104 = v103.X
				local v105 = v_u_76.Position.Y
				local v106 = v103.Z
				v_u_46(Vector3.new(v104, v105, v106), v_u_78, v_u_77.X)
				local v107 = v_u_5.Character
				if v107 and v107:FindFirstChild("HumanoidRootPart") then
					local v108 = v107.HumanoidRootPart
					local v109 = (v_u_78 / 80) ^ 2
					local v110 = 3 + v109 * 12
					local v111 = 0.3 + v109 * 0.7
					v_u_7:ScreenShake("Normal", { "Vector" }, v110, v111, 0.3, { v108.Position, v_u_76.Position, 300 + v_u_78 * 2 })
					v_u_7:ScreenShake("Normal", { "Tilt", 4 + v109 * 8 }, 4 + v109 * 6, v111, 0.4, { v108.Position, v_u_76.Position, 300 + v_u_78 * 2 })
				end
			end
			local v_u_113 = nil
			v_u_113 = v_u_3.RenderStepped:Connect(function(p114)
				-- upvalues: (ref) v_u_2, (ref) v_u_113, (copy) v_u_89, (copy) v_u_84, (copy) v_u_87, (copy) v_u_88, (ref) v_u_94, (ref) v_u_90, (copy) v_u_78, (copy) v_u_91, (ref) v_u_92, (ref) v_u_71, (ref) v_u_14, (copy) v_u_75, (ref) v_u_142, (copy) p_u_72, (ref) v_u_100, (copy) v_u_112, (ref) v_u_18, (ref) v_u_93, (copy) v_u_81, (copy) v_u_82, (copy) v_u_76
				if v_u_2 then
					if v_u_89.phase == "FALLEN" then
						task.delay(0.5, function()
							-- upvalues: (ref) v_u_113
							v_u_113:Disconnect()
						end)
					else
						if v_u_89.phase == "FREE_FALL" then
							local v115 = v_u_84 * 350
							local v116 = v_u_89.theta + v_u_87
							local v117 = v115 * math.sin(v116) / v_u_88
							local v118 = v_u_89
							v118.omega = v118.omega + v117 * p114
							local v119 = v_u_89
							v119.theta = v119.theta + v_u_89.omega * p114
							if v_u_94 and v_u_90 <= v_u_89.theta then
								v_u_89.theta = v_u_90
								local v120 = v_u_89.omega * v_u_78
								local v121 = v_u_91.size.Y
								local v122 = v_u_91.size.Z
								local v123 = (v121 / 2) ^ 2 + (v122 / 2) ^ 2
								local v124 = math.sqrt(v123) ^ 2 + (v121 ^ 2 + v122 ^ 2) / 12
								local v125 = 0.9 * v120 * v_u_92 / (v124 * v121)
								local v_u_126 = math.clamp(v125, 1, 12)
								v_u_89.omega = v_u_89.omega * 0.1
								v_u_89.phase = "RESTING"
								v_u_71(v_u_14, v_u_75, v_u_78, false)
								task.spawn(function()
									-- upvalues: (ref) v_u_142, (ref) p_u_72, (ref) v_u_126
									v_u_142(p_u_72 + 1, v_u_126)
								end)
							end
							if v_u_100 <= v_u_89.theta then
								v_u_112()
							end
						elseif v_u_89.phase == "RESTING" then
							local v127 = v_u_18[p_u_72 + 1]
							if v127 then
								local v128 = v127.theta
								local v129 = v_u_90 + v128 * v_u_93
								local v130 = v_u_100
								v_u_89.theta = math.min(v129, v130)
								if v128 > 0.39269908169872414 or v_u_89.theta > v_u_90 + 0.15 then
									v_u_89.phase = "SLIDING"
									v_u_89.omega = 1
								end
							end
							if v_u_100 <= v_u_89.theta then
								v_u_112()
							end
						elseif v_u_89.phase == "SLIDING" then
							local v131 = v_u_84 * 350
							local v132 = v_u_89.theta + v_u_87
							local v133 = v131 * math.sin(v132) / v_u_88
							local v134 = v_u_89
							v134.omega = v134.omega + v133 * p114
							local v135 = v_u_89
							v135.theta = v135.theta + v_u_89.omega * p114
							local v136 = v_u_18[p_u_72 + 1]
							if v136 and v136.phase ~= "FALLEN" then
								local v137 = v_u_90 + v136.theta * v_u_93
								local v138 = v_u_100
								local v139 = math.min(v137, v138)
								if v139 < v_u_89.theta then
									v_u_89.theta = v139
									local v140 = v_u_89
									local v141 = v_u_89.omega * 0.5
									v140.omega = math.max(v141, 0)
								end
							end
							if v_u_100 <= v_u_89.theta then
								v_u_112()
							end
						end
						v_u_75:PivotTo(CFrame.new(v_u_81) * CFrame.fromAxisAngle(v_u_82, -v_u_89.theta) * CFrame.new(-v_u_81) * v_u_76)
					end
				else
					v_u_113:Disconnect()
					return
				end
			end)
			return v_u_113
		end
	end
end
local function v_u_144(_)
	-- upvalues: (ref) v_u_2, (ref) v_u_47, (ref) v_u_48, (copy) v_u_16, (copy) v_u_17, (copy) v_u_18
	if v_u_2 then
		v_u_2 = false
		v_u_47 = false
		v_u_48 = nil
		for _, v143 in v_u_16 do
			if v143 and v143.Parent then
				v143:Destroy()
			end
		end
		table.clear(v_u_16)
		table.clear(v_u_17)
		table.clear(v_u_18)
	end
end
v9.OnClientEvent:Connect(function(p145)
	-- upvalues: (ref) v_u_2, (copy) v_u_17, (copy) v_u_16, (copy) v_u_61, (ref) v_u_48
	if v_u_2 then
		for _, v146 in p145 do
			v_u_17[v146.index] = v146
			v_u_16[v146.index] = v_u_61(v146)
		end
	else
		v_u_48 = p145
	end
end)
v11.OnClientEvent:Connect(function()
	-- upvalues: (ref) v_u_2, (ref) v_u_47, (copy) v_u_17, (copy) v_u_18, (copy) v_u_142
	if not v_u_2 or v_u_47 then
		return
	end
	v_u_47 = true
	local v147 = 1
	local v148 = nil
	while true do
		if not v_u_17[v147] then
			v147 = v148
			break
		end
		if not v_u_18[v147] or v_u_18[v147].phase ~= "FALLEN" then
			break
		end
		v147 = v147 + 1
	end
	if v147 and v_u_17[v147] then
		v_u_142(v147, 0.3)
	end
end)
v10.OnClientEvent:Connect(function(p149)
	-- upvalues: (copy) v_u_17, (copy) v_u_16, (copy) v_u_18
	local v150 = v_u_17[p149]
	local v151 = v_u_16[p149]
	if v150 and v151 then
		if not v_u_18[p149] then
			local v152 = v150.cf
			local v153 = v150.size
			local v154 = v152.Position + v152.LookVector * (v153.Z / 2)
			local v155 = v152.RightVector
			v151:PivotTo(CFrame.new(v154) * CFrame.fromAxisAngle(v155, -1.5707963267948966) * CFrame.new(-v154) * v152)
			v_u_18[p149] = {
				["theta"] = 1.5707963267948966,
				["omega"] = 0,
				["phase"] = "FALLEN"
			}
			local v156 = v151.PrimaryPart
			if v156 then
				local v157 = v156:FindFirstChild("Attachment")
				if v157 then
					v157 = v157:FindFirstChild("BillboardGui")
				end
				if v157 then
					v157.Enabled = false
				end
			end
		end
	else
		return
	end
end)
workspace:GetAttributeChangedSignal("Dominoes"):Connect(function()
	-- upvalues: (ref) v_u_2, (ref) v_u_48, (copy) v_u_17, (copy) v_u_16, (copy) v_u_61, (copy) v_u_144
	if workspace:GetAttribute("Dominoes") then
		if v_u_2 then
			return
		end
		v_u_2 = true
		if v_u_48 then
			for _, v158 in v_u_48 do
				v_u_17[v158.index] = v158
				v_u_16[v158.index] = v_u_61(v158)
			end
			v_u_48 = nil
			return
		end
	else
		v_u_144()
	end
end)
if workspace:GetAttribute("Dominoes") then
	task.defer(function()
		-- upvalues: (ref) v_u_2, (ref) v_u_48, (copy) v_u_17, (copy) v_u_16, (copy) v_u_61
		if not v_u_2 then
			v_u_2 = true
			if v_u_48 then
				for _, v159 in v_u_48 do
					v_u_17[v159.index] = v159
					v_u_16[v159.index] = v_u_61(v159)
				end
				v_u_48 = nil
			end
		end
	end)
else
	v_u_144(true)
end
return v1
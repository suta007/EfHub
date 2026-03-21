local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players")
local v3 = game:GetService("UserInputService")
local v_u_4 = v_u_2.LocalPlayer
v1:WaitForChild("Assets"):WaitForChild("Models")
local v_u_5 = workspace:WaitForChild("PetsPhysical")
local v_u_6 = require(v1.Modules.TwoPointCast)
require(v1.Modules.ExponentialScaler)
local v7 = require(v1.Modules.ReplicationClass)
local v8 = require(v1.Data.PetRegistry)
local v9 = v1.Modules.PetServices.AnimationEvents
local v_u_10 = require(v1.Modules.PetServices.PetUtilities)
local v_u_11 = require(v1.Modules.PetServices.PetSoundHandler)
local v12 = require(v1.Modules.OptimisationControllers.IsBadDeviceHeuristic)
local v_u_13 = require(v1.Data.PetRegistry.PetMutationRegistry)
require(v1.Types.PetTypes)
local v_u_14 = v12()
local v_u_15 = v_u_4:GetAttribute("KeepPetOnGround") or false
local v_u_16 = RaycastParams.new()
v_u_16.FilterDescendantsInstances = { workspace.Farm }
v_u_16.FilterType = Enum.RaycastFilterType.Include
local v_u_17 = RaycastParams.new()
v_u_17.FilterDescendantsInstances = { workspace.Interaction, workspace.BasePlate }
v_u_17.FilterType = Enum.RaycastFilterType.Include
local v_u_18 = require(v1.Modules.PetServices.PetVFXHandler)
local v_u_19 = require(v1.Modules.SkinService)
require(v1.Modules.DumpTable)
require(v1.Modules.PlatformService)
local v_u_20 = v3.TouchEnabled and "Mobile" or "PC"
local v_u_21 = {}
for _, v22 in v9:GetDescendants() do
	if v22:IsA("ModuleScript") then
		v_u_21[v22.Name] = require(v22)
	end
end
local v_u_23 = v8.PetList
local v_u_24 = v1:WaitForChild("GameEvents"):WaitForChild("ActivePetService")
require(v1.Modules.SelectiveAssetReplication)
local v_u_25 = v7.new("ActivePetsService_Replicator")
v_u_25.DontStager = true
v_u_25:YieldUntilData()
local v_u_26 = require(v1.Modules.GetFarm)
local v_u_27 = {}
local v_u_28 = {}
v_u_27.ClientPetState = v_u_28
local v_u_29 = {}
v_u_27.ClientServerPetState = v_u_29
local function v_u_34(p30)
	-- upvalues: (copy) v_u_29, (copy) v_u_21
	local v31 = v_u_29[p30]
	if v31 then
		if v31.PetSoundHandler then
			v31.PetSoundHandler:destroy()
		end
		if v31.Asset then
			v31.Asset:Destroy()
		end
		if v31.Model then
			v31.Model:Destroy()
		end
		local v32 = v31.CurrentAnimation
		if v32 then
			local v33 = v_u_21[v32.Name]
			if v33 and v33.AnimationEnded then
				v33.AnimationEnded(p30)
			end
			v32:Stop()
		end
		v_u_29[p30] = nil
	end
end
local function v_u_55(p_u_35)
	-- upvalues: (copy) v_u_25, (copy) v_u_29, (copy) v_u_5, (copy) v_u_23, (copy) v_u_19, (copy) v_u_4, (copy) v_u_20, (copy) v_u_11, (copy) v_u_18, (copy) v_u_34
	local v36 = v_u_25:YieldUntilData().Table.ServerPetStates
	local v37
	if v36 then
		v37 = v36[p_u_35]
	else
		v37 = nil
	end
	local v38 = v_u_25:YieldUntilData().Table.ServerPetData
	local v39
	if v38 then
		v39 = v38[p_u_35]
	else
		v39 = nil
	end
	if not (v37 and v39) then
		return nil
	end
	if v_u_29[p_u_35] then
		return v_u_29[p_u_35]
	end
	local v40 = v_u_5:WaitForChild(p_u_35, 2)
	if not v40 then
		return nil
	end
	local v41 = v39.PetType
	local v42 = v_u_23[v41]
	if not v42 then
		warn("Server pet type not found:", v41)
		return nil
	end
	local v43 = Instance.new("Part")
	v43.Size = Vector3.new(2, 2, 2)
	v43.Transparency = 1
	v43.Material = Enum.Material.Neon
	v43.Color = Color3.fromRGB(255, 14, 243)
	v43.Anchored = true
	v43.CanQuery = false
	v43.CanTouch = false
	v43:AddTag("PetTargetable")
	v43:AddTag("ServerPet")
	v43:SetAttribute("UUID", p_u_35)
	v43:SetAttribute("IsServerOwned", true)
	v43.Name = "ServerPetMover"
	v43.CanCollide = false
	local v44 = v39.PetData
	local v45 = (v44.BaseWeight or 1) + v42.ModelScalePerLevel * (v44.Level or 1)
	v43:PivotTo(v37.CurrentCFrame or CFrame.new(0, 5, 0))
	local v46 = {
		["Asset"] = v43,
		["LoadedAnimations"] = {},
		["IsServerOwned"] = true,
		["PetType"] = v41
	}
	v_u_29[p_u_35] = v46
	local v47 = v42.Variant
	if v47 then
		v_u_19:SetSkin(v40, v47)
	end
	if v_u_4:GetAttribute("PetScaling") == false then
		v40:ScaleTo(1)
	else
		v40:ScaleTo((math.max(0.1, v45)))
	end
	v40:AddTag("PetModel")
	v40:AddTag("ServerPetModel")
	if not v40.PrimaryPart then
		warn(v40, "Server pet missing PrimaryPart")
		v43:Destroy()
		v_u_29[p_u_35] = nil
		return nil
	end
	local v48 = v40.PrimaryPart
	local v49
	if v48 and v43 then
		v49 = Instance.new("Weld")
		v49.Part0 = v48
		v49.Part1 = v43
		v49.Name = "Weld"
		v49.Parent = v43
		v49.Name = ("%*_%*_WELD"):format(v48.Name, v43.Name)
	else
		v49 = nil
	end
	v49.C1 = v49.C1 * v42.WeldOffset
	v46.Model = v40
	local v_u_50 = v40:FindFirstChild("AnimationController")
	if v_u_50 then
		v_u_50 = v_u_50:FindFirstChild("Animator")
	end
	if v_u_50 then
		local v_u_51 = {}
		v46.LoadedAnimations = v_u_51
		for v_u_52, v_u_53 in v42.Animations do
			task.spawn(function()
				-- upvalues: (copy) v_u_50, (copy) v_u_53, (copy) v_u_51, (copy) v_u_52
				local v54 = v_u_50:LoadAnimation(v_u_53)
				v54.Looped = true
				v_u_51[v_u_52] = v54
				if v_u_52 == "Idle" then
					v54:Play()
				end
			end)
		end
	end
	if v_u_20 == "PC" then
		v46.PetSoundHandler = v_u_11.new(v41, v40, p_u_35)
	end
	v46.PetVFXHandler = v_u_18.new(v41, v40, p_u_35)
	v40.PrimaryPart.Anchored = false
	v40.Parent = v43
	v43.Parent = v_u_5
	v40.Destroying:Once(function()
		-- upvalues: (ref) v_u_34, (copy) p_u_35
		v_u_34(p_u_35)
	end)
	return v46
end
local function v_u_90(p56, p57, p58)
	-- upvalues: (copy) v_u_28, (copy) v_u_25, (copy) v_u_23, (copy) v_u_5, (copy) v_u_19, (copy) v_u_27, (copy) v_u_2, (copy) v_u_10, (ref) v_u_15, (copy) v_u_6, (copy) v_u_16, (copy) v_u_20, (copy) v_u_11, (copy) v_u_18
	local v59 = v_u_28[p56]
	if not v59 then
		v59 = {}
		v_u_28[p56] = v59
	end
	if not v59 then
		local v60 = tonumber(p56)
		v59 = v_u_28[v60]
		if not v59 then
			v59 = {}
			v_u_28[v60] = v59
		end
	end
	local v61 = v59[p57]
	local v62 = v_u_25:YieldUntilData().Table.PlayerPetData
	local v63 = (v62[p56] or v62[tonumber(p56)]).PetInventory.Data[p57]
	local v64 = v_u_23[v63.PetType]
	if v64 then
		local _ = v64.Model
	end
	local v_u_65 = v61.Asset
	if v_u_65 then
		local v66 = v61.Model
		if v66 then
			v66:Destroy()
		end
		local v67 = v_u_5:WaitForChild(p57)
		if v67 then
			local v_u_68 = v67
			local v69 = v64.Variant
			if v69 then
				v_u_19:SetSkin(v_u_68, v69)
			end
			local v70 = v_u_27:CalculateBoost(v_u_2:FindFirstChild(p56), p57, "SIZE_MODIFICATION") or 1
			local v71 = v63.PetType
			local v72 = v63.PetData.Level or 1
			local v73 = math.min(v72, 100)
			local v74 = v_u_10:CalculateWeight(v63.PetData.BaseWeight or 1, v73)
			if v71 == "Chubby Chipmunk" then
				p58 = (math.clamp(v74, 1, 50) - 1) * 0.20408163265306123 + 1
			end
			if v_u_2.LocalPlayer:GetAttribute("PetScaling") == false then
				v_u_68:ScaleTo(1)
			else
				v_u_68:ScaleTo(math.max(0.1, p58) * v70)
			end
			local v_u_75
			if v_u_15 then
				v_u_75 = 0
			else
				local v76 = v_u_6(v_u_65.Position + Vector3.new(0, 1, 0), v_u_65.Position - Vector3.new(0, 1, 0), v_u_16)
				v_u_75 = v76 and v76.Position.Y or 0
			end
			local function v_u_81()
				-- upvalues: (ref) v_u_68, (copy) v_u_65, (ref) v_u_75
				if v_u_68 and v_u_65 then
					local v77 = v_u_68:GetPivot()
					local v78, v79 = v_u_68:GetBoundingBox()
					local v80 = v78.Position - v77.Position
					v_u_68:PivotTo(v_u_65.CFrame * CFrame.new(0, v_u_75 + v79.Y / 2 + v80.Y, 0))
				end
			end
			v_u_81()
			v_u_68:AddTag("PetModel")
			local v82
			if v_u_20 == "PC" then
				v82 = v_u_11.new(v71, v_u_68, p57)
			else
				v82 = false
			end
			v61.PetSoundHandler = v82
			v_u_18.new(v71, v_u_68, p57)
			v61.PetVFXHandler = v_u_18.new(v71, v_u_68, p57)
			if v_u_68.PrimaryPart then
				local v83 = v_u_68.PrimaryPart
				local v84
				if v83 and v_u_65 then
					v84 = Instance.new("Weld")
					v84.Part0 = v83
					v84.Part1 = v_u_65
					v84.Name = "Weld"
					v84.Parent = v_u_65
					v84.Name = ("%*_%*_WELD"):format(v83.Name, v_u_65.Name)
				else
					v84 = nil
				end
				v84.C1 = v84.C1 * v64.WeldOffset
				v61.Model = v_u_68
				local v_u_85 = v_u_68:FindFirstChild("AnimationController")
				if v_u_85 then
					v_u_85 = v_u_85:FindFirstChild("Animator")
				end
				if v_u_85 then
					local v_u_86 = {}
					v61.LoadedAnimations = v_u_86
					for v_u_87, v_u_88 in v64.Animations do
						task.spawn(function()
							-- upvalues: (copy) v_u_85, (copy) v_u_88, (copy) v_u_86, (copy) v_u_87, (copy) v_u_81
							local v89 = v_u_85:LoadAnimation(v_u_88)
							v89.Looped = true
							v_u_86[v_u_87] = v89
							if v_u_87 == "Idle" then
								v89:Play()
							end
							task.defer(v_u_81)
						end)
					end
				end
				return v_u_68
			end
			warn(v_u_68, "DOES NOT HAVE A PRIMARY_PART??")
		end
	else
		return
	end
end
local function v_u_98(p91, p92)
	-- upvalues: (copy) v_u_28, (copy) v_u_21
	local v93 = v_u_28[p91]
	if not v93 then
		v93 = {}
		v_u_28[p91] = v93
	end
	local v94 = v93[p92]
	if v94 then
		if v94.PetSoundHandler then
			v94.PetSoundHandler:destroy()
		end
		v94.Asset:Destroy()
		local v95 = v94.Model
		if v95 then
			v95:Destroy()
		end
	end
	local v96 = v94.CurrentAnimation
	if v96 then
		local v97 = v_u_21[v96.Name]
		if v97 then
			v97 = v97.AnimationEnded
		end
		if v97 then
			v97(p92)
		end
		v96:Stop()
	end
	v93[p92] = nil
end
local function v_u_127(p99, p_u_100)
	-- upvalues: (copy) v_u_28, (copy) v_u_2, (copy) v_u_26, (copy) v_u_5, (copy) v_u_25, (copy) v_u_23, (copy) v_u_10, (copy) v_u_4, (ref) v_u_15, (copy) v_u_6, (copy) v_u_16, (copy) v_u_90, (copy) v_u_98
	local v_u_101 = tostring(p99)
	local v102 = v_u_101
	local v103 = v_u_28[v102]
	if not v103 then
		v103 = {}
		v_u_28[v102] = v103
	end
	if not v103 then
		local v104 = tonumber(v_u_101)
		v103 = v_u_28[v104]
		if not v103 then
			v103 = {}
			v_u_28[v104] = v103
		end
	end
	local v105 = v103[p_u_100]
	local v106 = v_u_2:FindFirstChild(v_u_101)
	if v106 then
		local v107 = v_u_26(v106)
		if v107 then
			if not v105 then
				local v108 = v_u_5:WaitForChild(p_u_100, 2)
				if not v108 then
					return nil
				end
				local v109 = Instance.new("Part")
				v109.Size = Vector3.new(2, 2, 2)
				v109.Transparency = 1
				v109.Material = Enum.Material.Neon
				v109.Color = Color3.fromRGB(15, 119, 255)
				v109.Anchored = true
				v109.CanQuery = false
				v109:AddTag("PetTargetable")
				v109:SetAttribute("UUID", p_u_100)
				v109:SetAttribute("OWNER", (tostring(v_u_101)))
				v109.Name = "PetMover"
				v109.CanCollide = false
				local v110 = v_u_25:YieldUntilData().Table
				local v111 = v110.PlayerPetData
				local v112 = v110.ActivePetStates
				local v113 = v111[v_u_101] or v111[tonumber(v_u_101)]
				if not v113 then
					return
				end
				local v114 = v113.PetInventory
				if not v114 then
					return
				end
				local v115 = v114.Data[p_u_100]
				if not v115 then
					return
				end
				local v116 = v115.PetType
				local v117 = v_u_23[v116]
				if v117 then
					local _ = v117.Model
				end
				if v111.PetType == "Chubby Chipmunk" then
					local v118 = v_u_10:CalculateWeight(v111.PetData.BaseWeight, v111.PetData.Level, v111.PetType)
					if v118 < 2 then
						local _ = v117.Model
					elseif v118 < 15 then
						local _ = v117.Model2
					elseif v118 < 30 then
						local _ = v117.Model3
					elseif v118 < 40 then
						local _ = v117.Model4
					else
						local _ = v117.Model5
					end
				end
				local v119 = v115.PetData.BaseWeight
				if not v117 then
					warn(v116, "does not have foundpettypedata")
					return
				end
				local v120 = v119 + v117.ModelScalePerLevel * v115.PetData.Level
				local v121 = v107:FindFirstChild("PetArea")
				local v122 = (v112[v_u_101] or v112[tonumber(v_u_101)])[p_u_100]
				if not v122 then
					return
				end
				local v123 = v_u_4:GetAttribute("PetScaling") == false and 1 or v120
				local v124
				if v_u_15 then
					v124 = 0
				else
					v124 = v_u_6(v109.Position + Vector3.new(0, 2, 0), v109.Position - Vector3.new(0, 2, 0), v_u_16)
					if v124 then
						v124 = v124.Position.Y
					end
				end
				local v125 = (v124 or 0) + (v117.YHeightScaler or 0) * v123
				v109:PivotTo(v117.MovementType == "Grounded" and CFrame.new(v122.CurrentCFrame.X, v125, v122.CurrentCFrame.Z) or (v122.CurrentCFrame or v121.CFrame))
				v103[p_u_100] = {
					["Asset"] = v109,
					["LoadedAnimations"] = {}
				}
				local v126 = v_u_90(v_u_101, p_u_100, v120)
				if not v126 then
					v109:Destroy()
					v103[p_u_100] = nil
					return nil
				end
				v108:PivotTo(v126:GetPivot() * CFrame.new(0, v125 + v126:GetExtentsSize().Y, 0))
				v108.PrimaryPart.Anchored = false
				v108.Parent = v109
				v109.Parent = v_u_5
				v108.Destroying:Once(function()
					-- upvalues: (ref) v_u_98, (ref) v_u_101, (copy) p_u_100
					v_u_98(v_u_101, p_u_100)
				end)
			end
			return v105
		end
	end
end
local function v_u_131()
	-- upvalues: (copy) v_u_25, (copy) v_u_29, (copy) v_u_34, (copy) v_u_55
	local v128 = v_u_25:YieldUntilData().Table.ServerPetStates or {}
	for v129 in v_u_29 do
		if not v128[v129] then
			v_u_34(v129)
		end
	end
	for v130 in v128 do
		if not v_u_29[v130] then
			v_u_55(v130)
		end
	end
end
local function v_u_146()
	-- upvalues: (copy) v_u_25, (copy) v_u_28, (copy) v_u_98, (copy) v_u_14, (copy) v_u_4, (copy) v_u_5, (copy) v_u_127, (copy) v_u_131
	local v132 = v_u_25:YieldUntilData().Table.ActivePetStates
	for v133, v134 in v_u_28 do
		local v135 = tostring(v133)
		local v136 = v132[v135] or v132[tonumber(v135)]
		if v136 then
			for v137 in v134 do
				if not v136[v137] then
					v_u_98(v135, v137)
				end
			end
		else
			local v138 = v_u_28[v135]
			if not v138 then
				v138 = {}
				v_u_28[v135] = v138
			end
			if v138 then
				for v139 in v138 do
					v_u_98(v135, v139)
				end
			end
			v_u_28[v135] = nil
		end
	end
	for v140, v141 in v132 do
		local v142 = tostring(v140)
		if v_u_14 and v142 ~= v_u_4.Name then
			for v_u_143 in v141 do
				task.spawn(function()
					-- upvalues: (ref) v_u_5, (copy) v_u_143
					local v144 = v_u_5:WaitForChild(v_u_143, 0.5)
					if v144 then
						v144:Destroy()
					end
				end)
			end
		else
			for v145 in v141 do
				v_u_127(v142, v145)
			end
		end
	end
	v_u_131()
end
local _ = workspace:WaitForChild("BasePlate").Baseplate
local v_u_147 = {}
local v_u_148 = {}
local v_u_149 = 0
local function v_u_248(p150)
	-- upvalues: (ref) v_u_149, (copy) v_u_148, (copy) v_u_147, (copy) v_u_25, (copy) v_u_28, (copy) v_u_14, (copy) v_u_4, (copy) v_u_23, (copy) v_u_10, (copy) v_u_27, (copy) v_u_2, (ref) v_u_15, (copy) v_u_6, (copy) v_u_16, (copy) v_u_20, (copy) v_u_21, (copy) v_u_29, (copy) v_u_17
	v_u_149 = 0
	table.clear(v_u_148)
	table.clear(v_u_147)
	local v151 = v_u_25:YieldUntilData().Table
	local v152 = v151.ActivePetStates
	local v153 = v151.PlayerPetData
	local v154 = v151.ServerPetStates or {}
	local v155 = v151.ServerPetData or {}
	for v156, v157 in v_u_28 do
		if not v_u_14 or v156 == v_u_4.Name then
			local v158 = tostring(v156)
			local v159 = v152[v158] or v152[tonumber(v158)]
			if v159 then
				for v160, v161 in v157 do
					local v162 = v159[v160]
					if v162 then
						local v163 = v161.Asset
						local v164 = v162.CurrentCFrame
						if v164 then
							local v165 = (v164.Position - v163.Position).Magnitude
							local v166 = ((v_u_28.LastUpdatedPosition or v164.Position) - v163.Position).Magnitude
							local v167 = v161.IsNotFirstTime
							if v166 > 2 or v167 then
								v161.LastUpdatedPosition = v163.Position
								v161.IsNotFirstTime = true
								local v168 = v163:FindFirstChildWhichIsA("Model", true)
								local v169 = v153[v158] or v153[tonumber(v158)]
								if v169 then
									local v170 = v169.PetInventory.Data[v160]
									local v171
									if v168 then
										v171 = v168.PrimaryPart
									else
										v171 = v168
									end
									local v172
									if v171 then
										v172 = v171.Size
									else
										v172 = v171
									end
									if not v171 then
										return
									end
									if not v170 then
										return
									end
									local v173 = v170.PetType
									local v174 = v_u_23[v173]
									local v175 = v162.MovementSpeed
									local v176 = v174.MovementType
									local v177 = v170.PetData.BaseWeight
									local v178 = v175 * p150 / v165
									local v179 = math.clamp(v178, 0, 1)
									local v180 = v163.Position:Lerp(v164.Position, v179)
									local v181 = v161.LastScale
									local v182 = v170.PetData.Level or 1
									local v183 = math.min(v182, 100)
									local v184 = v_u_10:CalculateWeight(v170.PetData.BaseWeight or 1, v183)
									local v185
									if v173 == "Chubby Chipmunk" then
										v185 = (math.clamp(v184, 1, 50) - 1) * 0.20408163265306123 + 1
									else
										v185 = v177 + v174.ModelScalePerLevel * v184
									end
									local v186 = v185 * (v_u_27:CalculateBoost(v_u_2:FindFirstChild(v158), v160, "SIZE_MODIFICATION") or 1)
									local v187 = v_u_4:GetAttribute("PetScaling")
									local v188 = v187 == false and 1 or v186
									if v187 == false then
										if v181 ~= 1 then
											v168:ScaleTo(1)
											v161.LastScale = 1
										end
									elseif v181 ~= v186 then
										v168:ScaleTo((math.max(0.01, v186)))
										v161.LastScale = v186
									end
									local v189
									if v_u_15 then
										v189 = 0
									else
										v189 = v_u_6(v163.Position + Vector3.new(0, 2, 0), v163.Position - Vector3.new(0, 2, 0), v_u_16)
										if v189 then
											v189 = v189.Position.Y
										end
									end
									local v190 = v189 or 0
									local v191 = v161.LastYHeight or v190
									local v192 = 5 * p150
									local v193 = math.lerp(v191, v190, v192)
									v161.LastYHeight = v193
									local _ = v168:GetExtentsSize().Y
									local v194 = (v174.YHeightScaler or 0) * v188
									local v195
									if v176 == "Grounded" then
										v195 = CFrame.new(v180.X, (v193 or 0) + v194 + v172.Y / 2, v180.Z)
									else
										v195 = CFrame.new(v180)
									end
									local v196 = v171.Position
									local v197 = v164.Position
									local v198
									if v176 == "Grounded" then
										v198 = (Vector2.new(v196.X, v196.Z) - Vector2.new(v197.X, v197.Z)).Magnitude <= 2.5
									else
										v198 = false
									end
									local v199
									if v176 == "Flight" then
										v199 = (v196 - v197).Magnitude <= 1
									else
										v199 = false
									end
									local v200 = v162.CustomAnimationState or ((v199 or v198) and "Idle" or "Walk")
									if not v161.LastAnimationState or v161.LastAnimationState ~= v200 then
										if v_u_20 == "PC" and v161.PetSoundHandler then
											v161.PetSoundHandler:playSound(v200)
										end
										v161.PetVFXHandler:playVFX(v200)
										v161.LastAnimationState = v200
									end
									local v201 = v161.LoadedAnimations
									local v202 = v201[v200]
									local v203 = v161.CurrentAnimation
									if v203 ~= v202 and v202 then
										v168:FindFirstChild("AnimationController")
										for _, v204 in v201 do
											v204:Stop()
										end
										if v203 then
											local v205 = v_u_21[v203.Name]
											if v205 then
												v205 = v205.AnimationEnded
											end
											if v205 then
												v205(v160)
											end
											v203:Stop()
										end
										v161.CurrentAnimation = v202
										if v202 then
											local v206 = v_u_21[v202.Name]
											if v206 then
												v206 = v206.AnimationStarted
											end
											if v206 then
												v206(v160)
											end
											v202:Play()
										end
									end
									if v161.LastTargetCFrame == v164 and v161.LastAngles then
										v_u_149 = v_u_149 + 1
										v_u_147[v_u_149] = v163
										v_u_148[v_u_149] = v195 * v161.LastAngles
									else
										local v207, v208, v209 = (v176 == "Grounded" and v_u_10:GetLookAt(v163.Position, v164.Position) or CFrame.new(v163.Position, v164.Position)):ToEulerAnglesXYZ()
										if v207 ~= v207 or (v208 ~= v208 or v209 ~= v209) then
											v207 = 0
											v208 = 0
											v209 = 0
										end
										local v210 = CFrame.Angles(v207, v208, v209)
										local v211 = (v161.LastAngles or v210):Lerp(v210, 6 * p150)
										v_u_149 = v_u_149 + 1
										v_u_147[v_u_149] = v163
										v_u_148[v_u_149] = v195 * v211
										v161.LastAngles = v211
									end
								end
							end
						end
					end
				end
			end
		end
	end
	for v212, v213 in v_u_29 do
		local v214 = v154[v212]
		if v214 then
			local v215 = v155[v212]
			if v215 then
				local v216 = v213.Asset
				if v216 then
					local v217 = v214.CurrentCFrame
					if v217 then
						local v218 = v_u_23[v215.PetType]
						if v218 then
							local v219 = v213.Model
							if v219 then
								v219 = v219.PrimaryPart
							end
							if v219 then
								local v220 = v214.MovementSpeed or 10
								local v221 = v218.MovementType
								local v222 = (v217.Position - v216.Position).Magnitude
								if v222 < 0.1 then
									v_u_149 = v_u_149 + 1
									v_u_147[v_u_149] = v216
									v_u_148[v_u_149] = v216.CFrame
								else
									local v223 = v220 * p150 / v222
									local v224 = math.clamp(v223, 0, 1)
									local v225 = v216.Position:Lerp(v217.Position, v224)
									local v226 = v225.X
									local v227 = v225.Z
									local v228 = Vector3.new(v226, 500, v227)
									local v229 = workspace:Raycast(v228, Vector3.new(0, -1000, 0), v_u_17)
									local v230 = v213.LastYHeight or v216.Position.Y
									if v229 then
										v230 = v229.Position.Y
									end
									local v231 = v213.LastYHeight or v230
									local v232 = 5 * p150
									local v233 = math.lerp(v231, v230, v232)
									v213.LastYHeight = v233
									local v234 = v219.Size
									local v235 = v218.YHeightScaler or 0
									local v236
									if v221 == "Grounded" then
										v236 = CFrame.new(v225.X, v233 + v235 + v234.Y / 2, v225.Z)
									else
										v236 = CFrame.new(v225)
									end
									local v237 = v222 <= 2.5 and "Idle" or "Walk"
									if v213.LastAnimationState ~= v237 then
										if v_u_20 == "PC" and v213.PetSoundHandler then
											v213.PetSoundHandler:playSound(v237)
										end
										if v213.PetVFXHandler then
											v213.PetVFXHandler:playVFX(v237)
										end
										v213.LastAnimationState = v237
									end
									local v238 = v213.LoadedAnimations[v237]
									local v239 = v213.CurrentAnimation
									if v239 ~= v238 and v238 then
										if v239 then
											v239:Stop()
										end
										v213.CurrentAnimation = v238
										v238:Play()
									end
									local v240, v241, v242 = (v221 == "Grounded" and v_u_10:GetLookAt(v216.Position, v217.Position) or CFrame.new(v216.Position, v217.Position)):ToEulerAnglesXYZ()
									local v243 = v240 ~= v240 and 0 or v240
									local v244 = v241 ~= v241 and 0 or v241
									local v245 = v242 ~= v242 and 0 or v242
									local v246 = CFrame.Angles(v243, v244, v245)
									local v247 = (v213.LastAngles or v246):Lerp(v246, 6 * p150)
									v213.LastAngles = v247
									v_u_149 = v_u_149 + 1
									v_u_147[v_u_149] = v216
									v_u_148[v_u_149] = v236 * v247
								end
							end
						end
					end
				end
			end
		end
	end
	workspace:BulkMoveTo(v_u_147, v_u_148, Enum.BulkMoveMode.FireCFrameChanged)
end
task.spawn(function()
	-- upvalues: (copy) v_u_20, (copy) v_u_248
	while true do
		local v_u_249 = task.wait(v_u_20 == "Mobile" and 0.025 or 0.015)
		task.spawn(function()
			-- upvalues: (ref) v_u_248, (copy) v_u_249
			v_u_248(v_u_249)
		end)
	end
end)
function v_u_27.GetServerState(_, p250, p251)
	-- upvalues: (copy) v_u_25
	local v252 = v_u_25:YieldUntilData().Table.ActivePetStates
	local v253 = v252[p250] or v252[tonumber(p250)]
	if v253 then
		return v253[p251]
	end
end
function v_u_27.GetPlayerDatastorePetData(_, p254)
	-- upvalues: (copy) v_u_25
	local v255 = v_u_25:YieldUntilData().Table.PlayerPetData
	local v256 = v255[p254] or v255[tonumber(p254)]
	if v256 then
		return v256
	end
end
function v_u_27.GetPetData(_, p257, p258)
	-- upvalues: (copy) v_u_25
	local v259 = v_u_25:YieldUntilData().Table.PlayerPetData
	local v260 = v259[p257] or v259[tonumber(p257)]
	if v260 then
		return v260.PetInventory.Data[p258]
	end
end
function v_u_27.GetPetDataFromPetObject(_, p261)
	-- upvalues: (copy) v_u_27
	if p261 then
		return v_u_27:GetPetData(p261:GetAttribute("OWNER"), (p261:GetAttribute("UUID")))
	end
end
function v_u_27.SetPetState(_, p262, p263, p264)
	-- upvalues: (copy) v_u_24
	v_u_24:FireServer("SetPetState", p262, p263, p264)
end
function v_u_27.GetClientPetState(_, p265)
	-- upvalues: (copy) v_u_28
	local v266 = v_u_28[p265]
	if not v266 then
		v266 = {}
		v_u_28[p265] = v266
	end
	return v266
end
function v_u_27.CalculateBoost(_, p267, p268, p269)
	-- upvalues: (copy) v_u_27, (copy) v_u_13
	if not p267 then
		return 1
	end
	local v270 = v_u_27:GetPetData(p267.Name, p268)
	if not v270 then
		return 1
	end
	local v271 = v270.PetData
	local v272 = v270.PetData.MutationType
	local v273 = 1
	if v272 then
		local v274 = v_u_13.EnumToPetMutation[v272]
		for _, v275 in v_u_13.PetMutationRegistry[v274].Boosts do
			if v275.BoostType == p269 then
				v273 = v273 + v275.BoostAmount
			end
		end
	end
	local v276 = v271.Boosts
	if not v276 then
		return v273
	end
	for _, v277 in v276 do
		if v277.BoostType == p269 then
			v273 = v273 + v277.BoostAmount
		end
	end
	return v273
end
function v_u_27.GetBoostsOfType(_, p278, p279, p280)
	-- upvalues: (copy) v_u_27, (copy) v_u_13
	local v281 = v_u_27:GetPetData(p278.Name, p279)
	if v281 then
		local v282 = v281.PetData.Boosts
		if v282 then
			local v283 = {}
			for _, v284 in v282 do
				if v284.BoostType == p280 then
					table.insert(v283, v284)
				end
			end
			local v285 = v281.PetData.MutationType
			if v285 then
				local v286 = v_u_13.EnumToPetMutation[v285]
				for _, v287 in v_u_13.PetMutationRegistry[v286].Boosts do
					if v287.BoostType == p280 then
						table.insert(v283, v287)
					end
				end
			end
			return v283
		end
	end
end
function v_u_27.GetClientPetStateUUID(_, p288, p289)
	-- upvalues: (copy) v_u_27
	local v290 = v_u_27:GetClientPetState(p288) or v_u_27:GetClientPetState((tonumber(p288)))
	if v290 then
		return v290[p289]
	end
end
v_u_2.PlayerRemoving:Connect(function(p291)
	-- upvalues: (copy) v_u_28, (copy) v_u_98
	local v292 = v_u_28[p291]
	if not v292 then
		v292 = {}
		v_u_28[p291] = v292
	end
	if v292 then
		for v293 in v292 do
			v_u_98(p291, v293)
		end
	end
	v_u_28[p291] = nil
end)
function v_u_27.Feed(_, p294)
	-- upvalues: (copy) v_u_29, (copy) v_u_24
	local v295 = v_u_29[p294]
	if v295 and v295.IsServerOwned then
		v_u_24:FireServer("FeedServerPet", p294)
	else
		v_u_24:FireServer("Feed", p294)
	end
end
function v_u_27.GetServerPetData(_, p296)
	-- upvalues: (copy) v_u_25
	local v297 = v_u_25:YieldUntilData().Table.ServerPetData
	if v297 then
		return v297[p296]
	else
		return nil
	end
end
task.delay(2, function()
	-- upvalues: (copy) v_u_146, (copy) v_u_25
	v_u_146()
	v_u_25:GetPathSignal("ActivePetStates/@"):Connect(function(...)
		-- upvalues: (ref) v_u_146
		v_u_146()
	end)
end)
v_u_146()
require(v1.Modules.userprint)
task.spawn(function()
	-- upvalues: (copy) v_u_146
	while true do
		task.wait(2)
		v_u_146()
	end
end)
v_u_4:GetAttributeChangedSignal("KeepPetOnGround"):Connect(function()
	-- upvalues: (copy) v_u_4, (ref) v_u_15
	v_u_15 = v_u_4:GetAttribute("KeepPetOnGround")
end)
return v_u_27
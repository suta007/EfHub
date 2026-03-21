local v1 = game:GetService("CollectionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players")
local v_u_5 = game.ReplicatedStorage.GameEvents.DiscoSetColor_RE
require(game.ReplicatedStorage.Modules.TableUtils)
local v_u_6 = require(game.ReplicatedStorage.Calculate_Weight)
local v_u_7 = require(v_u_2.Modules.GetPlayerFromPlant)
local v_u_8 = require(v_u_2.Data.EnumRegistry.FruitsEnums)
local v_u_9 = require(v_u_2.Data.EnumRegistry.PlantsEnums)
local v_u_10 = require(v_u_2.Modules.Task)
local v11 = require(v_u_2.Modules.Task.ThrottledTaskQueue)
local v_u_12 = require(v_u_2.Data.InfGrowPlantData)
local v_u_13 = {}
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_19 = {}
local v_u_20 = {
	["Potato"] = CFrame.Angles(1.5707963267948966, 0, 0)
}
local function v_u_74(p21, p22, p23, p24, p25)
	local v_u_26 = {
		Enum.NormalId.Top,
		Enum.NormalId.Bottom,
		Enum.NormalId.Left,
		Enum.NormalId.Right,
		Enum.NormalId.Front,
		Enum.NormalId.Back
	}
	local v27 = {
		Color3.fromRGB(210, 47, 255),
		Color3.fromRGB(255, 60, 60),
		Color3.fromRGB(57, 255, 133),
		Color3.fromRGB(255, 159, 33),
		Color3.fromRGB(69, 125, 255),
		Color3.fromRGB(255, 233, 105),
		Color3.fromRGB(255, 23, 23),
		Color3.fromRGB(138, 185, 255)
	}
	local function v38(p28, p29, p30)
		local v31 = p29.CFrame:PointToObjectSpace(p28)
		local v32 = p29.Size.X / 2
		local v33 = p29.Size.Y / 2
		local v34 = p29.Size.Z / 2
		local v35 = v31.X
		if math.abs(v35) <= v32 + p30 then
			local v36 = v31.Y
			if math.abs(v36) <= v33 + p30 then
				local v37 = v31.Z
				if math.abs(v37) <= v34 + p30 then
					return true
				end
			end
		end
		return false
	end
	local function v52(p39, p40, p41)
		local v42 = p39.Size.X / 2
		local v43 = p39.Size.Y / 2
		local v44 = p39.Size.Z / 2
		local v45 = p39.CFrame:VectorToObjectSpace(p40)
		local v46 = v45.X
		local v47 = math.abs(v46) * v42
		local v48 = v45.Y
		local v49 = v47 + math.abs(v48) * v43
		local v50 = v45.Z
		local v51 = v49 + math.abs(v50) * v44
		return p39.CFrame.Position + p40 * (v51 + p41)
	end
	local v58 = (function(p53)
		-- upvalues: (copy) v_u_26
		local v54 = (-1 / 0)
		local v55 = nil
		for _, v56 in ipairs(v_u_26) do
			local v57 = p53.CFrame:VectorToWorldSpace(Vector3.FromNormalId(v56)):Dot(Vector3.new(0, -1, 0))
			if v54 < v57 then
				v55 = v56
				v54 = v57
			end
		end
		return v55
	end)(p21)
	local v59 = p21.CFrame:VectorToWorldSpace(Vector3.FromNormalId(v58))
	local v60 = p23:Clone()
	local v61 = v60.PrimaryPart or v60:FindFirstChildWhichIsA("BasePart")
	if not v61 then
		v60:Destroy()
		return nil
	end
	v60.PrimaryPart = v61
	local v62 = v61.Size.Magnitude / 2
	local v63 = v52(p21, v59, p25 + p24 + v62)
	for _, v64 in ipairs(p22:GetDescendants()) do
		if v64:IsA("BasePart") and (v64 ~= p21 and v38(v63, v64, p24)) then
			v60:Destroy()
			return nil
		end
	end
	v60.Parent = p22
	v61.Color = v27[math.random(1, #v27)]
	v61.CFrame = CFrame.new(v63, v63 + v59)
	local v65 = Instance.new("WeldConstraint")
	v65.Part0 = v61
	v65.Part1 = p21
	v65.Parent = v61
	local v66 = v60:FindFirstChild("Stem")
	if v66 and v66:IsA("BasePart") then
		local v67 = v61.Position
		local v68 = v52(p21, v59, 0)
		local v69 = (v67 + v68) / 2
		local v70 = (v68 - v67).Magnitude
		local v71 = v66.Size.X
		local v72 = v66.Size.Z
		v66.Size = Vector3.new(v71, v70, v72)
		v66.CFrame = CFrame.lookAt(v69, v68) * CFrame.Angles(1.5707963267948966, 0, 0)
		local v73 = Instance.new("WeldConstraint")
		v73.Part0 = v66
		v73.Part1 = v61
		v73.Parent = v66
	end
	return v60
end
local function v_u_152(p75, p76, p77, p78)
	-- upvalues: (copy) v_u_20
	p75:_RemoveFX(p76, p77)
	local v79 = p75.Name
	if v79 then
		local v80 = p75.Color
		if v80 then
			local v81 = {}
			local v82 = p78 or 0.5
			for _, v83 in p76:GetDescendants() do
				if (v83:IsA("BasePart") or (v83:IsA("UnionOperation") or v83:IsA("MeshPart") and v83.Transparency < 1)) and not v83:HasTag("Effect") then
					table.insert(v81, v83)
				end
			end
			if #v81 ~= 0 then
				local v84 = Vector3.new(inf, inf, inf)
				local v85 = Vector3.new(-inf, -inf, -inf)
				for _, v86 in v81 do
					local v87 = v86.CFrame
					local v88 = v86.Size
					local v89 = {}
					local v90 = -v88.X / 2
					local v91 = -v88.Y / 2
					local v92 = -v88.Z / 2
					local v93 = v87 * Vector3.new(v90, v91, v92)
					local v94 = v88.X / 2
					local v95 = -v88.Y / 2
					local v96 = -v88.Z / 2
					local v97 = v87 * Vector3.new(v94, v95, v96)
					local v98 = -v88.X / 2
					local v99 = v88.Y / 2
					local v100 = -v88.Z / 2
					local v101 = v87 * Vector3.new(v98, v99, v100)
					local v102 = v88.X / 2
					local v103 = v88.Y / 2
					local v104 = -v88.Z / 2
					local v105 = v87 * Vector3.new(v102, v103, v104)
					local v106 = -v88.X / 2
					local v107 = -v88.Y / 2
					local v108 = v88.Z / 2
					local v109 = v87 * Vector3.new(v106, v107, v108)
					local v110 = v88.X / 2
					local v111 = -v88.Y / 2
					local v112 = v88.Z / 2
					local v113 = v87 * Vector3.new(v110, v111, v112)
					local v114 = -v88.X / 2
					local v115 = v88.Y / 2
					local v116 = v88.Z / 2
					local v117 = v87 * Vector3.new(v114, v115, v116)
					local v118 = v88.X / 2
					local v119 = v88.Y / 2
					local v120 = v88.Z / 2
					__set_list(v89, 1, {v93, v97, v101, v105, v109, v113, v117, v87 * Vector3.new(v118, v119, v120)})
					for _, v121 in ipairs(v89) do
						local v122 = v84.X
						local v123 = v121.X
						local v124 = math.min(v122, v123)
						local v125 = v84.Y
						local v126 = v121.Y
						local v127 = math.min(v125, v126)
						local v128 = v84.Z
						local v129 = v121.Z
						local v130 = math.min(v128, v129)
						v84 = Vector3.new(v124, v127, v130)
						local v131 = v85.X
						local v132 = v121.X
						local v133 = math.max(v131, v132)
						local v134 = v85.Y
						local v135 = v121.Y
						local v136 = math.max(v134, v135)
						local v137 = v85.Z
						local v138 = v121.Z
						local v139 = math.max(v137, v138)
						v85 = Vector3.new(v133, v136, v139)
					end
				end
				local v140 = v85 - v84 + Vector3.new(0.1, 0.1, 0.1)
				local v141 = (v84 + v85) / 2
				local v142 = p76:GetPivot().Rotation
				local v143 = CFrame.new(v141) * v142
				local v144 = p76.Name
				if p76:IsA("Tool") then
					v144 = p76.Item_String.Value
				end
				if v_u_20[v144] then
					v143 = v143 * v_u_20[v144]
				end
				local v145 = Instance.new("Part")
				v145.Name = ("%*Shell"):format(v79)
				v145.Size = v140
				v145.CFrame = v143
				v145.Anchored = false
				v145.CanCollide = false
				v145.CanQuery = false
				v145.Massless = true
				v145.Transparency = v82
				v145.CastShadow = false
				v145.Color = v80
				v145.Material = Enum.Material.Ice
				v145:AddTag((("Cleanup_%*"):format(v79)))
				v145:AddTag("Effect")
				local v146 = p76.PrimaryPart or (p76:FindFirstChild("Handle") or p76:FindFirstChildOfClass("BasePart"))
				if v146 then
					local v147 = Instance.new("WeldConstraint")
					v147.Part0 = v145
					v147.Part1 = v146
					v147.Parent = v145
					v145.Parent = v146
				else
					v145:Destroy()
				end
				local v148 = game.ServerStorage.Mutation_FX:FindFirstChild(v79)
				if v148 then
					for _, v149 in v148:GetChildren() do
						local v150 = v149:Clone()
						v150.Parent = p77
						v150.Enabled = true
						v150:AddTag((("Cleanup_%*"):format(v79)))
					end
				end
				for _, v151 in p76:GetDescendants() do
					if v151:IsA("BasePart") or v151:IsA("UnionOperation") then
						v151.Reflectance = 0.3
					end
				end
			end
		else
			warn("No Color on Mutation", p75)
			return
		end
	else
		warn("No Name on Mutation", p75)
		return
	end
end
local function v_u_161(p153, p154, p155)
	local v_u_156 = p153.Name
	if v_u_156 then
		local function v159(p157)
			-- upvalues: (copy) v_u_156
			for _, v158 in p157:GetDescendants() do
				if v158:HasTag((("Cleanup_%*"):format(v_u_156))) then
					v158:Destroy()
				end
			end
		end
		if p155 then
			v159(p155)
		end
		if p154 then
			v159(p154)
		end
		for _, v160 in p154:GetDescendants() do
			if v160:IsA("BasePart") or v160:IsA("UnionOperation") then
				v160.Reflectance = 0
			end
		end
	else
		warn("No Name on Mutation", p153)
	end
end
function v_u_13.CanBeMutated(_, p162)
	-- upvalues: (copy) v_u_12
	if not p162 then
		warn("MutationHandler.CanBeMutated | No plant given!")
		return false
	end
	local v163 = p162:HasTag("Harvestable") or p162:HasTag("FruitTool")
	local v164 = v_u_12.InfGrowPlants[p162.Name]
	return v163 and (not v164 and true or (v164.CanBeMutated or false))
end
local function v_u_170(p165)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	if not p165 then
		warn("MutationHandler.GetFXPart | No plant given!")
		return nil
	end
	if not p165:IsDescendantOf(game) then
		return nil
	end
	local v166 = {}
	if #v166 == 1 then
		return v166[1]
	end
	if #v166 > 1 then
		return v166
	end
	local v167 = p165:IsA("Tool") and p165:WaitForChild("Handle", 0.3)
	if v167 then
		return v167
	end
	if p165.PrimaryPart then
		return p165.PrimaryPart
	end
	local v168
	if v_u_3:IsStudio() then
		for _, v169 in v_u_4:GetPlayers() do
			if v169.Name == "JexSavron" then
				v168 = true
				goto l16
			end
		end
		v168 = false
		goto l16
	else
		v168 = false
		::l16::
		if v168 then
			warn((("MutationHandler.GetFXPart | No valid FX part found for %* of type %*"):format(p165:GetFullName(), p165.ClassName)))
		end
		return nil
	end
end
local function v_u_188(p_u_171)
	-- upvalues: (copy) v_u_13, (copy) v_u_10, (copy) v_u_170
	local v_u_172 = {}
	local v_u_173 = {}
	for _, v174 in v_u_13:GetMutations() do
		if not p_u_171:GetAttribute(v174.Name) then
			v_u_173[v174] = v174._RemoveFX
		end
		if p_u_171:GetAttribute(v174.Name) then
			v_u_172[v174] = v174._AddFX
		end
	end
	return v_u_10.run(function()
		-- upvalues: (copy) p_u_171, (ref) v_u_170, (copy) v_u_173, (copy) v_u_172
		local v175 = os.time()
		while os.time() - v175 <= 10 do
			task.wait()
			if p_u_171:HasTag("PlantGenerated") or p_u_171:HasTag("FoodGenerated") then
				break
			end
		end
		local v176 = v_u_170(p_u_171)
		local function v182(p177, p178, p179, p180)
			if typeof(p180) == "table" then
				for _, v181 in ipairs(p180) do
					p177(p178, p179, v181)
				end
			elseif p180 then
				p177(p178, p179, p180)
			end
		end
		local v183 = 0
		for v184, v185 in v_u_173 do
			v182(v185, v184, p_u_171, v176)
		end
		for v186, v187 in v_u_172 do
			if v183 < 50 then
				v183 = v183 + 1
				v182(v187, v186, p_u_171, v176)
			end
		end
	end)
end
local _ = 0
local v_u_925 = {
	["Shocked"] = {
		["Id"] = "a",
		["Name"] = "Shocked",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(255, 255, 100),
		["_AddFX"] = function(p189, p190, p191)
			-- upvalues: (copy) v_u_18
			p189:_RemoveFX(p190, p191)
			if p191 then
				for _, v192 in game.ServerStorage.Mutation_FX.Shocked:GetChildren() do
					local v193 = v192:Clone()
					v193.Parent = p191
					v193:AddTag("Cleanup_Shock")
				end
			end
			for _, v194 in p190:GetDescendants() do
				if (v194:IsA("BasePart") or v194:IsA("UnionOperation")) and not v194:HasTag("Effect") then
					v_u_18[v194] = v_u_18[v194] or v194.Material
					v194.Material = Enum.Material.Neon
				end
			end
		end,
		["_RemoveFX"] = function(_, p195, p196)
			-- upvalues: (copy) v_u_18
			if p196 then
				for _, v197 in p196:GetChildren() do
					if v197:HasTag("Cleanup_Shock") then
						v197:Destroy()
					end
				end
			end
			for _, v198 in p195:GetDescendants() do
				if (v198:IsA("BasePart") or v198:IsA("UnionOperation")) and v_u_18[v198] then
					if not v198:HasTag("Effect") then
						v198.Material = v_u_18[v198]
					end
					v_u_18[v198] = nil
				end
			end
		end
	},
	["Windstruck"] = {
		["Id"] = "b",
		["Name"] = "Windstruck",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(162, 185, 209),
		["_AddFX"] = function(p199, p200, p201)
			p199:_RemoveFX(p200, p201)
			if p201 then
				for _, v202 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v203 = v202:Clone()
					v203.Parent = p201
					v203:AddTag("Cleanup_Windstruck")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p204)
			if p204 then
				for _, v205 in p204:GetChildren() do
					if v205:HasTag("Cleanup_Windstruck") then
						v205:Destroy()
					end
				end
			end
		end
	},
	["Dawnbound"] = {
		["Id"] = "c",
		["Name"] = "Dawnbound",
		["ValueMulti"] = 150,
		["Color"] = Color3.fromRGB(255, 213, 0),
		["_AddFX"] = function(p206, p207, p208)
			-- upvalues: (copy) v_u_18
			p206:_RemoveFX(p207, p208)
			if p208 then
				for _, v209 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v210 = v209:Clone()
					v210.Parent = p208
					v210:AddTag("Cleanup_Dawnbound")
				end
			end
			for _, v211 in p207:GetDescendants() do
				if (v211:IsA("BasePart") or v211:IsA("UnionOperation")) and not v211:HasTag("Effect") then
					v_u_18[v211] = v_u_18[v211] or v211.Material
					v211.Material = Enum.Material.Neon
					v211.Reflectance = 0.05
					v211:AddTag("DawnboundVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p212, p213)
			-- upvalues: (copy) v_u_18
			if p213 then
				for _, v214 in p213:GetChildren() do
					if v214:HasTag("Cleanup_Dawnbound") then
						v214:Destroy()
					end
				end
			end
			for _, v215 in p212:GetDescendants() do
				if (v215:IsA("BasePart") or v215:IsA("UnionOperation")) and v215:HasTag("DawnboundVisual") then
					v215.Reflectance = 0
					v215:RemoveTag("DawnboundVisual")
					if v_u_18[v215] then
						v215.Material = v_u_18[v215]
						v_u_18[v215] = nil
					end
				end
			end
		end
	},
	["Beanbound"] = {
		["Id"] = "bb",
		["Name"] = "Beanbound",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(53, 184, 75),
		["_AddFX"] = function(p216, p217, p218)
			-- upvalues: (copy) v_u_18
			p216:_RemoveFX(p217, p218)
			if p218 then
				for _, v219 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v220 = v219:Clone()
					v220.Parent = p218
					v220:AddTag("Cleanup_Beanbound")
				end
			end
			for _, v221 in p217:GetDescendants() do
				if (v221:IsA("BasePart") or v221:IsA("UnionOperation")) and not v221:HasTag("Effect") then
					v_u_18[v221] = v_u_18[v221] or v221.Material
					v221.Material = Enum.Material.Neon
					v221.Reflectance = 0.05
					v221:AddTag("BeanboundVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p222, p223)
			-- upvalues: (copy) v_u_18
			if p223 then
				for _, v224 in p223:GetChildren() do
					if v224:HasTag("Cleanup_Beanbound") then
						v224:Destroy()
					end
				end
			end
			for _, v225 in p222:GetDescendants() do
				if (v225:IsA("BasePart") or v225:IsA("UnionOperation")) and v225:HasTag("BeanboundVisual") then
					v225.Reflectance = 0
					v225:RemoveTag("BeanboundVisual")
					if v_u_18[v225] then
						v225.Material = v_u_18[v225]
						v_u_18[v225] = nil
					end
				end
			end
		end
	},
	["Twisted"] = {
		["Id"] = "d",
		["Name"] = "Twisted",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(191, 191, 191),
		["_AddFX"] = function(p226, p227, p228)
			p226:_RemoveFX(p227, p228)
			if p228 then
				for _, v229 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v230 = v229:Clone()
					v230.Parent = p228
					v230:AddTag("Cleanup_Twisted")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p231)
			if p231 then
				for _, v232 in p231:GetChildren() do
					if v232:HasTag("Twisted") then
						v232:Destroy()
					end
				end
			end
		end
	},
	["Cloudtouched"] = {
		["Id"] = "e",
		["Name"] = "Cloudtouched",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(225, 255, 255),
		["_AddFX"] = function(p233, p234, p235)
			p233:_RemoveFX(p234, p235)
			if p235 then
				for _, v236 in game.ServerStorage.Mutation_FX.Cloudtouched:GetChildren() do
					local v237 = v236:Clone()
					v237.Parent = p235
					v237:AddTag("Cleanup_Cloudtouched")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p238)
			if p238 then
				for _, v239 in p238:GetChildren() do
					if v239:HasTag("Cleanup_Cloudtouched") then
						v239:Destroy()
					end
				end
			end
		end
	},
	["Voidtouched"] = {
		["Id"] = "f",
		["Name"] = "Voidtouched",
		["ValueMulti"] = 135,
		["Color"] = Color3.fromRGB(225, 0, 255),
		["_AddFX"] = function(p240, p241, p242)
			p240:_RemoveFX(p241, p242)
			if p242 then
				for _, v243 in game.ServerStorage.Mutation_FX.Voidtouched:GetChildren() do
					local v244 = v243:Clone()
					v244.Parent = p242
					v244:AddTag("Cleanup_Voidtouched")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p245)
			if p245 then
				for _, v246 in p245:GetChildren() do
					if v246:HasTag("Cleanup_Voidtouched") then
						v246:Destroy()
					end
				end
			end
		end
	},
	["Wet"] = {
		["Id"] = "g",
		["Name"] = "Wet",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(64, 164, 223),
		["_AddFX"] = function(p247, p248, p249)
			p247:_RemoveFX(p248, p249)
			if p249 then
				for _, v250 in game.ServerStorage.Mutation_FX.Wet:GetChildren() do
					local v251 = v250:Clone()
					v251.Parent = p249
					v251.Enabled = true
					v251:AddTag("Cleanup_Wet")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p252)
			if p252 then
				for _, v253 in p252:GetChildren() do
					if v253:HasTag("Cleanup_Wet") then
						v253:Destroy()
					end
				end
			end
		end
	},
	["Fried"] = {
		["Id"] = "h",
		["Name"] = "Fried",
		["ValueMulti"] = 8,
		["Color"] = Color3.fromRGB(223, 110, 34),
		["_AddFX"] = function(p254, p255, p256)
			p254:_RemoveFX(p255, p256)
			if p256 then
				for _, v257 in game.ServerStorage.Mutation_FX.Fried:GetChildren() do
					local v258 = v257:Clone()
					v258.Parent = p256
					v258.Enabled = true
					v258:AddTag("Cleanup_Fried")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p259)
			if p259 then
				for _, v260 in p259:GetChildren() do
					if v260:HasTag("Cleanup_Fried") then
						v260:Destroy()
					end
				end
			end
		end
	},
	["Molten"] = {
		["Id"] = "i",
		["Name"] = "Molten",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(223, 100, 0),
		["_AddFX"] = function(p261, p262, p263)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p261:_RemoveFX(p262, p263)
			local v264 = {
				"Neon orange",
				"Br. yellowish orange",
				"Bright orange",
				"Bright red",
				"Bright yellow"
			}
			for _, v265 in p262:GetDescendants() do
				if (v265:IsA("BasePart") or v265:IsA("UnionOperation")) and not v265:HasTag("Effect") then
					v_u_15[v265] = v_u_15[v265] or v265.BrickColor.Color
					v265.BrickColor = BrickColor.new(v264[Random.new():NextInteger(1, #v264)])
					v_u_18[v265] = v_u_18[v265] or v265.Material
					v265.Material = Enum.Material.Neon
					v265:AddTag("MoltenVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p266, _)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			for _, v267 in p266:GetDescendants() do
				if (v267:IsA("BasePart") or v267:IsA("UnionOperation")) and v267:HasTag("MoltenVisual") then
					v267.Reflectance = 0
					local v268
					if v_u_15[v267] then
						v268 = BrickColor.new(v_u_15[v267])
					else
						v268 = v267.BrickColor
					end
					v267.BrickColor = v268
					v_u_15[v267] = nil
					v267:RemoveTag("MoltenVisual")
					if v_u_18[v267] then
						v267.Material = v_u_18[v267]
						v_u_18[v267] = nil
					end
				end
			end
		end
	},
	["Vamp"] = {
		["Id"] = "Vam",
		["Name"] = "Vamp",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(139, 0, 0),
		["_AddFX"] = function(p269, p270, p271)
			-- upvalues: (copy) v_u_15
			p269:_RemoveFX(p270, p271)
			if p271 then
				for _, v272 in game.ServerStorage.Mutation_FX.Vamp:GetChildren() do
					if v272.Name == "CenterGlow" then
						local v273 = v272:Clone()
						v273.Parent = p271
						v273.Glow.Enabled = true
						if v273:FindFirstChild("Flapping") then
							v273.Flapping.PlaybackSpeed = math.random(7, 13) / 10
							v273.Flapping:Play()
						end
						local _, v274 = p270:GetBoundingBox()
						local v275 = v274.X
						local v276 = v274.Y
						local v277 = v274.Z
						local _ = math.max(v275, v276, v277) * 0.3
						local v278 = v273.Glow.Size
						local v279 = {}
						for _, v280 in ipairs(v278.Keypoints) do
							local v281 = NumberSequenceKeypoint.new
							local v282 = v280.Time
							local v283 = v280.Value * 0.3
							local v284 = v280.Envelope * 0.3
							table.insert(v279, v281(v282, v283, v284))
						end
						v273.Glow.Size = NumberSequence.new(v279)
					else
						local v285 = v272:Clone()
						v285.Parent = p271
						v285.Enabled = true
						v285:AddTag("Cleanup_Vamp")
					end
				end
			end
			for _, v286 in p270:GetDescendants() do
				if (v286:IsA("BasePart") or v286:IsA("UnionOperation")) and (not v286:HasTag("Effect") and v286.Transparency ~= 1) then
					v_u_15[v286] = v_u_15[v286] or v286.Color
					local v287 = Color3.new(0.545098, 0, 0)
					v286.Color = v286.Color:Lerp(v287, 0.4)
					v286:AddTag("VampVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p288, p289)
			-- upvalues: (copy) v_u_15
			if p289 then
				for _, v290 in p289:GetChildren() do
					if v290:HasTag("Cleanup_Vamp") then
						v290:Destroy()
					end
				end
			end
			for _, v291 in p288:GetDescendants() do
				if (v291:IsA("BasePart") or v291:IsA("UnionOperation")) and v291:HasTag("VampVisual") then
					v291:RemoveTag("VampVisual")
					v291.Color = v_u_15[v291] or v291.Color
					v_u_15[v291] = nil
					v291.Reflectance = 0
				end
			end
		end
	},
	["Moonbled"] = {
		["Id"] = "Mnb",
		["Name"] = "Moonbled",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(139, 139, 139),
		["_AddFX"] = function(p292, p293, p294)
			-- upvalues: (copy) v_u_15
			p292:_RemoveFX(p293, p294)
			if p294 then
				for _, v295 in game.ServerStorage.Mutation_FX.Moonbled:GetChildren() do
					if v295.Name == "CenterWave" then
						local v296 = v295:Clone()
						v296.Parent = p294
						v296.Wave.Enabled = true
						local _, v297 = p293:GetBoundingBox()
						local v298 = v297.X
						local v299 = v297.Y
						local v300 = v297.Z
						local _ = math.max(v298, v299, v300) * 0.3
						local v301 = v296.Wave.Size
						local v302 = {}
						for _, v303 in ipairs(v301.Keypoints) do
							local v304 = NumberSequenceKeypoint.new
							local v305 = v303.Time
							local v306 = v303.Value * 0.3
							local v307 = v303.Envelope * 0.3
							table.insert(v302, v304(v305, v306, v307))
						end
						v296.Wave.Size = NumberSequence.new(v302)
					else
						local v308 = v295:Clone()
						v308.Parent = p294
						v308.Enabled = true
						v308:AddTag("Cleanup_Moonbled")
					end
				end
			end
			for v309, v310 in p293:GetDescendants() do
				if v310:IsA("BasePart") or v310:IsA("UnionOperation") then
					if v309 % 3 == 0 then
						local v311 = game.ServerStorage.Mutation_FX.Moonbled.Fog:Clone()
						v311.Parent = v310
						v311.Enabled = true
						v311.Rate = math.random(8, 25) / 10
						v311:AddTag("Cleanup_Moonbled")
						local v312 = game.ServerStorage.Mutation_FX.Moonbled.Rays:Clone()
						v312.Parent = v310
						v312.Enabled = true
						v312.Rate = math.random(8, 25) / 10
						v312:AddTag("Cleanup_Moonbled")
					end
					if not v310:HasTag("Effect") and v310.Transparency ~= 1 then
						v_u_15[v310] = v_u_15[v310] or v310.Color
						local v313 = Color3.new(0.658824, 0.658824, 0.658824)
						v310.Color = v310.Color:Lerp(v313, 0.8)
						v310:AddTag("MoonbledVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p314, p315)
			-- upvalues: (copy) v_u_15
			if p315 then
				for _, v316 in p315:GetChildren() do
					if v316:HasTag("Cleanup_Moonbled") then
						v316:Destroy()
					end
				end
			end
			for _, v317 in p314:GetDescendants() do
				if (v317:IsA("BasePart") or v317:IsA("UnionOperation")) and v317:HasTag("MoonbledVisual") then
					v317:RemoveTag("MoonbledVisual")
					v317.Color = v_u_15[v317] or v317.Color
					v_u_15[v317] = nil
					v317.Reflectance = 0
				end
			end
		end
	},
	["Moist"] = {
		["Id"] = "Moi",
		["Name"] = "Moist",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(142, 161, 173),
		["_AddFX"] = function(p318, p319, p320)
			-- upvalues: (copy) v_u_15
			p318:_RemoveFX(p319, p320)
			if p320 then
				for _, v321 in game.ServerStorage.Mutation_FX.Moist:GetChildren() do
					local v322 = v321:Clone()
					v322.Parent = p320
					v322.Enabled = true
					v322:AddTag("Cleanup_Moist")
				end
			end
			for v323, v324 in p319:GetDescendants() do
				if v324:IsA("BasePart") or v324:IsA("UnionOperation") then
					if v323 % 3 == 0 then
						local v325 = game.ServerStorage.Mutation_FX.Moist.Drops:Clone()
						v325.Parent = v324
						v325.Enabled = true
						v325.Rate = math.random(5, 30) / 100
						v325:AddTag("Moist")
						local v326 = game.ServerStorage.Mutation_FX.Moist.Mist:Clone()
						v326.Parent = v324
						v326.Enabled = true
						v326.Rate = math.random(2, 8) / 10
						v326:AddTag("Moist")
					end
					if not v324:HasTag("Effect") and v324.Transparency ~= 1 then
						v_u_15[v324] = v_u_15[v324] or v324.Color
						local v327 = Color3.new(0, 0, 0)
						v324.Color = v324.Color:Lerp(v327, 0.2)
						v324:AddTag("MoistVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p328, p329)
			-- upvalues: (copy) v_u_15
			if p329 then
				for _, v330 in p329:GetChildren() do
					if v330:HasTag("Cleanup_Moist") then
						v330:Destroy()
					end
				end
			end
			for _, v331 in p328:GetDescendants() do
				if (v331:IsA("BasePart") or v331:IsA("UnionOperation")) and v331:HasTag("MoistVisual") then
					v331:RemoveTag("MoistVisual")
					v331.Color = v_u_15[v331] or v331.Color
					v_u_15[v331] = nil
					v331.Reflectance = 0
				end
			end
		end
	},
	["Crystalized"] = {
		["Id"] = "Cry",
		["Name"] = "Crystalized",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(255, 255, 255),
		["_AddFX"] = function(p332, p333, p334)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p332:_RemoveFX(p333, p334)
			if p334 then
				for _, v335 in game.ServerStorage.Mutation_FX.Crystalized:GetChildren() do
					local v336 = v335:Clone()
					v336.Parent = p334
					v336.Enabled = true
				end
			end
			for v337, v338 in p333:GetDescendants() do
				if v338:IsA("BasePart") or v338:IsA("UnionOperation") then
					if v337 % 4 == 0 then
						local v339 = game.ServerStorage.Mutation_FX.Crystalized.Aura:Clone()
						v339.Parent = v338
						v339.Enabled = true
						v339.Rate = math.random(8, 25) / 10
						v339:AddTag("Cleanup_Crystalized")
						local v340 = game.ServerStorage.Mutation_FX.Crystalized.Sparkle:Clone()
						v340.Parent = v338
						v340.Enabled = true
						v340.Rate = math.random(8, 25) / 10
						v340:AddTag("Cleanup_Crystalized")
					end
					if not v338:HasTag("Effect") and v338.Transparency ~= 1 then
						v_u_15[v338] = v_u_15[v338] or v338.Color
						v_u_18[v338] = v_u_18[v338] or v338.Material
						v338.Material = Enum.Material.Glass
						local v341 = Color3.new(1, 1, 1)
						v338.Color = v338.Color:Lerp(v341, 0.65)
						v338:AddTag("CrystalizedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p342, p343)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p343 then
				for _, v344 in p343:GetChildren() do
					if v344:HasTag("Cleanup_Crystalized") then
						v344:Destroy()
					end
				end
			end
			for _, v345 in p342:GetDescendants() do
				if (v345:IsA("BasePart") or v345:IsA("UnionOperation")) and v345:HasTag("CrystalizedVisual") then
					v345:RemoveTag("CrystalizedVisual")
					v345.Color = v_u_15[v345] or v345.Color
					v_u_15[v345] = nil
					v345.Material = v_u_18[v345] or v345.Material
					v_u_18[v345] = nil
					v345.Reflectance = 0
				end
			end
		end
	},
	["Alienated"] = {
		["Id"] = "Ali",
		["Name"] = "Alienated",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(55, 255, 0),
		["_AddFX"] = function(p346, p347, p348)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p346:_RemoveFX(p347, p348)
			if p348 then
				for _, v349 in game.ServerStorage.Mutation_FX.Alienated:GetChildren() do
					local v350 = v349:Clone()
					v350.Parent = p348
					v350.Enabled = true
				end
			end
			for v351, v352 in p347:GetDescendants() do
				if v352:IsA("BasePart") or v352:IsA("UnionOperation") then
					if v351 % 5 == 0 then
						local v353 = game.ServerStorage.Mutation_FX.Alienated.Aura:Clone()
						v353.Parent = v352
						v353.Enabled = true
						v353.Rate = math.random(8, 25) / 20
						v353:AddTag("Cleanup_Alienated")
						local v354 = game.ServerStorage.Mutation_FX.Alienated.Shines:Clone()
						v354.Parent = v352
						v354.Enabled = true
						v354.Rate = math.random(8, 25) / 30
						v354:AddTag("Cleanup_Alienated")
					end
					if not v352:HasTag("Effect") and v352.Transparency ~= 1 then
						v_u_15[v352] = v_u_15[v352] or v352.Color
						v_u_18[v352] = v_u_18[v352] or v352.Material
						v352.Material = Enum.Material.Neon
						local v355 = Color3.new(0, 1, 0.45098)
						v352.Color = v352.Color:Lerp(v355, 0.4)
						v352:AddTag("AlienatedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p356, p357)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p357 then
				for _, v358 in p357:GetChildren() do
					if v358:HasTag("Cleanup_Alienated") then
						v358:Destroy()
					end
				end
			end
			for _, v359 in p356:GetDescendants() do
				if (v359:IsA("BasePart") or v359:IsA("UnionOperation")) and v359:HasTag("AlienatedVisual") then
					v359:RemoveTag("AlienatedVisual")
					v359.Color = v_u_15[v359] or v359.Color
					v_u_15[v359] = nil
					v359.Material = v_u_18[v359] or v359.Material
					v_u_18[v359] = nil
					v359.Reflectance = 0
				end
			end
		end
	},
	["Brewed"] = {
		["Id"] = "Brw",
		["Name"] = "Brewed",
		["ValueMulti"] = 7,
		["Color"] = Color3.fromRGB(65, 203, 74),
		["_AddFX"] = function(p360, p361, p362)
			-- upvalues: (copy) v_u_15
			p360:_RemoveFX(p361, p362)
			if p362 then
				for _, v363 in game.ServerStorage.Mutation_FX.Brewed:GetChildren() do
					if v363.Name == "CenterWave" then
						local v364 = v363:Clone()
						v364.Parent = p362
						v364.Wave.Enabled = true
						local _, v365 = p361:GetBoundingBox()
						local v366 = v365.X
						local v367 = v365.Y
						local v368 = v365.Z
						local _ = math.max(v366, v367, v368) * 0.3
						local v369 = v364.Wave.Size
						local v370 = {}
						for _, v371 in ipairs(v369.Keypoints) do
							local v372 = NumberSequenceKeypoint.new
							local v373 = v371.Time
							local v374 = v371.Value * 0.3
							local v375 = v371.Envelope * 0.3
							table.insert(v370, v372(v373, v374, v375))
						end
						v364.Wave.Size = NumberSequence.new(v370)
					else
						local v376 = v363:Clone()
						v376.Parent = p362
						v376.Enabled = true
						v376:AddTag("Cleanup_Brewed")
					end
				end
			end
			for v377, v378 in p361:GetDescendants() do
				if v378:IsA("BasePart") or v378:IsA("UnionOperation") then
					if v377 % 3 == 0 then
						local v379 = game.ServerStorage.Mutation_FX.Brewed.Smoke:Clone()
						v379.Parent = v378
						v379.Enabled = true
						v379.Rate = math.random(8, 25) / 10
						v379:AddTag("Cleanup_Brewed")
						local v380 = game.ServerStorage.Mutation_FX.Brewed.Drip:Clone()
						v380.Parent = v378
						v380.Enabled = true
						v380.Rate = math.random(8, 25) / 10
						v380:AddTag("Cleanup_Brewed")
						local v381 = game.ServerStorage.Mutation_FX.Brewed.CenterWave.Wave:Clone()
						v381.Parent = v378
						v381.Enabled = true
						v381.Rate = math.random(8, 25) / 20
						v381:AddTag("Cleanup_Brewed")
					end
					if not v378:HasTag("Effect") and v378.Transparency ~= 1 then
						v_u_15[v378] = v_u_15[v378] or v378.Color
						local v382 = Color3.new(0.247059, 0.658824, 0.215686)
						v378.Color = v378.Color:Lerp(v382, 0.3)
						v378:AddTag("BrewedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p383, p384)
			-- upvalues: (copy) v_u_15
			if p384 then
				for _, v385 in p384:GetChildren() do
					if v385:HasTag("Cleanup_Brewed") then
						v385:Destroy()
					end
				end
			end
			for _, v386 in p383:GetDescendants() do
				if (v386:IsA("BasePart") or v386:IsA("UnionOperation")) and v386:HasTag("BrewedVisual") then
					v386:RemoveTag("BrewedVisual")
					v386.Color = v_u_15[v386] or v386.Color
					v_u_15[v386] = nil
					v386.Reflectance = 0
				end
			end
		end
	},
	["Ghostly"] = {
		["Id"] = "GH",
		["Name"] = "Ghostly",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(170, 255, 255),
		["_AddFX"] = function(p387, p388, p389)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p387:_RemoveFX(p388, p389)
			local v390 = game.ServerStorage.Mutation_FX.Ghostly:GetChildren()
			if p389 then
				for _, v391 in v390 do
					if v391:IsA("ParticleEmitter") or v391:IsA("Trail") then
						local v392 = v391:Clone()
						v392.Parent = p389
						v392.Enabled = true
						v392:AddTag("Cleanup_Ghostly")
					end
				end
			end
			local v393 = 0
			for _, v394 in p388:GetDescendants() do
				if v394:IsA("BasePart") and not v394:IsA("TrussPart") then
					v393 = v393 + 1
					v_u_15[v394] = v_u_15[v394] or v394.Color
					v_u_18[v394] = v_u_18[v394] or v394.Material
					v394.Material = Enum.Material.Glass
					v394.Color = Color3.fromRGB(200, 235, 255)
					if v394.Transparency ~= 1 then
						v394.Transparency = 0.35
						v394:SetAttribute("0Transparency", v394.Transparency)
					end
					v394:AddTag("GhostlyVisual")
					if v393 % 3 == 0 and #v390 > 0 then
						local v395 = v390[math.random(1, #v390)]
						if v395:IsA("ParticleEmitter") then
							local v396 = v395:Clone()
							v396.Parent = v394
							v396.Enabled = true
							v396:AddTag("Cleanup_Ghostly")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p397, p398)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v401(p399)
				for _, v400 in p399:GetDescendants() do
					if v400:HasTag("Cleanup_Ghostly") then
						v400:Destroy()
					end
				end
			end
			if p398 then
				v401(p398)
			end
			if p397 then
				v401(p397)
			end
			for _, v402 in p397:GetDescendants() do
				if v402:IsA("BasePart") and v402:HasTag("GhostlyVisual") then
					v402.Color = v_u_15[v402] or v402.Color
					v_u_15[v402] = nil
					v402.Material = v_u_18[v402] or v402.Material
					v_u_18[v402] = nil
					if v402:GetAttribute("0Transparency") then
						v402.Transparency = v402:GetAttribute("0Transparency")
					end
					v402:RemoveTag("GhostlyVisual")
				end
			end
		end
	},
	["Spooky"] = {
		["Id"] = "SK",
		["Name"] = "Spooky",
		["ValueMulti"] = 8,
		["Color"] = Color3.fromRGB(177, 177, 177),
		["_AddFX"] = function(p403, p404, p405)
			p403:_RemoveFX(p404, p405)
			local v406 = game.ServerStorage.Mutation_FX.Spooky:GetChildren()
			local v407 = 0
			for _, v408 in p404:GetDescendants() do
				if v408:IsA("BasePart") and v408 ~= p405 then
					v407 = v407 + 1
					if v407 % 2 == 0 then
						for _, v409 in v406 do
							if v409:IsA("ParticleEmitter") then
								local v410 = v409:Clone()
								v410.Parent = v408
								v410.Enabled = true
								v410:AddTag("Cleanup_Spooky")
							end
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p411, p412)
			local function v415(p413)
				for _, v414 in p413:GetDescendants() do
					if v414:HasTag("Cleanup_Spooky") then
						v414:Destroy()
					end
				end
			end
			if p412 then
				v415(p412)
			end
			if p411 then
				v415(p411)
			end
		end
	},
	["Volcanic"] = {
		["Id"] = "Bla",
		["Name"] = "Volcanic",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(255, 82, 24),
		["_AddFX"] = function(p416, p417, p418)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p416:_RemoveFX(p417, p418)
			local v419 = { Color3.fromRGB(229, 67, 13), Color3.fromRGB(225, 89, 26), Color3.fromRGB(234, 71, 39) }
			if p418 then
				for _, v420 in game.ServerStorage.Mutation_FX.Volcanic:GetChildren() do
					local v421 = v420:Clone()
					v421.Parent = p418
					v421.Enabled = true
					v421:AddTag("Cleanup_Volcanic")
				end
			end
			for v422, v423 in p417:GetDescendants() do
				if v423:IsA("BasePart") or v423:IsA("UnionOperation") then
					if v422 % 6 == 0 then
						local v424 = game.ServerStorage.Mutation_FX.Volcanic.Burst:Clone()
						v424.Parent = v423
						v424.Enabled = true
						v424.Rate = math.random(6, 12) / 10
						v424:AddTag("Cleanup_Volcanic")
						local v425 = game.ServerStorage.Mutation_FX.Volcanic.Glow:Clone()
						v425.Parent = v423
						v425.Enabled = true
						v425.Rate = math.random(9, 20) / 100
						v425:AddTag("Cleanup_Volcanic")
					end
					if not v423:HasTag("Effect") then
						v_u_15[v423] = v_u_15[v423] or v423.Color
						v423.Color = v419[Random.new():NextInteger(1, #v419)]
						v_u_18[v423] = v_u_18[v423] or v423.Material
						v423.Material = Enum.Material.Neon
						v423:AddTag("VolcanicVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p426, p427)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p427 then
				for _, v428 in p427:GetChildren() do
					if v428:HasTag("Cleanup_Volcanic") then
						v428:Destroy()
					end
				end
			end
			for _, v429 in p426:GetDescendants() do
				if v429:IsA("BasePart") or v429:IsA("UnionOperation") then
					if v429:HasTag("VolcanicVisual") then
						v429.Reflectance = 0
						local v430
						if v_u_15[v429] then
							v430 = BrickColor.new(v_u_15[v429])
						else
							v430 = v429.BrickColor
						end
						v429.BrickColor = v430
						v_u_15[v429] = nil
						v429:RemoveTag("VolcanicVisual")
						if v_u_18[v429] then
							v429.Material = v_u_18[v429]
							v_u_18[v429] = nil
						end
					elseif v429:HasTag("Cleanup_Volcanic") then
						v429:Destroy()
					end
				end
			end
		end
	},
	["Sliced"] = {
		["Id"] = "Sl",
		["Name"] = "Sliced",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(223, 223, 223),
		["_AddFX"] = function(_, p431, _)
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			for _, v432 in p431:GetDescendants() do
				if (v432:IsA("BasePart") or v432:IsA("UnionOperation")) and not v432:HasTag("SlicedVisual") then
					v_u_17[v432] = v_u_17[v432] or v432.Orientation
					v_u_16[v432] = v_u_16[v432] or v432.Position
					local v433 = p431.Item_Seed.Value
					local v434 = Random.new(v433)
					local v435 = v_u_17[v432]
					local v436 = v435.X + v434:NextNumber(-8, 8)
					local v437 = v435.Y + v434:NextNumber(-8, 8)
					local v438 = v435.Z + v434:NextNumber(-8, 8)
					v432.Orientation = Vector3.new(v436, v437, v438)
					local v439 = v432.Size.X
					local v440 = v434:NextNumber(-v439, v439) * 0.25
					local v441 = v434:NextNumber(-v439, v439) * 0.25
					local v442 = v434:NextNumber(-v439, v439) * 0.25
					local v443 = v_u_16[v432]
					local v444 = math.clamp(v440, 0, 1)
					local v445 = math.clamp(v441, 0, 1)
					local v446 = math.clamp(v442, 0, 1)
					v432.Position = v443 + Vector3.new(v444, v445, v446)
					v432:AddTag("SlicedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p447, _)
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			for _, v448 in p447:GetDescendants() do
				if (v448:IsA("BasePart") or v448:IsA("UnionOperation")) and v448:HasTag("SlicedVisual") then
					local v449
					if v_u_17[v448] then
						v449 = v_u_17[v448]
					else
						v449 = v448.Orientation
					end
					v448.Orientation = v449
					local v450
					if v_u_16[v448] then
						v450 = v_u_16[v448]
					else
						v450 = v448.Position
					end
					v448.Position = v450
					v448:RemoveTag("SlicedVisual")
				end
			end
		end
	},
	["Severed"] = {
		["Id"] = "Se",
		["Name"] = "Severed",
		["ValueMulti"] = 40,
		["Color"] = Color3.fromRGB(186, 211, 223),
		["_AddFX"] = function(_, p451, _)
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			local v452 = Random.new(p451.Item_Seed.Value)
			local v453 = {}
			for _, v454 in p451:GetDescendants() do
				if (v454:IsA("BasePart") or v454:IsA("UnionOperation")) and not v454:HasTag("SeveredVisual") then
					v_u_17[v454] = v_u_17[v454] or v454.Orientation
					v_u_16[v454] = v_u_16[v454] or v454.Position
					table.insert(v453, v454)
				end
			end
			table.sort(v453, function(p455, p456)
				-- upvalues: (ref) v_u_16
				return v_u_16[p455].Y < v_u_16[p456].Y
			end)
			local v457 = 0
			for _, v458 in ipairs(v453) do
				v457 = v457 + v458.Size.Y
			end
			local v459 = (#v453 > 0 and (v457 / #v453 or 1) or 1) * 0.25
			local v460 = math.max(0.05, v459)
			local v461 = (#v453 - 1) / 2
			for v462, v463 in ipairs(v453) do
				local v464 = v_u_17[v463]
				local v465 = v464.X + v452:NextNumber(-8, 8)
				local v466 = v464.Y + v452:NextNumber(-8, 8)
				local v467 = v464.Z + v452:NextNumber(-8, 8)
				v463.Orientation = Vector3.new(v465, v466, v467)
				local v468 = v463.Size.X
				local v469 = v452:NextNumber(-v468, v468) * 0.25
				local v470 = math.clamp(v469, -1, 1)
				local v471 = v452:NextNumber(-v468, v468) * 0.25
				local v472 = math.clamp(v471, -1, 1)
				local v473 = (v462 - v461) * v460
				v463.Position = v_u_16[v463] + Vector3.new(v470, v473, v472)
				v463:AddTag("SeveredVisual")
			end
		end,
		["_RemoveFX"] = function(_, p474, _)
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			for _, v475 in p474:GetDescendants() do
				if (v475:IsA("BasePart") or v475:IsA("UnionOperation")) and v475:HasTag("SeveredVisual") then
					local v476 = v_u_17[v475]
					local v477 = v_u_16[v475]
					if v476 then
						v475.Orientation = v476
					end
					if v477 then
						v475.Position = v477
					end
					v475:RemoveTag("SeveredVisual")
				end
			end
		end
	},
	["Slashbound"] = {
		["Id"] = "SB",
		["Name"] = "Slashbound",
		["ValueMulti"] = 95,
		["Color"] = Color3.fromRGB(200, 210, 220),
		["_AddFX"] = function(_, p478, _)
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			local v479 = Random.new(p478.Item_Seed.Value)
			local v480 = {}
			for _, v481 in p478:GetDescendants() do
				if (v481:IsA("BasePart") or v481:IsA("UnionOperation")) and not v481:HasTag("SlashboundVisual") then
					v_u_17[v481] = v_u_17[v481] or v481.Orientation
					v_u_16[v481] = v_u_16[v481] or v481.Position
					table.insert(v480, v481)
				end
			end
			table.sort(v480, function(p482, p483)
				-- upvalues: (ref) v_u_16
				return v_u_16[p482].Y < v_u_16[p483].Y
			end)
			local v484 = 0
			for _, v485 in ipairs(v480) do
				v484 = v484 + v485.Size.Y
			end
			local v486 = (#v480 > 0 and (v484 / #v480 or 1) or 1) * 0.25
			local v487 = math.max(0.05, v486)
			local v488 = (#v480 - 1) / 2
			for v489, v490 in ipairs(v480) do
				local v491 = v_u_17[v490]
				local v492 = v490.Size.X
				local v493 = v479:NextNumber(-v492, v492) * 0.25
				local v494 = math.clamp(v493, -1, 1)
				local v495 = v479:NextNumber(-v492, v492) * 0.25
				local v496 = math.clamp(v495, -1, 1)
				local v497 = (v489 - v488) * v487
				local v498 = v491.X + v479:NextNumber(-8, 8)
				local v499 = v491.Y + v479:NextNumber(-8, 8)
				local v500 = v491.Z + v479:NextNumber(-8, 8)
				v490.Orientation = Vector3.new(v498, v499, v500)
				v490.Position = v_u_16[v490] + Vector3.new(v494, v497, v496)
				v490:AddTag("SlashboundVisual")
			end
		end,
		["_RemoveFX"] = function(_, p501, _)
			-- upvalues: (copy) v_u_17, (copy) v_u_16
			for _, v502 in p501:GetDescendants() do
				if (v502:IsA("BasePart") or v502:IsA("UnionOperation")) and v502:HasTag("SlashboundVisual") then
					v502.Orientation = v_u_17[v502] or v502.Orientation
					v502.Position = v_u_16[v502] or v502.Position
					v502:RemoveTag("SlashboundVisual")
				end
			end
		end
	},
	["Alienlike"] = {
		["Id"] = "j",
		["Name"] = "Alienlike",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(0, 223, 197),
		["_AddFX"] = function(p503, p504, p505)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p503:_RemoveFX(p504, p505)
			if p505 then
				for _, v506 in game.ServerStorage.Mutation_FX.Alienlike:GetChildren() do
					local v507 = v506:Clone()
					v507.Parent = p505
					v507.Enabled = true
					v507:AddTag("Cleanup_Alienlike")
				end
			end
			for _, v508 in p504:GetDescendants() do
				if (v508:IsA("BasePart") or v508:IsA("UnionOperation")) and not v508:HasTag("Effect") then
					v_u_15[v508] = v_u_15[v508] or v508.Color
					v508.Color = Color3.fromRGB(0, 255, 217)
					if Random.new():NextInteger(1, 2) == 1 then
						v_u_18[v508] = v_u_18[v508] or v508.Material
						v508.Material = Enum.Material.ForceField
					end
					v508:AddTag("AlienlikeVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p509, p510)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p510 then
				for _, v511 in p510:GetChildren() do
					if v511:HasTag("Cleanup_Alienlike") then
						v511:Destroy()
					end
				end
			end
			for _, v512 in p509:GetDescendants() do
				if (v512:IsA("BasePart") or v512:IsA("UnionOperation")) and v512:HasTag("AlienlikeVisual") then
					v512.Reflectance = 0
					v512.Color = v_u_15[v512] or v512.Color
					v_u_15[v512] = nil
					v512:RemoveTag("AlienlikeVisual")
					if v_u_18[v512] then
						v512.Material = v_u_18[v512]
						v_u_18[v512] = nil
					end
				end
			end
		end
	},
	["Galactic"] = {
		["Id"] = "k",
		["Name"] = "Galactic",
		["ValueMulti"] = 120,
		["Color"] = Color3.fromRGB(243, 148, 255),
		["_AddFX"] = function(p513, p514, p515)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p513:_RemoveFX(p514, p515)
			if p515 then
				for _, v516 in game.ServerStorage.Mutation_FX.Galactic:GetChildren() do
					local v517 = v516:Clone()
					v517.Parent = p515
					v517.Enabled = true
					v517:AddTag("Cleanup_Galactic")
				end
			end
			for _, v518 in p514:GetDescendants() do
				if (v518:IsA("BasePart") or v518:IsA("UnionOperation")) and not v518:HasTag("Effect") then
					v_u_15[v518] = v_u_15[v518] or v518.Color
					v518.Color = Color3.fromRGB(226, 152, 255)
					if Random.new():NextInteger(1, 2) == 1 then
						v_u_18[v518] = v_u_18[v518] or v518.Material
						v518.Material = Enum.Material.Neon
					end
					v518:AddTag("GalacticVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p519, p520)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p520 then
				for _, v521 in p520:GetChildren() do
					if v521:HasTag("Cleanup_Galactic") then
						v521:Destroy()
					end
				end
			end
			for _, v522 in p519:GetDescendants() do
				if (v522:IsA("BasePart") or v522:IsA("UnionOperation")) and v522:HasTag("GalacticVisual") then
					v522.Reflectance = 0
					v522.Color = v_u_15[v522] or v522.Color
					v_u_15[v522] = nil
					v522:RemoveTag("GalacticVisual")
					if v_u_18[v522] then
						v522.Material = v_u_18[v522]
						v_u_18[v522] = nil
					end
				end
			end
		end
	},
	["Drenched"] = {
		["Id"] = "dr",
		["Name"] = "Drenched",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(0, 55, 228),
		["_AddFX"] = function(p523, p524, p525)
			-- upvalues: (copy) v_u_15
			p523:_RemoveFX(p524, p525)
			if p525 then
				for _, v526 in game.ServerStorage.Mutation_FX.Drenched:GetChildren() do
					local v527 = v526:Clone()
					v527.Parent = p525
					v527.Enabled = true
					v527:AddTag("Cleanup_Drenched")
				end
			end
			for _, v528 in p524:GetChildren() do
				if v528:IsA("BasePart") or v528:IsA("UnionOperation") then
					v_u_15[v528] = v_u_15[v528] or v528.Color
					local v529, v530, v531 = v528.Color:ToHSV()
					local v532 = v530 + 0.1
					local v533 = math.clamp(v532, v530, 1)
					local v534 = v531 + 0.05
					local v535 = math.clamp(v534, v531, 1)
					v528.Color = Color3.fromHSV(v529, v533, v535)
				end
			end
		end,
		["_RemoveFX"] = function(_, p536, p537)
			-- upvalues: (copy) v_u_15, (copy) v_u_18, (copy) v_u_19
			if p537 then
				for _, v538 in p537:GetChildren() do
					if v538:HasTag("Cleanup_Drenched") then
						v538:Destroy()
					end
				end
			end
			for _, v539 in p536:GetChildren() do
				if v539:IsA("BasePart") or v539:IsA("UnionOperation") then
					v539.Color = v_u_15[v539] or v539.Color
					v_u_15[v539] = nil
					if v_u_18[v539] then
						v539.Material = v_u_18[v539]
						v_u_18[v539] = nil
					end
					if v_u_19[v539] then
						v539.MaterialVariant = v_u_19[v539]
						v_u_19[v539] = nil
					end
				end
			end
		end
	},
	["Aurora"] = {
		["Id"] = "l",
		["Name"] = "Aurora",
		["ValueMulti"] = 90,
		["Color"] = Color3.fromRGB(99, 89, 175),
		["_AddFX"] = function(p540, p541, p542)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p540:_RemoveFX(p541, p542)
			for v543, v544 in p541:GetDescendants() do
				if v544:IsA("BasePart") or v544:IsA("UnionOperation") then
					if v543 % 5 == 0 then
						local v545 = game.ServerStorage.Mutation_FX.Aurora.Light:Clone()
						v545.Parent = v544
						v545.Enabled = true
						v545:AddTag("Cleanup_Aurora")
					end
					if not v544:HasTag("Effect") then
						local v546 = Random.new():NextInteger(1, 3)
						v_u_15[v544] = v_u_15[v544] or v544.Color
						if v546 == 1 then
							v544.Color = Color3.fromRGB(150, 92, 186)
						elseif v546 == 2 then
							v544.Color = Color3.fromRGB(87, 91, 171)
						elseif v546 == 3 then
							v544.Color = Color3.fromRGB(76, 156, 165)
						end
						v_u_18[v544] = v_u_18[v544] or v544.Material
						v544.Material = Enum.Material.Neon
						v544:AddTag("AuroraVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p547, p548)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p548 then
				for _, v549 in p548:GetChildren() do
					if v549:HasTag("Cleanup_Aurora") then
						v549:Destroy()
					end
				end
			end
			for _, v550 in p547:GetDescendants() do
				if (v550:IsA("BasePart") or v550:IsA("UnionOperation")) and v550:HasTag("GalacticVisual") then
					v550.Reflectance = 0
					v550.Color = v_u_15[v550] or v550.Color
					v_u_15[v550] = nil
					v550:RemoveTag("AuroraVisual")
					if v_u_18[v550] then
						v550.Material = v_u_18[v550]
						v_u_18[v550] = nil
					end
				end
			end
		end
	},
	["Chilled"] = {
		["Id"] = "m",
		["Name"] = "Chilled",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(135, 206, 250),
		["_AddFX"] = function(p551, p552, p553)
			p551:_RemoveFX(p552, p553)
			if p553 then
				for _, v554 in game.ServerStorage.Mutation_FX.Chilled:GetChildren() do
					local v555 = v554:Clone()
					v555.Parent = p553
					v555.Enabled = true
					v555:AddTag("Cleanup_Chilled")
				end
			end
			for _, v556 in p552:GetChildren() do
				if v556:IsA("BasePart") or v556:IsA("UnionOperation") then
					v556.Reflectance = 0.1
				end
			end
		end,
		["_RemoveFX"] = function(_, p557, p558)
			if p558 then
				for _, v559 in p558:GetChildren() do
					if v559:HasTag("Cleanup_Chilled") then
						v559:Destroy()
					end
				end
			end
			for _, v560 in p557:GetChildren() do
				if v560:IsA("BasePart") or v560:IsA("UnionOperation") then
					v560.Reflectance = 0
				end
			end
		end
	},
	["Sundried"] = {
		["Id"] = "n",
		["Name"] = "Sundried",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(207, 93, 0),
		["_AddFX"] = function(p561, p562, p563)
			-- upvalues: (copy) v_u_15
			p561:_RemoveFX(p562, p563)
			for _, v564 in p562:GetChildren() do
				if v564:IsA("BasePart") or v564:IsA("UnionOperation") then
					v_u_15[v564] = v_u_15[v564] or v564.Color
					v564.Color = Color3.fromRGB(v564.Color.R * 178.5, v564.Color.G * 127.5, v564.Color.B * 127.5)
				end
			end
		end,
		["_RemoveFX"] = function(_, p565, _)
			-- upvalues: (copy) v_u_15
			for _, v566 in p565:GetChildren() do
				if v566:IsA("BasePart") or v566:IsA("UnionOperation") then
					v566.Color = v_u_15[v566] or v566.Color
					v_u_15[v566] = nil
				end
			end
		end
	},
	["Wiltproof"] = {
		["Id"] = "o",
		["Name"] = "Wiltproof",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(0, 222, 155),
		["_AddFX"] = function(p567, p568, p569)
			-- upvalues: (copy) v_u_15
			p567:_RemoveFX(p568, p569)
			for _, v570 in p568:GetChildren() do
				if v570:IsA("BasePart") or v570:IsA("UnionOperation") then
					v_u_15[v570] = v_u_15[v570] or v570.Color
					local v571 = v570.Color
					local v572 = v571.R * 0.3 + v571.G * 0.59 + v571.B * 0.11
					local v573 = Color3.new
					local v574 = v572 + (v571.R - v572) * 3
					local v575 = math.clamp(v574, 0, 1)
					local v576 = v572 + (v571.G - v572) * 4
					local v577 = math.clamp(v576, 0, 1)
					local v578 = v572 + (v571.B - v572) * 3
					v570.Color = v573(v575, v577, (math.clamp(v578, 0, 1)))
				end
			end
		end,
		["_RemoveFX"] = function(_, p579, _)
			-- upvalues: (copy) v_u_15, (copy) v_u_18, (copy) v_u_19
			for _, v580 in p579:GetChildren() do
				if v580:IsA("BasePart") or v580:IsA("UnionOperation") then
					v580.Color = v_u_15[v580] or v580.Color
					v_u_15[v580] = nil
					if v_u_18[v580] then
						v580.Material = v_u_18[v580]
						v_u_18[v580] = nil
					end
					if v_u_19[v580] then
						v580.MaterialVariant = v_u_19[v580]
						v_u_19[v580] = nil
					end
				end
			end
		end
	},
	["Verdant"] = {
		["Id"] = "q",
		["Name"] = "Verdant",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(34, 139, 34),
		["_AddFX"] = function(p581, p582, p583)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p581:_RemoveFX(p582, p583)
			if p583 then
				for _, v584 in game.ServerStorage.Mutation_FX.Verdant:GetChildren() do
					local v585 = v584:Clone()
					v585.Parent = p583
					v585.Enabled = true
					v585:AddTag("Cleanup_Verdant")
				end
			end
			for v586, v587 in p582:GetDescendants() do
				if v587:IsA("BasePart") or v587:IsA("UnionOperation") then
					if v586 % 6 == 0 then
						local v588 = game.ServerStorage.Mutation_FX.Verdant.LeafSwirl:Clone()
						v588.Parent = v587
						v588.Enabled = true
						v588:AddTag("Cleanup_Verdant")
					end
					if not v587:HasTag("Effect") then
						local v589 = v587.Color
						v_u_15[v587] = v_u_15[v587] or v587.Color
						v_u_18[v587] = v_u_18[v587] or v587.Material
						local v590 = Color3.fromRGB
						local v591 = v589.R * 166 * 0.5
						local v592 = v589.G * 255 + 150
						v587.Color = v590(v591, math.clamp(v592, 0, 255) * 0.5, v589.B * 166 * 0.5)
						v587:AddTag("VerdantVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p593, p594)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p594 then
				for _, v595 in p594:GetChildren() do
					if v595:HasTag("Cleanup_Verdant") then
						v595:Destroy()
					end
				end
			end
			for _, v596 in p593:GetDescendants() do
				if (v596:IsA("BasePart") or v596:IsA("UnionOperation")) and v596:HasTag("VerdantVisual") then
					v596:RemoveTag("VerdantVisual")
					v596.Color = v_u_15[v596] or v596.Color
					v_u_15[v596] = nil
					if v_u_18[v596] then
						v596.Material = v_u_18[v596]
						v_u_18[v596] = nil
					end
					v596.Reflectance = 0
				end
			end
		end
	},
	["Paradisal"] = {
		["Id"] = "r",
		["Name"] = "Paradisal",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(176, 240, 0),
		["_AddFX"] = function(p597, p598, p599)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p597:_RemoveFX(p598, p599)
			if p599 then
				for _, v600 in game.ServerStorage.Mutation_FX.Paradisal:GetChildren() do
					local v601 = v600:Clone()
					v601.Parent = p599
					v601.Enabled = true
					v601:AddTag("Cleanup_Paradisal")
				end
			end
			for v602, v603 in p598:GetDescendants() do
				if v603:IsA("BasePart") or v603:IsA("UnionOperation") then
					if v602 % 6 == 0 then
						local v604 = game.ServerStorage.Mutation_FX.Paradisal.Rays:Clone()
						v604.Parent = v603
						v604.Enabled = true
						v604:AddTag("Cleanup_Paradisal")
					end
					if not v603:HasTag("Effect") then
						v_u_15[v603] = v_u_15[v603] or v603.Color
						v_u_18[v603] = v_u_18[v603] or v603.Material
						v603.Color = Color3.fromRGB(176, 240, 0)
						v603:AddTag("ParadisalVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p605, p606)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p606 then
				for _, v607 in p606:GetChildren() do
					if v607:HasTag("Cleanup_Paradisal") then
						v607:Destroy()
					end
				end
			end
			for _, v608 in p605:GetDescendants() do
				if (v608:IsA("BasePart") or v608:IsA("UnionOperation")) and v608:HasTag("ParadisalVisual") then
					v608:RemoveTag("ParadisalVisual")
					v608.Color = v_u_15[v608] or v608.Color
					v_u_15[v608] = nil
					if v_u_18[v608] then
						v608.Material = v_u_18[v608]
						v_u_18[v608] = nil
					end
					v608.Reflectance = 0
				end
			end
		end
	},
	["Glitched"] = {
		["Id"] = "gli",
		["Name"] = "Glitched",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(240, 96, 228),
		["_AddFX"] = function(p609, p610, p611)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p609:_RemoveFX(p610, p611)
			if p611 then
				for _, v612 in game.ServerStorage.Mutation_FX.Glitched:GetChildren() do
					local v613 = v612:Clone()
					v613.Parent = p611
					v613.Enabled = true
					v613:AddTag("Cleanup_Glitched")
				end
			end
			local v614 = {
				Color3.fromRGB(240, 96, 228),
				Color3.fromRGB(79, 237, 240),
				Color3.fromRGB(84, 240, 67),
				Color3.fromRGB(217, 217, 217),
				Color3.fromRGB(39, 39, 255)
			}
			for v615, v616 in p610:GetDescendants() do
				if v616:IsA("BasePart") or v616:IsA("UnionOperation") then
					if v615 % 6 == 0 then
						local v617 = game.ServerStorage.Mutation_FX.Glitched.Glitchy:Clone()
						v617.Parent = v616
						v617.Enabled = true
						v617.Rate = math.random(12, 35) / 10
						v617:AddTag("Cleanup_Glitched")
					end
					if not v616:HasTag("Effect") then
						v_u_15[v616] = v_u_15[v616] or v616.Color
						v_u_18[v616] = v_u_18[v616] or v616.Material
						v616.Color = v614[math.random(1, #v614)]
						v616.Material = "ForceField"
						v616:AddTag("GlitchedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p618, p619)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p619 then
				for _, v620 in p619:GetChildren() do
					if v620:HasTag("Cleanup_Glitched") then
						v620:Destroy()
					end
				end
			end
			for _, v621 in p618:GetDescendants() do
				if (v621:IsA("BasePart") or v621:IsA("UnionOperation")) and v621:HasTag("GlitchedVisual") then
					v621:RemoveTag("GlitchedVisual")
					v621.Color = v_u_15[v621] or v621.Color
					v_u_15[v621] = nil
					if v_u_18[v621] then
						v621.Material = v_u_18[v621]
						v_u_18[v621] = nil
					end
					v621.Reflectance = 0
				end
			end
		end
	},
	["Gilded"] = {
		["Id"] = "Gil",
		["Name"] = "Gilded",
		["ValueMulti"] = 15,
		["Color"] = Color3.fromRGB(255, 206, 58),
		["_AddFX"] = function(p622, p623, p624)
			-- upvalues: (copy) v_u_18
			p622:_RemoveFX(p623, p624)
			if p624 then
				for _, v625 in game.ServerStorage.Mutation_FX.Gilded:GetChildren() do
					if v625.Name ~= "Decals" then
						local v626 = v625:Clone()
						v626.Parent = p624
						v626.Enabled = true
						for _, v627 in game.ServerStorage.Mutation_FX.Gilded.Decals:GetChildren() do
							local v628 = v627:Clone()
							v628:AddTag("Cleanup_Gilded")
							v628.Parent = p624
						end
						v626:AddTag("Cleanup_Gilded")
					end
				end
			end
			for v629, v630 in p623:GetDescendants() do
				if v630:IsA("BasePart") or v630:IsA("UnionOperation") then
					if v629 % 6 == 0 then
						local v631 = game.ServerStorage.Mutation_FX.Gilded.Sparkle:Clone()
						v631.Parent = v630
						v631.Enabled = true
						v631.Rate = math.random(8, 25) / 10
						v631:AddTag("Cleanup_Gilded")
					end
					if not v630:HasTag("Effect") then
						v_u_18[v630] = v_u_18[v630] or v630.Material
						if v630.Transparency ~= 1 then
							v630.Material = "Metal"
							for _, v632 in game.ServerStorage.Mutation_FX.Gilded.Decals:GetChildren() do
								local v633 = v632:Clone()
								v633:AddTag("GildedDecal")
								v633.Parent = v630
							end
							v630:AddTag("GildedVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p634, p635)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p635 then
				for _, v636 in p635:GetChildren() do
					if v636:HasTag("Cleanup_Gilded") then
						v636:Destroy()
					end
				end
			end
			for _, v637 in p634:GetDescendants() do
				if v637:IsA("BasePart") or v637:IsA("UnionOperation") then
					if v637:HasTag("GildedVisual") then
						v637:RemoveTag("GildedVisual")
						v637.Color = v_u_15[v637] or v637.Color
						v_u_15[v637] = nil
						if v_u_18[v637] then
							v637.Material = v_u_18[v637]
							v_u_18[v637] = nil
						end
						v637.Reflectance = 0
					elseif v637:HasTag("GildedDecal") then
						v637:Destroy()
					end
				end
			end
		end
	},
	["Glimmering"] = {
		["Id"] = "glm",
		["Name"] = "Glimmering",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(255, 135, 245),
		["_AddFX"] = function(p638, p639, p640)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p638:_RemoveFX(p639, p640)
			if p640 then
				for _, v641 in game.ServerStorage.Mutation_FX.Glimmering:GetChildren() do
					local v642 = v641:Clone()
					v642.Parent = p640
					v642.Enabled = true
					v642:AddTag("Cleanup_Glimmering")
				end
			end
			local v643 = { Color3.fromRGB(246, 142, 255), Color3.fromRGB(176, 130, 255), Color3.fromRGB(255, 80, 238) }
			for v644, v645 in p639:GetDescendants() do
				if v645:IsA("BasePart") or v645:IsA("UnionOperation") then
					if v644 % 6 == 0 then
						local v646 = game.ServerStorage.Mutation_FX.Glimmering.Sparkle:Clone()
						v646.Parent = v645
						v646.Enabled = true
						v646.Rate = math.random(8, 25) / 10
						v646:AddTag("Cleanup_Glimmering")
						local v647 = Instance.new("Attachment", v645)
						v647:AddTag("Cleanup_Glimmering")
						local v648 = Instance.new("Attachment", v645)
						v648:AddTag("Cleanup_Glimmering")
						v647.Position = Vector3.new(0, 0.1, 0)
						v648.Position = Vector3.new(0, -0.1, 0)
						local v649 = Instance.new("Trail")
						v649.Color = ColorSequence.new(v643[2])
						v649.LightInfluence = 0
						v649.Brightness = 3
						v649.Attachment0 = v647
						v649.Attachment1 = v648
						v649.Lifetime = 0.3
						v649.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v649.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v649.Parent = v645
						v649:AddTag("Cleanup_Glimmering")
					end
					if not v645:HasTag("Effect") then
						v_u_15[v645] = v_u_15[v645] or v645.Color
						v_u_18[v645] = v_u_18[v645] or v645.Material
						if v645.Transparency ~= 1 then
							v645.Color = v643[math.random(1, #v643)]
							v645.Material = "Neon"
							v645:SetAttribute("OTransparency", v645.Transparency)
							v645.Transparency = 0.5
							v645:AddTag("GlimmeringVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p650, p651)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p651 then
				for _, v652 in p651:GetChildren() do
					if v652:HasTag("Cleanup_Glimmering") then
						v652:Destroy()
					end
				end
			end
			for _, v653 in p650:GetDescendants() do
				if (v653:IsA("BasePart") or v653:IsA("UnionOperation")) and v653:HasTag("GlimmeringVisual") then
					v653:RemoveTag("GlimmeringVisual")
					v653.Color = v_u_15[v653] or v653.Color
					v_u_15[v653] = nil
					v653.Transparency = v653:GetAttribute("OTransparency") or 0
					if v_u_18[v653] then
						v653.Material = v_u_18[v653]
						v_u_18[v653] = nil
					end
					v653.Reflectance = 0
				end
			end
		end
	},
	["Luminous"] = {
		["Id"] = "lum",
		["Name"] = "Luminous",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(85, 170, 255),
		["_AddFX"] = function(p654, p655, p656)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p654:_RemoveFX(p655, p656)
			local v657 = game.ServerStorage.Mutation_FX.Luminous:GetChildren()
			local v658 = {
				Color3.fromRGB(255, 160, 255),
				Color3.fromRGB(255, 128, 255),
				Color3.fromRGB(255, 105, 240),
				Color3.fromRGB(255, 100, 200)
			}
			if p656 then
				for _, v659 in v657 do
					local v660 = v659:Clone()
					v660.Parent = p656
					v660.Enabled = true
					v660:AddTag("Cleanup_Luminous")
				end
			end
			local v661 = 0
			for _, v662 in p655:GetDescendants() do
				if v662:IsA("BasePart") or v662:IsA("UnionOperation") then
					v661 = v661 + 1
					if not v662:HasTag("Effect") then
						v_u_15[v662] = v_u_15[v662] or v662.Color
						v_u_18[v662] = v_u_18[v662] or v662.Material
						if v662.Transparency ~= 1 then
							v662.Color = v658[math.random(1, #v658)]
							v662.Material = Enum.Material.Neon
							v662:SetAttribute("OTransparency", v662.Transparency)
							v662.Transparency = 0.5
							v662:AddTag("LuminousVisual")
						end
					end
					if v661 % 2 == 0 and #v657 > 0 then
						local v663 = v657[math.random(1, #v657)]:Clone()
						v663.Parent = v662
						v663.Enabled = true
						v663:AddTag("Cleanup_Luminous")
					end
					if v661 % 2 == 0 then
						local v664 = game.ServerStorage.Mutation_FX.Luminous:FindFirstChild("Sparkle")
						if v664 then
							local v665 = v664:Clone()
							v665.Parent = v662
							v665.Enabled = true
							v665.Rate = math.random(8, 25) / 10
							v665:AddTag("Cleanup_Luminous")
						end
						local v666 = Instance.new("Attachment", v662)
						v666:AddTag("Cleanup_Luminous")
						local v667 = Instance.new("Attachment", v662)
						v667:AddTag("Cleanup_Luminous")
						v666.Position = Vector3.new(0, 0.1, 0)
						v667.Position = Vector3.new(0, -0.1, 0)
						local v668 = Instance.new("Trail")
						v668.Color = ColorSequence.new(Color3.fromRGB(255, 150, 255))
						v668.LightInfluence = 0
						v668.Brightness = 3
						v668.Attachment0 = v666
						v668.Attachment1 = v667
						v668.Lifetime = 0.3
						v668.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v668.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.5), NumberSequenceKeypoint.new(1, 0) })
						v668.Parent = v662
						v668:AddTag("Cleanup_Luminous")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p669, p670)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v673(p671)
				-- upvalues: (ref) v_u_15, (ref) v_u_18
				for _, v672 in p671:GetDescendants() do
					if v672:HasTag("Cleanup_Luminous") then
						v672:Destroy()
					end
					if v672:HasTag("LuminousVisual") then
						v672:RemoveTag("LuminousVisual")
						v672.Color = v_u_15[v672] or v672.Color
						v_u_15[v672] = nil
						v672.Transparency = v672:GetAttribute("OTransparency") or 0
						if v_u_18[v672] then
							v672.Material = v_u_18[v672]
							v_u_18[v672] = nil
						end
					end
				end
			end
			if p670 then
				v673(p670)
			end
			if p669 then
				v673(p669)
			end
		end
	},
	["Cracked"] = {
		["Id"] = "CRA",
		["Name"] = "Cracked",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(138, 127, 114),
		["_AddFX"] = function(p674, p675, p676)
			p674:_RemoveFX(p675, p676)
			local v677 = 0
			for _, v678 in p675:GetDescendants() do
				if (v678:IsA("BasePart") or v678:IsA("UnionOperation")) and (not v678:HasTag("Effect") and v678.Transparency <= 0.75) then
					v677 = v677 + 1
					for _, v679 in game.ServerStorage.Mutation_FX.Cracked:GetChildren() do
						local v680 = v679:Clone()
						v680.Parent = v678
						if v680.ClassName == "ParticleEmitter" then
							v680.Enabled = true
							v680.Rate = v680.Rate / v677
							v680.Color = ColorSequence.new(v678.Color)
						else
							local v681 = v678.Transparency / 2
							v680.Transparency = math.clamp(v681, 0, 0.4) + 0.25
						end
					end
					v678:AddTag("CrackedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p682, p683)
			-- upvalues: (copy) v_u_15
			local function v686(p684)
				for _, v685 in p684:GetDescendants() do
					if v685:HasTag("Cleanup_Cracked") or v685.Name == "CRACKSTEXTURE" then
						v685:Destroy()
					end
				end
			end
			if p683 then
				v686(p683)
			end
			if p682 then
				v686(p682)
			end
			for _, v687 in p682:GetDescendants() do
				if (v687:IsA("BasePart") or v687:IsA("UnionOperation")) and v687:HasTag("CrackedVisual") then
					if v687:FindFirstChild("CrackedRubbleP") then
						v687.CrackedRubbleP:Destroy()
					end
					if v687:FindFirstChild("CrackedPixelSmokeP") then
						v687.CrackedPixelSmokeP:Destroy()
					end
					v687.Reflectance = 0
					v_u_15[v687] = nil
					v687:RemoveTag("CrackedVisual")
				end
			end
		end
	},
	["Enchanted"] = {
		["Id"] = "Enc",
		["Name"] = "Enchanted",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(255, 214, 89),
		["_AddFX"] = function(p688, p689, p690)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p688:_RemoveFX(p689, p690)
			if p690 then
				for _, v691 in game.ServerStorage.Mutation_FX.Enchanted:GetChildren() do
					local v692 = v691:Clone()
					v692.Parent = p690
					v692.Enabled = true
					v692:AddTag("Cleanup_Enchanted")
				end
			end
			local v693 = { Color3.fromRGB(255, 214, 89), Color3.fromRGB(255, 159, 80), Color3.fromRGB(255, 244, 123) }
			for v694, v695 in p689:GetDescendants() do
				if v695:IsA("BasePart") or v695:IsA("UnionOperation") then
					if v694 % 6 == 0 then
						local v696 = game.ServerStorage.Mutation_FX.Enchanted.Sparkle:Clone()
						v696.Parent = v695
						v696.Enabled = true
						v696.Rate = math.random(8, 25) / 10
						v696:AddTag("Cleanup_Enchanted")
						local v697 = Instance.new("Attachment", v695)
						v697:AddTag("Cleanup_Enchanted")
						local v698 = Instance.new("Attachment", v695)
						v698:AddTag("Cleanup_Enchanted")
						v697.Position = Vector3.new(0, 0.1, 0)
						v698.Position = Vector3.new(0, -0.1, 0)
						local v699 = Instance.new("Trail")
						v699.Color = ColorSequence.new(Color3.fromRGB(255, 214, 89))
						v699.LightInfluence = 0
						v699.Brightness = 3
						v699.Attachment0 = v697
						v699.Attachment1 = v698
						v699.Lifetime = 0.3
						v699.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v699.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v699.Parent = v695
						v699:AddTag("Cleanup_Enchanted")
					end
					if not v695:HasTag("Effect") then
						v_u_15[v695] = v_u_15[v695] or v695.Color
						v_u_18[v695] = v_u_18[v695] or v695.Material
						if v695.Transparency ~= 1 then
							v695.Color = v693[math.random(1, #v693)]
							v695.Material = "Neon"
							v695:SetAttribute("OTransparency", v695.Transparency)
							v695.Transparency = 0.5
							v695:AddTag("EnchantedVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p700, p701)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p701 then
				for _, v702 in p701:GetChildren() do
					if v702:HasTag("Cleanup_Enchanted") then
						v702:Destroy()
					end
				end
			end
			for _, v703 in p700:GetDescendants() do
				if (v703:IsA("BasePart") or v703:IsA("UnionOperation")) and v703:HasTag("EnchantedVisual") then
					v703:RemoveTag("EnchantedVisual")
					v703.Color = v_u_15[v703] or v703.Color
					v_u_15[v703] = nil
					v703.Transparency = v703:GetAttribute("OTransparency") or 0
					if v_u_18[v703] then
						v703.Material = v_u_18[v703]
						v_u_18[v703] = nil
					end
					v703.Reflectance = 0
				end
			end
		end
	},
	["Frozen"] = {
		["Id"] = "s",
		["Name"] = "Frozen",
		["ValueMulti"] = 10,
		["Color"] = Color3.fromRGB(108, 184, 255),
		["_AddFX"] = function(p704, p705, p706)
			-- upvalues: (copy) v_u_152
			v_u_152(p704, p705, p706, 0.8)
		end,
		["_RemoveFX"] = function(p707, p708, p709)
			-- upvalues: (copy) v_u_161
			v_u_161(p707, p708, p709)
		end
	},
	["Disco"] = {
		["Id"] = "t",
		["Name"] = "Disco",
		["ValueMulti"] = 125,
		["Color"] = Color3.fromRGB(255, 105, 180),
		["_AddFX"] = function(p710, p711, p712)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p710:_RemoveFX(p711, p712)
			local function v_u_715(p713)
				-- upvalues: (ref) v_u_15, (ref) v_u_18, (copy) v_u_715
				for _, v714 in p713:GetChildren() do
					if v714:IsA("BasePart") or v714:IsA("UnionOperation") then
						v_u_15[v714] = v_u_15[v714] or v714.Color
						v_u_18[v714] = v_u_18[v714] or v714.Material
						v714.Material = Enum.Material.Neon
						v714:AddTag("Discofied")
					elseif v714:IsA("Model") then
						v_u_715(v714)
					end
				end
			end
			v_u_715(p711)
		end,
		["_RemoveFX"] = function(_, p716, _)
			-- upvalues: (copy) v_u_15, (copy) v_u_18, (copy) v_u_5
			local v717 = {}
			for _, v718 in p716:GetDescendants() do
				if (v718:IsA("BasePart") or v718:IsA("UnionOperation")) and v718:HasTag("Discofied") then
					v718.Reflectance = 0
					v718:RemoveTag("Discofied")
					v718.Color = v_u_15[v718] or v718.Color
					v_u_15[v718] = nil
					local v719 = {
						["Part"] = v718,
						["Color"] = v718.Color
					}
					table.insert(v717, v719)
					local v720 = v_u_18[v718]
					if v720 then
						v718.Material = v720
						v_u_18[v718] = nil
					end
				end
			end
			if game:GetService("RunService"):IsServer() then
				v_u_5:FireAllClients(v717)
			end
		end
	},
	["Choc"] = {
		["Id"] = "u",
		["Name"] = "Choc",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(92, 64, 51),
		["StrokeColor"] = Color3.fromRGB(255, 255, 255),
		["_AddFX"] = function(p721, p722, p723)
			-- upvalues: (copy) v_u_14
			p721:_RemoveFX(p722, p723)
			local function v_u_730(p724)
				-- upvalues: (ref) v_u_14, (copy) v_u_730
				for _, v_u_725 in p724:GetChildren() do
					if v_u_725:IsA("BasePart") or v_u_725:IsA("UnionOperation") then
						local v_u_726 = {}
						for _, v727 in game.ServerStorage.Mutation_Textures.Choc:GetChildren() do
							local v728 = v727:Clone()
							v728.Parent = v_u_725
							v728.Transparency = v_u_725.Transparency
							table.insert(v_u_726, v728)
							v728:AddTag("Cleanup_Choc")
						end
						v_u_14[v_u_725] = v_u_725.Changed:Connect(function()
							-- upvalues: (copy) v_u_725, (ref) v_u_14, (copy) v_u_726
							if v_u_725.Transparency == 0 then
								v_u_14[v_u_725]:Disconnect()
								for _, v729 in v_u_726 do
									v729.Transparency = 0
								end
							end
						end)
					elseif v_u_725:IsA("Model") then
						v_u_730(v_u_725)
					end
				end
			end
			v_u_730(p722)
		end,
		["_RemoveFX"] = function(_, p731, _)
			-- upvalues: (copy) v_u_14
			for _, v732 in p731:GetDescendants() do
				if v732:HasTag("Cleanup_Choc") then
					v732:Destroy()
				end
				if v_u_14[v732] then
					v_u_14[v732]:Disconnect()
				end
			end
		end
	},
	["Plasma"] = {
		["Id"] = "v",
		["Name"] = "Plasma",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(208, 43, 137),
		["_AddFX"] = function(p733, p734, p735)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p733:_RemoveFX(p734, p735)
			if p735 then
				for _, v736 in game.ServerStorage.Mutation_FX.Plasma:GetChildren() do
					local v737 = v736:Clone()
					v737.Parent = p735
					v737.Enabled = true
					v737:AddTag("Cleanup_Plasma")
				end
			end
			for _, v738 in p734:GetDescendants() do
				if (v738:IsA("BasePart") or v738:IsA("UnionOperation")) and not v738:HasTag("Effect") then
					v_u_15[v738] = v_u_15[v738] or v738.Color
					v738.Color = Color3.fromRGB(189, 67, 142)
					v_u_18[v738] = v_u_18[v738] or v738.Material
					v738.Material = Enum.Material.Neon
					v738.Reflectance = 0.05
					v738:AddTag("PlasmaVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p739, p740)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v743(p741)
				for _, v742 in p741:GetDescendants() do
					if v742:HasTag("Cleanup_Plasma") then
						v742:Destroy()
					end
				end
			end
			if p740 then
				v743(p740)
			end
			if p739 then
				v743(p739)
			end
			for _, v744 in p739:GetDescendants() do
				if (v744:IsA("BasePart") or v744:IsA("UnionOperation")) and v744:HasTag("PlasmaVisual") then
					v744.Reflectance = 0
					v744.Color = v_u_15[v744] or v744.Color
					v_u_15[v744] = nil
					v744:RemoveTag("PlasmaVisual")
					if v_u_18[v744] then
						v744.Material = v_u_18[v744]
						v_u_18[v744] = nil
					end
				end
			end
		end
	},
	["Heavenly"] = {
		["Id"] = "w",
		["Name"] = "Heavenly",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(255, 249, 160),
		["_AddFX"] = function(p745, p746, p747)
			p745:_RemoveFX(p746, p747)
			if p747 then
				for _, v748 in game.ServerStorage.Mutation_FX.Heavenly:GetChildren() do
					local v749 = v748:Clone()
					v749.Parent = p747
					v749.Enabled = true
					v749:AddTag("Cleanup_Heavenly")
				end
			end
		end,
		["_RemoveFX"] = function(_, p750, p751)
			local function v754(p752)
				for _, v753 in p752:GetDescendants() do
					if v753:HasTag("Cleanup_Heavenly") then
						v753:Destroy()
					end
				end
			end
			if p751 then
				v754(p751)
			end
			if p750 then
				v754(p750)
			end
		end
	},
	["Burnt"] = {
		["Id"] = "x",
		["Name"] = "Burnt",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(40, 40, 40),
		["_AddFX"] = function(p755, p756, p757)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			p755:_RemoveFX(p756, p757)
			if p757 then
				for _, v758 in game.ServerStorage.Mutation_FX.Burnt:GetChildren() do
					local v759 = v758:Clone()
					v759.Parent = p757
					v759.Enabled = true
					v759:AddTag("Cleanup_Burnt")
				end
			end
			for _, v760 in p756:GetDescendants() do
				if (v760:IsA("BasePart") or v760:IsA("UnionOperation")) and not v760:HasTag("Effect") then
					v_u_15[v760] = v_u_15[v760] or v760.Color
					v760.Color = Color3.fromRGB(25, 25, 25)
					v_u_18[v760] = v_u_18[v760] or v760.Material
					v760.Material = Enum.Material.Slate
					v760.Reflectance = 0.05
					v760:AddTag("BurntVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p761, p762)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v765(p763)
				for _, v764 in p763:GetDescendants() do
					if v764:HasTag("Cleanup_Burnt") then
						v764:Destroy()
					end
				end
			end
			if p762 then
				v765(p762)
			end
			if p761 then
				v765(p761)
			end
			for _, v766 in p761:GetDescendants() do
				if (v766:IsA("BasePart") or v766:IsA("UnionOperation")) and v766:HasTag("BurntVisual") then
					v766.Reflectance = 0
					v766.Color = v_u_15[v766] or v766.Color
					v_u_15[v766] = nil
					v766:RemoveTag("BurntVisual")
					if v_u_18[v766] then
						v766.Material = v_u_18[v766]
						v_u_18[v766] = nil
					end
				end
			end
		end
	},
	["Cooked"] = {
		["Id"] = "y",
		["Name"] = "Cooked",
		["ValueMulti"] = 10,
		["Color"] = Color3.fromRGB(210, 120, 60),
		["_AddFX"] = function(p767, p768, p769)
			-- upvalues: (copy) v_u_15
			p767:_RemoveFX(p768, p769)
			if p769 then
				for _, v770 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
					local v771 = v770:Clone()
					v771.Parent = p769
					v771.Enabled = true
					v771:AddTag("Cleanup_Cooked")
				end
			end
			for _, v772 in p768:GetDescendants() do
				if (v772:IsA("BasePart") or v772:IsA("UnionOperation")) and not v772:HasTag("Effect") then
					v_u_15[v772] = v_u_15[v772] or v772.Color
					v772.Color = Color3.fromRGB(210, 120, 60)
					v772:AddTag("CookedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p773, p774)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v777(p775)
				for _, v776 in p775:GetDescendants() do
					if v776:HasTag("Cleanup_Cooked") then
						v776:Destroy()
					end
				end
			end
			if p774 then
				v777(p774)
			end
			if p773 then
				v777(p773)
			end
			for _, v778 in p773:GetDescendants() do
				if (v778:IsA("BasePart") or v778:IsA("UnionOperation")) and v778:HasTag("CookedVisual") then
					v778.Reflectance = 0
					v778.Color = v_u_15[v778] or v778.Color
					v_u_15[v778] = nil
					v778:RemoveTag("CookedVisual")
					local v779 = v_u_18[v778]
					if v779 then
						v778.Material = v779
						v_u_18[v778] = nil
					end
				end
			end
		end
	},
	["Sizzled"] = {
		["Id"] = "SI",
		["Name"] = "Sizzled",
		["ValueMulti"] = 18,
		["Color"] = Color3.fromRGB(210, 120, 60),
		["_AddFX"] = function(p780, p781, p782)
			-- upvalues: (copy) v_u_15
			p780:_RemoveFX(p781, p782)
			if p782 then
				for _, v783 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
					local v784 = v783:Clone()
					v784.Parent = p782
					v784.Enabled = true
					v784:AddTag("Cleanup_Sizzled")
				end
				for _, v785 in game.ServerStorage.Mutation_FX.Fried:GetChildren() do
					local v786 = v785:Clone()
					v786.Parent = p782
					v786.Enabled = true
					v786:AddTag("Cleanup_Sizzled")
				end
			end
			for _, v787 in p781:GetDescendants() do
				if (v787:IsA("BasePart") or v787:IsA("UnionOperation")) and not v787:HasTag("Effect") then
					v_u_15[v787] = v_u_15[v787] or v787.Color
					v787.Color = Color3.fromRGB(210, 120, 60)
					v787:AddTag("SizzledVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p788, p789)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v792(p790)
				for _, v791 in p790:GetDescendants() do
					if v791:HasTag("Cleanup_Sizzled") then
						v791:Destroy()
					end
				end
			end
			if p789 then
				v792(p789)
			end
			if p788 then
				v792(p788)
			end
			for _, v793 in p788:GetDescendants() do
				if (v793:IsA("BasePart") or v793:IsA("UnionOperation")) and v793:HasTag("SizzledVisual") then
					v793.Reflectance = 0
					v793.Color = v_u_15[v793] or v793.Color
					v_u_15[v793] = nil
					v793:RemoveTag("SizzledVisual")
					local v794 = v_u_18[v793]
					if v794 then
						v793.Material = v794
						v_u_18[v793] = nil
					end
				end
			end
		end
	},
	["Gourmet"] = {
		["Id"] = "GO",
		["Name"] = "Gourmet",
		["ValueMulti"] = 37,
		["Color"] = Color3.fromRGB(195, 151, 47),
		["_AddFX"] = function(p795, p796, p797)
			-- upvalues: (copy) v_u_15
			p795:_RemoveFX(p796, p797)
			local v798 = game.ServerStorage.Mutation_FX.Aromatic:GetChildren()
			local v799 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
			local v800 = game.ServerStorage.Mutation_FX.Cooked:GetChildren()
			local v801 = game.ServerStorage.Mutation_FX.Fried:GetChildren()
			local v802 = {}
			for _, v803 in v798 do
				table.insert(v802, v803)
			end
			for _, v804 in v799 do
				table.insert(v802, v804)
			end
			for _, v805 in v800 do
				table.insert(v802, v805)
			end
			for _, v806 in v801 do
				table.insert(v802, v806)
			end
			if p797 then
				for _, v807 in v802 do
					local v808 = v807:Clone()
					v808.Parent = p797
					if v808:IsA("ParticleEmitter") then
						v808.Enabled = true
					end
					v808:AddTag("Cleanup_Gourmet")
				end
			end
			for _, v809 in p796:GetDescendants() do
				if (v809:IsA("BasePart") or v809:IsA("UnionOperation")) and (not v809:HasTag("Effect") and v809.Transparency ~= 1) then
					v_u_15[v809] = v_u_15[v809] or v809.Color
					v809.Color = Color3.fromRGB(195, 151, 47)
					v809:AddTag("GourmetVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p810, p811)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			local function v814(p812)
				for _, v813 in p812:GetDescendants() do
					if v813:HasTag("Cleanup_Gourmet") then
						v813:Destroy()
					end
				end
			end
			if p811 then
				v814(p811)
			end
			if p810 then
				v814(p810)
			end
			for _, v815 in p810:GetDescendants() do
				if (v815:IsA("BasePart") or v815:IsA("UnionOperation")) and v815:HasTag("GourmetVisual") then
					v815.Color = v_u_15[v815] or v815.Color
					v_u_15[v815] = nil
					v815:RemoveTag("GourmetVisual")
					if v_u_18[v815] then
						v815.Material = v_u_18[v815]
						v_u_18[v815] = nil
					end
				end
			end
		end
	},
	["Moonlit"] = {
		["Id"] = "z",
		["Name"] = "Moonlit",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(153, 141, 255),
		["_AddFX"] = function(p816, p817, p818)
			-- upvalues: (copy) v_u_15
			p816:_RemoveFX(p817, p818)
			if p818 then
				for _, v819 in game.ServerStorage.Mutation_FX.Moonlit:GetChildren() do
					local v820 = v819:Clone()
					v820.Parent = p818
					v820.Enabled = true
					v820:AddTag("Cleanup_Moonlit")
					v820:AddTag("Effect")
				end
			end
			for _, v821 in p817:GetDescendants() do
				if (v821:IsA("BasePart") or v821:IsA("UnionOperation")) and not v821:HasTag("Effect") then
					v_u_15[v821] = v_u_15[v821] or v821.Color
					v821.Color = Color3.fromRGB(62, 56, 86)
					v821.Reflectance = 0.3
					v821:AddTag("MoonlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p822, p823)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p823 then
				for _, v824 in p823:GetChildren() do
					if v824:HasTag("Cleanup_Moonlit") then
						v824:Destroy()
					end
				end
			end
			for _, v825 in p822:GetDescendants() do
				if (v825:IsA("BasePart") or v825:IsA("UnionOperation")) and v825:HasTag("MoonlitVisual") then
					v825.Color = v_u_15[v825] or v825.Color
					v_u_15[v825] = nil
					v825.Reflectance = 0
					v825:RemoveTag("MoonlitVisual")
					local v826 = v_u_18[v825]
					if v826 then
						v825.Material = v826
						v_u_18[v825] = nil
					end
				end
			end
		end
	},
	["Heartstruck"] = {
		["Id"] = "HeartStruckID",
		["Name"] = "Heartstruck",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(255, 56, 238),
		["_AddFX"] = function(p827, p828, p829)
			-- upvalues: (copy) v_u_15
			p827:_RemoveFX(p828, p829)
			if p829 then
				for _, v830 in game.ServerStorage.Mutation_FX.Heartstruck:GetChildren() do
					local v831 = v830:Clone()
					v831.Parent = p829
					v831.Enabled = true
					v831:AddTag("Cleanup_Heartstruck")
					v831:AddTag("Effect")
				end
			end
			for _, v832 in p828:GetDescendants() do
				if (v832:IsA("BasePart") or v832:IsA("UnionOperation")) and not v832:HasTag("Effect") then
					v_u_15[v832] = v_u_15[v832] or v832.Color
					v832.Color = Color3.fromRGB(255, 0, 0)
					v832.Reflectance = 0.3
					v832:AddTag("HeartstuckVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p833, p834)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p834 then
				for _, v835 in p834:GetChildren() do
					if v835:HasTag("Cleanup_Heartstruck") then
						v835:Destroy()
					end
				end
			end
			for _, v836 in p833:GetDescendants() do
				if (v836:IsA("BasePart") or v836:IsA("UnionOperation")) and v836:HasTag("HeartstuckVisual") then
					v836.Color = v_u_15[v836] or v836.Color
					v_u_15[v836] = nil
					v836.Reflectance = 0
					v836:RemoveTag("HeartstuckVisual")
					local v837 = v_u_18[v836]
					if v837 then
						v836.Material = v837
						v_u_18[v836] = nil
					end
				end
			end
		end
	},
	["Luck"] = {
		["Id"] = "LuckID",
		["Name"] = "Luck",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(71, 255, 51),
		["_AddFX"] = function(p838, p839, p840)
			-- upvalues: (copy) v_u_15
			p838:_RemoveFX(p839, p840)
			for _, v841 in p839:GetDescendants() do
				if (v841:IsA("BasePart") or v841:IsA("UnionOperation")) and not v841:HasTag("Effect") then
					v_u_15[v841] = v_u_15[v841] or v841.Color
					v841.Color = Color3.fromRGB(0, 255, 0)
					v841.Material = Enum.Material.Foil
					v841.Reflectance = 0.3
					v841:AddTag("LuckVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p842, p843)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p843 then
				for _, v844 in p843:GetChildren() do
					if v844:HasTag("Cleanup_Luck") then
						v844:Destroy()
					end
				end
			end
			for _, v845 in p842:GetDescendants() do
				if (v845:IsA("BasePart") or v845:IsA("UnionOperation")) and v845:HasTag("LuckVisual") then
					v845.Color = v_u_15[v845] or v845.Color
					v_u_15[v845] = nil
					v845.Reflectance = 0
					v845:RemoveTag("LuckVisual")
					local v846 = v_u_18[v845]
					if v846 then
						v845.Material = v846
						v_u_18[v845] = nil
					end
				end
			end
		end
	},
	["Bloodlit"] = {
		["Id"] = "A",
		["Name"] = "Bloodlit",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(200, 0, 0),
		["_AddFX"] = function(p847, p848, p849)
			-- upvalues: (copy) v_u_15
			p847:_RemoveFX(p848, p849)
			if p849 then
				for _, v850 in game.ServerStorage.Mutation_FX.Bloodlit:GetChildren() do
					local v851 = v850:Clone()
					v851.Parent = p849
					v851.Enabled = true
					v851:AddTag("Cleanup_Bloodlit")
					v851:AddTag("Effect")
				end
			end
			for _, v852 in p848:GetDescendants() do
				if (v852:IsA("BasePart") or v852:IsA("UnionOperation")) and not v852:HasTag("Effect") then
					v_u_15[v852] = v_u_15[v852] or v852.Color
					v852.Color = Color3.fromRGB(143, 1, 3)
					v852.Reflectance = 0.3
					v852:AddTag("BloodlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p853, p854)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p854 then
				for _, v855 in p854:GetChildren() do
					if v855:HasTag("Cleanup_Bloodlit") then
						v855:Destroy()
					end
				end
			end
			for _, v856 in p853:GetDescendants() do
				if (v856:IsA("BasePart") or v856:IsA("UnionOperation")) and v856:HasTag("BloodlitVisual") then
					v856.Reflectance = 0
					v856.Color = v_u_15[v856] or v856.Color
					v_u_15[v856] = nil
					v856:RemoveTag("BloodlitVisual")
					local v857 = v_u_18[v856]
					if v857 then
						v856.Material = v857
						v_u_18[v856] = nil
					end
				end
			end
		end
	},
	["Peppermint"] = {
		["Id"] = "Pep",
		["Name"] = "Peppermint",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(255, 66, 66),
		["_AddFX"] = function(p858, p859, p860)
			-- upvalues: (copy) v_u_15
			p858:_RemoveFX(p859, p860)
			local v861 = false
			for v862, v863 in p859:GetDescendants() do
				if (v863:IsA("BasePart") or v863:IsA("UnionOperation")) and not v863:HasTag("Effect") then
					v_u_15[v863] = v_u_15[v863] or v863.Color
					if v862 % 5 == 0 then
						if v861 == false then
							local v864 = game.ServerStorage.Mutation_FX.Peppermint.BitsW:Clone()
							v864.Parent = v863
							v864.Enabled = true
							v864.Rate = math.random(7, 12) / 10
							v864:AddTag("Cleanup_Peppermint")
						else
							local v865 = game.ServerStorage.Mutation_FX.Peppermint.BitsR:Clone()
							v865.Parent = v863
							v865.Enabled = true
							v865.Rate = math.random(7, 12) / 10
							v865:AddTag("Cleanup_Peppermint")
						end
					end
					v863.Color = v861 == false and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 0, 0)
					v863:AddTag("PeppermintVisual")
					v861 = not v861
				end
			end
		end,
		["_RemoveFX"] = function(_, p866, p867)
			-- upvalues: (copy) v_u_15
			if p867 then
				for _, v868 in p867:GetChildren() do
					if v868:HasTag("Cleanup_Peppermint") then
						v868:Destroy()
					end
				end
			end
			for _, v869 in p866:GetDescendants() do
				if (v869:IsA("BasePart") or v869:IsA("UnionOperation")) and v869:HasTag("PeppermintVisual") then
					v869.Reflectance = 0
					v869.Color = v_u_15[v869] or v869.Color
					v_u_15[v869] = nil
					v869:RemoveTag("PeppermintVisual")
				end
			end
		end
	},
	["Zombified"] = {
		["Id"] = "B",
		["Name"] = "Zombified",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(128, 199, 127),
		["_AddFX"] = function(p870, p871, p872)
			p870:_RemoveFX(p871, p872)
			if p872 then
				for _, v873 in game.ServerStorage.Mutation_FX.Zombified:GetChildren() do
					local v874 = v873:Clone()
					v874.Parent = p872
					v874.Enabled = true
					v874:AddTag("Cleanup_Zombified")
					v874:AddTag("Effect")
				end
			end
			for _, v875 in p871:GetDescendants() do
				if (v875:IsA("BasePart") or v875:IsA("UnionOperation")) and not v875:HasTag("Effect") then
					v875:AddTag("ZombifiedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p876, p877)
			-- upvalues: (copy) v_u_18
			if p877 then
				for _, v878 in p877:GetChildren() do
					if v878:HasTag("Cleanup_Zombified") then
						v878:Destroy()
					end
				end
			end
			for _, v879 in p876:GetDescendants() do
				if (v879:IsA("BasePart") or v879:IsA("UnionOperation")) and v879:HasTag("ZombifiedVisual") then
					v879:RemoveTag("ZombifiedVisual")
					local v880 = v_u_18[v879]
					if v880 then
						v879.Material = v880
						v_u_18[v879] = nil
					end
				end
			end
		end
	},
	["Celestial"] = {
		["Id"] = "C",
		["Name"] = "Celestial",
		["ValueMulti"] = 120,
		["Color"] = Color3.fromRGB(255, 0, 255),
		["_AddFX"] = function(p881, p882, p883)
			p881:_RemoveFX(p882, p883)
			if p883 then
				for _, v884 in game.ServerStorage.Mutation_FX.Celestial:GetChildren() do
					local v885 = v884:Clone()
					v885.Parent = p883
					v885.Enabled = true
					v885:AddTag("Cleanup_Celestial")
					v885:AddTag("Effect")
				end
			end
			for _, v886 in p882:GetDescendants() do
				if (v886:IsA("BasePart") or v886:IsA("UnionOperation")) and not v886:HasTag("Effect") then
					v886.Reflectance = 0.5
					v886:AddTag("CelestialVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p887, p888)
			-- upvalues: (copy) v_u_18
			if p888 then
				for _, v889 in p888:GetChildren() do
					if v889:HasTag("Cleanup_Celestial") then
						v889:Destroy()
					end
				end
			end
			for _, v890 in p887:GetDescendants() do
				if (v890:IsA("BasePart") or v890:IsA("UnionOperation")) and v890:HasTag("CelestialVisual") then
					v890.Reflectance = 0
					v890:RemoveTag("CelestialVisual")
					local v891 = v_u_18[v890]
					if v891 then
						v890.Material = v891
						v_u_18[v890] = nil
					end
				end
			end
		end
	},
	["Meteoric"] = {
		["Id"] = "D",
		["Name"] = "Meteoric",
		["ValueMulti"] = 125,
		["Color"] = Color3.fromRGB(73, 29, 193),
		["_AddFX"] = function(p892, p893, p894)
			p892:_RemoveFX(p893, p894)
			if p894 then
				for _, v895 in game.ServerStorage.Mutation_FX.Meteoric:GetChildren() do
					local v896 = v895:Clone()
					v896.Parent = p894
					v896.Enabled = true
					v896:AddTag("Cleanup_Meteoric")
					v896:AddTag("Effect")
				end
			end
			for _, v897 in p893:GetDescendants() do
				if (v897:IsA("BasePart") or v897:IsA("UnionOperation")) and not v897:HasTag("Effect") then
					v897.Reflectance = 0.5
					v897:AddTag("MeteoricVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p898, p899)
			-- upvalues: (copy) v_u_18
			if p899 then
				for _, v900 in p899:GetChildren() do
					if v900:HasTag("Cleanup_Meteoric") then
						v900:Destroy()
					end
				end
			end
			for _, v901 in p898:GetDescendants() do
				if (v901:IsA("BasePart") or v901:IsA("UnionOperation")) and v901:HasTag("MeteoricVisual") then
					v901.Reflectance = 0
					v901:RemoveTag("MeteoricVisual")
					local v902 = v_u_18[v901]
					if v902 then
						v901.Material = v902
						v_u_18[v901] = nil
					end
				end
			end
		end
	},
	["HoneyGlazed"] = {
		["Id"] = "E",
		["Name"] = "HoneyGlazed",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(255, 204, 0),
		["_AddFX"] = function(p903, p904, p905)
			p903:_RemoveFX(p904, p905)
			if p905 then
				for _, v906 in game.ServerStorage.Mutation_FX.Honey:GetChildren() do
					local v907 = v906:Clone()
					v907.Parent = p905
					v907.Enabled = true
					v907:AddTag("Cleanup_Honey")
					v907:AddTag("Effect")
				end
			end
			for _, v908 in p904:GetDescendants() do
				if (v908:IsA("BasePart") or v908:IsA("UnionOperation")) and not v908:HasTag("Effect") then
					v908:AddTag("HoneyVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p909, p910)
			-- upvalues: (copy) v_u_18
			if p910 then
				for _, v911 in p910:GetChildren() do
					if v911:HasTag("Cleanup_Honey") then
						v911:Destroy()
					end
				end
			end
			for _, v912 in p909:GetDescendants() do
				if (v912:IsA("BasePart") or v912:IsA("UnionOperation")) and v912:HasTag("HoneyVisual") then
					v912:RemoveTag("HoneyVisual")
					local v913 = v_u_18[v912]
					if v913 then
						v912.Material = v913
						v_u_18[v912] = nil
					end
				end
			end
		end
	},
	["Pollinated"] = {
		["Id"] = "F",
		["Name"] = "Pollinated",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(255, 170, 0),
		["_AddFX"] = function(p914, p915, p916)
			-- upvalues: (copy) v_u_15
			p914:_RemoveFX(p915, p916)
			if p916 then
				for _, v917 in game.ServerStorage.Mutation_FX.Pollinated:GetChildren() do
					local v918 = v917:Clone()
					v918.Parent = p916
					v918.Enabled = true
					v918:AddTag("Cleanup_Pollinated")
					v918:AddTag("Effect")
				end
			end
			for _, v919 in p915:GetDescendants() do
				if (v919:IsA("BasePart") or v919:IsA("UnionOperation")) and not v919:HasTag("Effect") then
					v_u_15[v919] = v_u_15[v919] or v919.Color
					v919.Color = Color3.fromRGB(255, 170, 0)
					v919:AddTag("PollinatedlVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p920, p921)
			-- upvalues: (copy) v_u_15, (copy) v_u_18
			if p921 then
				for _, v922 in p921:GetChildren() do
					if v922:HasTag("Cleanup_Pollinated") then
						v922:Destroy()
					end
				end
			end
			for _, v923 in p920:GetDescendants() do
				if (v923:IsA("BasePart") or v923:IsA("UnionOperation")) and v923:HasTag("PollinatedlVisual") then
					v923:RemoveTag("PollinatedVisual")
					v923.Color = v_u_15[v923] or v923.Color
					v_u_15[v923] = nil
					local v924 = v_u_18[v923]
					if v924 then
						v923.Material = v924
						v_u_18[v923] = nil
					end
				end
			end
		end
	}
}
local v932 = {
	["Id"] = "G",
	["Name"] = "Amber",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(255, 192, 0),
	["TimeData"] = {
		["TimeToChange"] = 86400,
		["AddMutationName"] = "OldAmber"
	},
	["_AddFX"] = function(p926, p927, p928)
		-- upvalues: (copy) v_u_152
		v_u_152(p926, p927, p928, 0.5)
	end,
	["_RemoveFX"] = function(p929, p930, p931)
		-- upvalues: (copy) v_u_161
		v_u_161(p929, p930, p931)
	end
}
v_u_925.Amber = v932
local v939 = {
	["Id"] = "H",
	["Name"] = "OldAmber",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(252, 106, 33),
	["TimeData"] = {
		["TimeToChange"] = 172800,
		["AddMutationName"] = "AncientAmber"
	},
	["_AddFX"] = function(p933, p934, p935)
		-- upvalues: (copy) v_u_152
		v_u_152(p933, p934, p935, 0.5)
	end,
	["_RemoveFX"] = function(p936, p937, p938)
		-- upvalues: (copy) v_u_161
		v_u_161(p936, p937, p938)
	end
}
v_u_925.OldAmber = v939
v_u_925.AncientAmber = {
	["Id"] = "I",
	["Name"] = "AncientAmber",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(204, 68, 0),
	["_AddFX"] = function(p940, p941, p942)
		-- upvalues: (copy) v_u_152
		v_u_152(p940, p941, p942, 0.5)
	end,
	["_RemoveFX"] = function(p943, p944, p945)
		-- upvalues: (copy) v_u_161
		v_u_161(p943, p944, p945)
	end
}
v_u_925.Sandy = {
	["Id"] = "J",
	["Name"] = "Sandy",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(212, 191, 141),
	["_AddFX"] = function(p946, p947, p948)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p946:_RemoveFX(p947, p948)
		if p948 then
			for _, v949 in game.ServerStorage.Mutation_FX.Sandy:GetChildren() do
				local v950 = v949:Clone()
				v950.Parent = p948
				v950.Enabled = true
				v950:AddTag("Cleanup_Sandy")
			end
		end
		for _, v951 in p947:GetDescendants() do
			if (v951:IsA("BasePart") or v951:IsA("UnionOperation")) and not v951:HasTag("Effect") then
				v_u_15[v951] = v_u_15[v951] or v951.Color
				v951.Color = Color3.fromRGB(240, 206, 119)
				v_u_18[v951] = v_u_18[v951] or v951.Material
				v951.Material = Enum.Material.Sand
				v951.Reflectance = 0
				v951:AddTag("SandyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p952, p953)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v956(p954)
			for _, v955 in p954:GetDescendants() do
				if v955:HasTag("Cleanup_Sandy") then
					v955:Destroy()
				end
			end
		end
		if p953 then
			v956(p953)
		end
		if p952 then
			v956(p952)
		end
		for _, v957 in p952:GetDescendants() do
			if (v957:IsA("BasePart") or v957:IsA("UnionOperation")) and v957:HasTag("SandyVisual") then
				v957.Reflectance = 0
				v957.Color = v_u_15[v957] or v957.Color
				v_u_15[v957] = nil
				v957:RemoveTag("SandyVisual")
				if v_u_18[v957] then
					v957.Material = v_u_18[v957]
					v_u_18[v957] = nil
				end
			end
		end
	end
}
v_u_925.Clay = {
	["Id"] = "K",
	["Name"] = "Clay",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(147, 129, 122),
	["_AddFX"] = function(p958, p959, p960)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p958:_RemoveFX(p959, p960)
		if p960 then
			for _, v961 in game.ServerStorage.Mutation_FX.Clay:GetChildren() do
				local v962 = v961:Clone()
				v962.Parent = p960
				v962.Enabled = true
				v962:AddTag("Cleanup_Clay")
			end
		end
		for _, v963 in p959:GetDescendants() do
			if (v963:IsA("BasePart") or v963:IsA("UnionOperation")) and not v963:HasTag("Effect") then
				v_u_15[v963] = v_u_15[v963] or v963.Color
				v963.Color = Color3.fromRGB(147, 129, 122)
				v_u_18[v963] = v_u_18[v963] or v963.Material
				v963.Material = Enum.Material.Plaster
				v963.Reflectance = 0.5
				v963:AddTag("ClayVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p964, p965)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v968(p966)
			for _, v967 in p966:GetDescendants() do
				if v967:HasTag("Cleanup_Clay") then
					v967:Destroy()
				end
			end
		end
		if p965 then
			v968(p965)
		end
		if p964 then
			v968(p964)
		end
		for _, v969 in p964:GetDescendants() do
			if (v969:IsA("BasePart") or v969:IsA("UnionOperation")) and v969:HasTag("ClayVisual") then
				v969.Reflectance = 0
				v969.Color = v_u_15[v969] or v969.Color
				v_u_15[v969] = nil
				v969:RemoveTag("ClayVisual")
				if v_u_18[v969] then
					v969.Material = v_u_18[v969]
					v_u_18[v969] = nil
				end
			end
		end
	end
}
v_u_925.Ceramic = {
	["Id"] = "L",
	["Name"] = "Ceramic",
	["ValueMulti"] = 32,
	["Color"] = Color3.fromRGB(234, 184, 146),
	["_AddFX"] = function(p970, p971, p972)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p970:_RemoveFX(p971, p972)
		if p972 then
			for _, v973 in game.ServerStorage.Mutation_FX.Ceramic:GetChildren() do
				local v974 = v973:Clone()
				v974.Parent = p972
				v974.Enabled = true
				v974:AddTag("Cleanup_Ceramic")
			end
		end
		for _, v975 in p971:GetDescendants() do
			if (v975:IsA("BasePart") or v975:IsA("UnionOperation")) and not v975:HasTag("Effect") then
				v_u_15[v975] = v_u_15[v975] or v975.Color
				v975.Color = Color3.fromRGB(234, 184, 146)
				v_u_18[v975] = v_u_18[v975] or v975.Material
				v975.Material = Enum.Material.Concrete
				v975:AddTag("CeramicVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p976, p977)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v980(p978)
			for _, v979 in p978:GetDescendants() do
				if v979:HasTag("Cleanup_Ceramic") then
					v979:Destroy()
				end
			end
		end
		if p977 then
			v980(p977)
		end
		if p976 then
			v980(p976)
		end
		for _, v981 in p976:GetDescendants() do
			if (v981:IsA("BasePart") or v981:IsA("UnionOperation")) and v981:HasTag("CeramicVisual") then
				v981.Reflectance = 0
				v981.Color = v_u_15[v981] or v981.Color
				v_u_15[v981] = nil
				v981:RemoveTag("CeramicVisual")
				if v_u_18[v981] then
					v981.Material = v_u_18[v981]
					v_u_18[v981] = nil
				end
			end
		end
	end
}
v_u_925.Friendbound = {
	["Id"] = "M",
	["Name"] = "Friendbound",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(255, 0, 127),
	["_AddFX"] = function(p982, p983, p984)
		-- upvalues: (copy) v_u_15
		p982:_RemoveFX(p983, p984)
		if p984 then
			for _, v985 in game.ServerStorage.Mutation_FX.Friendbound:GetChildren() do
				local v986 = v985:Clone()
				v986.Parent = p984
				v986.Enabled = true
				v986:AddTag("Cleanup_Friendbound")
			end
		end
		for _, v987 in p983:GetDescendants() do
			if (v987:IsA("BasePart") or v987:IsA("UnionOperation")) and not v987:HasTag("Effect") then
				v_u_15[v987] = v_u_15[v987] or v987.Color
				v987.Color = v_u_15[v987]:Lerp(Color3.fromRGB(255, 0, 127), 0.4)
				v987:AddTag("FriendboundVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p988, p989)
		-- upvalues: (copy) v_u_15
		local function v992(p990)
			for _, v991 in p990:GetDescendants() do
				if v991:HasTag("Cleanup_Friendbound") then
					v991:Destroy()
				end
			end
		end
		if p989 then
			v992(p989)
		end
		if p988 then
			v992(p988)
		end
		for _, v993 in p988:GetDescendants() do
			if (v993:IsA("BasePart") or v993:IsA("UnionOperation")) and v993:HasTag("FriendboundVisual") then
				v993.Color = v_u_15[v993] or v993.Color
				v_u_15[v993] = nil
				v993:RemoveTag("FriendboundVisual")
			end
		end
	end
}
v_u_925.Tempestuous = {
	["Id"] = "N",
	["Name"] = "Tempestuous",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(143, 163, 180),
	["_AddFX"] = function(p994, p995, p996)
		p994:_RemoveFX(p995, p996)
		if p996 then
			for _, v997 in { game.ServerStorage.Mutation_FX.Twisted, game.ServerStorage.Mutation_FX.Tempestuous } do
				for _, v998 in v997:GetChildren() do
					local v999 = v998:Clone()
					v999.Parent = p996
					v999.Enabled = true
					v999:AddTag("Cleanup_Tempestuous")
				end
			end
		end
		for _, v1000 in p995:GetDescendants() do
			if (v1000:IsA("BasePart") or v1000:IsA("UnionOperation")) and not v1000:HasTag("Effect") then
				v1000:AddTag("TempestuousVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1001, p1002)
		if p1002 then
			for _, v1003 in p1002:GetChildren() do
				if v1003:HasTag("Cleanup_Tempestuous") then
					v1003:Destroy()
				end
			end
		end
		for _, v1004 in p1001:GetDescendants() do
			if (v1004:IsA("BasePart") or v1004:IsA("UnionOperation")) and v1004:HasTag("TempestuousVisual") then
				v1004:RemoveTag("TempestuousVisual")
			end
		end
	end
}
v_u_925.Infected = {
	["Id"] = "O",
	["Name"] = "Infected",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(67, 167, 0),
	["_AddFX"] = function(p1005, p1006, p1007)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1005:_RemoveFX(p1006, p1007)
		if p1007 then
			for _, v1008 in game.ServerStorage.Mutation_FX.Infected:GetChildren() do
				local v1009 = v1008:Clone()
				v1009.Parent = p1007
				v1009.Enabled = true
				v1009:AddTag("Cleanup_Infected")
			end
		end
		for _, v1010 in p1006:GetDescendants() do
			if (v1010:IsA("BasePart") or v1010:IsA("UnionOperation")) and not v1010:HasTag("Effect") then
				v_u_15[v1010] = v_u_15[v1010] or v1010.Color
				v1010.Color = Color3.fromRGB(65, 175, 0)
				v_u_18[v1010] = v_u_18[v1010] or v1010.Material
				v1010:AddTag("InfectedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1011, p1012)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1015(p1013)
			for _, v1014 in p1013:GetDescendants() do
				if v1014:HasTag("Cleanup_Infected") then
					v1014:Destroy()
				end
			end
		end
		if p1012 then
			v1015(p1012)
		end
		if p1011 then
			v1015(p1011)
		end
		for _, v1016 in p1011:GetDescendants() do
			if (v1016:IsA("BasePart") or v1016:IsA("UnionOperation")) and v1016:HasTag("InfectedVisual") then
				v1016.Reflectance = 0
				v1016.Color = v_u_15[v1016] or v1016.Color
				v_u_15[v1016] = nil
				v1016:RemoveTag("InfectedVisual")
				if v_u_18[v1016] then
					v1016.Material = v_u_18[v1016]
					v_u_18[v1016] = nil
				end
			end
		end
	end
}
v_u_925.Radioactive = {
	["Id"] = "P",
	["Name"] = "Radioactive",
	["ValueMulti"] = 55,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p1017, p1018, p1019)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1017:_RemoveFX(p1018, p1019)
		if p1019 then
			for _, v1020 in game.ServerStorage.Mutation_FX.Radioactive:GetChildren() do
				local v1021 = v1020:Clone()
				v1021.Parent = p1019
				v1021.Enabled = true
				v1021:AddTag("Cleanup_Radioactive")
			end
		end
		for _, v1022 in p1018:GetDescendants() do
			if (v1022:IsA("BasePart") or v1022:IsA("UnionOperation")) and not v1022:HasTag("Effect") then
				v_u_15[v1022] = v_u_15[v1022] or v1022.Color
				v1022.Color = Color3.fromRGB(65, 175, 0)
				v_u_18[v1022] = v_u_18[v1022] or v1022.Material
				v1022.Material = Enum.Material.Neon
				v1022:AddTag("RadioactiveVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1023, p1024)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1027(p1025)
			for _, v1026 in p1025:GetDescendants() do
				if v1026:HasTag("Cleanup_Radioactive") then
					v1026:Destroy()
				end
			end
		end
		if p1024 then
			v1027(p1024)
		end
		if p1023 then
			v1027(p1023)
		end
		for _, v1028 in p1023:GetDescendants() do
			if (v1028:IsA("BasePart") or v1028:IsA("UnionOperation")) and v1028:HasTag("RadioactiveVisual") then
				v1028.Reflectance = 0
				v1028.Color = v_u_15[v1028] or v1028.Color
				v_u_15[v1028] = nil
				v1028:RemoveTag("RadioactiveVisual")
				if v_u_18[v1028] then
					v1028.Material = v_u_18[v1028]
					v_u_18[v1028] = nil
				end
			end
		end
	end
}
v_u_925.Chakra = {
	["Id"] = "R",
	["Name"] = "Chakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p1029, p1030, p1031)
		p1029:_RemoveFX(p1030, p1031)
		local v1032 = game.ServerStorage.Mutation_FX.Chakra:GetChildren()
		if p1031 then
			for _, v1033 in v1032 do
				local v1034 = v1033:Clone()
				v1034.Parent = p1031
				v1034.Enabled = true
				v1034:AddTag("Cleanup_Chakra")
			end
		end
		local v1035 = 0
		for _, v1036 in p1030:GetDescendants() do
			if v1036:IsA("BasePart") and v1036 ~= p1031 then
				v1035 = v1035 + 1
				if v1035 % 3 == 0 then
					local v1037 = v1032[math.random(1, #v1032)]:Clone()
					v1037.Parent = v1036
					v1037.Enabled = true
					v1037:AddTag("Cleanup_Chakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1038, p1039)
		local function v1042(p1040)
			for _, v1041 in p1040:GetDescendants() do
				if v1041:HasTag("Cleanup_Chakra") then
					v1041:Destroy()
				end
			end
		end
		if p1039 then
			v1042(p1039)
		end
		if p1038 then
			v1042(p1038)
		end
	end
}
v_u_925.FoxfireChakra = {
	["Id"] = "S",
	["Name"] = "FoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p1043, p1044, p1045)
		p1043:_RemoveFX(p1044, p1045)
		local v1046 = game.ServerStorage.Mutation_FX.FoxfireChakra:GetChildren()
		local v1047 = nil
		for _, v1048 in v1046 do
			if v1048.Name == "Flames" then
				v1047 = v1048
				break
			end
		end
		if p1045 then
			for _, v1049 in v1046 do
				local v1050 = v1049:Clone()
				v1050.Parent = p1045
				v1050.Enabled = true
				v1050:AddTag("Cleanup_FoxfireChakra")
			end
		end
		local v1051 = 0
		for _, v1052 in p1044:GetDescendants() do
			if v1052:IsA("BasePart") and v1052 ~= p1045 then
				v1051 = v1051 + 1
				if v1051 % 2 == 0 then
					local v1053 = v1046[math.random(1, #v1046)]:Clone()
					v1053.Parent = v1052
					v1053.Enabled = true
					v1053:AddTag("Cleanup_FoxfireChakra")
				end
				if v1051 % 3 == 0 and v1047 then
					local v1054 = v1047:Clone()
					v1054.Parent = v1052
					v1054.Enabled = true
					v1054:AddTag("Cleanup_FoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1055, p1056)
		local function v1059(p1057)
			for _, v1058 in p1057:GetDescendants() do
				if v1058:HasTag("Cleanup_FoxfireChakra") then
					v1058:Destroy()
				end
			end
		end
		if p1056 then
			v1059(p1056)
		end
		if p1055 then
			v1059(p1055)
		end
	end
}
v_u_925.Cute = {
	["Id"] = "CUTEID",
	["Name"] = "Cute",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 170, 255),
	["_AddFX"] = function(p1060, p1061, p1062)
		p1060:_RemoveFX(p1061, p1062)
		local v1063 = game.ServerStorage.Mutation_FX.Cute:GetChildren()
		local v1064 = nil
		for _, v1065 in v1063 do
			if v1065.Name == "Flames" then
				v1064 = v1065
				break
			end
		end
		if p1062 then
			for _, v1066 in v1063 do
				local v1067 = v1066:Clone()
				v1067.Parent = p1062
				v1067.Enabled = true
				v1067:AddTag("Cleanup_Cute")
			end
		end
		local v1068 = 0
		for _, v1069 in p1061:GetDescendants() do
			if v1069:IsA("BasePart") and v1069 ~= p1062 then
				v1068 = v1068 + 1
				if v1068 % 2 == 0 then
					local v1070 = v1063[math.random(1, #v1063)]:Clone()
					v1070.Parent = v1069
					v1070.Enabled = true
					v1070:AddTag("Cleanup_Cute")
				end
				if v1068 % 3 == 0 and v1064 then
					local v1071 = v1064:Clone()
					v1071.Parent = v1069
					v1071.Enabled = true
					v1071:AddTag("Cleanup_Cute")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1072, p1073)
		local function v1076(p1074)
			for _, v1075 in p1074:GetDescendants() do
				if v1075:HasTag("Cleanup_Cute") then
					v1075:Destroy()
				end
			end
		end
		if p1073 then
			v1076(p1073)
		end
		if p1072 then
			v1076(p1072)
		end
	end
}
v_u_925.Heartbound = {
	["Id"] = "SHeartbound",
	["Name"] = "Heartbound",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 0, 0),
	["_AddFX"] = function(p1077, p1078, p1079)
		p1077:_RemoveFX(p1078, p1079)
		local v1080 = game.ServerStorage.Mutation_FX.Heartbound:GetChildren()
		local v1081 = nil
		for _, v1082 in v1080 do
			if v1082.Name == "Flames" then
				v1081 = v1082
				break
			end
		end
		if p1079 then
			for _, v1083 in v1080 do
				local v1084 = v1083:Clone()
				v1084.Parent = p1079
				v1084.Enabled = true
				v1084:AddTag("Cleanup_Heartbound")
			end
		end
		local v1085 = 0
		for _, v1086 in p1078:GetDescendants() do
			if v1086:IsA("BasePart") and v1086 ~= p1079 then
				v1085 = v1085 + 1
				if v1085 % 2 == 0 then
					local v1087 = v1080[math.random(1, #v1080)]:Clone()
					v1087.Parent = v1086
					v1087.Enabled = true
					v1087:AddTag("Cleanup_Heartbound")
				end
				if v1085 % 3 == 0 and v1081 then
					local v1088 = v1081:Clone()
					v1088.Parent = v1086
					v1088.Enabled = true
					v1088:AddTag("Cleanup_Heartbound")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1089, p1090)
		local function v1093(p1091)
			for _, v1092 in p1091:GetDescendants() do
				if v1092:HasTag("Cleanup_Heartbound") then
					v1092:Destroy()
				end
			end
		end
		if p1090 then
			v1093(p1090)
		end
		if p1089 then
			v1093(p1089)
		end
	end
}
v_u_925.CorruptChakra = {
	["Id"] = "T",
	["Name"] = "CorruptChakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 85, 255),
	["_AddFX"] = function(p1094, p1095, p1096)
		p1094:_RemoveFX(p1095, p1096)
		local v1097 = game.ServerStorage.Mutation_FX.CorruptChakra:GetChildren()
		if p1096 then
			for _, v1098 in v1097 do
				local v1099 = v1098:Clone()
				v1099.Parent = p1096
				v1099.Enabled = true
				v1099:AddTag("Cleanup_CorruptChakra")
			end
		end
		local v1100 = 0
		for _, v1101 in p1095:GetDescendants() do
			if v1101:IsA("BasePart") and v1101 ~= p1096 then
				v1100 = v1100 + 1
				if v1100 % 3 == 0 then
					local v1102 = v1097[math.random(1, #v1097)]:Clone()
					v1102.Parent = v1101
					v1102.Enabled = true
					v1102:AddTag("Cleanup_CorruptChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1103, p1104)
		local function v1107(p1105)
			for _, v1106 in p1105:GetDescendants() do
				if v1106:HasTag("Cleanup_CorruptChakra") then
					v1106:Destroy()
				end
			end
		end
		if p1104 then
			v1107(p1104)
		end
		if p1103 then
			v1107(p1103)
		end
	end
}
v_u_925.CorruptFoxfireChakra = {
	["Id"] = "U",
	["Name"] = "CorruptFoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(0, 0, 255),
	["_AddFX"] = function(p1108, p1109, p1110)
		p1108:_RemoveFX(p1109, p1110)
		local v1111 = game.ServerStorage.Mutation_FX.CorruptFoxfireChakra:GetChildren()
		local v1112 = nil
		for _, v1113 in v1111 do
			if v1113.Name == "Flames" then
				v1112 = v1113
				break
			end
		end
		if p1110 then
			for _, v1114 in v1111 do
				local v1115 = v1114:Clone()
				v1115.Parent = p1110
				v1115.Enabled = true
				v1115:AddTag("Cleanup_CorruptFoxfireChakra")
			end
		end
		local v1116 = 0
		for _, v1117 in p1109:GetDescendants() do
			if v1117:IsA("BasePart") and v1117 ~= p1110 then
				v1116 = v1116 + 1
				if v1116 % 2 == 0 then
					local v1118 = v1111[math.random(1, #v1111)]:Clone()
					v1118.Parent = v1117
					v1118.Enabled = true
					v1118:AddTag("Cleanup_CorruptFoxfireChakra")
				end
				if v1116 % 3 == 0 and v1112 then
					local v1119 = v1112:Clone()
					v1119.Parent = v1117
					v1119.Enabled = true
					v1119:AddTag("Cleanup_CorruptFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1120, p1121)
		local function v1124(p1122)
			for _, v1123 in p1122:GetDescendants() do
				if v1123:HasTag("Cleanup_CorruptFoxfireChakra") then
					v1123:Destroy()
				end
			end
		end
		if p1121 then
			v1124(p1121)
		end
		if p1120 then
			v1124(p1120)
		end
	end
}
v_u_925.AscendedChakra = {
	["Id"] = "ACH",
	["Name"] = "AscendedChakra",
	["ValueMulti"] = 230,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1125, p1126, p1127)
		-- upvalues: (copy) v_u_18, (copy) v_u_15
		p1125:_RemoveFX(p1126, p1127)
		local v1128 = game.ServerStorage.Mutation_FX.AscendedChakra:GetChildren()
		local v1129 = nil
		for _, v1130 in v1128 do
			if v1130.Name == "Flames" then
				v1129 = v1130
				break
			end
		end
		if p1127 then
			for _, v1131 in v1128 do
				local v1132 = v1131:Clone()
				v1132.Parent = p1127
				v1132.Enabled = true
				v1132:AddTag("Cleanup_AscendedChakra")
			end
		end
		local v1133 = 0
		for _, v1134 in p1126:GetDescendants() do
			if v1134:IsA("BasePart") and v1134 ~= p1127 then
				v1133 = v1133 + 1
				v1134:AddTag("AscendedChakraVisual")
				v_u_18[v1134] = v_u_18[v1134] or v1134.Material
				v_u_15[v1134] = v_u_15[v1134] or v1134.Color
				if v1133 % 2 == 0 then
					v1134.Color = Color3.fromRGB(255, 255, 255)
				else
					v1134.Color = Color3.fromRGB(255, 255, 0)
				end
				if math.random() < 0.5 then
					v1134.Material = Enum.Material.Neon
				else
					v1134.Material = Enum.Material.ForceField
				end
				if v1133 % 2 == 0 and #v1128 > 0 then
					local v1135 = v1128[math.random(1, #v1128)]:Clone()
					v1135.Parent = v1134
					v1135.Enabled = true
					v1135:AddTag("Cleanup_AscendedChakra")
				end
				if v1133 % 3 == 0 and v1129 then
					local v1136 = v1129:Clone()
					v1136.Parent = v1134
					v1136.Enabled = true
					v1136:AddTag("Cleanup_AscendedChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1137, p1138)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1141(p1139)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1140 in p1139:GetDescendants() do
				if v1140:HasTag("Cleanup_AscendedChakra") then
					v1140:Destroy()
				end
				if v1140:HasTag("AscendedChakraVisual") then
					v1140:RemoveTag("AscendedChakraVisual")
					v1140.Color = v_u_15[v1140] or v1140.Color
					v_u_15[v1140] = nil
					if v_u_18[v1140] then
						v1140.Material = v_u_18[v1140]
						v_u_18[v1140] = nil
					end
				end
			end
		end
		if p1138 then
			v1141(p1138)
		end
		if p1137 then
			v1141(p1137)
		end
	end
}
v_u_925.Static = {
	["Id"] = "V",
	["Name"] = "Static",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1142, p1143, p1144)
		p1142:_RemoveFX(p1143, p1144)
		if p1144 then
			for _, v1145 in game.ServerStorage.Mutation_FX.Static:GetChildren() do
				local v1146 = v1145:Clone()
				v1146.Parent = p1144
				v1146:AddTag("Cleanup_Static")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1147)
		if p1147 then
			for _, v1148 in p1147:GetChildren() do
				if v1148:HasTag("Cleanup_Static") then
					v1148:Destroy()
				end
			end
		end
	end
}
v_u_925.HarmonisedChakra = {
	["Id"] = "W",
	["Name"] = "HarmonisedChakra",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p1149, p1150, p1151)
		p1149:_RemoveFX(p1150, p1151)
		local v1152 = game.ServerStorage.Mutation_FX.HarmonisedChakra:GetChildren()
		if p1151 then
			for _, v1153 in v1152 do
				local v1154 = v1153:Clone()
				v1154.Parent = p1151
				v1154.Enabled = true
				v1154:AddTag("Cleanup_HarmonisedChakra")
			end
		end
		local v1155 = 0
		for _, v1156 in p1150:GetDescendants() do
			if v1156:IsA("BasePart") and v1156 ~= p1151 then
				v1155 = v1155 + 1
				if v1155 % 3 == 0 then
					local v1157 = v1152[math.random(1, #v1152)]:Clone()
					v1157.Parent = v1156
					v1157.Enabled = true
					v1157:AddTag("Cleanup_HarmonisedChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1158, p1159)
		local function v1162(p1160)
			for _, v1161 in p1160:GetDescendants() do
				if v1161:HasTag("Cleanup_HarmonisedChakra") then
					v1161:Destroy()
				end
			end
		end
		if p1159 then
			v1162(p1159)
		end
		if p1158 then
			v1162(p1158)
		end
	end
}
v_u_925.HarmonisedFoxfireChakra = {
	["Id"] = "X",
	["Name"] = "HarmonisedFoxfireChakra",
	["ValueMulti"] = 190,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p1163, p1164, p1165)
		p1163:_RemoveFX(p1164, p1165)
		local v1166 = game.ServerStorage.Mutation_FX.HarmonisedFoxfireChakra:GetChildren()
		local v1167 = nil
		for _, v1168 in v1166 do
			if v1168.Name == "Flames" then
				v1167 = v1168
				break
			end
		end
		if p1165 then
			for _, v1169 in v1166 do
				local v1170 = v1169:Clone()
				v1170.Parent = p1165
				v1170.Enabled = true
				v1170:AddTag("Cleanup_HarmonisedFoxfireChakra")
			end
		end
		local v1171 = 0
		for _, v1172 in p1164:GetDescendants() do
			if v1172:IsA("BasePart") and v1172 ~= p1165 then
				v1171 = v1171 + 1
				if v1171 % 2 == 0 then
					local v1173 = v1166[math.random(1, #v1166)]:Clone()
					v1173.Parent = v1172
					v1173.Enabled = true
					v1173:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
				if v1171 % 3 == 0 and v1167 then
					local v1174 = v1167:Clone()
					v1174.Parent = v1172
					v1174.Enabled = true
					v1174:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1175, p1176)
		local function v1179(p1177)
			for _, v1178 in p1177:GetDescendants() do
				if v1178:HasTag("Cleanup_HarmonisedFoxfireChakra") then
					v1178:Destroy()
				end
			end
		end
		if p1176 then
			v1179(p1176)
		end
		if p1175 then
			v1179(p1175)
		end
	end
}
v_u_925.Pasta = {
	["Id"] = "PA",
	["Name"] = "Pasta",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(255, 223, 128),
	["_AddFX"] = function(p1180, p1181, p1182)
		p1180:_RemoveFX(p1181, p1182)
		local v1183 = {}
		for _, v1184 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v1184.Name == "Pasta" then
				table.insert(v1183, v1184)
			end
		end
		if p1182 then
			for _, v1185 in v1183 do
				if not p1182:FindFirstChild(v1185.Name) then
					local v1186 = v1185:Clone()
					v1186.Parent = p1182
					v1186.Enabled = true
					v1186:AddTag("Cleanup_Pasta")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1187, p1188)
		local function v1191(p1189)
			for _, v1190 in p1189:GetDescendants() do
				if v1190:HasTag("Cleanup_Pasta") then
					v1190:Destroy()
				end
			end
		end
		if p1188 then
			v1191(p1188)
		end
		if p1187 then
			v1191(p1187)
		end
	end
}
v_u_925.Sauce = {
	["Id"] = "SA",
	["Name"] = "Sauce",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(200, 45, 35),
	["_AddFX"] = function(p1192, p1193, p1194)
		p1192:_RemoveFX(p1193, p1194)
		local v1195 = {}
		for _, v1196 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v1196.Name == "Sauce" then
				table.insert(v1195, v1196)
			end
		end
		if p1194 then
			for _, v1197 in v1195 do
				if not p1194:FindFirstChild(v1197.Name) then
					local v1198 = v1197:Clone()
					v1198.Parent = p1194
					v1198.Enabled = true
					v1198:AddTag("Cleanup_Sauce")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1199, p1200)
		local function v1203(p1201)
			for _, v1202 in p1201:GetDescendants() do
				if v1202:HasTag("Cleanup_Sauce") then
					v1202:Destroy()
				end
			end
		end
		if p1200 then
			v1203(p1200)
		end
		if p1199 then
			v1203(p1199)
		end
	end
}
v_u_925.Meatball = {
	["Id"] = "MB",
	["Name"] = "Meatball",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(139, 69, 19),
	["_AddFX"] = function(p1204, p1205, p1206)
		p1204:_RemoveFX(p1205, p1206)
		local v1207 = {}
		for _, v1208 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v1208.Name == "Meatball" then
				table.insert(v1207, v1208)
			end
		end
		if p1206 then
			for _, v1209 in v1207 do
				if not p1206:FindFirstChild(v1209.Name) then
					local v1210 = v1209:Clone()
					v1210.Parent = p1206
					v1210.Enabled = true
					v1210:AddTag("Cleanup_Meatball")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1211, p1212)
		local function v1215(p1213)
			for _, v1214 in p1213:GetDescendants() do
				if v1214:HasTag("Cleanup_Meatball") then
					v1214:Destroy()
				end
			end
		end
		if p1212 then
			v1215(p1212)
		end
		if p1211 then
			v1215(p1211)
		end
	end
}
v_u_925.Spaghetti = {
	["Id"] = "SP",
	["Name"] = "Spaghetti",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 140, 70),
	["_AddFX"] = function(p1216, p1217, p1218)
		p1216:_RemoveFX(p1217, p1218)
		local v1219 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
		if p1218 then
			for _, v1220 in v1219 do
				if not p1218:FindFirstChild(v1220.Name) then
					local v1221 = v1220:Clone()
					v1221.Parent = p1218
					v1221.Enabled = true
					v1221:AddTag("Cleanup_Spaghetti")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1222, p1223)
		local function v1226(p1224)
			for _, v1225 in p1224:GetDescendants() do
				if v1225:HasTag("Cleanup_Spaghetti") then
					v1225:Destroy()
				end
			end
		end
		if p1223 then
			v1226(p1223)
		end
		if p1222 then
			v1226(p1222)
		end
	end
}
v_u_925.Eclipsed = {
	["Id"] = "EC",
	["Name"] = "Eclipsed",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(44, 111, 162),
	["_AddFX"] = function(p1227, p1228, p1229)
		-- upvalues: (copy) v_u_15
		p1227:_RemoveFX(p1228, p1229)
		if p1229 then
			for _, v1230 in game.ServerStorage.Mutation_FX.Eclipsed:GetChildren() do
				local v1231 = v1230:Clone()
				v1231.Parent = p1229
				v1231.Enabled = true
				v1231:AddTag("Cleanup_Eclipsed")
			end
		end
		for _, v1232 in p1228:GetDescendants() do
			if (v1232:IsA("BasePart") or v1232:IsA("UnionOperation")) and (not v1232:HasTag("Effect") and (not v1232.Transparency or v1232.Transparency ~= 1)) then
				v_u_15[v1232] = v_u_15[v1232] or v1232.Color
				v1232.Color = v1232.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.45)
				v1232:AddTag("EclipsedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1233, p1234)
		-- upvalues: (copy) v_u_15
		if p1234 then
			for _, v1235 in p1234:GetChildren() do
				if v1235:HasTag("Cleanup_Eclipsed") then
					v1235:Destroy()
				end
			end
		end
		for _, v1236 in p1233:GetDescendants() do
			if (v1236:IsA("BasePart") or v1236:IsA("UnionOperation")) and v1236:HasTag("EclipsedVisual") then
				v1236.Color = v_u_15[v1236] or v1236.Color
				v_u_15[v1236] = nil
				v1236:RemoveTag("EclipsedVisual")
			end
		end
	end
}
v_u_925.Enlightened = {
	["Id"] = "EN",
	["Name"] = "Enlightened",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1237, p1238, p1239)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1237:_RemoveFX(p1238, p1239)
		local v1240 = Color3.fromRGB(218, 133, 65)
		local v1241 = {}
		for _, v1242 in p1238:GetDescendants() do
			if (v1242:IsA("BasePart") or v1242:IsA("UnionOperation")) and not v1242:HasTag("Effect") then
				local v1243 = v1242.Color
				v1241[v1243] = (v1241[v1243] or 0) + 1
			end
		end
		local v1244 = 0
		for v1245, v1246 in pairs(v1241) do
			if v1244 <= v1246 then
				v1240 = v1245
				v1244 = v1246
			end
		end
		for _, v1247 in p1238:GetDescendants() do
			if (v1247:IsA("BasePart") or v1247:IsA("UnionOperation")) and (not v1247:HasTag("Effect") and (not v1247.Transparency or v1247.Transparency ~= 1) and v1247.Color == v1240) then
				v_u_15[v1247] = v_u_15[v1247] or v1247.Color
				v1247.Color = Color3.fromRGB(218, 133, 65)
				v_u_18[v1247] = v_u_18[v1247] or v1247.Material
				v1247.Material = Enum.Material.Neon
				v1247:AddTag("EnlightenedVisual")
			end
		end
		if p1239 then
			for _, v1248 in game.ServerStorage.Mutation_FX.Enlightened:GetChildren() do
				local v1249 = v1248:Clone()
				v1249.Parent = p1239
				v1249.Enabled = true
				v1249:AddTag("Cleanup_Enlightened")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1250, p1251)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1254(p1252)
			for _, v1253 in p1252:GetDescendants() do
				if v1253:HasTag("Cleanup_Enlightened") then
					v1253:Destroy()
				end
			end
		end
		if p1251 then
			v1254(p1251)
		end
		if p1250 then
			v1254(p1250)
		end
		for _, v1255 in p1250:GetDescendants() do
			if (v1255:IsA("BasePart") or v1255:IsA("UnionOperation")) and v1255:HasTag("EnlightenedVisual") then
				v1255.Color = v_u_15[v1255] or v1255.Color
				v_u_15[v1255] = nil
				v1255:RemoveTag("EnlightenedVisual")
				if v_u_18[v1255] then
					v1255.Material = v_u_18[v1255]
					v_u_18[v1255] = nil
				end
			end
		end
	end
}
v_u_925.Tranquil = {
	["Id"] = "TQ",
	["Name"] = "Tranquil",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1256, p1257, p1258)
		p1256:_RemoveFX(p1257, p1258)
		local v1259 = p1257:FindFirstChild("Item_Seed")
		local v1260 = not (v1259 and v1259:IsA("NumberValue")) and 0 or v1259.Value
		local v1261 = Random.new(v1260)
		local v1262 = game.ServerStorage.Mutation_FX.Tranquil:GetChildren()
		local v1263 = 0
		for _, v1264 in p1257:GetDescendants() do
			if (v1264:IsA("BasePart") or v1264:IsA("UnionOperation")) and not v1264:HasTag("Effect") then
				v1263 = v1263 + 1
				if v1263 % 5 == 0 or v1263 == 1 then
					local v1265 = v1262[v1261:NextInteger(1, #v1262)]:Clone()
					v1265.Enabled = true
					v1265.Rate = v1261:NextInteger(30, 50) * 0.01
					v1265.Parent = v1264
					v1265:AddTag("Cleanup_Tranquil")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1266, p1267)
		local function v1270(p1268)
			for _, v1269 in p1268:GetDescendants() do
				if v1269:HasTag("Cleanup_Tranquil") then
					v1269:Destroy()
				end
			end
		end
		if p1267 then
			v1270(p1267)
		end
		if p1266 then
			v1270(p1266)
		end
	end
}
v_u_925.Corrupt = {
	["Id"] = "CR",
	["Name"] = "Corrupt",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(176, 23, 26),
	["_AddFX"] = function(p1271, p1272, p1273)
		p1271:_RemoveFX(p1272, p1273)
		if p1273 then
			for _, v1274 in game.ServerStorage.Mutation_FX.Corrupt:GetChildren() do
				local v1275 = v1274:Clone()
				v1275.Parent = p1273
				v1275:AddTag("Cleanup_Corrupt")
				if v1275:IsA("ParticleEmitter") then
					v1275.Enabled = true
				end
			end
		end
		for _, v1276 in p1272:GetDescendants() do
			if (v1276:IsA("BasePart") or v1276:IsA("UnionOperation")) and (not v1276:HasTag("Effect") and (not v1276.Transparency or v1276.Transparency ~= 1)) then
				v1276.Color = v1276.Color:Lerp(Color3.fromRGB(176, 23, 26), 0.5)
				v1276:AddTag("CorruptVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1277, p1278)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1281(p1279)
			for _, v1280 in p1279:GetDescendants() do
				if v1280:HasTag("Cleanup_Corrupt") then
					v1280:Destroy()
				end
			end
		end
		if p1278 then
			v1281(p1278)
		end
		for _, v1282 in p1277:GetDescendants() do
			if (v1282:IsA("BasePart") or v1282:IsA("UnionOperation")) and v1282:HasTag("CorruptVisual") then
				v1282.Color = v_u_15[v1282] or v1282.Color
				v_u_15[v1282] = nil
				v1282:RemoveTag("CorruptVisual")
				if v_u_18[v1282] then
					v1282.Material = v_u_18[v1282]
					v_u_18[v1282] = nil
				end
			end
		end
	end
}
v_u_925.Toxic = {
	["Id"] = "TX",
	["Name"] = "Toxic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(85, 255, 0),
	["_AddFX"] = function(p1283, p1284, p1285)
		p1283:_RemoveFX(p1284, p1285)
		if p1285 then
			for _, v1286 in game.ServerStorage.Mutation_FX.Toxic:GetChildren() do
				local v1287 = v1286:Clone()
				v1287.Parent = p1285
				v1287.Enabled = true
				v1287:AddTag("Cleanup_Toxic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1288, p1289)
		local function v1292(p1290)
			for _, v1291 in p1290:GetDescendants() do
				if v1291:HasTag("Cleanup_Toxic") then
					v1291:Destroy()
				end
			end
		end
		if p1289 then
			v1292(p1289)
		end
		if p1288 then
			v1292(p1288)
		end
	end
}
v_u_925.Acidic = {
	["Id"] = "AC",
	["Name"] = "Acidic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(224, 245, 129),
	["_AddFX"] = function(p1293, p1294, p1295)
		p1293:_RemoveFX(p1294, p1295)
		if p1295 then
			for _, v1296 in game.ServerStorage.Mutation_FX.Acidic:GetChildren() do
				local v1297 = v1296:Clone()
				v1297.Parent = p1295
				v1297.Enabled = true
				v1297:AddTag("Cleanup_Acidic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1298, p1299)
		local function v1302(p1300)
			for _, v1301 in p1300:GetDescendants() do
				if v1301:HasTag("Cleanup_Acidic") then
					v1301:Destroy()
				end
			end
		end
		if p1299 then
			v1302(p1299)
		end
		if p1298 then
			v1302(p1298)
		end
	end
}
v_u_925.Corrosive = {
	["Id"] = "CV",
	["Name"] = "Corrosive",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 0),
	["_AddFX"] = function(p1303, p1304, p1305)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1303:_RemoveFX(p1304, p1305)
		local v1306 = {}
		for _, v1307 in { "Acidic", "Toxic" } do
			for _, v1308 in game.ServerStorage.Mutation_FX[v1307]:GetChildren() do
				table.insert(v1306, v1308)
			end
		end
		if p1305 then
			for _, v1309 in v1306 do
				local v1310 = v1309:Clone()
				v1310.Parent = p1305
				v1310.Enabled = true
				v1310:AddTag("Cleanup_Corrosive")
			end
		end
		local v1311 = 0
		for _, v1312 in p1304:GetDescendants() do
			if v1312:IsA("BasePart") and v1312 ~= p1305 then
				v1311 = v1311 + 1
				if v1311 % 2 == 0 and #v1306 > 0 then
					local v1313 = v1306[math.random(1, #v1306)]:Clone()
					v1313.Parent = v1312
					v1313.Enabled = true
					v1313:AddTag("Cleanup_Corrosive")
				end
				if Random.new():NextNumber() < 0.5 then
					v1312:AddTag("CorrosiveVisual")
					v_u_15[v1312] = v_u_15[v1312] or v1312.Color
					v_u_18[v1312] = v_u_18[v1312] or v1312.Material
					v1312.Color = Color3.fromRGB(0, 255, 0)
					v1312.Material = Enum.Material.Neon
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1314, p1315)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1318(p1316)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1317 in p1316:GetDescendants() do
				if v1317:HasTag("Cleanup_Corrosive") then
					v1317:Destroy()
				elseif v1317:HasTag("CorrosiveVisual") then
					v1317.Color = v_u_15[v1317] or v1317.Color
					v1317.Material = v_u_18[v1317] or v1317.Material
					v_u_15[v1317] = nil
					v_u_18[v1317] = nil
					v1317:RemoveTag("CorrosiveVisual")
				end
			end
		end
		if p1315 then
			v1318(p1315)
		end
		if p1314 then
			v1318(p1314)
		end
	end
}
v_u_925.Flaming = {
	["Id"] = "FL",
	["Name"] = "Flaming",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(255, 85, 0),
	["_AddFX"] = function(p1319, p1320, p1321)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1319:_RemoveFX(p1320, p1321)
		local v1322 = game.ServerStorage.Mutation_FX.Flaming:GetChildren()
		local v1323 = { Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 128, 0), Color3.fromRGB(255, 255, 0) }
		if p1321 then
			for _, v1324 in v1322 do
				local v1325 = v1324:Clone()
				v1325.Parent = p1321
				v1325.Enabled = true
				v1325:AddTag("Cleanup_Flaming")
			end
		end
		local v1326 = 0
		for _, v1327 in p1320:GetDescendants() do
			if v1327:IsA("BasePart") and v1327 ~= p1321 then
				v1326 = v1326 + 1
				v_u_15[v1327] = v_u_15[v1327] or v1327.Color
				v_u_18[v1327] = v_u_18[v1327] or v1327.Material
				v1327.Color = v1323[math.random(1, #v1323)]
				if v1326 % 3 == 0 and #v1322 > 0 then
					local v1328 = v1322[math.random(1, #v1322)]:Clone()
					v1328.Parent = v1327
					v1328.Enabled = true
					v1328:AddTag("Cleanup_Flaming")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1329, p1330)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1333(p1331)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1332 in p1331:GetDescendants() do
				if v1332:HasTag("Cleanup_Flaming") then
					v1332:Destroy()
				end
				if v_u_15[v1332] then
					v1332.Color = v_u_15[v1332]
					v_u_15[v1332] = nil
				end
				if v_u_18[v1332] then
					v1332.Material = v_u_18[v1332]
					v_u_18[v1332] = nil
				end
			end
		end
		if p1330 then
			v1333(p1330)
		end
		if p1329 then
			v1333(p1329)
		end
	end
}
v_u_925.Blazing = {
	["Id"] = "BZ",
	["Name"] = "Blazing",
	["ValueMulti"] = 52,
	["Color"] = Color3.fromRGB(255, 90, 20),
	["_AddFX"] = function(p1334, p1335, p1336)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1334:_RemoveFX(p1335, p1336)
		local v1337 = game.ServerStorage.Mutation_FX.Flaming:GetChildren()
		local v1338 = {
			"Neon orange",
			"Br. yellowish orange",
			"Bright orange",
			"Bright red",
			"Bright yellow"
		}
		if p1336 then
			for _, v1339 in v1337 do
				local v1340 = v1339:Clone()
				v1340.Parent = p1336
				v1340.Enabled = true
				v1340:AddTag("Cleanup_Blazing")
			end
		end
		local v1341 = 0
		for _, v1342 in p1335:GetDescendants() do
			if v1342:IsA("BasePart") then
				v1341 = v1341 + 1
				v_u_15[v1342] = v_u_15[v1342] or v1342.BrickColor.Color
				v_u_18[v1342] = v_u_18[v1342] or v1342.Material
				v1342.BrickColor = BrickColor.new(v1338[math.random(1, #v1338)])
				v1342.Material = Enum.Material.Neon
				v1342:AddTag("BlazingVisual")
				if v1342 ~= p1336 and (v1341 % 2 == 0 and #v1337 > 0) then
					local v1343 = v1337[math.random(1, #v1337)]:Clone()
					v1343.Parent = v1342
					v1343.Enabled = true
					v1343:AddTag("Cleanup_Blazing")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1344, p1345)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1349(p1346)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1347 in p1346:GetDescendants() do
				if v1347:HasTag("Cleanup_Blazing") then
					v1347:Destroy()
				end
				if v1347:HasTag("BlazingVisual") then
					local v1348
					if v_u_15[v1347] then
						v1348 = BrickColor.new(v_u_15[v1347])
					else
						v1348 = v1347.BrickColor
					end
					v1347.BrickColor = v1348
					v_u_15[v1347] = nil
					v1347:RemoveTag("BlazingVisual")
					if v_u_18[v1347] then
						v1347.Material = v_u_18[v1347]
						v_u_18[v1347] = nil
					end
				end
			end
		end
		if p1345 then
			v1349(p1345)
		end
		if p1344 then
			v1349(p1344)
		end
	end
}
v_u_925.Infernal = {
	["Id"] = "IN",
	["Name"] = "Infernal",
	["ValueMulti"] = 180,
	["Color"] = Color3.fromRGB(101, 255, 91),
	["_AddFX"] = function(p1350, p1351, p1352)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1350:_RemoveFX(p1351, p1352)
		local v1353 = game.ServerStorage.Mutation_FX.Infernal:GetChildren()
		local v1354 = {
			Color3.fromRGB(153, 255, 102),
			Color3.fromRGB(101, 255, 91),
			Color3.fromRGB(50, 205, 50),
			Color3.fromRGB(124, 252, 0),
			Color3.fromRGB(178, 255, 102)
		}
		if p1352 then
			for _, v1355 in v1353 do
				local v1356 = v1355:Clone()
				v1356.Parent = p1352
				v1356.Enabled = true
				v1356:AddTag("Cleanup_Infernal")
			end
		end
		local v1357 = 0
		for _, v1358 in p1351:GetDescendants() do
			if v1358:IsA("BasePart") then
				v1357 = v1357 + 1
				v_u_15[v1358] = v_u_15[v1358] or v1358.Color
				v_u_18[v1358] = v_u_18[v1358] or v1358.Material
				v1358.Color = v1354[math.random(1, #v1354)]
				v1358.Material = Enum.Material.Neon
				v1358:AddTag("InfernalVisual")
				if v1357 % 3 == 0 then
					local v1359 = Instance.new("Attachment", v1358)
					local v1360 = Instance.new("Attachment", v1358)
					v1359.Position = Vector3.new(0, 0.15, 0)
					v1360.Position = Vector3.new(0, -0.15, 0)
					v1359:AddTag("Cleanup_Infernal")
					v1360:AddTag("Cleanup_Infernal")
					local v1361 = Instance.new("Trail")
					v1361.Color = ColorSequence.new(Color3.fromRGB(101, 255, 91))
					v1361.LightInfluence = 0
					v1361.Brightness = 3
					v1361.Attachment0 = v1359
					v1361.Attachment1 = v1360
					v1361.Lifetime = 0.3
					v1361.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v1361.WidthScale = NumberSequence.new(2)
					v1361.Parent = v1358
					v1361:AddTag("Cleanup_Infernal")
				end
				if v1358 ~= p1352 and #v1353 > 0 then
					local v1362 = v1353[math.random(1, #v1353)]:Clone()
					v1362.Parent = v1358
					v1362.Enabled = true
					v1362:AddTag("Cleanup_Infernal")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1363, p1364)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1367(p1365)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1366 in p1365:GetDescendants() do
				if v1366:HasTag("Cleanup_Infernal") then
					v1366:Destroy()
				end
				if v1366:HasTag("InfernalVisual") then
					v1366.Color = v_u_15[v1366] or v1366.Color
					v_u_15[v1366] = nil
					v1366:RemoveTag("InfernalVisual")
					if v_u_18[v1366] then
						v1366.Material = v_u_18[v1366]
						v_u_18[v1366] = nil
					end
				end
			end
		end
		if p1364 then
			v1367(p1364)
		end
		if p1363 then
			v1367(p1363)
		end
	end
}
v_u_925.Goldsparkle = {
	["Id"] = "GLDSPARKLE",
	["Name"] = "Goldsparkle",
	["ValueMulti"] = 500,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1368, p1369, p1370)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1368:_RemoveFX(p1369, p1370)
		local v1371 = game.ServerStorage.Mutation_FX.Goldsparkle:GetChildren()
		local v1372 = {
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(255, 213, 0),
			Color3.fromRGB(255, 179, 0),
			Color3.fromRGB(252, 188, 86),
			Color3.fromRGB(255, 213, 0)
		}
		if p1370 then
			for _, v1373 in v1371 do
				local v1374 = v1373:Clone()
				v1374.Parent = p1370
				v1374:AddTag("Cleanup_Goldsparkle")
			end
		end
		local v1375 = 0
		for _, v1376 in p1369:GetDescendants() do
			if v1376:IsA("BasePart") then
				v1375 = v1375 + 1
				v_u_15[v1376] = v_u_15[v1376] or v1376.Color
				v_u_18[v1376] = v_u_18[v1376] or v1376.Material
				v1376.Color = v1372[math.random(1, #v1372)]
				v1376.Material = Enum.Material.Neon
				v1376:AddTag("GoldsparkleVisual")
				if v1375 % 3 == 0 then
					local v1377 = Instance.new("Attachment", v1376)
					local v1378 = Instance.new("Attachment", v1376)
					v1377.Position = Vector3.new(0, 0.15, 0)
					v1378.Position = Vector3.new(0, -0.15, 0)
					v1377:AddTag("Cleanup_Goldsparkle")
					v1378:AddTag("Cleanup_Goldsparkle")
					local v1379 = Instance.new("Trail")
					v1379.Color = ColorSequence.new(Color3.fromRGB(101, 255, 91))
					v1379.LightInfluence = 0
					v1379.Brightness = 3
					v1379.Attachment0 = v1377
					v1379.Attachment1 = v1378
					v1379.Lifetime = 0.3
					v1379.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v1379.WidthScale = NumberSequence.new(2)
					v1379.Parent = v1376
					v1379:AddTag("Cleanup_Goldsparkle")
				end
				if v1376 ~= p1370 and #v1371 > 0 then
					local v1380 = v1371[math.random(1, #v1371)]:Clone()
					v1380.Parent = v1376
					v1380.Enabled = true
					v1380:AddTag("Cleanup_Goldsparkle")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1381, p1382)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1385(p1383)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1384 in p1383:GetDescendants() do
				if v1384:HasTag("Cleanup_Goldsparkle") then
					v1384:Destroy()
				end
				if v1384:HasTag("GoldsparkleVisual") then
					v1384.Color = v_u_15[v1384] or v1384.Color
					v_u_15[v1384] = nil
					v1384:RemoveTag("GoldsparkleVisual")
					if v_u_18[v1384] then
						v1384.Material = v_u_18[v1384]
						v_u_18[v1384] = nil
					end
				end
			end
		end
		if p1382 then
			v1385(p1382)
		end
		if p1381 then
			v1385(p1381)
		end
	end
}
v_u_925.Oil = {
	["Id"] = "OL",
	["Name"] = "Oil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(52, 52, 77),
	["_AddFX"] = function(p1386, p1387, p1388)
		p1386:_RemoveFX(p1387, p1388)
		if p1388 then
			for _, v1389 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v1390 = v1389:Clone()
				v1390.Parent = p1388
				v1390.Enabled = true
				v1390:AddTag("Cleanup_Oil")
				v1390:AddTag("Effect")
			end
		end
		for _, v1391 in p1387:GetDescendants() do
			if (v1391:IsA("BasePart") or v1391:IsA("UnionOperation")) and not v1391:HasTag("Effect") then
				v1391:AddTag("OilVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1392, p1393)
		-- upvalues: (copy) v_u_18
		if p1393 then
			for _, v1394 in p1393:GetChildren() do
				if v1394:HasTag("Cleanup_Oil") then
					v1394:Destroy()
				end
			end
		end
		for _, v1395 in p1392:GetDescendants() do
			if (v1395:IsA("BasePart") or v1395:IsA("UnionOperation")) and v1395:HasTag("OilVisual") then
				v1395:RemoveTag("OilVisual")
				local v1396 = v_u_18[v1395]
				if v1396 then
					v1395.Material = v1396
					v_u_18[v1395] = nil
				end
			end
		end
	end
}
v_u_925.Goldsparkle = {
	["Id"] = "GLDSPARKLE",
	["Name"] = "Goldsparkle",
	["ValueMulti"] = 500,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1397, p1398, p1399)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1397:_RemoveFX(p1398, p1399)
		local v1400 = game.ServerStorage.Mutation_FX.Goldsparkle:GetChildren()
		local v1401 = {
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(255, 213, 0),
			Color3.fromRGB(255, 179, 0),
			Color3.fromRGB(252, 188, 86),
			Color3.fromRGB(255, 213, 0)
		}
		if p1399 then
			for _, v1402 in v1400 do
				local v1403 = v1402:Clone()
				v1403.Parent = p1399
				v1403:AddTag("Cleanup_Goldsparkle")
			end
		end
		local v1404 = 0
		for _, v1405 in p1398:GetDescendants() do
			if v1405:IsA("BasePart") then
				v1404 = v1404 + 1
				v_u_15[v1405] = v_u_15[v1405] or v1405.Color
				v_u_18[v1405] = v_u_18[v1405] or v1405.Material
				v1405.Color = v1401[math.random(1, #v1401)]
				v1405.Material = Enum.Material.Neon
				v1405:AddTag("GoldsparkleVisual")
				if v1404 % 3 == 0 then
					local v1406 = Instance.new("Attachment", v1405)
					local v1407 = Instance.new("Attachment", v1405)
					v1406.Position = Vector3.new(0, 0.15, 0)
					v1407.Position = Vector3.new(0, -0.15, 0)
					v1406:AddTag("Cleanup_Goldsparkle")
					v1407:AddTag("Cleanup_Goldsparkle")
					local v1408 = Instance.new("Trail")
					v1408.Color = ColorSequence.new(Color3.fromRGB(101, 255, 91))
					v1408.LightInfluence = 0
					v1408.Brightness = 3
					v1408.Attachment0 = v1406
					v1408.Attachment1 = v1407
					v1408.Lifetime = 0.3
					v1408.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v1408.WidthScale = NumberSequence.new(2)
					v1408.Parent = v1405
					v1408:AddTag("Cleanup_Goldsparkle")
				end
				if v1405 ~= p1399 and #v1400 > 0 then
					local v1409 = v1400[math.random(1, #v1400)]:Clone()
					v1409.Parent = v1405
					v1409.Enabled = true
					v1409:AddTag("Cleanup_Goldsparkle")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1410, p1411)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1414(p1412)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1413 in p1412:GetDescendants() do
				if v1413:HasTag("Cleanup_Goldsparkle") then
					v1413:Destroy()
				end
				if v1413:HasTag("GoldsparkleVisual") then
					v1413.Color = v_u_15[v1413] or v1413.Color
					v_u_15[v1413] = nil
					v1413:RemoveTag("GoldsparkleVisual")
					if v_u_18[v1413] then
						v1413.Material = v_u_18[v1413]
						v_u_18[v1413] = nil
					end
				end
			end
		end
		if p1411 then
			v1414(p1411)
		end
		if p1410 then
			v1414(p1410)
		end
	end
}
v_u_925.Oil = {
	["Id"] = "OL",
	["Name"] = "Oil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(52, 52, 77),
	["_AddFX"] = function(p1415, p1416, p1417)
		p1415:_RemoveFX(p1416, p1417)
		if p1417 then
			for _, v1418 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v1419 = v1418:Clone()
				v1419.Parent = p1417
				v1419.Enabled = true
				v1419:AddTag("Cleanup_Oil")
				v1419:AddTag("Effect")
			end
		end
		for _, v1420 in p1416:GetDescendants() do
			if (v1420:IsA("BasePart") or v1420:IsA("UnionOperation")) and not v1420:HasTag("Effect") then
				v1420:AddTag("OilVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1421, p1422)
		-- upvalues: (copy) v_u_18
		if p1422 then
			for _, v1423 in p1422:GetChildren() do
				if v1423:HasTag("Cleanup_Oil") then
					v1423:Destroy()
				end
			end
		end
		for _, v1424 in p1421:GetDescendants() do
			if (v1424:IsA("BasePart") or v1424:IsA("UnionOperation")) and v1424:HasTag("OilVisual") then
				v1424:RemoveTag("OilVisual")
				local v1425 = v_u_18[v1424]
				if v1425 then
					v1424.Material = v1425
					v_u_18[v1424] = nil
				end
			end
		end
	end
}
v_u_925.Boil = {
	["Id"] = "BOL",
	["Name"] = "Boil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(150, 178, 225),
	["_AddFX"] = function(p1426, p1427, p1428)
		p1426:_RemoveFX(p1427, p1428)
		if p1428 then
			for _, v1429 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
				local v1430 = v1429:Clone()
				v1430.Parent = p1428
				v1430.Enabled = true
				v1430:AddTag("Cleanup_Boil")
				v1430:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1431)
		if p1431 then
			for _, v1432 in p1431:GetChildren() do
				if v1432:HasTag("Cleanup_Boil") then
					v1432:Destroy()
				end
			end
		end
	end
}
v_u_925.OilBoil = {
	["Id"] = "OB",
	["Name"] = "OilBoil",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(99, 118, 149),
	["_AddFX"] = function(p1433, p1434, p1435)
		p1433:_RemoveFX(p1434, p1435)
		if p1435 then
			for _, v1436 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v1437 = v1436:Clone()
				v1437.Parent = p1435
				v1437.Enabled = true
				v1437:AddTag("Cleanup_OilBoil")
				v1437:AddTag("Effect")
			end
		end
		if p1435 then
			for _, v1438 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
				local v1439 = v1438:Clone()
				v1439.Parent = p1435
				v1439.Enabled = true
				v1439:AddTag("Cleanup_OilBoil")
				v1439:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1440)
		if p1440 then
			for _, v1441 in p1440:GetChildren() do
				if v1441:HasTag("Cleanup_OilBoil") then
					v1441:Destroy()
				end
			end
		end
	end
}
v_u_925.Fortune = {
	["Id"] = "FR",
	["Name"] = "Fortune",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 192, 5),
	["_AddFX"] = function(p1442, p1443, p1444)
		p1442:_RemoveFX(p1443, p1444)
		if p1444 then
			for _, v1445 in game.ServerStorage.Mutation_FX.Fortune:GetChildren() do
				local v1446 = v1445:Clone()
				v1446.Parent = p1444
				v1446.Enabled = true
				v1446:AddTag("Cleanup_Fortune")
				v1446:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1447)
		if p1447 then
			for _, v1448 in p1447:GetChildren() do
				if v1448:HasTag("Cleanup_Fortune") then
					v1448:Destroy()
				end
			end
		end
	end
}
v_u_925.Bloom = {
	["Id"] = "BL",
	["Name"] = "Bloom",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(170, 255, 0),
	["_AddFX"] = function(p1449, p1450, p1451)
		p1449:_RemoveFX(p1450, p1451)
		local v1452 = game.ServerStorage.Mutation_FX.Bloom:GetChildren()
		if p1451 then
			for _, v1453 in v1452 do
				if not p1451:FindFirstChild(v1453.Name) then
					local v1454 = v1453:Clone()
					v1454.Parent = p1451
					v1454.Enabled = true
					v1454:AddTag("Cleanup_Bloom")
					v1454:AddTag("Effect")
				end
			end
		end
		local v1455 = {}
		for _, v1456 in p1450:GetDescendants() do
			if v1456:IsA("BasePart") and v1456 ~= p1451 then
				table.insert(v1455, v1456)
			end
		end
		(function(p1457)
			for v1458 = #p1457, 2, -1 do
				local v1459 = math.random(1, v1458)
				local v1460 = p1457[v1459]
				local v1461 = p1457[v1458]
				p1457[v1458] = v1460
				p1457[v1459] = v1461
			end
			return p1457
		end)(v1455)
		local v1462 = #v1455 * 0.25 + 0.5
		for v1463 = 1, math.floor(v1462) do
			local v1464 = v1455[v1463]
			local v1465 = v1452[math.random(1, #v1452)]:Clone()
			v1465.Parent = v1464
			v1465.Enabled = true
			v1465:AddTag("Cleanup_Bloom")
			v1465:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1466, p1467)
		local function v1470(p1468)
			for _, v1469 in p1468:GetDescendants() do
				if v1469:HasTag("Cleanup_Bloom") then
					v1469:Destroy()
				end
			end
		end
		if p1467 then
			v1470(p1467)
		end
		if p1466 then
			v1470(p1466)
		end
	end
}
v_u_925.Rot = {
	["Id"] = "RO",
	["Name"] = "Rot",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 0, 127),
	["_AddFX"] = function(p1471, p1472, p1473)
		p1471:_RemoveFX(p1472, p1473)
		local v1474 = game.ServerStorage.Mutation_FX.Rot:GetChildren()
		if p1473 then
			for _, v1475 in v1474 do
				if not p1473:FindFirstChild(v1475.Name) then
					local v1476 = v1475:Clone()
					v1476.Parent = p1473
					v1476.Enabled = true
					v1476:AddTag("Cleanup_Rot")
					v1476:AddTag("Effect")
				end
			end
		end
		local v1477 = {}
		for _, v1478 in p1472:GetDescendants() do
			if v1478:IsA("BasePart") and v1478 ~= p1473 then
				table.insert(v1477, v1478)
			end
		end
		(function(p1479)
			for v1480 = #p1479, 2, -1 do
				local v1481 = math.random(1, v1480)
				local v1482 = p1479[v1481]
				local v1483 = p1479[v1480]
				p1479[v1480] = v1482
				p1479[v1481] = v1483
			end
			return p1479
		end)(v1477)
		local v1484 = #v1477 * 0.25 + 0.5
		for v1485 = 1, math.floor(v1484) do
			local v1486 = v1477[v1485]
			local v1487 = v1474[math.random(1, #v1474)]:Clone()
			v1487.Parent = v1486
			v1487.Enabled = true
			v1487:AddTag("Cleanup_Rot")
			v1487:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1488, p1489)
		local function v1492(p1490)
			for _, v1491 in p1490:GetDescendants() do
				if v1491:HasTag("Cleanup_Rot") then
					v1491:Destroy()
				end
			end
		end
		if p1489 then
			v1492(p1489)
		end
		if p1488 then
			v1492(p1488)
		end
	end
}
v_u_925.Gloom = {
	["Id"] = "GL",
	["Name"] = "Gloom",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(85, 85, 127),
	["_AddFX"] = function(p1493, p1494, p1495)
		p1493:_RemoveFX(p1494, p1495)
		local v1496 = game.ServerStorage.Mutation_FX.Gloom:GetChildren()
		if p1495 then
			for _, v1497 in v1496 do
				if not p1495:FindFirstChild(v1497.Name) then
					local v1498 = v1497:Clone()
					v1498.Parent = p1495
					v1498.Enabled = true
					v1498:AddTag("Cleanup_Gloom")
					v1498:AddTag("Effect")
				end
			end
		end
		local v1499 = {}
		for _, v1500 in p1494:GetDescendants() do
			if v1500:IsA("BasePart") and v1500 ~= p1495 then
				table.insert(v1499, v1500)
			end
		end
		(function(p1501)
			for v1502 = #p1501, 2, -1 do
				local v1503 = math.random(1, v1502)
				local v1504 = p1501[v1503]
				local v1505 = p1501[v1502]
				p1501[v1502] = v1504
				p1501[v1503] = v1505
			end
			return p1501
		end)(v1499)
		local v1506 = #v1499 * 0.25 + 0.5
		for v1507 = 1, math.floor(v1506) do
			local v1508 = v1499[v1507]
			local v1509 = v1496[math.random(1, #v1496)]:Clone()
			v1509.Parent = v1508
			v1509.Enabled = true
			v1509:AddTag("Cleanup_Gloom")
			v1509:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1510, p1511)
		local function v1514(p1512)
			for _, v1513 in p1512:GetDescendants() do
				if v1513:HasTag("Cleanup_Gloom") then
					v1513:Destroy()
				end
			end
		end
		if p1511 then
			v1514(p1511)
		end
		if p1510 then
			v1514(p1510)
		end
	end
}
v_u_925.Blight = {
	["Id"] = "BT",
	["Name"] = "Blight",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(170, 0, 255),
	["_AddFX"] = function(p1515, p1516, p1517)
		p1515:_RemoveFX(p1516, p1517)
		local v1518 = game.ServerStorage.Mutation_FX.Blight:GetChildren()
		if p1517 then
			for _, v1519 in v1518 do
				if not p1517:FindFirstChild(v1519.Name) then
					local v1520 = v1519:Clone()
					v1520.Parent = p1517
					v1520.Enabled = true
					v1520:AddTag("Cleanup_Blight")
					v1520:AddTag("Effect")
				end
			end
		end
		local v1521 = {}
		for _, v1522 in p1516:GetDescendants() do
			if v1522:IsA("BasePart") and v1522 ~= p1517 then
				table.insert(v1521, v1522)
			end
		end
		(function(p1523)
			for v1524 = #p1523, 2, -1 do
				local v1525 = math.random(1, v1524)
				local v1526 = p1523[v1525]
				local v1527 = p1523[v1524]
				p1523[v1524] = v1526
				p1523[v1525] = v1527
			end
			return p1523
		end)(v1521)
		local v1528 = #v1521 * 0.25 + 0.5
		for v1529 = 1, math.floor(v1528) do
			local v1530 = v1521[v1529]
			local v1531 = v1518[math.random(1, #v1518)]:Clone()
			v1531.Parent = v1530
			v1531.Enabled = true
			v1531:AddTag("Cleanup_Blight")
			v1531:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1532, p1533)
		local function v1536(p1534)
			for _, v1535 in p1534:GetDescendants() do
				if v1535:HasTag("Cleanup_Blight") then
					v1535:Destroy()
				end
			end
		end
		if p1533 then
			v1536(p1533)
		end
		if p1532 then
			v1536(p1532)
		end
	end
}
v_u_925.Pestilent = {
	["Id"] = "PE",
	["Name"] = "Pestilent",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 85, 0),
	["_AddFX"] = function(p1537, p1538, p1539)
		p1537:_RemoveFX(p1538, p1539)
		local v1540 = game.ServerStorage.Mutation_FX.Pestilent:GetChildren()
		if p1539 then
			for _, v1541 in v1540 do
				if not p1539:FindFirstChild(v1541.Name) then
					local v1542 = v1541:Clone()
					v1542.Parent = p1539
					v1542.Enabled = true
					v1542:AddTag("Cleanup_Pestilent")
					v1542:AddTag("Effect")
				end
			end
		end
		local v1543 = {}
		for _, v1544 in p1538:GetDescendants() do
			if v1544:IsA("BasePart") and v1544 ~= p1539 then
				table.insert(v1543, v1544)
			end
		end
		(function(p1545)
			for v1546 = #p1545, 2, -1 do
				local v1547 = math.random(1, v1546)
				local v1548 = p1545[v1547]
				local v1549 = p1545[v1546]
				p1545[v1546] = v1548
				p1545[v1547] = v1549
			end
			return p1545
		end)(v1543)
		local v1550 = #v1543 * 0.25 + 0.5
		for v1551 = 1, math.floor(v1550) do
			local v1552 = v1543[v1551]
			local v1553 = v1540[math.random(1, #v1540)]:Clone()
			v1553.Parent = v1552
			v1553.Enabled = true
			v1553:AddTag("Cleanup_Pestilent")
			v1553:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1554, p1555)
		local function v1558(p1556)
			for _, v1557 in p1556:GetDescendants() do
				if v1557:HasTag("Cleanup_Pestilent") then
					v1557:Destroy()
				end
			end
		end
		if p1555 then
			v1558(p1555)
		end
		if p1554 then
			v1558(p1554)
		end
	end
}
v_u_925.Umbral = {
	["Id"] = "UM",
	["Name"] = "Umbral",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(30, 20, 55),
	["_AddFX"] = function(p1559, p1560, p1561)
		p1559:_RemoveFX(p1560, p1561)
		local v1562 = game.ServerStorage.Mutation_FX.Umbral:GetChildren()
		if p1561 then
			for _, v1563 in v1562 do
				if not p1561:FindFirstChild(v1563.Name) then
					local v1564 = v1563:Clone()
					v1564.Parent = p1561
					v1564.Enabled = true
					v1564:AddTag("Cleanup_Umbral")
					v1564:AddTag("Effect")
				end
			end
		end
		local v1565 = {}
		for _, v1566 in p1560:GetDescendants() do
			if v1566:IsA("BasePart") and v1566 ~= p1561 then
				table.insert(v1565, v1566)
			end
		end
		(function(p1567)
			for v1568 = #p1567, 2, -1 do
				local v1569 = math.random(1, v1568)
				local v1570 = p1567[v1569]
				local v1571 = p1567[v1568]
				p1567[v1568] = v1570
				p1567[v1569] = v1571
			end
			return p1567
		end)(v1565)
		local v1572 = #v1565 * 0.25 + 0.5
		for v1573 = 1, math.floor(v1572) do
			local v1574 = v1565[v1573]
			local v1575 = v1562[math.random(1, #v1562)]:Clone()
			v1575.Parent = v1574
			v1575.Enabled = true
			v1575:AddTag("Cleanup_Umbral")
			v1575:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1576, p1577)
		local function v1580(p1578)
			for _, v1579 in p1578:GetDescendants() do
				if v1579:HasTag("Cleanup_Umbral") then
					v1579:Destroy()
				end
			end
		end
		if p1577 then
			v1580(p1577)
		end
		if p1576 then
			v1580(p1576)
		end
	end
}
v_u_925.Shadowbound = {
	["Id"] = "SH",
	["Name"] = "Shadowbound",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(25, 25, 45),
	["_AddFX"] = function(p1581, p1582, p1583)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1581:_RemoveFX(p1582, p1583)
		local v1584 = game.ServerStorage.Mutation_FX.Shadowbound:GetChildren()
		if #v1584 ~= 0 then
			if p1583 then
				for _, v1585 in v1584 do
					local v1586 = v1585:Clone()
					v1586.Parent = p1583
					v1586.Enabled = true
					v1586:AddTag("Cleanup_Shadowbound")
					v1586:AddTag("Effect")
				end
			end
			for _, v1587 in p1582:GetDescendants() do
				if v1587:IsA("BasePart") then
					v_u_15[v1587] = v_u_15[v1587] or v1587.Color
					v_u_18[v1587] = v_u_18[v1587] or v1587.Material
					v1587.Color = Color3.fromRGB(25, 25, 45)
					v1587.Material = Enum.Material.ForceField
					v1587.Transparency = 0.5
					v1587:AddTag("ShadowboundVisual")
				end
			end
			local v1588 = {}
			for _, v1589 in p1582:GetDescendants() do
				if v1589:IsA("BasePart") and (v1589 ~= p1583 and not v1589:HasTag("Effect")) then
					table.insert(v1588, v1589)
				end
			end
			for v1590, v1591 in ipairs(v1588) do
				if v1590 % 2 == 0 then
					local v1592 = v1584[math.random(1, #v1584)]:Clone()
					v1592.Parent = v1591
					v1592.Enabled = true
					v1592:AddTag("Cleanup_Shadowbound")
					v1592:AddTag("Effect")
					if math.random() < 0.25 then
						local v1593 = v1584[math.random(1, #v1584)]:Clone()
						v1593.Parent = v1591
						v1593.Enabled = true
						v1593:AddTag("Cleanup_Shadowbound")
						v1593:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1594, p1595)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1598(p1596)
			for _, v1597 in p1596:GetDescendants() do
				if v1597:HasTag("Cleanup_Shadowbound") then
					v1597:Destroy()
				end
			end
		end
		if p1595 then
			v1598(p1595)
		end
		if p1594 then
			v1598(p1594)
		end
		for _, v1599 in p1594:GetDescendants() do
			if v1599:IsA("BasePart") and v1599:HasTag("ShadowboundVisual") then
				v1599:RemoveTag("ShadowboundVisual")
				v1599.Color = v_u_15[v1599] or v1599.Color
				v_u_15[v1599] = nil
				local v1600 = v_u_18[v1599]
				if v1600 then
					v1599.Material = v1600
					v_u_18[v1599] = nil
				end
				v1599.Transparency = 0
			end
		end
	end
}
v_u_925.Necrotic = {
	["Id"] = "NC",
	["Name"] = "Necrotic",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 85, 255),
	["_AddFX"] = function(p1601, p1602, p1603)
		p1601:_RemoveFX(p1602, p1603)
		local v1604 = game.ServerStorage.Mutation_FX.Necrotic:GetChildren()
		if p1603 then
			for _, v1605 in v1604 do
				if not p1603:FindFirstChild(v1605.Name) then
					local v1606 = v1605:Clone()
					v1606.Parent = p1603
					v1606.Enabled = true
					v1606:AddTag("Cleanup_Necrotic")
					v1606:AddTag("Effect")
				end
			end
		end
		local v1607 = {}
		for _, v1608 in p1602:GetDescendants() do
			if v1608:IsA("BasePart") and v1608 ~= p1603 then
				table.insert(v1607, v1608)
			end
		end
		(function(p1609)
			for v1610 = #p1609, 2, -1 do
				local v1611 = math.random(1, v1610)
				local v1612 = p1609[v1611]
				local v1613 = p1609[v1610]
				p1609[v1610] = v1612
				p1609[v1611] = v1613
			end
			return p1609
		end)(v1607)
		local v1614 = #v1607 * 0.25 + 0.5
		for v1615 = 1, math.floor(v1614) do
			local v1616 = v1607[v1615]
			local v1617 = v1604[math.random(1, #v1604)]:Clone()
			v1617.Parent = v1616
			v1617.Enabled = true
			v1617:AddTag("Cleanup_Necrotic")
			v1617:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1618, p1619)
		local function v1622(p1620)
			for _, v1621 in p1620:GetDescendants() do
				if v1621:HasTag("Cleanup_Necrotic") then
					v1621:Destroy()
				end
			end
		end
		if p1619 then
			v1622(p1619)
		end
		if p1618 then
			v1622(p1618)
		end
	end
}
v_u_925.Cyclonic = {
	["Id"] = "CY",
	["Name"] = "Cyclonic",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(130, 230, 255),
	["_AddFX"] = function(p1623, p1624, p1625)
		p1623:_RemoveFX(p1624, p1625)
		local v1626 = game.ServerStorage.Mutation_FX.Cyclonic:GetChildren()
		if p1625 then
			for _, v1627 in v1626 do
				if not p1625:FindFirstChild(v1627.Name) then
					local v1628 = v1627:Clone()
					v1628.Parent = p1625
					v1628.Enabled = true
					v1628:AddTag("Cleanup_Cyclonic")
				end
			end
		end
		local v1629 = 0
		for _, v1630 in p1624:GetDescendants() do
			if v1630:IsA("BasePart") and v1630 ~= p1625 then
				v1629 = v1629 + 1
				if v1629 % 2 == 0 then
					local v1631 = v1626[math.random(1, #v1626)]:Clone()
					v1631.Parent = v1630
					v1631.Enabled = true
					v1631:AddTag("Cleanup_Cyclonic")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1632, p1633)
		local function v1636(p1634)
			for _, v1635 in p1634:GetDescendants() do
				if v1635:HasTag("Cleanup_Cyclonic") then
					v1635:Destroy()
				end
			end
		end
		if p1633 then
			v1636(p1633)
		end
		if p1632 then
			v1636(p1632)
		end
	end
}
v_u_925.Maelstrom = {
	["Id"] = "MS",
	["Name"] = "Maelstrom",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(0, 60, 255),
	["_AddFX"] = function(p1637, p1638, p1639)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1637:_RemoveFX(p1638, p1639)
		local v1640 = game.ServerStorage.Mutation_FX.Maelstrom:GetChildren()
		local v1641 = {
			["Stars1"] = true
		}
		if p1639 then
			for _, v1642 in v1640 do
				if not p1639:FindFirstChild(v1642.Name) then
					local v1643 = v1642:Clone()
					v1643.Parent = p1639
					v1643.Enabled = true
					v1643:AddTag("Cleanup_Maelstrom")
				end
			end
		end
		local v1644 = {}
		for _, v1645 in p1638:GetDescendants() do
			if v1645:IsA("BasePart") and v1645 ~= p1639 then
				table.insert(v1644, v1645)
				for _, v1646 in v1640 do
					if v1641[v1646.Name] then
						local v1647 = v1646:Clone()
						v1647.Parent = v1645
						v1647.Enabled = true
						v1647:AddTag("Cleanup_Maelstrom")
					end
				end
			end
		end
		for _, v1648 in v1644 do
			if Random.new():NextNumber() < 0.5 then
				v_u_15[v1648] = v_u_15[v1648] or v1648.Color
				v_u_18[v1648] = v_u_18[v1648] or v1648.Material
				v1648.Color = Color3.fromRGB(0, 186, 186)
				v1648.Material = Enum.Material.Neon
				v1648:AddTag("MaelstromVisual")
			end
		end
		local v1649 = {}
		for _, v1650 in v1640 do
			if not v1641[v1650.Name] then
				table.insert(v1649, v1650)
			end
		end
		for v1651, v1652 in v1644 do
			if v1651 % 2 == 0 and #v1649 > 0 then
				local v1653 = v1649[math.random(1, #v1649)]:Clone()
				v1653.Parent = v1652
				v1653.Enabled = true
				v1653:AddTag("Cleanup_Maelstrom")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1654, p1655)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1658(p1656)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v1657 in p1656:GetDescendants() do
				if v1657:HasTag("Cleanup_Maelstrom") then
					v1657:Destroy()
				end
				if v1657:HasTag("MaelstromVisual") then
					v1657.Color = v_u_15[v1657] or v1657.Color
					v_u_15[v1657] = nil
					if v_u_18[v1657] then
						v1657.Material = v_u_18[v1657]
						v_u_18[v1657] = nil
					end
					v1657:RemoveTag("MaelstromVisual")
				end
			end
		end
		if p1655 then
			v1658(p1655)
		end
		if p1654 then
			v1658(p1654)
		end
	end
}
v_u_925.Stormcharged = {
	["Id"] = "SC",
	["Name"] = "Stormcharged",
	["ValueMulti"] = 180,
	["Color"] = Color3.fromRGB(148, 226, 255),
	["_AddFX"] = function(p1659, p1660, p1661)
		p1659:_RemoveFX(p1660, p1661)
		local v1662 = {}
		for _, v1663 in { game.ServerStorage.Mutation_FX.Shocked:GetChildren(), game.ServerStorage.Mutation_FX.Static:GetChildren(), game.ServerStorage.Mutation_FX.Tempestuous:GetChildren() } do
			for _, v1664 in v1663 do
				table.insert(v1662, v1664)
			end
		end
		if p1661 then
			for _, v1665 in v1662 do
				if not p1661:FindFirstChild(v1665.Name) then
					local v1666 = v1665:Clone()
					v1666.Color = ColorSequence.new(Color3.fromRGB(148, 226, 255))
					v1666.Parent = p1661
					v1666.Enabled = true
					v1666:AddTag("Cleanup_Stormcharged")
				end
			end
		end
		local v1667 = {}
		for _, v1668 in p1660:GetDescendants() do
			if v1668:IsA("BasePart") and v1668 ~= p1661 then
				table.insert(v1667, v1668)
			end
		end
		local v1669 = Random.new()
		local v1670 = Color3.fromRGB(255, 255, 100)
		local v1671 = Color3.fromRGB(0, 60, 255)
		for _, v1672 in v1667 do
			if #v1662 > 0 then
				local v1673 = v1662[v1669:NextInteger(1, #v1662)]:Clone()
				v1673.Color = ColorSequence.new(Color3.fromRGB(148, 226, 255))
				v1673.Parent = v1672
				v1673.Enabled = true
				v1673:AddTag("Cleanup_Stormcharged")
			end
			v1672.Color = v1669:NextNumber() < 0.5 and v1670 and v1670 or v1671
			v1672.Material = Enum.Material.Neon
			v1672:AddTag("StormchargedVisual")
		end
	end,
	["_RemoveFX"] = function(_, p1674, p1675)
		local function v1678(p1676)
			for _, v1677 in p1676:GetDescendants() do
				if v1677:HasTag("Cleanup_Stormcharged") then
					v1677:Destroy()
				end
				if v1677:HasTag("StormchargedVisual") then
					v1677:RemoveTag("StormchargedVisual")
					v1677.Material = Enum.Material.Plastic
				end
			end
		end
		if p1675 then
			v1678(p1675)
		end
		if p1674 then
			v1678(p1674)
		end
	end
}
v_u_925.Cosmic = {
	["Id"] = "CS",
	["Name"] = "Cosmic",
	["ValueMulti"] = 240,
	["Color"] = Color3.fromRGB(171, 171, 255),
	["_AddFX"] = function(p1679, p1680, p1681)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1679:_RemoveFX(p1680, p1681)
		local v1682 = game.ServerStorage.Mutation_FX.Cosmic:GetChildren()
		local v1683 = #v1682
		if p1681 then
			for _, v1684 in v1682 do
				if not p1681:FindFirstChild(v1684.Name) then
					local v1685 = v1684:Clone()
					v1685.Parent = p1681
					v1685.Enabled = true
					v1685:AddTag("Cleanup_Cosmic")
				end
			end
		end
		local v1686 = 0
		for _, v1687 in p1680:GetDescendants() do
			if v1687:IsA("BasePart") and v1687 ~= p1681 then
				v1686 = v1686 + 1
				if v1683 > 0 then
					local v1688 = v1682[math.random(1, v1683)]:Clone()
					v1688.Parent = v1687
					v1688.Enabled = true
					v1688:AddTag("Cleanup_Cosmic")
				end
				if not v1687:HasTag("Effect") then
					v_u_15[v1687] = v_u_15[v1687] or v1687.Color
					v_u_18[v1687] = v_u_18[v1687] or v1687.Material
					if math.random() < 0.5 then
						v1687.Color = Color3.fromRGB(255, 255, 100)
					else
						v1687.Color = Color3.fromRGB(171, 171, 255)
					end
					v1687.Material = Enum.Material.Neon
					v1687:AddTag("CosmicVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1689, p1690)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1693(p1691)
			for _, v1692 in p1691:GetDescendants() do
				if v1692:HasTag("Cleanup_Cosmic") then
					v1692:Destroy()
				end
			end
		end
		if p1690 then
			v1693(p1690)
		end
		if p1689 then
			v1693(p1689)
		end
		for _, v1694 in p1689:GetDescendants() do
			if (v1694:IsA("BasePart") or v1694:IsA("UnionOperation")) and v1694:HasTag("CosmicVisual") then
				v1694.Color = v_u_15[v1694] or v1694.Color
				v_u_15[v1694] = nil
				v1694.Material = v_u_18[v1694] or v1694.Material
				v_u_18[v1694] = nil
				v1694:RemoveTag("CosmicVisual")
			end
		end
	end
}
v_u_925.Webbed = {
	["Id"] = "WB",
	["Name"] = "Webbed",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1695, p1696, p1697)
		p1695:_RemoveFX(p1696, p1697)
		local v1698 = game.ServerStorage.Mutation_FX.Webbed:GetChildren()
		if p1697 then
			for _, v1699 in v1698 do
				if not p1697:FindFirstChild(v1699.Name) then
					local v1700 = v1699:Clone()
					v1700.Parent = p1697
					v1700.Enabled = true
					v1700:AddTag("Cleanup_Webbed")
					v1700:AddTag("Effect")
				end
			end
		end
		local v1701 = {}
		for _, v1702 in p1696:GetDescendants() do
			if v1702:IsA("BasePart") and v1702 ~= p1697 then
				table.insert(v1701, v1702)
			end
		end
		(function(p1703)
			for v1704 = #p1703, 2, -1 do
				local v1705 = math.random(1, v1704)
				local v1706 = p1703[v1705]
				local v1707 = p1703[v1704]
				p1703[v1704] = v1706
				p1703[v1705] = v1707
			end
			return p1703
		end)(v1701)
		local v1708 = #v1701 * 0.25 + 0.5
		for v1709 = 1, math.floor(v1708) do
			local v1710 = v1701[v1709]
			local v1711 = v1698[math.random(1, #v1698)]:Clone()
			v1711.Parent = v1710
			v1711.Enabled = true
			v1711:AddTag("Cleanup_Webbed")
			v1711:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1712, p1713)
		local function v1716(p1714)
			for _, v1715 in p1714:GetDescendants() do
				if v1715:HasTag("Cleanup_Webbed") then
					v1715:Destroy()
				end
			end
		end
		if p1713 then
			v1716(p1713)
		end
		if p1712 then
			v1716(p1712)
		end
	end
}
v_u_925.Astral = {
	["Id"] = "AS",
	["Name"] = "Astral",
	["ValueMulti"] = 365,
	["Color"] = Color3.fromRGB(255, 255, 100),
	["_AddFX"] = function(p1717, p1718, p1719)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1717:_RemoveFX(p1718, p1719)
		local v1720 = game.ServerStorage.Mutation_FX.Astral:GetChildren()
		local v1721 = #v1720
		if p1719 then
			for _, v1722 in v1720 do
				if not p1719:FindFirstChild(v1722.Name) then
					local v1723 = v1722:Clone()
					v1723.Parent = p1719
					v1723.Enabled = true
					v1723:AddTag("Cleanup_Astral")
				end
			end
		end
		local v1724 = 0
		for _, v1725 in p1718:GetDescendants() do
			if v1725:IsA("BasePart") and v1725 ~= p1719 then
				v1724 = v1724 + 1
				if v1721 > 0 then
					local v1726 = v1720[math.random(1, v1721)]:Clone()
					v1726.Parent = v1725
					v1726.Enabled = true
					v1726:AddTag("Cleanup_Astral")
				end
				if not v1725:HasTag("Effect") then
					v_u_15[v1725] = v_u_15[v1725] or v1725.Color
					v_u_18[v1725] = v_u_18[v1725] or v1725.Material
					if math.random() < 0.5 then
						v1725.Color = Color3.fromRGB(255, 255, 100)
					else
						v1725.Color = Color3.fromRGB(255, 170, 255)
					end
					v1725.Material = Enum.Material.Neon
					v1725:AddTag("AstralVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1727, p1728)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1731(p1729)
			for _, v1730 in p1729:GetDescendants() do
				if v1730:HasTag("Cleanup_Astral") then
					v1730:Destroy()
				end
			end
		end
		if p1728 then
			v1731(p1728)
		end
		if p1727 then
			v1731(p1727)
		end
		for _, v1732 in p1727:GetDescendants() do
			if (v1732:IsA("BasePart") or v1732:IsA("UnionOperation")) and v1732:HasTag("AstralVisual") then
				v1732.Color = v_u_15[v1732] or v1732.Color
				v_u_15[v1732] = nil
				v1732.Material = v_u_18[v1732] or v1732.Material
				v_u_18[v1732] = nil
				v1732:RemoveTag("AstralVisual")
			end
		end
	end
}
v_u_925.Abyssal = {
	["Id"] = "AB",
	["Name"] = "Abyssal",
	["ValueMulti"] = 240,
	["Color"] = Color3.fromRGB(85, 0, 127),
	["_AddFX"] = function(p1733, p1734, p1735)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1733:_RemoveFX(p1734, p1735)
		local v1736 = game.ServerStorage.Mutation_FX.Abyssal:GetChildren()
		local _ = #v1736
		local v1737 = {}
		for _, v1738 in v1736 do
			if v1738.Name ~= "Blackhole" then
				table.insert(v1737, v1738)
			end
		end
		if p1735 then
			for _, v1739 in v1736 do
				if not p1735:FindFirstChild(v1739.Name) then
					local v1740 = v1739:Clone()
					v1740.Parent = p1735
					v1740.Enabled = true
					v1740:AddTag("Cleanup_Abyssal")
				end
			end
		end
		local v1741 = 0
		for _, v1742 in p1734:GetDescendants() do
			if v1742:IsA("BasePart") and v1742 ~= p1735 then
				v1741 = v1741 + 1
				if #v1737 > 0 then
					local v1743 = v1737[math.random(1, #v1737)]:Clone()
					v1743.Parent = v1742
					v1743.Enabled = true
					v1743:AddTag("Cleanup_Abyssal")
				end
				if not v1742:HasTag("Effect") then
					v_u_15[v1742] = v_u_15[v1742] or v1742.Color
					v_u_18[v1742] = v_u_18[v1742] or v1742.Material
					if math.random() < 0.5 then
						v1742.Color = Color3.fromRGB(170, 0, 255)
					else
						v1742.Color = Color3.fromRGB(85, 0, 127)
					end
					v1742.Material = Enum.Material.Neon
					v1742:AddTag("AbyssalVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1744, p1745)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1748(p1746)
			for _, v1747 in p1746:GetDescendants() do
				if v1747:HasTag("Cleanup_Abyssal") then
					v1747:Destroy()
				end
			end
		end
		if p1745 then
			v1748(p1745)
		end
		if p1744 then
			v1748(p1744)
		end
		for _, v1749 in p1744:GetDescendants() do
			if (v1749:IsA("BasePart") or v1749:IsA("UnionOperation")) and v1749:HasTag("AbyssalVisual") then
				v1749.Color = v_u_15[v1749] or v1749.Color
				v_u_15[v1749] = nil
				v1749.Material = v_u_18[v1749] or v1749.Material
				v_u_18[v1749] = nil
				v1749:RemoveTag("AbyssalVisual")
			end
		end
	end
}
v_u_925.Graceful = {
	["Id"] = "GR",
	["Name"] = "Graceful",
	["ValueMulti"] = 77,
	["Color"] = Color3.fromRGB(240, 240, 255),
	["_AddFX"] = function(p1750, p1751, p1752)
		p1750:_RemoveFX(p1751, p1752)
		local v1753 = game.ServerStorage.Mutation_FX.Graceful:GetChildren()
		local v1754 = 0
		for _, v1755 in p1751:GetDescendants() do
			if v1755:IsA("BasePart") then
				v1754 = v1754 + 1
				if v1754 % 2 == 0 then
					for _, v1756 in v1753 do
						local v1757 = v1756:Clone()
						v1757.Parent = v1755
						v1757.Enabled = true
						v1757:AddTag("Cleanup_Graceful")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1758, p1759)
		local function v1762(p1760)
			for _, v1761 in p1760:GetDescendants() do
				if v1761:HasTag("Cleanup_Graceful") then
					v1761:Destroy()
				end
			end
		end
		if p1759 then
			v1762(p1759)
		end
		if p1758 then
			v1762(p1758)
		end
	end
}
v_u_925.Jackpot = {
	["Id"] = "JA",
	["Name"] = "Jackpot",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 215, 0),
	["_AddFX"] = function(p1763, p1764, p1765)
		p1763:_RemoveFX(p1764, p1765)
		if p1765 then
			for _, v1766 in game.ServerStorage.Mutation_FX.Jackpot:GetChildren() do
				local v1767 = v1766:Clone()
				v1767.Parent = p1765
				v1767:AddTag("Cleanup_Jackpot")
				if v1767:IsA("ParticleEmitter") then
					v1767.Enabled = true
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1768)
		local function v1771(p1769)
			for _, v1770 in p1769:GetDescendants() do
				if v1770:HasTag("Cleanup_Jackpot") then
					v1770:Destroy()
				end
			end
		end
		if p1768 then
			v1771(p1768)
		end
	end
}
v_u_925.Plagued = {
	["Id"] = "PL",
	["Name"] = "Plagued",
	["ValueMulti"] = 102,
	["Color"] = Color3.fromRGB(85, 85, 0),
	["_AddFX"] = function(p1772, p1773, p1774)
		p1772:_RemoveFX(p1773, p1774)
		if p1774 then
			for _, v1775 in game.ServerStorage.Mutation_FX.Plagued:GetChildren() do
				local v1776 = v1775:Clone()
				v1776.Parent = p1774
				v1776.Enabled = true
				v1776:AddTag("Cleanup_Plagued")
				v1776:AddTag("Effect")
			end
		end
		for _, v1777 in p1773:GetDescendants() do
			if (v1777:IsA("BasePart") or v1777:IsA("UnionOperation")) and not v1777:HasTag("Effect") then
				v1777:AddTag("PlaguedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1778, p1779)
		-- upvalues: (copy) v_u_18
		if p1779 then
			for _, v1780 in p1779:GetChildren() do
				if v1780:HasTag("Cleanup_Plagued") then
					v1780:Destroy()
				end
			end
		end
		for _, v1781 in p1778:GetDescendants() do
			if (v1781:IsA("BasePart") or v1781:IsA("UnionOperation")) and v1781:HasTag("PlaguedVisual") then
				v1781:RemoveTag("PlaguedVisual")
				local v1782 = v_u_18[v1781]
				if v1782 then
					v1781.Material = v1782
					v_u_18[v1781] = nil
				end
			end
		end
	end
}
v_u_925.Biohazard = {
	["Id"] = "BH",
	["Name"] = "Biohazard",
	["ValueMulti"] = 157,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p1783, p1784, p1785)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1783:_RemoveFX(p1784, p1785)
		local v1786 = game.ServerStorage.Mutation_FX.Plagued:GetChildren()
		local v1787 = game.ServerStorage.Mutation_FX.Radioactive:GetChildren()
		if p1785 then
			for _, v1788 in v1786 do
				local v1789 = v1788:Clone()
				v1789.Parent = p1785
				v1789.Enabled = true
				v1789:AddTag("Cleanup_Biohazard")
				v1789:AddTag("Effect")
			end
			for _, v1790 in v1787 do
				local v1791 = v1790:Clone()
				v1791.Parent = p1785
				v1791.Enabled = true
				v1791:AddTag("Cleanup_Biohazard")
				v1791:AddTag("Effect")
			end
		end
		for _, v1792 in p1784:GetDescendants() do
			if (v1792:IsA("BasePart") or v1792:IsA("UnionOperation")) and not v1792:HasTag("Effect") then
				v_u_15[v1792] = v_u_15[v1792] or v1792.Color
				v1792.Color = Color3.fromRGB(65, 175, 0)
				v_u_18[v1792] = v_u_18[v1792] or v1792.Material
				v1792.Material = Enum.Material.Neon
				v1792:AddTag("RadioactiveVisual")
				v1792:AddTag("BiohazardVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1793, p1794)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1797(p1795)
			for _, v1796 in p1795:GetDescendants() do
				if v1796:HasTag("Cleanup_Biohazard") then
					v1796:Destroy()
				end
			end
		end
		if p1794 then
			v1797(p1794)
		end
		if p1793 then
			v1797(p1793)
		end
		for _, v1798 in p1793:GetDescendants() do
			if (v1798:IsA("BasePart") or v1798:IsA("UnionOperation")) and v1798:HasTag("BiohazardVisual") then
				v1798:RemoveTag("BiohazardVisual")
				v1798:RemoveTag("RadioactiveVisual")
				v1798.Color = v_u_15[v1798] or v1798.Color
				v_u_15[v1798] = nil
				local v1799 = v_u_18[v1798]
				if v1799 then
					v1798.Material = v1799
					v_u_18[v1798] = nil
				end
			end
		end
	end
}
v_u_925.Contagion = {
	["Id"] = "CO",
	["Name"] = "Contagion",
	["ValueMulti"] = 205,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p1800, p1801, p1802)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p1800:_RemoveFX(p1801, p1802)
		local v1803 = game.ServerStorage.Mutation_FX.Plagued:GetChildren()
		local v1804 = game.ServerStorage.Mutation_FX.Radioactive:GetChildren()
		if p1802 then
			for _, v1805 in v1803 do
				local v1806 = v1805:Clone()
				v1806.Parent = p1802
				v1806.Enabled = true
				v1806:AddTag("Cleanup_Contagion")
				v1806:AddTag("Effect")
			end
			for _, v1807 in v1804 do
				local v1808 = v1807:Clone()
				v1808.Parent = p1802
				v1808.Enabled = true
				v1808:AddTag("Cleanup_Contagion")
				v1808:AddTag("Effect")
			end
		end
		local v1809 = {}
		for _, v1810 in p1801:GetDescendants() do
			if (v1810:IsA("BasePart") or v1810:IsA("UnionOperation")) and v1810 ~= p1802 then
				table.insert(v1809, v1810)
			end
		end
		for v1811 = 1, #v1809 do
			local v1812 = v1809[v1811]
			if v1811 % 2 == 0 then
				local v1813 = math.random(1, 2) == 1 and v1803 and v1803 or v1804
				local v1814 = v1813[math.random(1, #v1813)]:Clone()
				v1814.Parent = v1812
				v1814.Enabled = true
				v1814:AddTag("Cleanup_Contagion")
				v1814:AddTag("Effect")
				if math.random() < 0.25 then
					local v1815 = v1813 == v1803 and v1804 and v1804 or v1803
					local v1816 = v1815[math.random(1, #v1815)]:Clone()
					v1816.Parent = v1812
					v1816.Enabled = true
					v1816:AddTag("Cleanup_Contagion")
					v1816:AddTag("Effect")
				end
			end
			if not v1812:HasTag("Effect") then
				v_u_15[v1812] = v_u_15[v1812] or v1812.Color
				v1812.Color = Color3.fromRGB(65, 175, 0)
				v_u_18[v1812] = v_u_18[v1812] or v1812.Material
				v1812.Material = Enum.Material.Neon
				v1812:AddTag("ContagionVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1817, p1818)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1821(p1819)
			for _, v1820 in p1819:GetDescendants() do
				if v1820:HasTag("Cleanup_Contagion") then
					v1820:Destroy()
				end
			end
		end
		if p1818 then
			v1821(p1818)
		end
		if p1817 then
			v1821(p1817)
		end
		for _, v1822 in p1817:GetDescendants() do
			if (v1822:IsA("BasePart") or v1822:IsA("UnionOperation")) and v1822:HasTag("ContagionVisual") then
				v1822:RemoveTag("ContagionVisual")
				v1822.Color = v_u_15[v1822] or v1822.Color
				v_u_15[v1822] = nil
				local v1823 = v_u_18[v1822]
				if v1823 then
					v1822.Material = v1823
					v_u_18[v1822] = nil
				end
			end
		end
	end
}
v_u_925.Blitzshock = {
	["Id"] = "BS",
	["Name"] = "Blitzshock",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(0, 192, 245),
	["_AddFX"] = function(p1824, p1825, p1826)
		-- upvalues: (copy) v_u_18, (copy) v_u_15
		p1824:_RemoveFX(p1825, p1826)
		if p1826 then
			for _, v1827 in game.ServerStorage.Mutation_FX.Blitzshock:GetChildren() do
				local v1828 = v1827:Clone()
				v1828.Parent = p1826
				v1828:AddTag("Cleanup_Blitzshock")
				if v1828:IsA("ParticleEmitter") then
					v1828.Enabled = true
				end
			end
		end
		for _, v1829 in p1825:GetDescendants() do
			if (v1829:IsA("BasePart") or v1829:IsA("UnionOperation")) and (not v1829:HasTag("Effect") and (not v1829.Transparency or v1829.Transparency ~= 1)) then
				v_u_18[v1829] = v_u_18[v1829] or v1829.Material
				v1829.Material = Enum.Material.Neon
				v_u_15[v1829] = v_u_15[v1829] or v1829.Color
				v1829.Color = v1829.Color:Lerp(Color3.fromRGB(0, 170, 255), 0.5)
				v1829:AddTag("BlitzshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1830, p1831)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1834(p1832)
			for _, v1833 in p1832:GetDescendants() do
				if v1833:HasTag("Cleanup_Blitzshock") then
					v1833:Destroy()
				end
			end
		end
		if p1831 then
			v1834(p1831)
		end
		if p1830 then
			v1834(p1830)
		end
		for _, v1835 in p1830:GetDescendants() do
			if (v1835:IsA("BasePart") or v1835:IsA("UnionOperation")) and v1835:HasTag("BlitzshockVisual") then
				v1835.Color = v_u_15[v1835] or v1835.Color
				v_u_15[v1835] = nil
				v1835:RemoveTag("BlitzshockVisual")
				if v_u_18[v1835] then
					v1835.Material = v_u_18[v1835]
					v_u_18[v1835] = nil
				end
			end
		end
	end
}
v_u_925.Junkshock = {
	["Id"] = "JS",
	["Name"] = "Junkshock",
	["ValueMulti"] = 45,
	["Color"] = Color3.fromRGB(147, 247, 0),
	["_AddFX"] = function(p1836, p1837, p1838)
		-- upvalues: (copy) v_u_18, (copy) v_u_15
		p1836:_RemoveFX(p1837, p1838)
		if p1838 then
			for _, v1839 in game.ServerStorage.Mutation_FX.Junkshock:GetChildren() do
				local v1840 = v1839:Clone()
				v1840.Parent = p1838
				v1840:AddTag("Cleanup_Junkshock")
				if v1840:IsA("ParticleEmitter") then
					v1840.Enabled = true
				end
			end
		end
		for _, v1841 in p1837:GetDescendants() do
			if (v1841:IsA("BasePart") or v1841:IsA("UnionOperation")) and (not v1841:HasTag("Effect") and (not v1841.Transparency or v1841.Transparency ~= 1)) then
				v_u_18[v1841] = v_u_18[v1841] or v1841.Material
				v1841.Material = Enum.Material.Neon
				v_u_15[v1841] = v_u_15[v1841] or v1841.Color
				v1841.Color = v1841.Color:Lerp(Color3.fromRGB(0, 255, 36), 0.5)
				v1841:AddTag("JunkshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1842, p1843)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1846(p1844)
			for _, v1845 in p1844:GetDescendants() do
				if v1845:HasTag("Cleanup_Junkshock") then
					v1845:Destroy()
				end
			end
		end
		if p1843 then
			v1846(p1843)
		end
		if p1842 then
			v1846(p1842)
		end
		for _, v1847 in p1842:GetDescendants() do
			if (v1847:IsA("BasePart") or v1847:IsA("UnionOperation")) and v1847:HasTag("JunkshockVisual") then
				v1847.Color = v_u_15[v1847] or v1847.Color
				v_u_15[v1847] = nil
				v1847:RemoveTag("JunkshockVisual")
				if v_u_18[v1847] then
					v1847.Material = v_u_18[v1847]
					v_u_18[v1847] = nil
				end
			end
		end
	end
}
v_u_925.Touchdown = {
	["Id"] = "TD",
	["Name"] = "Touchdown",
	["ValueMulti"] = 105,
	["Color"] = Color3.fromRGB(203, 95, 0),
	["_AddFX"] = function(p1848, p1849, p1850)
		p1848:_RemoveFX(p1849, p1850)
		if p1850 then
			for _, v1851 in game.ServerStorage.Mutation_FX.Touchdown:GetChildren() do
				local v1852 = v1851:Clone()
				v1852.Parent = p1850
				v1852.Enabled = true
				v1852:AddTag("Cleanup_Touchdown")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1853, p1854)
		local function v1857(p1855)
			for _, v1856 in p1855:GetDescendants() do
				if v1856:HasTag("Cleanup_Touchdown") then
					v1856:Destroy()
				end
			end
		end
		if p1854 then
			v1857(p1854)
		end
		if p1853 then
			v1857(p1853)
		end
	end
}
v_u_925.Subzero = {
	["Id"] = "SZ",
	["Name"] = "Subzero",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 255),
	["_AddFX"] = function(p1858, p1859, p1860)
		-- upvalues: (copy) v_u_152, (copy) v_u_18, (copy) v_u_19, (copy) v_u_15
		p1858:_RemoveFX(p1859, p1860)
		v_u_152(p1858, p1859, p1860, 0.4)
		if p1860 then
			for _, v1861 in game.ServerStorage.Mutation_FX.Subzero:GetChildren() do
				local v1862 = v1861:Clone()
				v1862.Parent = p1860
				v1862:AddTag("Cleanup_Subzero")
				if v1862:IsA("ParticleEmitter") then
					v1862.Enabled = true
				end
			end
		end
		for _, v1863 in p1859:GetChildren() do
			if v1863:IsA("BasePart") or v1863:IsA("UnionOperation") then
				v1863.Reflectance = 0.35
			end
		end
		for _, v1864 in p1859:GetDescendants() do
			if (v1864:IsA("BasePart") or v1864:IsA("UnionOperation")) and (not v1864:HasTag("Effect") and (not v1864.Transparency or v1864.Transparency ~= 1)) then
				v_u_18[v1864] = v_u_18[v1864] or v1864.Material
				v1864.Material = Enum.Material.Plastic
				v_u_19[v1864] = v_u_19[v1864] or v1864.MaterialVariant
				v1864.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_15[v1864] = v_u_15[v1864] or v1864.Color
				v1864.Color = v1864.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
				v1864:AddTag("SubzeroVisual")
			end
		end
	end,
	["_RemoveFX"] = function(p1865, p1866, p1867)
		-- upvalues: (copy) v_u_161, (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		v_u_161(p1865, p1866, p1867)
		local function v1870(p1868)
			for _, v1869 in p1868:GetDescendants() do
				if v1869:HasTag("Cleanup_Subzero") then
					v1869:Destroy()
				end
			end
		end
		if p1867 then
			v1870(p1867)
		end
		if p1866 then
			v1870(p1866)
		end
		for _, v1871 in p1866:GetDescendants() do
			if v1871:IsA("BasePart") or v1871:IsA("UnionOperation") then
				v1871.Reflectance = 0
				if v1871:HasTag("SubzeroVisual") then
					v1871.Color = v_u_15[v1871] or v1871.Color
					v_u_15[v1871] = nil
					v1871:RemoveTag("SubzeroVisual")
					v1871.MaterialVariant = v_u_19[v1871] or v1871.MaterialVariant
					v_u_19[v1871] = nil
					if v_u_18[v1871] then
						v1871.Material = v_u_18[v1871]
						v_u_18[v1871] = nil
					end
				end
			end
		end
	end
}
v_u_925.Lightcycle = {
	["Id"] = "lc",
	["Name"] = "Lightcycle",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1872, p1873, p1874)
		-- upvalues: (copy) v_u_15
		p1872:_RemoveFX(p1873, p1874)
		p1873:AddTag("Lightcycle_Mutation")
		for _, v1875 in p1873:GetDescendants() do
			if (v1875:IsA("BasePart") or v1875:IsA("UnionOperation")) and not v1875:HasTag("Effect") then
				local _ = v1875.Color
				v_u_15[v1875] = v_u_15[v1875] or v1875.Color
				v1875:AddTag("StoplightVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1876, _)
		-- upvalues: (copy) v_u_15
		p1876:RemoveTag("Lightcycle_Mutation")
		for _, v1877 in p1876:GetDescendants() do
			if (v1877:IsA("BasePart") or v1877:IsA("UnionOperation")) and v1877:HasTag("StoplightVisual") then
				local v1878 = v_u_15[v1877]
				if v1878 then
					v1877.Color = v1878
				end
				v1877:RemoveTag("StoplightVisual")
			end
		end
	end
}
v_u_925.Brainrot = {
	["Id"] = "lca",
	["Name"] = "Brainrot",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 108, 110),
	["_AddFX"] = function(p1879, p1880, p1881)
		p1879:_RemoveFX(p1880, p1881)
		if p1881 then
			for _, v1882 in game.ServerStorage.Mutation_FX.Brainrot:GetChildren() do
				local v1883 = v1882:Clone()
				v1883.Parent = p1881
				v1883.Enabled = true
				v1883:AddTag("Cleanup_Brainrot")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1884, p1885)
		local function v1888(p1886)
			for _, v1887 in p1886:GetDescendants() do
				if v1887:HasTag("Cleanup_Brainrot") then
					v1887:Destroy()
				end
			end
		end
		if p1885 then
			v1888(p1885)
		end
		if p1884 then
			v1888(p1884)
		end
	end
}
v_u_925.Warped = {
	["Id"] = "wpa",
	["Name"] = "Warped",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(192, 52, 255),
	["_AddFX"] = function(p1889, p1890, p1891)
		p1889:_RemoveFX(p1890, p1891)
		if p1891 then
			for _, v1892 in game.ServerStorage.Mutation_FX.Warped:GetChildren() do
				local v1893 = v1892:Clone()
				v1893.Parent = p1891
				v1893.Enabled = true
				v1893:AddTag("Cleanup_Warped")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1894, p1895)
		local function v1898(p1896)
			for _, v1897 in p1896:GetDescendants() do
				if v1897:HasTag("Cleanup_Warped") then
					v1897:Destroy()
				end
			end
		end
		if p1895 then
			v1898(p1895)
		end
		if p1894 then
			v1898(p1894)
		end
	end
}
v_u_925.Azure = {
	["Id"] = "azu",
	["Name"] = "Azure",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(0, 127, 255),
	["_AddFX"] = function(p1899, p1900, p1901)
		-- upvalues: (copy) v_u_18
		p1899:_RemoveFX(p1900, p1901)
		if p1901 then
			for _, v1902 in game.ServerStorage.Mutation_FX.Azure:GetChildren() do
				local v1903 = v1902:Clone()
				v1903.Parent = p1901
				v1903.Enabled = true
				v1903:AddTag("Cleanup_Azure")
			end
		end
		for _, v1904 in p1900:GetDescendants() do
			if (v1904:IsA("BasePart") or v1904:IsA("UnionOperation")) and not v1904:HasTag("Effect") then
				v_u_18[v1904] = v_u_18[v1904] or v1904.Material
				v1904.Material = Enum.Material.ForceField
				v1904.Reflectance = 0.5
			end
		end
	end,
	["_RemoveFX"] = function(_, p1905, p1906)
		-- upvalues: (copy) v_u_18
		local function v1909(p1907)
			for _, v1908 in p1907:GetDescendants() do
				if v1908:HasTag("Cleanup_Azure") then
					v1908:Destroy()
				end
			end
		end
		if p1906 then
			v1909(p1906)
		end
		if p1905 then
			v1909(p1905)
		end
		for _, v1910 in p1905:GetDescendants() do
			if (v1910:IsA("BasePart") or v1910:IsA("UnionOperation")) and v_u_18[v1910] then
				if not v1910:HasTag("Effect") then
					v1910.Material = v_u_18[v1910]
				end
				v_u_18[v1910] = nil
				v1910.Reflectance = 0
			end
		end
	end
}
v_u_925.Terran = {
	["Id"] = "ter",
	["Name"] = "Terran",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(163, 175, 142),
	["_AddFX"] = function(p1911, p1912, p1913)
		-- upvalues: (copy) v_u_18
		p1911:_RemoveFX(p1912, p1913)
		if p1913 then
			for _, v1914 in game.ServerStorage.Mutation_FX.Terran:GetChildren() do
				local v1915 = v1914:Clone()
				v1915.Parent = p1913
				v1915.Enabled = true
				v1915:AddTag("Cleanup_Azure")
			end
		end
		for _, v1916 in p1912:GetDescendants() do
			if (v1916:IsA("BasePart") or v1916:IsA("UnionOperation")) and not v1916:HasTag("Effect") then
				v_u_18[v1916] = v_u_18[v1916] or v1916.Material
				v1916.Material = Enum.Material.ForceField
				v1916.Reflectance = 0.5
			end
		end
	end,
	["_RemoveFX"] = function(_, p1917, p1918)
		-- upvalues: (copy) v_u_18
		local function v1921(p1919)
			for _, v1920 in p1919:GetDescendants() do
				if v1920:HasTag("Cleanup_Terran") then
					v1920:Destroy()
				end
			end
		end
		if p1918 then
			v1921(p1918)
		end
		if p1917 then
			v1921(p1917)
		end
		for _, v1922 in p1917:GetDescendants() do
			if (v1922:IsA("BasePart") or v1922:IsA("UnionOperation")) and v_u_18[v1922] then
				if not v1922:HasTag("Effect") then
					v1922.Material = v_u_18[v1922]
				end
				v_u_18[v1922] = nil
				v1922.Reflectance = 0
			end
		end
	end
}
v_u_925.Aromatic = {
	["Id"] = "ar",
	["Name"] = "Aromatic",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(162, 145, 57),
	["_AddFX"] = function(p1923, p1924, p1925)
		-- upvalues: (copy) v_u_15
		p1923:_RemoveFX(p1924, p1925)
		if p1925 then
			for _, v1926 in game.ServerStorage.Mutation_FX.Aromatic:GetChildren() do
				local v1927 = v1926:Clone()
				v1927.Parent = p1925
				v1927:AddTag("Cleanup_Aromatic")
				if v1927:IsA("ParticleEmitter") then
					v1927.Enabled = true
				end
			end
		end
		for _, v1928 in p1924:GetDescendants() do
			if (v1928:IsA("BasePart") or v1928:IsA("UnionOperation")) and (not v1928:HasTag("Effect") and (not v1928.Transparency or v1928.Transparency ~= 1)) then
				v_u_15[v1928] = v_u_15[v1928] or v1928.Color
				v1928.Color = v1928.Color:Lerp(Color3.fromRGB(162, 145, 57), 0.3)
				v1928:AddTag("AromaticVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1929, p1930)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1933(p1931)
			for _, v1932 in p1931:GetDescendants() do
				if v1932:HasTag("Cleanup_Aromatic") then
					v1932:Destroy()
				end
			end
		end
		if p1930 then
			v1933(p1930)
		end
		if p1929 then
			v1933(p1929)
		end
		for _, v1934 in p1929:GetDescendants() do
			if (v1934:IsA("BasePart") or v1934:IsA("UnionOperation")) and v1934:HasTag("AromaticVisual") then
				v1934.Color = v_u_15[v1934] or v1934.Color
				v_u_15[v1934] = nil
				v1934:RemoveTag("AromaticVisual")
				if v_u_18[v1934] then
					v1934.Material = v_u_18[v1934]
					v_u_18[v1934] = nil
				end
			end
		end
	end
}
v_u_925.Gnomed = {
	["Id"] = "gn",
	["Name"] = "Gnomed",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 173, 239),
	["_AddFX"] = function(p1935, p1936, p1937)
		p1935:_RemoveFX(p1936, p1937)
		if p1937 then
			for _, v1938 in game.ServerStorage.Mutation_FX.Gnomed:GetChildren() do
				local v1939 = v1938:Clone()
				v1939.Parent = p1937
				v1939.Enabled = true
				v1939:AddTag("Cleanup_Gnomed")
			end
		end
		for _, v1940 in p1936:GetChildren() do
			if v1940:IsA("BasePart") or v1940:IsA("UnionOperation") then
				v1940.Reflectance = 0.1
			end
		end
	end,
	["_RemoveFX"] = function(_, p1941, p1942)
		if p1942 then
			for _, v1943 in p1942:GetChildren() do
				if v1943:HasTag("Cleanup_Gnomed") then
					v1943:Destroy()
				end
			end
		end
		for _, v1944 in p1941:GetChildren() do
			if v1944:IsA("BasePart") or v1944:IsA("UnionOperation") then
				v1944.Reflectance = 0
			end
		end
	end
}
v_u_925.Fall = {
	["Id"] = "fa",
	["Name"] = "Fall",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(204, 128, 61),
	["_AddFX"] = function(p1945, p1946, p1947)
		-- upvalues: (copy) v_u_15
		p1945:_RemoveFX(p1946, p1947)
		if p1947 then
			for _, v1948 in game.ServerStorage.Mutation_FX.Fall:GetChildren() do
				local v1949 = v1948:Clone()
				v1949.Parent = p1947
				v1949:AddTag("Cleanup_Fall")
				if v1949:IsA("ParticleEmitter") then
					v1949.Enabled = true
				end
			end
		end
		for _, v1950 in p1946:GetDescendants() do
			if (v1950:IsA("BasePart") or v1950:IsA("UnionOperation")) and (not v1950:HasTag("Effect") and (not v1950.Transparency or v1950.Transparency ~= 1)) then
				v_u_15[v1950] = v_u_15[v1950] or v1950.Color
				v1950.Color = v1950.Color:Lerp(Color3.fromRGB(222, 160, 60), 0.5)
				v1950:AddTag("FallVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1951, p1952)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v1955(p1953)
			for _, v1954 in p1953:GetDescendants() do
				if v1954:HasTag("Cleanup_Fall") then
					v1954:Destroy()
				end
			end
		end
		if p1952 then
			v1955(p1952)
		end
		if p1951 then
			v1955(p1951)
		end
		for _, v1956 in p1951:GetDescendants() do
			if (v1956:IsA("BasePart") or v1956:IsA("UnionOperation")) and v1956:HasTag("FallVisual") then
				v1956.Color = v_u_15[v1956] or v1956.Color
				v_u_15[v1956] = nil
				v1956:RemoveTag("FallVisual")
				if v_u_18[v1956] then
					v1956.Material = v_u_18[v1956]
					v_u_18[v1956] = nil
				end
			end
		end
	end
}
v_u_925.Blackout = {
	["Id"] = "BO",
	["Name"] = "Blackout",
	["ValueMulti"] = 95,
	["Color"] = Color3.fromRGB(26, 26, 26),
	["_AddFX"] = function(p1957, p1958, p1959)
		-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_15
		p1957:_RemoveFX(p1958, p1959)
		if p1959 then
			for _, v1960 in game.ServerStorage.Mutation_FX.Blackout:GetChildren() do
				local v1961 = v1960:Clone()
				v1961.Parent = p1959
				v1961:AddTag("Cleanup_Blackout")
				if v1961:IsA("ParticleEmitter") then
					v1961.Enabled = true
				end
			end
		end
		for _, v1962 in p1958:GetDescendants() do
			if (v1962:IsA("BasePart") or v1962:IsA("UnionOperation")) and (not v1962:HasTag("Effect") and (not v1962.Transparency or v1962.Transparency ~= 1)) then
				v_u_18[v1962] = v_u_18[v1962] or v1962.Material
				v1962.Material = Enum.Material.Plastic
				v_u_19[v1962] = v_u_19[v1962] or v1962.MaterialVariant
				v1962.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_15[v1962] = v_u_15[v1962] or v1962.Color
				v1962.Color = v1962.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.9)
				v1962:AddTag("BlackoutVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1963, p1964)
		-- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		local function v1967(p1965)
			for _, v1966 in p1965:GetDescendants() do
				if v1966:HasTag("Cleanup_Blackout") then
					v1966:Destroy()
				end
			end
		end
		if p1964 then
			v1967(p1964)
		end
		if p1963 then
			v1967(p1963)
		end
		for _, v1968 in p1963:GetDescendants() do
			if (v1968:IsA("BasePart") or v1968:IsA("UnionOperation")) and v1968:HasTag("BlackoutVisual") then
				v1968.Color = v_u_15[v1968] or v1968.Color
				v_u_15[v1968] = nil
				v1968:RemoveTag("BlackoutVisual")
				v1968.MaterialVariant = v_u_19[v1968] or v1968.MaterialVariant
				v_u_19[v1968] = nil
				if v_u_18[v1968] then
					v1968.Material = v_u_18[v1968]
					v_u_18[v1968] = nil
				end
			end
		end
	end
}
v_u_925.Wilted = {
	["Id"] = "WI",
	["Name"] = "Wilted",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(145, 145, 216),
	["_AddFX"] = function(p1969, p1970, p1971)
		-- upvalues: (copy) v_u_15
		p1969:_RemoveFX(p1970, p1971)
		local v1972 = game.ServerStorage.Mutation_FX.Wilted:GetChildren()
		if #v1972 ~= 0 then
			if p1971 then
				for _, v1973 in v1972 do
					local v1974 = v1973:Clone()
					if v1974:IsA("ParticleEmitter") then
						v1974.Color = ColorSequence.new(p1969.Color)
					end
					v1974.Parent = p1971
					v1974.Enabled = true
					v1974:AddTag("Cleanup_Wilted")
					v1974:AddTag("Effect")
				end
			end
			local v1975 = {}
			for _, v1976 in p1970:GetDescendants() do
				if v1976:IsA("BasePart") and not v1976:HasTag("Effect") then
					table.insert(v1975, v1976)
				end
			end
			for v1977, v1978 in ipairs(v1975) do
				if v1977 % 3 == 0 then
					local v1979 = v1972[math.random(1, #v1972)]:Clone()
					if v1979:IsA("ParticleEmitter") then
						v1979.Color = ColorSequence.new(p1969.Color)
					end
					v1979.Parent = v1978
					v1979.Enabled = true
					v1979:AddTag("Cleanup_Wilted")
					v1979:AddTag("Effect")
					v_u_15[v1978] = v_u_15[v1978] or v1978.Color
					v1978.Color = p1969.Color
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1980, p1981)
		-- upvalues: (copy) v_u_15
		local function v1984(p1982)
			for _, v1983 in p1982:GetDescendants() do
				if v1983:HasTag("Cleanup_Wilted") then
					v1983:Destroy()
				end
			end
		end
		if p1981 then
			v1984(p1981)
		end
		if p1980 then
			v1984(p1980)
		end
		for _, v1985 in p1980:GetDescendants() do
			if v1985:IsA("BasePart") and v_u_15[v1985] then
				v1985.Color = v_u_15[v1985]
				v_u_15[v1985] = nil
			end
		end
	end
}
v_u_925.Withered = {
	["Id"] = "WH",
	["Name"] = "Withered",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(59, 0, 89),
	["_AddFX"] = function(p1986, p1987, p1988)
		-- upvalues: (copy) v_u_15
		p1986:_RemoveFX(p1987, p1988)
		local v1989 = game.ServerStorage.Mutation_FX.Wilted:GetChildren()
		if #v1989 ~= 0 then
			if p1988 then
				for _, v1990 in v1989 do
					local v1991 = v1990:Clone()
					if v1991:IsA("ParticleEmitter") then
						v1991.Color = ColorSequence.new(p1986.Color)
					end
					v1991.Parent = p1988
					v1991.Enabled = true
					v1991:AddTag("Cleanup_Withered")
					v1991:AddTag("Effect")
				end
			end
			local v1992 = {}
			for _, v1993 in p1987:GetDescendants() do
				if v1993:IsA("BasePart") and not v1993:HasTag("Effect") then
					table.insert(v1992, v1993)
				end
			end
			for v1994, v1995 in ipairs(v1992) do
				if v1994 % 2 == 0 then
					local v1996 = v1989[math.random(1, #v1989)]:Clone()
					if v1996:IsA("ParticleEmitter") then
						v1996.Color = ColorSequence.new(p1986.Color)
					end
					v1996.Parent = v1995
					v1996.Enabled = true
					v1996:AddTag("Cleanup_Withered")
					v1996:AddTag("Effect")
					v_u_15[v1995] = v_u_15[v1995] or v1995.Color
					v1995.Color = p1986.Color
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1997, p1998)
		-- upvalues: (copy) v_u_15
		local function v2001(p1999)
			for _, v2000 in p1999:GetDescendants() do
				if v2000:HasTag("Cleanup_Withered") then
					v2000:Destroy()
				end
			end
		end
		if p1998 then
			v2001(p1998)
		end
		if p1997 then
			v2001(p1997)
		end
		for _, v2002 in p1997:GetDescendants() do
			if v2002:IsA("BasePart") and v_u_15[v2002] then
				v2002.Color = v_u_15[v2002]
				v_u_15[v2002] = nil
			end
		end
	end
}
v_u_925.Desolate = {
	["Id"] = "DE",
	["Name"] = "Desolate",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(85, 0, 0),
	["_AddFX"] = function(p2003, p2004, p2005)
		-- upvalues: (copy) v_u_15
		p2003:_RemoveFX(p2004, p2005)
		local v2006 = game.ServerStorage.Mutation_FX.Wilted:GetChildren()
		if #v2006 ~= 0 then
			if p2005 then
				for _, v2007 in v2006 do
					local v2008 = v2007:Clone()
					if v2008:IsA("ParticleEmitter") then
						v2008.Color = ColorSequence.new(p2003.Color)
					end
					v2008.Parent = p2005
					v2008.Enabled = true
					v2008:AddTag("Cleanup_Desolate")
					v2008:AddTag("Effect")
				end
			end
			local v2009 = {}
			for _, v2010 in p2004:GetDescendants() do
				if v2010:IsA("BasePart") and not v2010:HasTag("Effect") then
					table.insert(v2009, v2010)
				end
			end
			for v2011, v2012 in ipairs(v2009) do
				if v2011 % 1 == 0 then
					local v2013 = v2006[math.random(1, #v2006)]:Clone()
					if v2013:IsA("ParticleEmitter") then
						v2013.Color = ColorSequence.new(p2003.Color)
					end
					v2013.Parent = v2012
					v2013.Enabled = true
					v2013:AddTag("Cleanup_Desolate")
					v2013:AddTag("Effect")
					v_u_15[v2012] = v_u_15[v2012] or v2012.Color
					v2012.Color = p2003.Color
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2014, p2015)
		-- upvalues: (copy) v_u_15
		local function v2018(p2016)
			for _, v2017 in p2016:GetDescendants() do
				if v2017:HasTag("Cleanup_Desolate") then
					v2017:Destroy()
				end
			end
		end
		if p2015 then
			v2018(p2015)
		end
		if p2014 then
			v2018(p2014)
		end
		for _, v2019 in p2014:GetDescendants() do
			if v2019:IsA("BasePart") and v_u_15[v2019] then
				v2019.Color = v_u_15[v2019]
				v_u_15[v2019] = nil
			end
		end
	end
}
v_u_925.Batty = {
	["Id"] = "BA",
	["Name"] = "Batty",
	["ValueMulti"] = 45,
	["Color"] = Color3.fromRGB(56, 56, 56),
	["_AddFX"] = function(p2020, p2021, p2022)
		-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_15
		p2020:_RemoveFX(p2021, p2022)
		if p2022 then
			for _, v2023 in game.ServerStorage.Mutation_FX.Batty:GetChildren() do
				local v2024 = v2023:Clone()
				v2024.Parent = p2022
				v2024:AddTag("Cleanup_Batty")
				if v2024:IsA("ParticleEmitter") then
					v2024.Enabled = true
				end
			end
		end
		for _, v2025 in p2021:GetDescendants() do
			if (v2025:IsA("BasePart") or v2025:IsA("UnionOperation")) and (not v2025:HasTag("Effect") and (not v2025.Transparency or v2025.Transparency ~= 1)) then
				v_u_18[v2025] = v_u_18[v2025] or v2025.Material
				v2025.Material = Enum.Material.Plastic
				v_u_19[v2025] = v_u_19[v2025] or v2025.MaterialVariant
				v2025.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_15[v2025] = v_u_15[v2025] or v2025.Color
				v2025.Color = v2025.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.4)
				v2025:AddTag("BattyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2026, p2027)
		-- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		local function v2030(p2028)
			for _, v2029 in p2028:GetDescendants() do
				if v2029:HasTag("Cleanup_Batty") then
					v2029:Destroy()
				end
			end
		end
		if p2027 then
			v2030(p2027)
		end
		if p2026 then
			v2030(p2026)
		end
		for _, v2031 in p2026:GetDescendants() do
			if (v2031:IsA("BasePart") or v2031:IsA("UnionOperation")) and v2031:HasTag("BattyVisual") then
				v2031.Color = v_u_15[v2031] or v2031.Color
				v_u_15[v2031] = nil
				v2031:RemoveTag("BattyVisual")
				v2031.MaterialVariant = v_u_19[v2031] or v2031.MaterialVariant
				v_u_19[v2031] = nil
				if v_u_18[v2031] then
					v2031.Material = v_u_18[v2031]
					v_u_18[v2031] = nil
				end
			end
		end
	end
}
v_u_925.Glossy = {
	["Id"] = "GS",
	["Name"] = "Glossy",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(228, 255, 255),
	["_AddFX"] = function(p2032, p2033, p2034)
		-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_15
		p2032:_RemoveFX(p2033, p2034)
		if p2034 then
			for _, v2035 in game.ServerStorage.Mutation_FX.Glossy:GetChildren() do
				local v2036 = v2035:Clone()
				v2036.Parent = p2034
				v2036:AddTag("Cleanup_Glossy")
				if v2036:IsA("ParticleEmitter") then
					v2036.Enabled = true
				end
			end
		end
		for _, v2037 in p2033:GetDescendants() do
			if (v2037:IsA("BasePart") or v2037:IsA("UnionOperation")) and (not v2037:HasTag("Effect") and (not v2037.Transparency or v2037.Transparency ~= 1)) then
				v2037.Reflectance = 0.5
				v_u_18[v2037] = v_u_18[v2037] or v2037.Material
				v2037.Material = Enum.Material.Glass
				v_u_19[v2037] = v_u_19[v2037] or v2037.MaterialVariant
				v2037.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_15[v2037] = v_u_15[v2037] or v2037.Color
				v2037.Color = v2037.Color:Lerp(Color3.fromRGB(228, 255, 255), 0.8)
				v2037:AddTag("GlossyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2038, p2039)
		-- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		local function v2042(p2040)
			for _, v2041 in p2040:GetDescendants() do
				if v2041:HasTag("Cleanup_Glossy") then
					v2041:Destroy()
				end
			end
		end
		if p2039 then
			v2042(p2039)
		end
		if p2038 then
			v2042(p2038)
		end
		for _, v2043 in p2038:GetDescendants() do
			if (v2043:IsA("BasePart") or v2043:IsA("UnionOperation")) and v2043:HasTag("GlossyVisual") then
				v2043.Color = v_u_15[v2043] or v2043.Color
				v_u_15[v2043] = nil
				v2043:RemoveTag("GlossyVisual")
				v2043.MaterialVariant = v_u_19[v2043] or v2043.MaterialVariant
				v_u_19[v2043] = nil
				if v_u_18[v2043] then
					v2043.Material = v_u_18[v2043]
					v_u_18[v2043] = nil
				end
			end
		end
	end
}
v_u_925.Leeched = {
	["Id"] = "LE",
	["Name"] = "Leeched",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(95, 26, 26),
	["_AddFX"] = function(p2044, p2045, p2046)
		-- upvalues: (copy) v_u_18, (copy) v_u_19, (copy) v_u_15
		p2044:_RemoveFX(p2045, p2046)
		if p2046 then
			for _, v2047 in game.ServerStorage.Mutation_FX.Leeched:GetChildren() do
				local v2048 = v2047:Clone()
				v2048.Parent = p2046
				v2048:AddTag("Cleanup_Leeched")
				if v2048:IsA("ParticleEmitter") then
					v2048.Enabled = true
				end
			end
		end
		for _, v2049 in p2045:GetDescendants() do
			if (v2049:IsA("BasePart") or v2049:IsA("UnionOperation")) and (not v2049:HasTag("Effect") and (not v2049.Transparency or v2049.Transparency ~= 1)) then
				v_u_18[v2049] = v_u_18[v2049] or v2049.Material
				v2049.Material = Enum.Material.Plastic
				v_u_19[v2049] = v_u_19[v2049] or v2049.MaterialVariant
				v2049.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_15[v2049] = v_u_15[v2049] or v2049.Color
				v2049.Color = v2049.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.4)
				v2049:AddTag("LeechedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2050, p2051)
		-- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		local function v2054(p2052)
			for _, v2053 in p2052:GetDescendants() do
				if v2053:HasTag("Cleanup_Leeched") then
					v2053:Destroy()
				end
			end
		end
		if p2051 then
			v2054(p2051)
		end
		if p2050 then
			v2054(p2050)
		end
		for _, v2055 in p2050:GetDescendants() do
			if (v2055:IsA("BasePart") or v2055:IsA("UnionOperation")) and v2055:HasTag("LeechedVisual") then
				v2055.Color = v_u_15[v2055] or v2055.Color
				v_u_15[v2055] = nil
				v2055:RemoveTag("LeechedVisual")
				v2055.MaterialVariant = v_u_19[v2055] or v2055.MaterialVariant
				v_u_19[v2055] = nil
				if v_u_18[v2055] then
					v2055.Material = v_u_18[v2055]
					v_u_18[v2055] = nil
				end
			end
		end
	end
}
v_u_925.Lush = {
	["Id"] = "LU",
	["Name"] = "Lush",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(85, 255, 0),
	["_AddFX"] = function(p2056, p2057, p2058)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2056:_RemoveFX(p2057, p2058)
		local v2059 = {
			"Bright green",
			"Earth green",
			"Shamrock",
			"Lime green",
			"Grime"
		}
		for _, v2060 in p2057:GetDescendants() do
			if (v2060:IsA("BasePart") or v2060:IsA("UnionOperation")) and not v2060:HasTag("Effect") then
				v_u_15[v2060] = v_u_15[v2060] or v2060.BrickColor.Color
				v2060.BrickColor = BrickColor.new(v2059[Random.new():NextInteger(1, #v2059)])
				v_u_18[v2060] = v_u_18[v2060] or v2060.Material
				v2060.Material = Enum.Material.Plastic
				v2060:AddTag("LushVisual")
			end
		end
		local v2061 = game.ServerStorage:FindFirstChild("Mutation_FX")
		if v2061 then
			v2061 = game.ServerStorage.Mutation_FX:FindFirstChild("Lush")
		end
		if v2061 then
			local v2062 = v2061:GetChildren()
			if p2058 then
				for _, v2063 in v2062 do
					local v2064 = v2063:Clone()
					v2064.Parent = p2058
					if v2064:IsA("ParticleEmitter") then
						v2064.Enabled = true
					end
					v2064:AddTag("Cleanup_Lush")
					v2064:AddTag("Effect")
				end
			end
			for v2065, v2066 in ipairs(p2057:GetDescendants()) do
				if v2066:IsA("BasePart") and (not v2066:HasTag("Effect") and v2065 % 3 == 0) then
					for _, v2067 in v2062 do
						if v2067.Name == "Swirls" then
							local v2068 = v2067:Clone()
							v2068.Parent = v2066
							if v2068:IsA("ParticleEmitter") then
								v2068.Enabled = true
							end
							v2068:AddTag("Cleanup_Lush")
							v2068:AddTag("Effect")
						end
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2069, p2070)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2073(p2071)
			for _, v2072 in p2071:GetDescendants() do
				if v2072:HasTag("Cleanup_Lush") then
					v2072:Destroy()
				end
			end
		end
		if p2070 then
			v2073(p2070)
		end
		if p2069 then
			v2073(p2069)
		end
		for _, v2074 in p2069:GetDescendants() do
			if (v2074:IsA("BasePart") or v2074:IsA("UnionOperation")) and v2074:HasTag("LushVisual") then
				v2074.Reflectance = 0
				local v2075
				if v_u_15[v2074] then
					v2075 = BrickColor.new(v_u_15[v2074])
				else
					v2075 = v2074.BrickColor
				end
				v2074.BrickColor = v2075
				v_u_15[v2074] = nil
				v2074:RemoveTag("LushVisual")
				if v_u_18[v2074] then
					v2074.Material = v_u_18[v2074]
					v_u_18[v2074] = nil
				end
			end
		end
	end
}
v_u_925.Nocturnal = {
	["Id"] = "NL",
	["Name"] = "Nocturnal",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(61, 219, 255),
	["_AddFX"] = function(p2076, p2077, p2078)
		-- upvalues: (copy) v_u_15
		p2076:_RemoveFX(p2077, p2078)
		if p2078 then
			for _, v2079 in game.ServerStorage.Mutation_FX.Nocturnal:GetChildren() do
				local v2080 = v2079:Clone()
				v2080.Parent = p2078
				v2080.Enabled = true
				v2080:AddTag("Cleanup_Nocturnal")
				v2080:AddTag("Effect")
			end
		end
		for _, v2081 in p2077:GetDescendants() do
			if (v2081:IsA("BasePart") or v2081:IsA("UnionOperation")) and not v2081:HasTag("Effect") then
				v_u_15[v2081] = v_u_15[v2081] or v2081.Color
				v2081.Color = Color3.fromRGB(62, 56, 86)
				v2081.Reflectance = 0.3
				v2081:AddTag("NocturnalVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2082, p2083)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2083 then
			for _, v2084 in p2083:GetChildren() do
				if v2084:HasTag("Cleanup_Nocturnal") then
					v2084:Destroy()
				end
			end
		end
		for _, v2085 in p2082:GetDescendants() do
			if (v2085:IsA("BasePart") or v2085:IsA("UnionOperation")) and v2085:HasTag("NocturnalVisual") then
				v2085.Color = v_u_15[v2085] or v2085.Color
				v_u_15[v2085] = nil
				v2085.Reflectance = 0
				v2085:RemoveTag("NocturnalVisual")
				local v2086 = v_u_18[v2085]
				if v2086 then
					v2085.Material = v2086
					v_u_18[v2085] = nil
				end
			end
		end
	end
}
v_u_925.Arid = {
	["Id"] = "AR",
	["Name"] = "Arid",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(255, 170, 0),
	["_AddFX"] = function(p2087, p2088, p2089)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2087:_RemoveFX(p2088, p2089)
		local v2090 = {
			Color3.fromRGB(255, 205, 60),
			Color3.fromRGB(255, 185, 85),
			Color3.fromRGB(230, 150, 50),
			Color3.fromRGB(200, 125, 35),
			Color3.fromRGB(255, 220, 140)
		}
		if p2089 then
			for _, v2091 in game.ServerStorage.Mutation_FX.Arid:GetChildren() do
				local v2092 = v2091:Clone()
				v2092.Parent = p2089
				v2092.Enabled = true
				v2092:AddTag("Cleanup_Arid")
			end
		end
		for v2093, v2094 in p2088:GetDescendants() do
			if v2094:IsA("BasePart") or v2094:IsA("UnionOperation") then
				local v2095 = v2093 % 5 == 0 and game.ServerStorage.Mutation_FX.Arid:FindFirstChild("LeafSwirl")
				if v2095 then
					local v2096 = v2095:Clone()
					v2096.Parent = v2094
					v2096.Enabled = true
					v2096:AddTag("Cleanup_Arid")
				end
				if not v2094:HasTag("Effect") then
					v_u_15[v2094] = v_u_15[v2094] or v2094.Color
					v_u_18[v2094] = v_u_18[v2094] or v2094.Material
					v2094.Color = v2090[Random.new():NextInteger(1, #v2090)]
					v2094.Material = Enum.Material.Sand
					v2094:AddTag("AridVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2097, p2098)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2101(p2099)
			for _, v2100 in p2099:GetDescendants() do
				if v2100:HasTag("Cleanup_Arid") then
					v2100:Destroy()
				end
			end
		end
		if p2098 then
			v2101(p2098)
		end
		if p2097 then
			v2101(p2097)
		end
		for _, v2102 in p2097:GetDescendants() do
			if (v2102:IsA("BasePart") or v2102:IsA("UnionOperation")) and v2102:HasTag("AridVisual") then
				v2102:RemoveTag("AridVisual")
				v2102.Color = v_u_15[v2102] or v2102.Color
				v_u_15[v2102] = nil
				if v_u_18[v2102] then
					v2102.Material = v_u_18[v2102]
					v_u_18[v2102] = nil
				end
				v2102.Reflectance = 0
			end
		end
	end
}
v_u_925.Mirage = {
	["Id"] = "MR",
	["Name"] = "Mirage",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(170, 255, 255),
	["_AddFX"] = function(p2103, p2104, p2105)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2103:_RemoveFX(p2104, p2105)
		if p2105 then
			for _, v2106 in game.ServerStorage.Mutation_FX.Mirage:GetChildren() do
				local v2107 = v2106:Clone()
				v2107.Parent = p2105
				v2107.Enabled = true
				v2107:AddTag("Cleanup_Mirage")
			end
		end
		for v2108, v2109 in p2104:GetDescendants() do
			if v2109:IsA("BasePart") or v2109:IsA("UnionOperation") then
				if v2108 % 4 == 0 then
					local v2110 = game.ServerStorage.Mutation_FX.Mirage.Rays:Clone()
					v2110.Parent = v2109
					v2110.Enabled = true
					v2110:AddTag("Cleanup_Mirage")
				end
				if not v2109:HasTag("Effect") then
					v_u_15[v2109] = v_u_15[v2109] or v2109.Color
					v_u_18[v2109] = v_u_18[v2109] or v2109.Material
					v2109.Color = Color3.fromRGB(170, 255, 255)
					v2109.Material = Enum.Material.Glass
					v2109:AddTag("MirageVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2111, p2112)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2112 then
			for _, v2113 in p2112:GetChildren() do
				if v2113:HasTag("Cleanup_Mirage") then
					v2113:Destroy()
				end
			end
		end
		for _, v2114 in p2111:GetDescendants() do
			if (v2114:IsA("BasePart") or v2114:IsA("UnionOperation")) and v2114:HasTag("MirageVisual") then
				v2114:RemoveTag("MirageVisual")
				v2114.Color = v_u_15[v2114] or v2114.Color
				v_u_15[v2114] = nil
				if v_u_18[v2114] then
					v2114.Material = v_u_18[v2114]
					v_u_18[v2114] = nil
				end
				v2114.Reflectance = 0
			end
		end
	end
}
v_u_925.Stampede = {
	["Id"] = "ST",
	["Name"] = "Stampede",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 170, 0),
	["_AddFX"] = function(p2115, p2116, p2117)
		-- upvalues: (copy) v_u_17, (copy) v_u_16
		p2115:_RemoveFX(p2116, p2117)
		local v2118 = p2116:FindFirstChild("Item_Seed") and p2116.Item_Seed.Value or tick()
		local v2119 = Random.new(v2118)
		local v2120 = 0
		for _, v2121 in p2116:GetDescendants() do
			if (v2121:IsA("BasePart") or v2121:IsA("UnionOperation")) and (not v2121:HasTag("Effect") and v2121.Transparency <= 0.75) then
				v2120 = v2120 + 1
				for _, v2122 in game.ServerStorage.Mutation_FX.Stampede:GetChildren() do
					local v2123 = v2122:Clone()
					v2123.Parent = v2121
					if v2123:IsA("ParticleEmitter") then
						v2123.Enabled = true
						v2123.Rate = v2123.Rate / v2120
						v2123.Color = ColorSequence.new(v2121.Color)
					else
						local v2124 = v2121.Transparency / 2
						v2123.Transparency = math.clamp(v2124, 0, 0.4) + 0.25
					end
					v2123:AddTag("Cleanup_Stampede")
				end
				if not v2121:HasTag("StampedeVisual") then
					v_u_17[v2121] = v_u_17[v2121] or v2121.Orientation
					v_u_16[v2121] = v_u_16[v2121] or v2121.Position
					local v2125 = v_u_17[v2121]
					local v2126 = v_u_16[v2121]
					local v2127 = v2121.Size.X
					local v2128 = v2125.X + v2119:NextNumber(-6.4, 6.4)
					local v2129 = v2125.Y + v2119:NextNumber(-6.4, 6.4)
					local v2130 = v2125.Z + v2119:NextNumber(-6.4, 6.4)
					v2121.Orientation = Vector3.new(v2128, v2129, v2130)
					local v2131 = v2119:NextNumber(-v2127, v2127) * 0.2
					local v2132 = v2119:NextNumber(-v2127, v2127) * 0.2
					local v2133 = v2119:NextNumber(-v2127, v2127) * 0.2
					local v2134 = math.clamp(v2131, -1, 1)
					local v2135 = math.clamp(v2132, -1, 1)
					local v2136 = math.clamp(v2133, -1, 1)
					v2121.Position = v2126 + Vector3.new(v2134, v2135, v2136)
					v2121:AddTag("StampedeVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2137, p2138)
		-- upvalues: (copy) v_u_17, (copy) v_u_16, (copy) v_u_15
		local function v2141(p2139)
			for _, v2140 in p2139:GetDescendants() do
				if v2140:HasTag("Cleanup_Stampede") or v2140.Name == "CRACKSTEXTURE" then
					v2140:Destroy()
				end
			end
		end
		if p2138 then
			v2141(p2138)
		end
		if p2137 then
			v2141(p2137)
		end
		for _, v2142 in p2137:GetDescendants() do
			if (v2142:IsA("BasePart") or v2142:IsA("UnionOperation")) and v2142:HasTag("StampedeVisual") then
				if v_u_17[v2142] then
					v2142.Orientation = v_u_17[v2142]
					v_u_17[v2142] = nil
				end
				if v_u_16[v2142] then
					v2142.Position = v_u_16[v2142]
					v_u_16[v2142] = nil
				end
				if v2142:FindFirstChild("StampedeRubbleP") then
					v2142.StampedeRubbleP:Destroy()
				end
				if v2142:FindFirstChild("StampedePixelSmokeP") then
					v2142.StampedePixelSmokeP:Destroy()
				end
				v2142.Reflectance = 0
				v_u_15[v2142] = nil
				v2142:RemoveTag("StampedeVisual")
			end
		end
	end
}
v_u_925.Monsoon = {
	["Id"] = "MO",
	["Name"] = "Monsoon",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(170, 255, 255),
	["_AddFX"] = function(p2143, p2144, p2145)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2143:_RemoveFX(p2144, p2145)
		local v2146 = game.ServerStorage.Mutation_FX.Monsoon:GetChildren()
		local v2147 = Color3.fromRGB(170, 255, 255)
		local v2148 = {}
		for _, v2149 in p2144:GetDescendants() do
			if v2149:IsA("BasePart") or v2149:IsA("UnionOperation") then
				table.insert(v2148, v2149)
			end
		end
		if p2145 and not table.find(v2148, p2145) then
			table.insert(v2148, p2145)
		end
		for v2150, v2151 in ipairs(v2148) do
			for _, v2152 in v2146 do
				if v2150 % 4 == 0 or v2151 == p2145 then
					local v2153 = v2152:Clone()
					v2153.Parent = v2151
					v2153.Enabled = true
					v2153:AddTag("Cleanup_Monsoon")
					v2153:AddTag("Effect")
				end
			end
			if not v2151:HasTag("Effect") then
				v_u_15[v2151] = v_u_15[v2151] or v2151.Color
				v_u_18[v2151] = v_u_18[v2151] or v2151.Material
				OriginalTransparency = OriginalTransparency or {}
				OriginalTransparency[v2151] = v2151.Transparency
				v2151.Color = v2147
				v2151.Material = Enum.Material.Neon
				v2151.Transparency = 0.8
				v2151:AddTag("MonsoonVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2154, p2155)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2158(p2156)
			for _, v2157 in p2156:GetDescendants() do
				if v2157:HasTag("Cleanup_Monsoon") then
					v2157:Destroy()
				end
			end
		end
		if p2155 then
			v2158(p2155)
		end
		if p2154 then
			v2158(p2154)
		end
		for _, v2159 in p2154:GetDescendants() do
			if (v2159:IsA("BasePart") or v2159:IsA("UnionOperation")) and v2159:HasTag("MonsoonVisual") then
				v2159.Color = v_u_15[v2159] or v2159.Color
				v_u_15[v2159] = nil
				v2159.Material = v_u_18[v2159] or v2159.Material
				v_u_18[v2159] = nil
				if OriginalTransparency and OriginalTransparency[v2159] then
					v2159.Transparency = OriginalTransparency[v2159]
					OriginalTransparency[v2159] = nil
				else
					v2159.Transparency = 0
				end
				v2159:RemoveTag("MonsoonVisual")
			end
		end
	end
}
v_u_925.Twilight = {
	["Id"] = "TW",
	["Name"] = "Twilight",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(170, 170, 255),
	["_AddFX"] = function(p2160, p2161, p2162)
		-- upvalues: (copy) v_u_15
		p2160:_RemoveFX(p2161, p2162)
		if p2162 then
			for _, v2163 in game.ServerStorage.Mutation_FX.Crepuscular:GetChildren() do
				local v2164 = v2163:Clone()
				v2164.Parent = p2162
				v2164.Enabled = true
				v2164:AddTag("Cleanup_Crepuscular")
				v2164:AddTag("Effect")
			end
		end
		for _, v2165 in p2161:GetDescendants() do
			if (v2165:IsA("BasePart") or v2165:IsA("UnionOperation")) and not v2165:HasTag("Effect") then
				v_u_15[v2165] = v_u_15[v2165] or v2165.Color
				v2165.Color = Color3.fromRGB(170, 170, 255)
				v2165.Reflectance = 0.3
				v2165:AddTag("CrepuscularVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2166, p2167)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2167 then
			for _, v2168 in p2167:GetChildren() do
				if v2168:HasTag("Cleanup_Crepuscular") then
					v2168:Destroy()
				end
			end
		end
		for _, v2169 in p2166:GetDescendants() do
			if (v2169:IsA("BasePart") or v2169:IsA("UnionOperation")) and v2169:HasTag("CrepuscularVisual") then
				v2169.Color = v_u_15[v2169] or v2169.Color
				v_u_15[v2169] = nil
				v2169.Reflectance = 0
				v2169:RemoveTag("CrepuscularVisual")
				local v2170 = v_u_18[v2169]
				if v2170 then
					v2169.Material = v2170
					v_u_18[v2169] = nil
				end
			end
		end
	end
}
v_u_925.Typhoon = {
	["Id"] = "TY",
	["Name"] = "Typhoon",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(0, 174, 255),
	["_AddFX"] = function(p2171, p2172, p2173)
		p2171:_RemoveFX(p2172, p2173)
		local v2174 = game.ServerStorage.Mutation_FX.Typhoon:GetChildren()
		if p2173 then
			for _, v2175 in v2174 do
				if not p2173:FindFirstChild(v2175.Name) then
					local v2176 = v2175:Clone()
					v2176.Parent = p2173
					v2176.Enabled = true
					v2176:AddTag("Cleanup_Typhoon")
				end
			end
		end
		local v2177 = 0
		for _, v2178 in p2172:GetDescendants() do
			if v2178:IsA("BasePart") and v2178 ~= p2173 then
				v2177 = v2177 + 1
				if v2177 % 3 == 0 then
					local v2179 = v2174[math.random(1, #v2174)]:Clone()
					v2179.Parent = v2178
					v2179.Enabled = true
					v2179:AddTag("Cleanup_Typhoon")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2180, p2181)
		local function v2184(p2182)
			for _, v2183 in p2182:GetDescendants() do
				if v2183:HasTag("Cleanup_Typhoon") then
					v2183:Destroy()
				end
			end
		end
		if p2181 then
			v2184(p2181)
		end
		if p2180 then
			v2184(p2180)
		end
	end
}
v_u_925.Wildfast = {
	["Id"] = "WF",
	["Name"] = "Wildfast",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p2185, p2186, p2187)
		p2185:_RemoveFX(p2186, p2187)
		if p2187 then
			for _, v2188 in game.ServerStorage.Mutation_FX.Wildfast:GetChildren() do
				local v2189 = v2188:Clone()
				v2189.Parent = p2187
				v2189:AddTag("Cleanup_Wildfast")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p2190)
		if p2190 then
			for _, v2191 in p2190:GetChildren() do
				if v2191:HasTag("Cleanup_Wildfast") then
					v2191:Destroy()
				end
			end
		end
	end
}
v_u_925.Tempered = {
	["Id"] = "TE",
	["Name"] = "Tempered",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(255, 96, 17),
	["_AddFX"] = function(p2192, p2193, p2194)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2192:_RemoveFX(p2193, p2194)
		if p2194 then
			for _, v2195 in game.ServerStorage.Mutation_FX.Tempered:GetChildren() do
				local v2196 = v2195:Clone()
				v2196.Parent = p2194
				v2196.Enabled = true
				v2196:AddTag("Cleanup_Tempered")
			end
		end
		for v2197, v2198 in p2193:GetDescendants() do
			if v2198:IsA("BasePart") or v2198:IsA("UnionOperation") then
				local _ = v2197 % 5 == 0
				if not v2198:HasTag("Effect") then
					v_u_15[v2198] = v_u_15[v2198] or v2198.Color
					v_u_18[v2198] = v_u_18[v2198] or v2198.Material
					v2198.Color = Color3.fromRGB(255, 100, 28)
					v2198.Material = Enum.Material.Neon
					v2198:AddTag("TemperedVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2199, p2200)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2203(p2201)
			for _, v2202 in p2201:GetDescendants() do
				if v2202:HasTag("Cleanup_Tempered") then
					v2202:Destroy()
				end
			end
		end
		if p2200 then
			v2203(p2200)
		end
		if p2199 then
			v2203(p2199)
		end
		for _, v2204 in p2199:GetDescendants() do
			if (v2204:IsA("BasePart") or v2204:IsA("UnionOperation")) and v2204:HasTag("TemperedVisual") then
				v2204:RemoveTag("TemperedVisual")
				v2204.Color = v_u_15[v2204] or v2204.Color
				v_u_15[v2204] = nil
				if v_u_18[v2204] then
					v2204.Material = v_u_18[v2204]
					v_u_18[v2204] = nil
				end
				v2204.Reflectance = 0
			end
		end
	end
}
v_u_925.Charcoal = {
	["Id"] = "CH",
	["Name"] = "Charcoal",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(71, 71, 71),
	["_AddFX"] = function(p2205, p2206, p2207)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2205:_RemoveFX(p2206, p2207)
		if p2207 then
			for _, v2208 in game.ServerStorage.Mutation_FX.Charcoal:GetChildren() do
				local v2209 = v2208:Clone()
				v2209.Parent = p2207
				v2209.Enabled = true
				v2209:AddTag("Cleanup_Charcoal")
			end
		end
		for v2210, v2211 in p2206:GetDescendants() do
			if v2211:IsA("BasePart") or v2211:IsA("UnionOperation") then
				local _ = v2210 % 5 == 0
				if not v2211:HasTag("Effect") then
					v_u_15[v2211] = v_u_15[v2211] or v2211.Color
					v_u_18[v2211] = v_u_18[v2211] or v2211.Material
					v2211.Color = Color3.fromRGB(71, 71, 71)
					v2211.Material = Enum.Material.Sand
					v2211:AddTag("CharcoalVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2212, p2213)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2216(p2214)
			for _, v2215 in p2214:GetDescendants() do
				if v2215:HasTag("Cleanup_Charcoal") then
					v2215:Destroy()
				end
			end
		end
		if p2213 then
			v2216(p2213)
		end
		if p2212 then
			v2216(p2212)
		end
		for _, v2217 in p2212:GetDescendants() do
			if (v2217:IsA("BasePart") or v2217:IsA("UnionOperation")) and v2217:HasTag("CharcoalVisual") then
				v2217:RemoveTag("CharcoalVisual")
				v2217.Color = v_u_15[v2217] or v2217.Color
				v_u_15[v2217] = nil
				if v_u_18[v2217] then
					v2217.Material = v_u_18[v2217]
					v_u_18[v2217] = nil
				end
				v2217.Reflectance = 0
			end
		end
	end
}
v_u_925.Geode = {
	["Id"] = "GD",
	["Name"] = "Geode",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 0, 0),
	["_AddFX"] = function(p2218, p2219, p2220)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2218:_RemoveFX(p2219, p2220)
		local v2221 = game.ServerStorage.Mutation_FX.Geode:GetChildren()
		if #v2221 == 0 then
			return
		else
			local v2222 = {}
			for _, v2223 in p2219:GetDescendants() do
				if v2223:IsA("BasePart") and (not v2223:HasTag("Effect") and v2223.Transparency < 0.9) then
					table.insert(v2222, v2223)
				end
			end
			if #v2222 ~= 0 then
				local v2224 = #v2222 * 0.25
				local v2225 = math.floor(v2224)
				local v2226 = math.max(4, v2225)
				local v2227 = Random.new(tick())
				local v2228 = {}
				while #v2228 < v2226 and #v2222 > 0 do
					local v2229 = v2227:NextInteger(1, #v2222)
					local v2230 = table.remove
					table.insert(v2228, v2230(v2222, v2229))
				end
				local v2231 = {
					{
						["Color"] = Color3.fromRGB(255, 50, 50),
						["Material"] = Enum.Material.Neon
					},
					{
						["Color"] = Color3.fromRGB(50, 255, 255),
						["Material"] = Enum.Material.Neon
					},
					{
						["Color"] = Color3.fromRGB(50, 255, 100),
						["Material"] = Enum.Material.Neon
					}
				}
				for _, v2232 in v2228 do
					local v2233 = v2221[v2227:NextInteger(1, #v2221)]:Clone()
					v2233.Parent = v2232
					v2233.Enabled = true
					v2233:AddTag("Cleanup_Geode")
					v2233:AddTag("Effect")
					local v2234 = v2231[v2227:NextInteger(1, #v2231)]
					v_u_15[v2232] = v_u_15[v2232] or v2232.Color
					v_u_18[v2232] = v_u_18[v2232] or v2232.Material
					v2232.Color = v2234.Color
					v2232.Material = v2234.Material
					v2232:AddTag("GeodeVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2235, p2236)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2239(p2237)
			for _, v2238 in p2237:GetDescendants() do
				if v2238:HasTag("Cleanup_Geode") then
					v2238:Destroy()
				end
			end
		end
		if p2236 then
			v2239(p2236)
		end
		if p2235 then
			v2239(p2235)
		end
		for _, v2240 in p2235:GetDescendants() do
			if (v2240:IsA("BasePart") or v2240:IsA("UnionOperation")) and v2240:HasTag("GeodeVisual") then
				v2240.Color = v_u_15[v2240] or v2240.Color
				v_u_15[v2240] = nil
				if v_u_18[v2240] then
					v2240.Material = v_u_18[v2240]
					v_u_18[v2240] = nil
				end
				v2240:RemoveTag("GeodeVisual")
			end
		end
	end
}
v_u_925.Supernatural = {
	["Id"] = "SU",
	["Name"] = "Supernatural",
	["ValueMulti"] = 37,
	["Color"] = Color3.fromRGB(79, 28, 110),
	["_AddFX"] = function(p2241, p2242, p2243)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2246(p2244)
			for _, v2245 in p2244:GetDescendants() do
				if v2245:IsA("ParticleEmitter") or (v2245:IsA("Trail") or (v2245:IsA("Beam") or (v2245:IsA("Smoke") or (v2245:IsA("Sparkles") or v2245:IsA("PointLight"))))) then
					v2245.Enabled = true
				end
			end
		end
		p2241:_RemoveFX(p2242, p2243)
		local v2247 = game.ServerStorage.Mutation_FX.Supernatural:GetChildren()
		if #v2247 ~= 0 then
			if p2243 then
				for _, v2248 in v2247 do
					local v2249 = v2248:Clone()
					v2249.Parent = p2243
					v2246(v2249)
					v2249:AddTag("Cleanup_Supernatural")
					v2249:AddTag("Effect")
				end
			end
			for _, v2250 in p2242:GetDescendants() do
				if v2250:IsA("BasePart") then
					v_u_15[v2250] = v_u_15[v2250] or v2250.Color
					v_u_18[v2250] = v_u_18[v2250] or v2250.Material
					v2250.Color = Color3.fromRGB(170, 215, 230)
					v2250.Material = Enum.Material.Neon
					v2250.Transparency = 0.6
					v2250:AddTag("SupernaturalVisual")
				end
			end
			local v2251 = {}
			for _, v2252 in p2242:GetDescendants() do
				if v2252:IsA("BasePart") and (v2252 ~= p2243 and not v2252:HasTag("Effect")) then
					table.insert(v2251, v2252)
				end
			end
			local v2253 = #v2247 > 6 and 3 or 2
			for v2254, v2255 in ipairs(v2251) do
				if v2254 % v2253 == 0 then
					local v2256 = v2247[math.random(1, #v2247)]:Clone()
					v2256.Parent = v2255
					v2246(v2256)
					v2256:AddTag("Cleanup_Supernatural")
					v2256:AddTag("Effect")
					if math.random() < 0.22 then
						local v2257 = v2247[math.random(1, #v2247)]:Clone()
						v2257.Parent = v2255
						v2246(v2257)
						v2257:AddTag("Cleanup_Supernatural")
						v2257:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2258, p2259)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2262(p2260)
			for _, v2261 in p2260:GetDescendants() do
				if v2261:HasTag("Cleanup_Supernatural") then
					v2261:Destroy()
				end
			end
		end
		if p2259 then
			v2262(p2259)
		end
		if p2258 then
			v2262(p2258)
		end
		for _, v2263 in p2258:GetDescendants() do
			if v2263:IsA("BasePart") and v2263:HasTag("SupernaturalVisual") then
				v2263:RemoveTag("SupernaturalVisual")
				v2263.Color = v_u_15[v2263] or v2263.Color
				v_u_15[v2263] = nil
				local v2264 = v_u_18[v2263]
				if v2264 then
					v2263.Material = v2264
					v_u_18[v2263] = nil
				end
				v2263.Transparency = 0
			end
		end
	end
}
v_u_925.Stormbound = {
	["Id"] = "STB",
	["Name"] = "Stormbound",
	["ValueMulti"] = 270,
	["Color"] = Color3.fromRGB(25, 46, 89),
	["_AddFX"] = function(p2265, p2266, p2267)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2270(p2268)
			for _, v2269 in p2268:GetDescendants() do
				if v2269:IsA("ParticleEmitter") or (v2269:IsA("Trail") or (v2269:IsA("Beam") or (v2269:IsA("Smoke") or (v2269:IsA("Sparkles") or v2269:IsA("PointLight"))))) then
					v2269.Enabled = true
				end
			end
		end
		p2265:_RemoveFX(p2266, p2267)
		local v2271 = game.ServerStorage.Mutation_FX.Stormbound:GetChildren()
		if #v2271 ~= 0 then
			if p2267 then
				for _, v2272 in v2271 do
					local v2273 = v2272:Clone()
					v2273.Parent = p2267
					v2270(v2273)
					v2273:AddTag("Cleanup_Stormbound")
					v2273:AddTag("Effect")
				end
			end
			local v2274 = {}
			for _, v2275 in p2266:GetDescendants() do
				if v2275:IsA("BasePart") and not v2275:HasTag("Effect") then
					v_u_15[v2275] = v_u_15[v2275] or v2275.Color
					v_u_18[v2275] = v_u_18[v2275] or v2275.Material
					table.insert(v2274, v2275)
				end
			end
			local v2276 = #v2274 * 1
			for _ = 1, math.ceil(v2276) do
				local v2277 = math.random(1, #v2274)
				local v2278 = table.remove(v2274, v2277)
				v2278.Material = Enum.Material.Neon
				v2278.Transparency = 0.4
				v2278:AddTag("StormboundVisual")
				v2278.Color = Color3.fromRGB(60, 75, 120)
			end
			local v2279 = #v2271 <= 4 and 2 or 3
			for v2280, v2281 in ipairs(v2274) do
				if v2280 % v2279 == 0 then
					local v2282 = v2271[math.random(1, #v2271)]:Clone()
					v2282.Parent = v2281
					v2270(v2282)
					v2282:AddTag("Cleanup_Stormbound")
					v2282:AddTag("Effect")
					if math.random() < 0.15 then
						local v2283 = v2271[math.random(1, #v2271)]:Clone()
						v2283.Parent = v2281
						v2270(v2283)
						v2283:AddTag("Cleanup_Stormbound")
						v2283:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2284, p2285)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2288(p2286)
			for _, v2287 in p2286:GetDescendants() do
				if v2287:HasTag("Cleanup_Stormbound") then
					v2287:Destroy()
				end
			end
		end
		if p2285 then
			v2288(p2285)
		end
		if p2284 then
			v2288(p2284)
		end
		for _, v2289 in p2284:GetDescendants() do
			if v2289:IsA("BasePart") and v2289:HasTag("StormboundVisual") then
				v2289:RemoveTag("StormboundVisual")
				v2289.Color = v_u_15[v2289] or v2289.Color
				v_u_15[v2289] = nil
				local v2290 = v_u_18[v2289]
				if v2290 then
					v2289.Material = v2290
					v_u_18[v2289] = nil
				end
				v2289.Transparency = 0
			end
		end
	end
}
v_u_925.SunScorched = {
	["Id"] = "SCO",
	["Name"] = "SunScorched",
	["ValueMulti"] = 32,
	["Color"] = Color3.fromRGB(210, 115, 30),
	["_AddFX"] = function(p2291, p2292, p2293)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2296(p2294)
			for _, v2295 in p2294:GetDescendants() do
				if v2295:IsA("ParticleEmitter") or (v2295:IsA("Trail") or (v2295:IsA("Beam") or (v2295:IsA("Smoke") or (v2295:IsA("Sparkles") or v2295:IsA("PointLight"))))) then
					v2295.Enabled = true
				end
			end
		end
		p2291:_RemoveFX(p2292, p2293)
		local v2297 = game.ServerStorage.Mutation_FX.SunScorched:GetChildren()
		if #v2297 ~= 0 then
			if p2293 then
				for _, v2298 in v2297 do
					local v2299 = v2298:Clone()
					v2299.Parent = p2293
					v2296(v2299)
					v2299:AddTag("Cleanup_SunScorched")
					v2299:AddTag("Effect")
				end
			end
			local v2300 = {}
			for _, v2301 in p2292:GetDescendants() do
				if v2301:IsA("BasePart") then
					v_u_15[v2301] = v_u_15[v2301] or v2301.Color
					v_u_18[v2301] = v_u_18[v2301] or v2301.Material
					v2301.Material = Enum.Material.Sand
					v2301.Color = Color3.fromRGB(210, 115, 30)
					v2301:AddTag("SunScorchedVisual")
					table.insert(v2300, v2301)
				end
			end
			local v2302 = #v2297 > 5 and 3 or 2
			for v2303, v2304 in ipairs(v2300) do
				if v2303 % v2302 == 0 then
					local v2305 = v2297[math.random(1, #v2297)]:Clone()
					v2305.Parent = v2304
					v2296(v2305)
					v2305:AddTag("Cleanup_SunScorched")
					v2305:AddTag("Effect")
					if math.random() < 0.18 then
						local v2306 = v2297[math.random(1, #v2297)]:Clone()
						v2306.Parent = v2304
						v2296(v2306)
						v2306:AddTag("Cleanup_SunScorched")
						v2306:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2307, p2308)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2311(p2309)
			for _, v2310 in p2309:GetDescendants() do
				if v2310:HasTag("Cleanup_SunScorched") then
					v2310:Destroy()
				end
			end
		end
		if p2308 then
			v2311(p2308)
		end
		if p2307 then
			v2311(p2307)
		end
		for _, v2312 in p2307:GetDescendants() do
			if v2312:IsA("BasePart") and v2312:HasTag("SunScorchedVisual") then
				v2312:RemoveTag("SunScorchedVisual")
				v2312.Color = v_u_15[v2312] or v2312.Color
				v_u_15[v2312] = nil
				local v2313 = v_u_18[v2312]
				if v2313 then
					v2312.Material = v2313
					v_u_18[v2312] = nil
				end
				v2312.Transparency = 0
			end
		end
	end
}
v_u_925.Riptide = {
	["Id"] = "RP",
	["Name"] = "Riptide",
	["ValueMulti"] = 80,
	["Color"] = Color3.fromRGB(15, 151, 178),
	["_AddFX"] = function(p2314, p2315, p2316)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2319(p2317)
			for _, v2318 in p2317:GetDescendants() do
				if v2318:IsA("ParticleEmitter") or (v2318:IsA("Trail") or (v2318:IsA("Beam") or (v2318:IsA("Smoke") or (v2318:IsA("Sparkles") or v2318:IsA("PointLight"))))) then
					v2318.Enabled = true
				end
			end
		end
		p2314:_RemoveFX(p2315, p2316)
		local v2320 = game.ServerStorage.Mutation_FX.Riptide:GetChildren()
		if #v2320 ~= 0 then
			if p2316 then
				for _, v2321 in v2320 do
					local v2322 = v2321:Clone()
					v2322.Parent = p2316
					v2319(v2322)
					v2322:AddTag("Cleanup_Riptide")
					v2322:AddTag("Effect")
				end
			end
			local v2323 = {}
			for _, v2324 in p2315:GetDescendants() do
				if v2324:IsA("BasePart") then
					v_u_15[v2324] = v_u_15[v2324] or v2324.Color
					v_u_18[v2324] = v_u_18[v2324] or v2324.Material
					v2324.Material = Enum.Material.Glass
					v2324.Color = Color3.fromRGB(15, 151, 178)
					v2324.Transparency = 0.3
					v2324:AddTag("RiptideVisual")
					table.insert(v2323, v2324)
				end
			end
			for v2325, v2326 in ipairs(v2323) do
				if v2325 % 2 == 0 then
					local v2327 = v2320[math.random(1, #v2320)]:Clone()
					v2327.Parent = v2326
					v2319(v2327)
					v2327:AddTag("Cleanup_Riptide")
					v2327:AddTag("Effect")
					if math.random() < 0.18 then
						local v2328 = v2320[math.random(1, #v2320)]:Clone()
						v2328.Parent = v2326
						v2319(v2328)
						v2328:AddTag("Cleanup_Riptide")
						v2328:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2329, p2330)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2333(p2331)
			for _, v2332 in p2331:GetDescendants() do
				if v2332:HasTag("Cleanup_Riptide") then
					v2332:Destroy()
				end
			end
		end
		if p2330 then
			v2333(p2330)
		end
		if p2329 then
			v2333(p2329)
		end
		for _, v2334 in p2329:GetDescendants() do
			if v2334:IsA("BasePart") and v2334:HasTag("RiptideVisual") then
				v2334:RemoveTag("RiptideVisual")
				v2334.Color = v_u_15[v2334] or v2334.Color
				v_u_15[v2334] = nil
				local v2335 = v_u_18[v2334]
				if v2335 then
					v2334.Material = v2335
					v_u_18[v2334] = nil
				end
				v2334.Transparency = 0
			end
		end
	end
}
v_u_925.Grim = {
	["Id"] = "GRM",
	["Name"] = "Grim",
	["ValueMulti"] = 170,
	["Color"] = Color3.fromRGB(6, 7, 23),
	["_AddFX"] = function(p2336, p2337, p2338)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2341(p2339)
			for _, v2340 in p2339:GetDescendants() do
				if v2340:IsA("ParticleEmitter") or (v2340:IsA("Trail") or (v2340:IsA("Beam") or (v2340:IsA("Smoke") or (v2340:IsA("Sparkles") or v2340:IsA("PointLight"))))) then
					v2340.Enabled = true
				end
			end
		end
		p2336:_RemoveFX(p2337, p2338)
		local v2342 = game.ServerStorage.Mutation_FX.Grim:GetChildren()
		if #v2342 ~= 0 then
			if p2338 then
				for _, v2343 in v2342 do
					local v2344 = v2343:Clone()
					v2344.Parent = p2338
					v2341(v2344)
					v2344:AddTag("Cleanup_Grim")
					v2344:AddTag("Effect")
				end
			end
			for _, v2345 in p2337:GetDescendants() do
				if v2345:IsA("BasePart") then
					v_u_15[v2345] = v_u_15[v2345] or v2345.Color
					v_u_18[v2345] = v_u_18[v2345] or v2345.Material
					v2345.Color = Color3.fromRGB(10, 10, 25)
					v2345:AddTag("GrimVisual")
				end
			end
			local v2346 = {}
			for _, v2347 in p2337:GetDescendants() do
				if v2347:IsA("BasePart") and (v2347 ~= p2338 and not v2347:HasTag("Effect")) then
					table.insert(v2346, v2347)
				end
			end
			for v2348, v2349 in ipairs(v2346) do
				if v2348 % 2 == 0 then
					local v2350 = v2342[math.random(1, #v2342)]:Clone()
					v2350.Parent = v2349
					v2341(v2350)
					v2350:AddTag("Cleanup_Grim")
					v2350:AddTag("Effect")
					if math.random() < 0.2 then
						local v2351 = v2342[math.random(1, #v2342)]:Clone()
						v2351.Parent = v2349
						v2341(v2351)
						v2351:AddTag("Cleanup_Grim")
						v2351:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2352, p2353)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2356(p2354)
			for _, v2355 in p2354:GetDescendants() do
				if v2355:HasTag("Cleanup_Grim") then
					v2355:Destroy()
				end
			end
		end
		if p2353 then
			v2356(p2353)
		end
		if p2352 then
			v2356(p2352)
		end
		for _, v2357 in p2352:GetDescendants() do
			if v2357:IsA("BasePart") and v2357:HasTag("GrimVisual") then
				v2357:RemoveTag("NGrimVisual")
				v2357.Color = v_u_15[v2357] or v2357.Color
				v_u_15[v2357] = nil
				local v2358 = v_u_18[v2357]
				if v2358 then
					v2357.Material = v2358
					v_u_18[v2357] = nil
				end
				v2357.Transparency = 0
			end
		end
	end
}
v_u_925.Extraterrestrial = {
	["Id"] = "ET",
	["Name"] = "Extraterrestrial",
	["ValueMulti"] = 130,
	["Color"] = Color3.fromRGB(17, 0, 255),
	["_AddFX"] = function(p2359, p2360, p2361)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2359:_RemoveFX(p2360, p2361)
		local v2362 = Random.new()
		local v2363 = game.ServerStorage.Mutation_FX.Extraterrestrial
		if p2361 then
			for _, v2364 in v2363:GetChildren() do
				local v2365 = v2364:Clone()
				v2365.Parent = p2361
				v2365.Enabled = true
				v2365:AddTag("Cleanup_Extraterrestrial")
			end
		end
		local v2366 = {
			Color3.fromRGB(3, 23, 76),
			Color3.fromRGB(3, 96, 159),
			Color3.fromRGB(3, 142, 206),
			Color3.fromRGB(0, 149, 94),
			Color3.fromRGB(0, 255, 217),
			Color3.fromRGB(3, 23, 76)
		}
		for v2367, v2368 in p2360:GetDescendants() do
			if v2368:IsA("BasePart") or v2368:IsA("UnionOperation") then
				if v2367 % 5 == 0 then
					local v2369 = v2363:FindFirstChild("Sparkle")
					if v2369 then
						local v2370 = v2369:Clone()
						v2370.Parent = v2368
						v2370.Enabled = true
						v2370.Rate = v2362:NextNumber(17, 25) / 20
						v2370:AddTag("Cleanup_Extraterrestrial")
					end
					local v2371 = v2363:FindFirstChild("Swirls")
					if v2371 then
						local v2372 = v2371:Clone()
						v2372.Parent = v2368
						v2372.Enabled = true
						v2372.Rate = v2362:NextNumber(17, 25) / 30
						v2372:AddTag("Cleanup_Extraterrestrial")
					end
				end
				if not v2368:HasTag("Effect") and v2368.Transparency ~= 1 then
					v_u_15[v2368] = v_u_15[v2368] or v2368.Color
					v_u_18[v2368] = v_u_18[v2368] or v2368.Material
					if v2362:NextInteger(1, 9) == 1 then
						v2368.Material = Enum.Material.Marble
					else
						v2368.Material = Enum.Material.Neon
					end
					local v2373 = v2366[v2362:NextInteger(1, #v2366)]
					v2368.Color = v2368.Color:Lerp(v2373, 0.9)
					v2368:AddTag("ExtraterrestrialVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2374, p2375)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2378(p2376)
			for _, v2377 in p2376:GetDescendants() do
				if v2377:HasTag("Cleanup_Extraterrestrial") then
					v2377:Destroy()
				end
			end
		end
		if p2375 then
			v2378(p2375)
		end
		if p2374 then
			v2378(p2374)
		end
		for _, v2379 in p2374:GetDescendants() do
			if (v2379:IsA("BasePart") or v2379:IsA("UnionOperation")) and v2379:HasTag("ExtraterrestrialVisual") then
				v2379:RemoveTag("ExtraterrestrialVisual")
				v2379.Color = v_u_15[v2379] or v2379.Color
				v_u_15[v2379] = nil
				if v_u_18[v2379] then
					v2379.Material = v_u_18[v2379]
					v_u_18[v2379] = nil
				end
				v2379.Reflectance = 0
			end
		end
	end
}
v_u_925.Mineral = {
	["Id"] = "MN",
	["Name"] = "Mineral",
	["ValueMulti"] = 18,
	["Color"] = Color3.fromRGB(112, 88, 71),
	["_AddFX"] = function(p2380, p2381, p2382)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2380:_RemoveFX(p2381, p2382)
		if p2382 then
			for _, v2383 in game.ServerStorage.Mutation_FX.Mineral:GetChildren() do
				local v2384 = v2383:Clone()
				v2384.Parent = p2382
				v2384.Enabled = true
			end
		end
		for v2385, v2386 in p2381:GetDescendants() do
			if v2386:IsA("BasePart") or v2386:IsA("UnionOperation") then
				if v2385 % 3 == 0 then
					local v2387 = game.ServerStorage.Mutation_FX.Mineral.AmberParticle:Clone()
					v2387.Parent = v2386
					v2387.Enabled = true
					v2387.Rate = math.random(17, 25) / 20
					v2387:AddTag("Cleanup_Mineral")
					local v2388 = game.ServerStorage.Mutation_FX.Mineral.BurntSizzle:Clone()
					v2388.Parent = v2386
					v2388.Enabled = true
					v2388.Rate = math.random(17, 25) / 30
					v2388:AddTag("Cleanup_Mineral")
					local v2389 = game.ServerStorage.Mutation_FX.Mineral.CharcoalParticles:Clone()
					v2389.Parent = v2386
					v2389.Enabled = true
					v2389.Rate = math.random(17, 25) / 30
					v2389:AddTag("Cleanup_Mineral")
					local v2390 = game.ServerStorage.Mutation_FX.Mineral.ClayParticle:Clone()
					v2390.Parent = v2386
					v2390.Enabled = true
					v2390.Rate = math.random(17, 25) / 30
					v2390:AddTag("Cleanup_Mineral")
					local v2391 = game.ServerStorage.Mutation_FX.Mineral.brown:Clone()
					v2391.Parent = v2386
					v2391.Enabled = true
					v2391.Rate = math.random(17, 25) / 30
					v2391:AddTag("Cleanup_Mineral")
					local v2392 = game.ServerStorage.Mutation_FX.Mineral.green:Clone()
					v2392.Parent = v2386
					v2392.Enabled = true
					v2392.Rate = math.random(17, 25) / 30
					v2392:AddTag("Cleanup_Mineral")
				end
				Color3.new(0.0666667, 0.298039, 0.121569)
				if not v2386:HasTag("Effect") and v2386.Transparency ~= 1 then
					v_u_15[v2386] = v_u_15[v2386] or v2386.Color
					v_u_18[v2386] = v_u_18[v2386] or v2386.Material
					v2386.Material = Enum.Material.Rock
					local v2393 = Color3.new(0.298039, 0.266667, 0.137255)
					v2386.Color = v2386.Color:Lerp(v2393, 0.9)
					v2386:AddTag("MineralVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2394, p2395)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2395 then
			for _, v2396 in p2395:GetChildren() do
				if v2396:HasTag("Cleanup_Mineral") then
					v2396:Destroy()
				end
			end
		end
		for _, v2397 in p2394:GetDescendants() do
			if (v2397:IsA("BasePart") or v2397:IsA("UnionOperation")) and v2397:HasTag("MineralVisual") then
				v2397:RemoveTag("MineralVisual")
				v2397.Color = v_u_15[v2397] or v2397.Color
				v_u_15[v2397] = nil
				v2397.Material = v_u_18[v2397] or v2397.Material
				v_u_18[v2397] = nil
				v2397.Reflectance = 0
			end
		end
	end
}
v_u_925.MindBender = {
	["Id"] = "MBR",
	["Name"] = "MindBender",
	["ValueMulti"] = 175,
	["Color"] = Color3.fromRGB(255, 48, 210),
	["_AddFX"] = function(p2398, p2399, p2400)
		p2398:_RemoveFX(p2399, p2400)
		if p2400 then
			for _, v2401 in game.ServerStorage.Mutation_FX.MindBender:GetChildren() do
				local v2402 = v2401:Clone()
				v2402.Parent = p2400
				v2402.Enabled = true
				v2402:AddTag("Cleanup_MindBender")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2403, p2404)
		local function v2407(p2405)
			for _, v2406 in p2405:GetDescendants() do
				if v2406:HasTag("Cleanup_MindBender") then
					v2406:Destroy()
				end
			end
		end
		if p2404 then
			v2407(p2404)
		end
		if p2403 then
			v2407(p2403)
		end
	end
}
v_u_925.Affluent = {
	["Id"] = "AF",
	["Name"] = "Affluent",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(57, 238, 255),
	["_AddFX"] = function(p2408, p2409, p2410)
		p2408:_RemoveFX(p2409, p2410)
		p2410.Material = Enum.Material.Neon
		local v2411 = Color3.new(0.14902, 0.898039, 0.898039)
		p2410.Color = p2410.Color:Lerp(v2411, 0.9)
		p2410:AddTag("AffluentVisual")
		if p2410 then
			for _, v2412 in game.ServerStorage.Mutation_FX.Affluent:GetChildren() do
				local v2413 = v2412:Clone()
				v2413.Parent = p2410
				v2413.Enabled = true
				v2413:AddTag("Cleanup_Affluent")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2414, p2415)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2418(p2416)
			for _, v2417 in p2416:GetDescendants() do
				if v2417:HasTag("Cleanup_Affluent") then
					v2417:Destroy()
				end
			end
		end
		if p2415 then
			v2418(p2415)
		end
		if p2414 then
			v2418(p2414)
		end
		if p2415:HasTag("AffluentVisual") then
			p2415:RemoveTag("AffluentVisual")
			p2415.Color = v_u_15[p2415] or p2415.Color
			v_u_15[p2415] = nil
			p2415.Material = v_u_18[p2415] or p2415.Material
			v_u_18[p2415] = nil
			p2415.Reflectance = 0
		end
	end
}
v_u_925.Fractured = {
	["Id"] = "FD",
	["Name"] = "Fractured",
	["ValueMulti"] = 92,
	["Color"] = Color3.fromRGB(255, 3, 3),
	["_AddFX"] = function(p2419, p2420, p2421)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2419:_RemoveFX(p2420, p2421)
		for _, v2422 in p2420:GetDescendants() do
			if (v2422:IsA("BasePart") or v2422:IsA("UnionOperation")) and (not v2422:HasTag("Effect") and v2422.Transparency ~= 1) then
				v_u_15[v2422] = v_u_15[v2422] or v2422.Color
				v_u_18[v2422] = v_u_18[v2422] or v2422.Material
				v2422.Material = Enum.Material.CrackedLava
				local v2423 = Color3.new(0.937255, 0.0352941, 0.0352941)
				v2422.Color = v2422.Color:Lerp(v2423, 0.9)
				v2422:AddTag("FracturedVisual")
			end
		end
		if p2421 then
			for _, v2424 in game.ServerStorage.Mutation_FX.Fractured:GetChildren() do
				local v2425 = v2424:Clone()
				v2425.Parent = p2421
				v2425.Enabled = true
				v2425:AddTag("Cleanup_Fractured")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2426, p2427)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2430(p2428)
			for _, v2429 in p2428:GetDescendants() do
				if v2429:HasTag("Cleanup_Fractured") then
					v2429:Destroy()
				end
			end
		end
		if p2427 then
			v2430(p2427)
		end
		if p2426 then
			v2430(p2426)
		end
		if p2427:HasTag("FracturedVisual") then
			p2427:RemoveTag("FracturedVisual")
			p2427.Color = v_u_15[p2427] or p2427.Color
			v_u_15[p2427] = nil
			p2427.Material = v_u_18[p2427] or p2427.Material
			v_u_18[p2427] = nil
			p2427.Reflectance = 0
		end
	end
}
v_u_925.Coin = {
	["Id"] = "CN",
	["Name"] = "Coin",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(255, 216, 0),
	["_AddFX"] = function(p2431, p2432, p2433)
		-- upvalues: (copy) v_u_18
		p2431:_RemoveFX(p2432, p2433)
		if p2433 then
			for _, v2434 in game.ServerStorage.Mutation_FX.Coin:GetChildren() do
				local v2435 = v2434:Clone()
				v2435.Parent = p2433
				v2435.Enabled = true
				v2435:AddTag("Cleanup_Coin")
			end
		end
		for _, v2436 in p2432:GetDescendants() do
			if (v2436:IsA("BasePart") or v2436:IsA("UnionOperation")) and not v2436:HasTag("Effect") then
				v_u_18[v2436] = v_u_18[v2436] or v2436.Material
				v2436.Material = Enum.Material.SmoothPlastic
				v2436:AddTag("CoinVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2437, p2438)
		-- upvalues: (copy) v_u_18
		local function v2441(p2439)
			for _, v2440 in p2439:GetDescendants() do
				if v2440:HasTag("Cleanup_Coin") then
					v2440:Destroy()
				end
			end
		end
		if p2438 then
			v2441(p2438)
		end
		if p2437 then
			v2441(p2437)
		end
		for _, v2442 in p2437:GetDescendants() do
			if (v2442:IsA("BasePart") or v2442:IsA("UnionOperation")) and v2442:HasTag("CoinVisual") then
				v2442:RemoveTag("CoinVisual")
				if v_u_18[v2442] then
					v2442.Material = v_u_18[v2442]
					v_u_18[v2442] = nil
				end
				v2442.Reflectance = 0
			end
		end
	end
}
v_u_925.Arctic = {
	["Id"] = "AT",
	["Name"] = "Arctic",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p2443, p2444, p2445)
		p2443:_RemoveFX(p2444, p2445)
		if p2445 then
			for _, v2446 in game.ServerStorage.Mutation_FX.Arctic:GetChildren() do
				local v2447 = v2446:Clone()
				v2447.Parent = p2445
				v2447:AddTag("Cleanup_Arctic")
				if v2447:IsA("ParticleEmitter") then
					v2447.Enabled = true
				end
			end
		end
		for _, v2448 in p2444:GetDescendants() do
			if (v2448:IsA("BasePart") or v2448:IsA("UnionOperation")) and (not v2448:HasTag("Effect") and (not v2448.Transparency or v2448.Transparency ~= 1)) then
				v2448.Color = v2448.Color:Lerp(Color3.fromRGB(255, 255, 255), 0.5)
				v2448:AddTag("ArcticVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2449, p2450)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2453(p2451)
			for _, v2452 in p2451:GetDescendants() do
				if v2452:HasTag("Arctic") then
					v2452:Destroy()
				end
			end
		end
		if p2450 then
			v2453(p2450)
		end
		for _, v2454 in p2449:GetDescendants() do
			if (v2454:IsA("BasePart") or v2454:IsA("UnionOperation")) and v2454:HasTag("ArcticVisual") then
				v2454.Color = v_u_15[v2454] or v2454.Color
				v_u_15[v2454] = nil
				v2454:RemoveTag("ArcticVisual")
				if v_u_18[v2454] then
					v2454.Material = v_u_18[v2454]
					v_u_18[v2454] = nil
				end
			end
		end
	end
}
v_u_925.Ornamented = {
	["Id"] = "Orn",
	["Name"] = "Ornamented",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(34, 102, 50),
	["_AddFX"] = function(p2455, p2456, p2457)
		-- upvalues: (copy) v_u_74, (copy) v_u_15
		p2455:_RemoveFX(p2456, p2457)
		local v2458 = false
		for v2459, v2460 in p2456:GetDescendants() do
			if (v2460:IsA("BasePart") or v2460:IsA("UnionOperation")) and v2460.Transparency ~= 1 then
				if v2459 % 5 == 0 or v2458 == false then
					v2458 = true
					local v2461 = v_u_74(v2460, p2456, game.ServerStorage.Mutation_FX.Ornamented.OrnamentTemplate, 0.15, 0)
					if v2461 then
						v2461.PrimaryPart.Sparkles.Rate = math.random(2, 5) / 10
						v2461.PrimaryPart.Sparkles.Enabled = true
					end
				end
				if not v2460:HasTag("Effect") then
					v_u_15[v2460] = v_u_15[v2460] or v2460.Color
					local v2462 = Color3.new(0.121569, 0.364706, 0.176471)
					v2460.Color = v2460.Color:Lerp(v2462, 0.8)
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2463, p2464)
		-- upvalues: (copy) v_u_15
		if p2464 then
			for _, v2465 in p2464:GetChildren() do
				if v2465:HasTag("Cleanup_Ornamented") then
					v2465:Destroy()
				end
			end
		end
		for _, v2466 in p2463:GetDescendants() do
			if v2466:IsA("BasePart") or v2466:IsA("UnionOperation") then
				if v2466:HasTag("OrnamentedVisual") then
					v2466:RemoveTag("OrnamentedVisual")
					v2466.Color = v_u_15[v2466] or v2466.Color
					v_u_15[v2466] = nil
					v2466.Reflectance = 0
				elseif v2466:HasTag("OrnamentedDecal") then
					v2466:Destroy()
				end
			end
		end
	end
}
v_u_925.Glacial = {
	["Id"] = "Gla",
	["Name"] = "Glacial",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(134, 255, 251),
	["_AddFX"] = function(p2467, p2468, p2469)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2467:_RemoveFX(p2468, p2469)
		if p2469 then
			for _, v2470 in game.ServerStorage.Mutation_FX.Glacial:GetChildren() do
				local v2471 = v2470:Clone()
				v2471.Parent = p2469
				v2471.Enabled = true
				v2471:AddTag("Cleanup_Glacial")
			end
		end
		for v2472, v2473 in p2468:GetDescendants() do
			if v2473:IsA("BasePart") or v2473:IsA("UnionOperation") then
				if v2472 % 6 == 0 then
					local v2474 = game.ServerStorage.Mutation_FX.Glacial.Bits:Clone()
					v2474.Parent = v2473
					v2474.Enabled = true
					v2474.Rate = math.random(8, 25) / 20
					v2474:AddTag("Cleanup_Glacial")
					local v2475 = game.ServerStorage.Mutation_FX.Glacial.Frost:Clone()
					v2475.Parent = v2473
					v2475.Enabled = true
					v2475.Rate = math.random(8, 25) / 20
					v2475:AddTag("Cleanup_Glacial")
					local v2476 = game.ServerStorage.Mutation_FX.Glacial.Snowflake:Clone()
					v2476.Parent = v2473
					v2476.Enabled = true
					v2476.Rate = math.random(8, 25) / 20
					v2476:AddTag("Cleanup_Glacial")
				end
				if not v2473:HasTag("Effect") then
					if v2473.Transparency ~= 1 then
						v_u_15[v2473] = v_u_15[v2473] or v2473.Color
						v_u_18[v2473] = v_u_18[v2473] or v2473.Material
						v2473.Material = "Ice"
						local v2477 = Color3.new(0.454902, 1, 1)
						v2473.Color = v2473.Color:Lerp(v2477, 0.65)
					end
					v_u_18[v2473] = v_u_18[v2473] or v2473.Material
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2478, p2479)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2479 then
			for _, v2480 in p2479:GetChildren() do
				if v2480:HasTag("Cleanup_Glacial") then
					v2480:Destroy()
				end
			end
		end
		for _, v2481 in p2478:GetDescendants() do
			if v2481:IsA("BasePart") or v2481:IsA("UnionOperation") then
				if v2481:HasTag("GlacialVisual") then
					v2481:RemoveTag("GlacialVisual")
					v2481.Color = v_u_15[v2481] or v2481.Color
					v2481.Material = v_u_18[v2481] or v2481.Material
					v_u_15[v2481] = nil
					v2481.Reflectance = 0
				elseif v2481:HasTag("GlacialDecal") then
					v2481:Destroy()
				end
			end
		end
	end
}
v_u_925.Snowtouched = {
	["Id"] = "Snot",
	["Name"] = "Snowtouched",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(209, 209, 209),
	["_AddFX"] = function(p2482, p2483, p2484)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2482:_RemoveFX(p2483, p2484)
		if p2484 then
			for _, v2485 in game.ServerStorage.Mutation_FX.Snowtouched:GetChildren() do
				local v2486 = v2485:Clone()
				v2486.Parent = p2484
				v2486.Enabled = true
				v2486:AddTag("Cleanup_Snowtouched")
			end
		end
		local v2487 = false
		for v2488, v2489 in p2483:GetDescendants() do
			if (v2489:IsA("BasePart") or v2489:IsA("UnionOperation")) and not v2489:HasTag("Effect") then
				if v2489.Transparency ~= 1 then
					v_u_15[v2489] = v_u_15[v2489] or v2489.Color
					v_u_18[v2489] = v_u_18[v2489] or v2489.Material
					if v2488 % 5 == 0 or v2487 == false then
						v2489.Material = "Ice"
						local v2490 = Color3.new(0.466667, 0.886275, 1)
						v2489.Color = v2489.Color:Lerp(v2490, 0.65)
						local v2491 = game.ServerStorage.Mutation_FX.Snowtouched.Frost:Clone()
						v2491.Parent = v2489
						v2491.Rate = math.random(2, 4) / 10
						v2491.Enabled = true
						v2491:AddTag("Cleanup_Snowtouched")
						v2487 = true
					else
						local v2492 = Color3.new(1, 1, 1)
						v2489.Color = v2489.Color:Lerp(v2492, 0.65)
						local v2493 = game.ServerStorage.Mutation_FX.Snowtouched.Snow:Clone()
						v2493.Parent = v2489
						v2493.Rate = math.random(4, 12) / 10
						v2493.Enabled = true
						v2493:AddTag("Cleanup_Snowtouched")
					end
				end
				v_u_18[v2489] = v_u_18[v2489] or v2489.Material
			end
		end
	end,
	["_RemoveFX"] = function(_, p2494, p2495)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2495 then
			for _, v2496 in p2495:GetChildren() do
				if v2496:HasTag("Cleanup_Snowtouched") then
					v2496:Destroy()
				end
			end
		end
		for _, v2497 in p2494:GetDescendants() do
			if v2497:IsA("BasePart") or v2497:IsA("UnionOperation") then
				if v2497:HasTag("SnowtouchedVisual") then
					v2497:RemoveTag("SnowtouchedVisual")
					v2497.Color = v_u_15[v2497] or v2497.Color
					v2497.Material = v_u_18[v2497] or v2497.Material
					v_u_15[v2497] = nil
					v2497.Reflectance = 0
				elseif v2497:HasTag("SnowtouchedDecal") then
					v2497:Destroy()
				end
			end
		end
	end
}
v_u_925.Snowy = {
	["Id"] = "SN",
	["Name"] = "Snowy",
	["ValueMulti"] = 2,
	["Color"] = Color3.fromRGB(157, 217, 255),
	["_AddFX"] = function(p2498, p2499, p2500)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2498:_RemoveFX(p2499, p2500)
		if p2500 then
			for _, v2501 in game.ServerStorage.Mutation_FX.Snowy:GetChildren() do
				local v2502 = v2501:Clone()
				v2502.Parent = p2500
				v2502.Enabled = true
				v2502:AddTag("Cleanup_Snowy")
			end
		end
		for _, v2503 in p2499:GetDescendants() do
			if (v2503:IsA("BasePart") or v2503:IsA("UnionOperation")) and not v2503:HasTag("Effect") then
				v_u_15[v2503] = v_u_15[v2503] or v2503.Color
				v_u_18[v2503] = v_u_18[v2503] or v2503.Material
				v2503.Color = Color3.fromRGB(143, 155, 158)
				v2503.Material = Enum.Material.Neon
				v2503:AddTag("SnowyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2504, p2505)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2508(p2506)
			for _, v2507 in p2506:GetDescendants() do
				if v2507:HasTag("Cleanup_Snowy") then
					v2507:Destroy()
				end
			end
		end
		if p2505 then
			v2508(p2505)
		end
		if p2504 then
			v2508(p2504)
		end
		for _, v2509 in p2504:GetDescendants() do
			if (v2509:IsA("BasePart") or v2509:IsA("UnionOperation")) and v2509:HasTag("SnowyVisual") then
				v2509:RemoveTag("SnowyVisual")
				v2509.Color = v_u_15[v2509] or v2509.Color
				v_u_15[v2509] = nil
				if v_u_18[v2509] then
					v2509.Material = v_u_18[v2509]
					v_u_18[v2509] = nil
				end
				v2509.Reflectance = 0
			end
		end
	end
}
v_u_925.Eggnog = {
	["Id"] = "EG",
	["Name"] = "Eggnog",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 188, 144),
	["_AddFX"] = function(p2510, p2511, p2512)
		p2510:_RemoveFX(p2511, p2512)
		if p2512 then
			for _, v2513 in game.ServerStorage.Mutation_FX.Eggnog:GetChildren() do
				local v2514 = v2513:Clone()
				v2514.Parent = p2512
				v2514.Enabled = true
				v2514:AddTag("Cleanup_Eggnog")
				v2514:AddTag("Effect")
			end
		end
		for _, v2515 in p2511:GetDescendants() do
			if (v2515:IsA("BasePart") or v2515:IsA("UnionOperation")) and not v2515:HasTag("Effect") then
				v2515:AddTag("EggnogVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2516, p2517)
		-- upvalues: (copy) v_u_18
		if p2517 then
			for _, v2518 in p2517:GetChildren() do
				if v2518:HasTag("Cleanup_Eggnog") then
					v2518:Destroy()
				end
			end
		end
		for _, v2519 in p2516:GetDescendants() do
			if (v2519:IsA("BasePart") or v2519:IsA("UnionOperation")) and v2519:HasTag("EggnogVisual") then
				v2519:RemoveTag("EggnogVisual")
				local v2520 = v_u_18[v2519]
				if v2520 then
					v2519.Material = v2520
					v_u_18[v2519] = nil
				end
			end
		end
	end
}
v_u_925.Blizzard = {
	["Id"] = "BD",
	["Name"] = "Blizzard",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 170, 255),
	["_AddFX"] = function(p2521, p2522, p2523)
		-- upvalues: (copy) v_u_152, (copy) v_u_18, (copy) v_u_19, (copy) v_u_15
		p2521:_RemoveFX(p2522, p2523)
		v_u_152(p2521, p2522, p2523, 0.4)
		if p2523 then
			for _, v2524 in game.ServerStorage.Mutation_FX.Blizzard:GetChildren() do
				local v2525 = v2524:Clone()
				v2525.Parent = p2523
				v2525:AddTag("Cleanup_Blizzard")
				if v2525:IsA("ParticleEmitter") then
					v2525.Enabled = true
				end
			end
		end
		for _, v2526 in p2522:GetChildren() do
			if v2526:IsA("BasePart") or v2526:IsA("UnionOperation") then
				v2526.Reflectance = 0.35
			end
		end
		for _, v2527 in p2522:GetDescendants() do
			if (v2527:IsA("BasePart") or v2527:IsA("UnionOperation")) and (not v2527:HasTag("Effect") and (not v2527.Transparency or v2527.Transparency ~= 1)) then
				v_u_18[v2527] = v_u_18[v2527] or v2527.Material
				v2527.Material = Enum.Material.Plastic
				v_u_19[v2527] = v_u_19[v2527] or v2527.MaterialVariant
				v2527.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_15[v2527] = v_u_15[v2527] or v2527.Color
				v2527.Color = v2527.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
				v2527:AddTag("BlizzardVisual")
			end
		end
	end,
	["_RemoveFX"] = function(p2528, p2529, p2530)
		-- upvalues: (copy) v_u_161, (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		v_u_161(p2528, p2529, p2530)
		local function v2533(p2531)
			for _, v2532 in p2531:GetDescendants() do
				if v2532:HasTag("Cleanup_Blizzard") then
					v2532:Destroy()
				end
			end
		end
		if p2530 then
			v2533(p2530)
		end
		if p2529 then
			v2533(p2529)
		end
		for _, v2534 in p2529:GetDescendants() do
			if v2534:IsA("BasePart") or v2534:IsA("UnionOperation") then
				v2534.Reflectance = 0
				if v2534:HasTag("BlizzardVisual") then
					v2534.Color = v_u_15[v2534] or v2534.Color
					v_u_15[v2534] = nil
					v2534:RemoveTag("BlizzardVisual")
					v2534.MaterialVariant = v_u_19[v2534] or v2534.MaterialVariant
					v_u_19[v2534] = nil
					if v_u_18[v2534] then
						v2534.Material = v_u_18[v2534]
						v_u_18[v2534] = nil
					end
				end
			end
		end
	end
}
v_u_925.Opulent = {
	["Id"] = "OP",
	["Name"] = "Opulent",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 67, 255),
	["_AddFX"] = function(p2535, p2536, p2537)
		-- upvalues: (copy) v_u_15
		p2535:_RemoveFX(p2536, p2537)
		if p2537 then
			for _, v2538 in game.ServerStorage.Mutation_FX.Opulent:GetChildren() do
				local v2539 = v2538:Clone()
				v2539.Parent = p2537
				v2539:AddTag("Cleanup_Opulent")
			end
		end
		for _, v2540 in p2536:GetDescendants() do
			if (v2540:IsA("BasePart") or v2540:IsA("UnionOperation")) and (not v2540:HasTag("Effect") and (not v2540.Transparency or v2540.Transparency ~= 1)) then
				v_u_15[v2540] = v_u_15[v2540] or v2540.Color
				v2540.Color = v2540.Color:Lerp(Color3.fromRGB(247, 15, 255), 0.5)
				v2540:AddTag("OpulentVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2541, p2542)
		-- upvalues: (copy) v_u_15, (copy) v_u_19, (copy) v_u_18
		if p2542 then
			for _, v2543 in p2542:GetChildren() do
				if v2543:HasTag("Cleanup_Opulent") then
					v2543:Destroy()
				end
			end
		end
		for _, v2544 in p2541:GetDescendants() do
			if v2544:IsA("BasePart") or v2544:IsA("UnionOperation") then
				v2544.Reflectance = 0
				if v2544:HasTag("OpulentVisual") then
					v2544.Color = v_u_15[v2544] or v2544.Color
					v_u_15[v2544] = nil
					v2544:RemoveTag("OpulentVisual")
					v2544.MaterialVariant = v_u_19[v2544] or v2544.MaterialVariant
					v_u_19[v2544] = nil
					if v_u_18[v2544] then
						v2544.Material = v_u_18[v2544]
						v_u_18[v2544] = nil
					end
				end
			end
		end
	end
}
v_u_925.Gale = {
	["Id"] = "GA",
	["Name"] = "Gale",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(138, 149, 167),
	["_AddFX"] = function(p2545, p2546, p2547)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2545:_RemoveFX(p2546, p2547)
		if p2547 then
			for _, v2548 in game.ServerStorage.Mutation_FX.Gale:GetChildren() do
				local v2549 = v2548:Clone()
				v2549.Parent = p2547
				v2549.Enabled = true
				v2549:AddTag("Cleanup_Gale")
			end
		end
		for v2550, v2551 in p2546:GetDescendants() do
			if v2551:IsA("BasePart") or v2551:IsA("UnionOperation") then
				if v2550 % 6 == 0 then
					local v2552 = game.ServerStorage.Mutation_FX.Gale.Bits:Clone()
					v2552.Parent = v2551
					v2552.Enabled = true
					v2552.Rate = math.random(8, 25) / 20
					v2552:AddTag("Cleanup_Gale")
					local v2553 = game.ServerStorage.Mutation_FX.Gale.Frost:Clone()
					v2553.Parent = v2551
					v2553.Enabled = true
					v2553.Rate = math.random(8, 25) / 20
					v2553:AddTag("Cleanup_Gale")
					local v2554 = game.ServerStorage.Mutation_FX.Gale.Snowflake:Clone()
					v2554.Parent = v2551
					v2554.Enabled = true
					v2554.Rate = math.random(8, 25) / 20
					v2554:AddTag("Cleanup_Gale")
				end
				if not v2551:HasTag("Effect") then
					if v2551.Transparency ~= 1 then
						v_u_15[v2551] = v_u_15[v2551] or v2551.Color
						v_u_18[v2551] = v_u_18[v2551] or v2551.Material
						v2551.Material = "Ice"
						local v2555 = Color3.new(0.521569, 0.568627, 0.603922)
						v2551.Color = v2551.Color:Lerp(v2555, 0.65)
					end
					v_u_18[v2551] = v_u_18[v2551] or v2551.Material
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2556, p2557)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		if p2557 then
			for _, v2558 in p2557:GetChildren() do
				if v2558:HasTag("Cleanup_Glacial") then
					v2558:Destroy()
				end
			end
		end
		for _, v2559 in p2556:GetDescendants() do
			if v2559:IsA("BasePart") or v2559:IsA("UnionOperation") then
				if v2559:HasTag("GlacialVisual") then
					v2559:RemoveTag("GlacialVisual")
					v2559.Color = v_u_15[v2559] or v2559.Color
					v2559.Material = v_u_18[v2559] or v2559.Material
					v_u_15[v2559] = nil
					v2559.Reflectance = 0
				elseif v2559:HasTag("GlacialDecal") then
					v2559:Destroy()
				end
			end
		end
	end
}
v_u_925.Sleepy = {
	["Id"] = "SY",
	["Name"] = "Sleepy",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(139, 139, 139),
	["_AddFX"] = function(p2560, p2561, p2562)
		p2560:_RemoveFX(p2561, p2562)
		if p2562 then
			for _, v2563 in game.ServerStorage.Mutation_FX.Sleepy:GetChildren() do
				local v2564 = v2563:Clone()
				v2564.Parent = p2562
				v2564.Enabled = true
				v2564:AddTag("Cleanup_Sleepy")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p2565)
		if p2565 then
			for _, v2566 in p2565:GetChildren() do
				if v2566:HasTag("Cleanup_Sleepy") then
					v2566:Destroy()
				end
			end
		end
	end
}
v_u_925.Firework = {
	["Id"] = "FW",
	["Name"] = "Firework",
	["ValueMulti"] = 26,
	["Color"] = Color3.fromRGB(255, 85, 0),
	["_AddFX"] = function(p2567, p2568, p2569)
		p2567:_RemoveFX(p2568, p2569)
		if p2569 then
			for _, v2570 in game.ServerStorage.Mutation_FX.Firework:GetChildren() do
				local v2571 = v2570:Clone()
				v2571.Parent = p2569
				v2571.Enabled = true
				v2571:AddTag("Cleanup_Firework")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p2572)
		if p2572 then
			for _, v2573 in p2572:GetChildren() do
				if v2573:HasTag("Cleanup_Firework") then
					v2573:Destroy()
				end
			end
		end
	end
}
v_u_925.Fiery = {
	["Id"] = "fry",
	["Name"] = "Fiery",
	["ValueMulti"] = 2,
	["Color"] = Color3.fromRGB(255, 115, 0),
	["_AddFX"] = function(p2574, p2575, p2576)
		-- upvalues: (copy) v_u_15
		p2574:_RemoveFX(p2575, p2576)
		local v2577 = game.ServerStorage.Mutation_FX.Fiery:GetChildren()
		local v2578 = {
			"Neon orange",
			"Br. yellowish orange",
			"Bright orange",
			"Bright red",
			"Bright yellow"
		}
		if p2576 then
			for _, v2579 in v2577 do
				local v2580 = v2579:Clone()
				v2580.Parent = p2576
				v2580.Enabled = true
				v2580:AddTag("Cleanup_Fiery")
			end
		end
		local v2581 = 0
		for _, v2582 in p2575:GetDescendants() do
			if v2582:IsA("BasePart") then
				v2581 = v2581 + 1
				v_u_15[v2582] = v_u_15[v2582] or v2582.Color
				v2582.Color = v2582.Color:Lerp(BrickColor.new(v2578[math.random(1, #v2578)]).Color, 0.75)
				v2582:AddTag("FieryVisual")
				if v2582 ~= p2576 and (v2581 % 2 == 0 and #v2577 > 0) then
					local v2583 = v2577[math.random(1, #v2577)]:Clone()
					v2583.Parent = v2582
					v2583.Enabled = true
					v2583:AddTag("Cleanup_Fiery")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2584, p2585)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2588(p2586)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v2587 in p2586:GetDescendants() do
				if v2587:HasTag("Cleanup_Fiery") then
					v2587:Destroy()
				end
				if v2587:HasTag("FieryVisual") then
					v2587.Color = v_u_15[v2587] or v2587.Color
					v_u_15[v2587] = nil
					v2587:RemoveTag("FieryVisual")
					if v_u_18[v2587] then
						v2587.Material = v_u_18[v2587]
						v_u_18[v2587] = nil
					end
				end
			end
		end
		if p2585 then
			v2588(p2585)
		end
		if p2584 then
			v2588(p2584)
		end
	end
}
v_u_925.Fierywork = {
	["Id"] = "fw",
	["Name"] = "Fierywork",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(255, 234, 0),
	["_AddFX"] = function(p2589, p2590, p2591)
		-- upvalues: (copy) v_u_18, (copy) v_u_15
		p2589:_RemoveFX(p2590, p2591)
		local v2592 = game.ServerStorage.Mutation_FX.Fierywork:GetChildren()
		local v2593 = {
			"Neon orange",
			"Br. yellowish orange",
			"Bright orange",
			"Bright red",
			"Bright yellow"
		}
		if p2591 then
			for _, v2594 in v2592 do
				local v2595 = v2594:Clone()
				v2595.Parent = p2591
				v2595.Enabled = true
				v2595:AddTag("Cleanup_Fierywork")
			end
		end
		local v2596 = 0
		for _, v2597 in p2590:GetDescendants() do
			if v2597:IsA("BasePart") then
				v2596 = v2596 + 1
				v_u_18[v2597] = v_u_18[v2597] or v2597.Material
				v_u_15[v2597] = v_u_15[v2597] or v2597.Color
				v2597.Color = v2597.Color:Lerp(BrickColor.new(v2593[math.random(1, #v2593)]).Color, 0.5)
				v2597.Material = Enum.Material.Neon
				v2597:AddTag("FieryworkVisual")
				if v2597 ~= p2591 and (v2596 % 2 == 0 and #v2592 > 0) then
					local v2598 = v2592[math.random(1, #v2592)]:Clone()
					v2598.Parent = v2597
					v2598.Enabled = true
					v2598:AddTag("Cleanup_Fierywork")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2599, p2600)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2603(p2601)
			-- upvalues: (ref) v_u_15, (ref) v_u_18
			for _, v2602 in p2601:GetDescendants() do
				if v2602:HasTag("Cleanup_Fierywork") then
					v2602:Destroy()
				end
				if v2602:HasTag("FieryworkVisual") then
					v2602.Color = v_u_15[v2602] or v2602.Color
					v_u_15[v2602] = nil
					v2602:RemoveTag("FieryworkVisual")
					if v_u_18[v2602] then
						v2602.Material = v_u_18[v2602]
						v_u_18[v2602] = nil
					end
				end
			end
		end
		if p2600 then
			v2603(p2600)
		end
		if p2599 then
			v2603(p2599)
		end
	end
}
v_u_925.Whalebound = {
	["Id"] = "wh",
	["Name"] = "Whalebound",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(41, 73, 218),
	["_AddFX"] = function(p2604, p2605, p2606)
		p2604:_RemoveFX(p2605, p2606)
		if p2606 then
			for _, v2607 in game.ServerStorage.Mutation_FX.Whalebound:GetChildren() do
				local v2608 = v2607:Clone()
				v2608.Parent = p2606
				v2608.Enabled = true
				v2608:AddTag("Cleanup_Whalebound")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2609, p2610)
		local function v2613(p2611)
			for _, v2612 in p2611:GetDescendants() do
				if v2612:HasTag("Cleanup_Whalebound") then
					v2612:Destroy()
				end
			end
		end
		if p2610 then
			v2613(p2610)
		end
		if p2609 then
			v2613(p2609)
		end
	end
}
v_u_925.Festive = {
	["Id"] = "FE",
	["Name"] = "Festive",
	["ValueMulti"] = 24,
	["Color"] = Color3.fromRGB(34, 102, 50),
	["_AddFX"] = function(p2614, p2615, p2616)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		p2614:_RemoveFX(p2615, p2616)
		if p2616 then
			for _, v2617 in game.ServerStorage.Mutation_FX.Festive:GetChildren() do
				local v2618 = v2617:Clone()
				v2618.Parent = p2616
				if v2618:IsA("ParticleEmitter") then
					v2618.Enabled = true
				end
				v2618:AddTag("Cleanup_Festive")
				v2618:AddTag("Effect")
			end
		end
		local v2619 = {}
		for _, v2620 in p2615:GetDescendants() do
			if (v2620:IsA("BasePart") or v2620:IsA("UnionOperation")) and (not v2620:HasTag("Effect") and v2620.Transparency < 1) then
				table.insert(v2619, v2620)
			end
		end
		if #v2619 ~= 0 then
			table.sort(v2619, function(p2621, p2622)
				return p2621.Position.Y < p2622.Position.Y
			end)
			local v2623 = #v2619
			local v2624 = v2623 * 0.33
			local v2625 = math.floor(v2624)
			local v2626 = v2623 * 0.66
			local v2627 = math.floor(v2626)
			local v2628 = Color3.fromRGB(10, 60, 10)
			local v2629 = Color3.fromRGB(20, 120, 20)
			local v2630 = Color3.fromRGB(40, 180, 40)
			for v2631, v2632 in v2619 do
				if v2632:IsA("UnionOperation") then
					v2632.UsePartColor = true
				end
				v_u_15[v2632] = v_u_15[v2632] or v2632.Color
				v_u_18[v2632] = v_u_18[v2632] or v2632.Material
				v2632.Material = Enum.Material.Metal
				v2632.Reflectance = 0.1
				if v2631 <= v2625 then
					v2632.Color = v2628
				elseif v2631 <= v2627 then
					v2632.Color = v2629
				else
					v2632.Color = v2630
				end
				v2632:AddTag("FestiveVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2633, p2634)
		-- upvalues: (copy) v_u_15, (copy) v_u_18
		local function v2637(p2635)
			for _, v2636 in p2635:GetDescendants() do
				if v2636:HasTag("Cleanup_Festive") then
					v2636:Destroy()
				end
			end
		end
		if p2634 then
			v2637(p2634)
		end
		if p2633 then
			v2637(p2633)
		end
		for _, v2638 in p2633:GetDescendants() do
			if (v2638:IsA("BasePart") or v2638:IsA("UnionOperation")) and v2638:HasTag("FestiveVisual") then
				v2638.Color = v_u_15[v2638] or v2638.Color
				v_u_15[v2638] = nil
				if v_u_18[v2638] then
					v2638.Material = v_u_18[v2638]
					v_u_18[v2638] = nil
				end
				v2638.Reflectance = 0
				v2638:RemoveTag("FestiveVisual")
			end
		end
	end
}
v_u_925.Clockwork = {
	["Id"] = "cw",
	["Name"] = "Clockwork",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(170, 128, 0),
	["_AddFX"] = function(p2639, p2640, p2641)
		p2639:_RemoveFX(p2640, p2641)
		if p2641 then
			for _, v2642 in game.ServerStorage.Mutation_FX.Clockwork:GetChildren() do
				local v2643 = v2642:Clone()
				v2643.Parent = p2641
				v2643.Enabled = true
				v2643:AddTag("Cleanup_Clockwork")
				v2643:AddTag("Effect")
			end
		end
		for _, v2644 in p2640:GetDescendants() do
			if (v2644:IsA("BasePart") or v2644:IsA("UnionOperation")) and not v2644:HasTag("Effect") then
				v2644:AddTag("ClockworkVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2645, p2646)
		-- upvalues: (copy) v_u_18
		if p2646 then
			for _, v2647 in p2646:GetChildren() do
				if v2647:HasTag("Cleanup_Clockwork") then
					v2647:Destroy()
				end
			end
		end
		for _, v2648 in p2645:GetDescendants() do
			if (v2648:IsA("BasePart") or v2648:IsA("UnionOperation")) and v2648:HasTag("ClockworkVisual") then
				v2648:RemoveTag("ClockworkVisual")
				local v2649 = v_u_18[v2648]
				if v2649 then
					v2648.Material = v2649
					v_u_18[v2648] = nil
				end
			end
		end
	end
}
v_u_925.Whimsical = {
	["Id"] = "WL",
	["Name"] = "Whimsical",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p2650, p2651, p2652)
		p2650:_RemoveFX(p2651, p2652)
		if p2652 then
			for _, v2653 in game.ServerStorage.Mutation_FX.Whimsical:GetChildren() do
				local v2654 = v2653:Clone()
				v2654.Parent = p2652
				v2654.Enabled = true
				v2654:AddTag("Cleanup_Whimsicalt")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2655, p2656)
		local function v2659(p2657)
			for _, v2658 in p2657:GetDescendants() do
				if v2658:HasTag("Cleanup_Whimsical") then
					v2658:Destroy()
				end
			end
		end
		if p2656 then
			v2659(p2656)
		end
		if p2655 then
			v2659(p2655)
		end
	end
}
local v_u_2660 = {}
local v_u_2661 = {}
for v2662, v2663 in v_u_925 do
	v_u_2660[v2662] = v2663.Id
end
for v2664, v2665 in v_u_925 do
	if v_u_2661[v2665.Id] then
		error((("MutationHandler | Duplicate Enum for %* and %*"):format(v2664, v_u_2661[v2665.Id])))
	end
	v_u_2661[v2665.Id] = v2664
end
table.freeze(v_u_2660)
table.freeze(v_u_2661)
table.freeze(v_u_925)
function v_u_13.GetMutationsToEnums(_)
	-- upvalues: (copy) v_u_2660
	return v_u_2660
end
function v_u_13.GetEnumsToMutations(_)
	-- upvalues: (copy) v_u_2661
	return v_u_2661
end
function v_u_13.GetMutations(_)
	-- upvalues: (copy) v_u_925
	return v_u_925
end
function v_u_13.AddMutation(_, p2666, p2667, p2668)
	-- upvalues: (copy) v_u_12, (copy) v_u_3, (copy) v_u_7
	if p2666 then
		local v2669 = v_u_12.InfGrowPlants[p2666.Name]
		if v2669 and not v2669.CanBeMutated then
			warn((("Cannot mutate InfGrowPlant %*"):format(p2666.Name)))
		else
			p2666:SetAttribute(p2667.Name, true)
			if v_u_3:IsServer() and not p2668 then
				local v2670 = game:GetService("ServerScriptService")
				local v2671 = require(v2670.Modules.GardenGuideService)
				local v2672 = v_u_7(p2666)
				if not v2672 then
					return
				end
				v2671:IncrementMutationCount(v2672, p2667.Name, "Applied")
			end
		end
	else
		warn("MutationHandler:AddMutation | No plant")
		return
	end
end
function v_u_13.RemoveMutation(_, p2673, p2674)
	if p2673 then
		p2673:SetAttribute(p2674.Name, nil)
	else
		warn("MutationHandler:RemoveMutation | No plant")
	end
end
function v_u_13.GetPlantMutations(_, p2675, p2676)
	-- upvalues: (copy) v_u_925
	local v2677 = 0
	local v2678 = {}
	local v2679 = p2676 and {} or nil
	for _, v2680 in v_u_925 do
		if p2675:GetAttribute(v2680.Name) then
			v2677 = v2677 + 1
			v2678[v2677] = v2680
			if v2679 then
				v2679[v2677] = v2680.Name
			end
		end
	end
	return v2678, v2677, v2679
end
function v_u_13.GetPlantMutationsCount(_, p2681)
	-- upvalues: (copy) v_u_925
	local v2682 = 0
	for _, v2683 in v_u_925 do
		if p2681:GetAttribute(v2683.Name) then
			v2682 = v2682 + 1
		end
	end
	return v2682
end
function v_u_13.GetPlantMutationsAsEnums(_, p2684)
	-- upvalues: (copy) v_u_13
	local v2685 = {}
	for _, v2686 in v_u_13:GetPlantMutations(p2684) do
		local v2687 = v2686.Id
		table.insert(v2685, v2687)
	end
	return v2685
end
function v_u_13.GetMutationsAsString(_, p2688, p2689)
	-- upvalues: (copy) v_u_925
	local v2690 = ""
	for _, v2691 in v_u_925 do
		local v2692 = v2691.Name
		if p2688:GetAttribute(v2692) then
			if v2690 ~= "" then
				v2690 = v2690 .. ", "
			end
			v2690 = v2690 .. v2692
		end
	end
	if v2690 ~= "" and p2689 then
		v2690 = "[" .. v2690 .. "]"
	end
	return v2690
end
function v_u_13.ExtractMutationsFromEnumArray(_, p2693)
	-- upvalues: (copy) v_u_2661, (copy) v_u_925
	local v2694 = {}
	for _, v2695 in p2693 do
		local v2696 = v_u_2661[v2695]
		if v2696 then
			local v2697 = v_u_925[v2696]
			table.insert(v2694, v2697)
		else
			warn((("MutationHandler:ExtractMutationsFromEnumArray | Mutation does not exist for %*"):format(v2695)))
		end
	end
	return v2694
end
function v_u_13.ExtractMutationsFromString(_, p2698)
	-- upvalues: (copy) v_u_13
	local v2699 = {}
	if not p2698 or p2698 == "" then
		return v2699
	end
	local v2700 = p2698:gsub("%[", ""):gsub("%]", ""):gsub("%s+", "")
	for v2701 in string.gmatch(v2700, "([^,]+)") do
		local v2702 = false
		for _, v2703 in v_u_13:GetMutations() do
			if v2703.Name == v2701 then
				table.insert(v2699, v2703)
				v2702 = true
			end
		end
		if not v2702 then
			warn((("MutationHandler:ExtractMutationsFromString | Mutation name: %* does not exist"):format(v2701)))
		end
	end
	return v2699
end
function v_u_13.TransferMutations(_, p2704, p2705)
	-- upvalues: (copy) v_u_12, (copy) v_u_13
	local v2706 = v_u_12.InfGrowPlants[p2705.Name]
	if v2706 and not v2706.CanBeMutated then
		warn((("Cannot mutate InfGrowPlant %*"):format(p2705.Name)))
	else
		for _, v2707 in v_u_13:GetMutations() do
			if p2704:GetAttribute(v2707.Name) then
				v_u_13:AddMutation(p2705, v2707)
				v_u_13:RemoveMutation(p2704, v2707)
			end
		end
		p2705:SetAttribute("WeightMulti", p2704:GetAttribute("WeightMulti") or 1)
	end
end
function v_u_13.CalcValueMultiFromMuts(_, p2708)
	local v2709 = 1
	for _, v2710 in p2708 do
		v2709 = v2709 + (v2710.ValueMulti - 1)
	end
	return math.max(1, v2709)
end
function v_u_13.CalcValueMulti(_, p2711)
	-- upvalues: (copy) v_u_13
	return v_u_13:CalcValueMultiFromMuts((v_u_13:GetPlantMutations(p2711)))
end
function v_u_13.SetToolName(_, p_u_2712)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_13
	if p_u_2712:IsA("Tool") then
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_2712, (ref) v_u_6, (ref) v_u_13
			local v2713 = game:GetService("ServerScriptService")
			local v2714 = require(v2713.Modules.InventoryService)
			local v2715 = require(v_u_2.Data.EnumRegistry.InventoryServiceEnums)
			local v2716
			if p_u_2712:FindFirstChild("Item_String") then
				v2716 = p_u_2712.Item_String.Value
			else
				v2716 = nil
			end
			local v2717
			if p_u_2712:FindFirstChild("Weight") then
				v2717 = p_u_2712.Weight
			else
				v2717 = nil
			end
			local v2718, v2719
			if p_u_2712:GetAttribute(v2715.OWNER) then
				local v2720 = v2714:GetToolData(p_u_2712)
				v2716 = v2716 or v2720.ItemName
				if not v2720 then
					return
				end
				v2718 = v2720.Variant or "Normal"
				v2719 = v2720.Seed
			else
				local v2721 = p_u_2712:WaitForChild("Variant", 0.3)
				if not v2721 then
					return
				end
				local v2722 = p_u_2712:WaitForChild("Item_Seed", 0.3)
				if not v2722 then
					return
				end
				v2718 = v2721.Value
				v2719 = v2722.Value
			end
			if v2718 and (v2719 and v2716) then
				local v2723 = v_u_6.Calculate_Weight(v2719, v2716) * (p_u_2712:GetAttribute("WeightMulti") or 1)
				if p_u_2712:HasTag("WaitForWeightValue") and v2717 then
					if not v2717:GetAttribute("SetWeight") then
						repeat
							task.wait(0.5)
						until v2717:GetAttribute("SetWeight")
					end
					v2723 = v2717.Value
				end
				local v2724 = v_u_13:GetMutationsAsString(p_u_2712)
				if v2718 and (v2718 ~= "" and v2718 ~= "Normal") then
					v2724 = v2724 .. (#v2724 > 0 and ", " or "") .. v2718
				end
				p_u_2712.Name = (v2724 == "" and "" or (("[%*] "):format(v2724) or "")) .. v2716 .. " [" .. string.format("%.2f", v2723) .. "kg]"
			end
		end)
	end
end
local v_u_2725 = {}
for _, v2726 in v_u_925 do
	v_u_2725[v2726.Name] = v2726.Name
end
v_u_13.MutationNames = v_u_2725
local v_u_2727 = {}
function v_u_13.CheckTimedPlants(_)
	-- upvalues: (copy) v_u_2727, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_13, (copy) v_u_925
	local v2728 = require(game.ServerStorage.Data_Module)
	local v2729 = workspace:GetServerTimeNow()
	for v2730, _ in v_u_2727 do
		local v2731 = v_u_7(v2730)
		if v2731 then
			local v2732 = v2728.GetFruitData(v2731, v2730)
			local v2733 = v_u_8.MutationTimes
			if not v2732 then
				v2732 = v2728.GetPlantData(v2731, v2730)
				v2733 = v_u_9.MutationTimes
			end
			if v2732 then
				if v2732[v2733] then
					local v2734 = 0
					for v2735, v2736 in v2732[v2733] do
						local v2737 = v_u_13:GetEnumsToMutations()[v2735]
						local v2738 = v_u_925[v2737]
						if v2738 then
							local v2739 = v2738.TimeData
							if v2739 and (v2739.TimeToChange and v2739.AddMutationName) then
								v2734 = v2734 + 1
								if v2729 - v2736 >= v2739.TimeToChange then
									v2730:SetAttribute(v2739.AddMutationName, true)
								end
							else
								warn((("Invalid or nil TimeData for %*, despite being in mutaionTimes"):format(v2737)))
							end
						else
							warn((("No mutation for %*:%*"):format(v2735, v2737)))
						end
					end
					if v2734 <= 0 then
						warn((("%* in timedPlants, but no valid muts!"):format(v2730.Name)))
					end
				else
					warn(("No Mutation Times for %* >"):format(v2730.Name), v2730)
				end
			else
				warn(("No Plant Data for %* >"):format((v2730:GetFullName())), v2730)
			end
		end
	end
end
local function v_u_2753(p2740)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_13, (copy) v_u_925, (copy) v_u_2727
	if p2740:IsA("Tool") then
		return
	elseif p2740:HasTag("FoodModel") then
		return
	elseif p2740:HasTag("TESTING") then
		return
	else
		local v2741 = require(game.ServerStorage.Data_Module)
		local v2742 = v_u_7(p2740)
		if v2742 then
			local v2743 = v2741.GetFruitData(v2742, p2740)
			local v2744 = v_u_8.MutationTimes
			if not v2743 then
				v2743 = v2741.GetPlantData(v2742, p2740)
				v2744 = v_u_9.MutationTimes
			end
			if v2743 then
				local v2745 = workspace:GetServerTimeNow()
				local v2746 = math.floor(v2745)
				v2743[v2744] = v2743[v2744] or {}
				for v2747, _ in v2743[v2744] do
					local v2748 = v_u_13:GetEnumsToMutations()[v2747]
					local v2749 = v_u_925[v2748]
					if not (p2740:GetAttribute(v2748) and v2749.TimeData) then
						v2743[v2744][v2747] = nil
					end
				end
				for v2750, _ in p2740:GetAttributes() do
					local v2751 = v_u_925[v2750]
					if v2751 and v2751.TimeData then
						local v2752 = v_u_13:GetMutationsToEnums()[v2750]
						if not v2743[v2744][v2752] then
							v2743[v2744][v2752] = v2746
						end
					end
				end
				if next(v2743[v2744]) == nil then
					v2743[v2744] = nil
					if v_u_2727[p2740] then
						v_u_2727[p2740] = nil
						return
					end
				elseif not v_u_2727[p2740] then
					v_u_2727[p2740] = true
				end
			else
				warn(("No Plant Data for %* >"):format((p2740:GetFullName())), p2740)
			end
		else
			warn("No player for plant >", p2740)
			return
		end
	end
end
local v_u_2754 = v11.new(50, 0.25)
local v_u_2755 = {}
local function v2766(p_u_2756)
	-- upvalues: (copy) v_u_2725, (copy) v_u_2755, (copy) v_u_2754, (copy) v_u_10, (copy) v_u_2753, (copy) v_u_188, (copy) v_u_13, (copy) v_u_15, (copy) v_u_18, (copy) v_u_2727
	if p_u_2756:HasTag("IGNORE_GROWABLE") then
		return
	else
		if p_u_2756:GetAttribute("GrowthType") == "Fruit" then
			local v2757 = p_u_2756:FindFirstAncestorWhichIsA("Model")
			if v2757 and v2757:HasTag("IGNORE_GROWABLE") then
				return
			end
		end
		local v2758 = require(script.MutationCombos)
		if p_u_2756 then
			p_u_2756.AttributeChanged:Connect(function(p2759)
				-- upvalues: (ref) v_u_2725, (copy) p_u_2756, (ref) v_u_2755, (ref) v_u_2754, (ref) v_u_10, (ref) v_u_2753, (ref) v_u_188, (ref) v_u_13
				if v_u_2725[p2759] then
					local v_u_2760 = p_u_2756
					if not v_u_2755[v_u_2760] then
						local v_u_2761 = require(script.MutationCombos)
						v_u_2755[v_u_2760] = true
						v_u_2754:Enqueue(v_u_10.new(function()
							-- upvalues: (ref) v_u_2753, (copy) v_u_2760, (copy) v_u_2761, (ref) v_u_188, (ref) v_u_13, (ref) v_u_2755
							v_u_2753(v_u_2760)
							v_u_2761:HandleCombos(v_u_2760)
							v_u_188(v_u_2760):Await()
							if v_u_2760:HasTag("PlantGenerated") and not v_u_2760:FindFirstAncestorWhichIsA("PlayerGui") then
								v_u_13:SetToolName(v_u_2760)
							end
							task.wait(0.1)
							v_u_2755[v_u_2760] = nil
						end))
					end
				else
					return
				end
			end)
			v_u_2753(p_u_2756)
			v2758:HandleCombos(p_u_2756)
			if not v_u_2755[p_u_2756] then
				local v_u_2762 = require(script.MutationCombos)
				v_u_2755[p_u_2756] = true
				v_u_2754:Enqueue(v_u_10.new(function()
					-- upvalues: (ref) v_u_2753, (copy) p_u_2756, (copy) v_u_2762, (ref) v_u_188, (ref) v_u_13, (ref) v_u_2755
					v_u_2753(p_u_2756)
					v_u_2762:HandleCombos(p_u_2756)
					v_u_188(p_u_2756):Await()
					if p_u_2756:HasTag("PlantGenerated") and not p_u_2756:FindFirstAncestorWhichIsA("PlayerGui") then
						v_u_13:SetToolName(p_u_2756)
					end
					task.wait(0.1)
					v_u_2755[p_u_2756] = nil
				end))
			end
			task.delay(nil, function()
				-- upvalues: (copy) p_u_2756, (ref) v_u_13
				if p_u_2756 then
					if p_u_2756:HasTag("PlantGenerated") and not p_u_2756:FindFirstAncestorWhichIsA("PlayerGui") then
						v_u_13:SetToolName(p_u_2756)
					end
				end
			end)
			local v_u_2764 = p_u_2756.DescendantRemoving:Connect(function(p2763)
				-- upvalues: (ref) v_u_15, (ref) v_u_18
				v_u_15[p2763] = nil
				v_u_18[p2763] = nil
			end)
			p_u_2756.Destroying:Once(function()
				-- upvalues: (ref) v_u_2727, (copy) p_u_2756, (copy) v_u_2764, (ref) v_u_15, (ref) v_u_18
				v_u_2727[p_u_2756] = nil
				v_u_2764:Disconnect()
				for _, v2765 in p_u_2756:GetDescendants() do
					if v2765:IsA("BasePart") then
						v_u_15[v2765] = nil
						v_u_18[v2765] = nil
					end
				end
			end)
		else
			warn("MutationHandler.MutatableAdded | No plant")
		end
	end
end
if v_u_3:IsServer() then
	v1:GetInstanceAddedSignal("Harvestable"):Connect(v2766)
	v1:GetInstanceAddedSignal("FruitTool"):Connect(v2766)
	v1:GetInstanceAddedSignal("FoodGenerated"):Connect(v2766)
	v1:GetInstanceAddedSignal("PlantScaled"):Connect(function(p_u_2767)
		-- upvalues: (copy) v_u_13, (copy) v_u_2755, (copy) v_u_2754, (copy) v_u_10, (copy) v_u_2753, (copy) v_u_188
		if v_u_13:CanBeMutated(p_u_2767) then
			if p_u_2767:IsA("Model") or p_u_2767:IsA("Tool") then
				if not v_u_2755[p_u_2767] then
					local v_u_2768 = require(script.MutationCombos)
					v_u_2755[p_u_2767] = true
					v_u_2754:Enqueue(v_u_10.new(function()
						-- upvalues: (ref) v_u_2753, (copy) p_u_2767, (copy) v_u_2768, (ref) v_u_188, (ref) v_u_13, (ref) v_u_2755
						v_u_2753(p_u_2767)
						v_u_2768:HandleCombos(p_u_2767)
						v_u_188(p_u_2767):Await()
						if p_u_2767:HasTag("PlantGenerated") and not p_u_2767:FindFirstAncestorWhichIsA("PlayerGui") then
							v_u_13:SetToolName(p_u_2767)
						end
						task.wait(0.1)
						v_u_2755[p_u_2767] = nil
					end))
				end
				v_u_13:SetToolName(p_u_2767)
			end
		else
			return
		end
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_13
		while true do
			task.wait(60)
			xpcall(function()
				-- upvalues: (ref) v_u_13
				v_u_13:CheckTimedPlants()
			end, warn)
		end
	end)
end
return v_u_13
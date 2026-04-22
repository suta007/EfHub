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
local v_u_10 = require(v_u_2.Modules.PlantTraitsData)
local v_u_11 = require(v_u_2.Modules.Task)
local v12 = require(v_u_2.Modules.Task.ThrottledTaskQueue)
local v_u_13 = require(v_u_2.Data.InfGrowPlantData)
local v_u_14 = {}
local v_u_15 = {}
local v_u_16 = {}
local v_u_17 = {}
local v_u_18 = {}
local v_u_19 = {}
local v_u_20 = {}
local v_u_21 = {
	["Potato"] = CFrame.Angles(1.5707963267948966, 0, 0)
}
local function v_u_75(p22, p23, p24, p25, p26)
	local v_u_27 = {
		Enum.NormalId.Top,
		Enum.NormalId.Bottom,
		Enum.NormalId.Left,
		Enum.NormalId.Right,
		Enum.NormalId.Front,
		Enum.NormalId.Back
	}
	local v28 = {
		Color3.fromRGB(210, 47, 255),
		Color3.fromRGB(255, 60, 60),
		Color3.fromRGB(57, 255, 133),
		Color3.fromRGB(255, 159, 33),
		Color3.fromRGB(69, 125, 255),
		Color3.fromRGB(255, 233, 105),
		Color3.fromRGB(255, 23, 23),
		Color3.fromRGB(138, 185, 255)
	}
	local function v39(p29, p30, p31)
		local v32 = p30.CFrame:PointToObjectSpace(p29)
		local v33 = p30.Size.X / 2
		local v34 = p30.Size.Y / 2
		local v35 = p30.Size.Z / 2
		local v36 = v32.X
		if math.abs(v36) <= v33 + p31 then
			local v37 = v32.Y
			if math.abs(v37) <= v34 + p31 then
				local v38 = v32.Z
				if math.abs(v38) <= v35 + p31 then
					return true
				end
			end
		end
		return false
	end
	local function v53(p40, p41, p42)
		local v43 = p40.Size.X / 2
		local v44 = p40.Size.Y / 2
		local v45 = p40.Size.Z / 2
		local v46 = p40.CFrame:VectorToObjectSpace(p41)
		local v47 = v46.X
		local v48 = math.abs(v47) * v43
		local v49 = v46.Y
		local v50 = v48 + math.abs(v49) * v44
		local v51 = v46.Z
		local v52 = v50 + math.abs(v51) * v45
		return p40.CFrame.Position + p41 * (v52 + p42)
	end
	local v59 = (function(p54)
		-- upvalues: (copy) v_u_27
		local v55 = (-1 / 0)
		local v56 = nil
		for _, v57 in ipairs(v_u_27) do
			local v58 = p54.CFrame:VectorToWorldSpace(Vector3.FromNormalId(v57)):Dot(Vector3.new(0, -1, 0))
			if v55 < v58 then
				v56 = v57
				v55 = v58
			end
		end
		return v56
	end)(p22)
	local v60 = p22.CFrame:VectorToWorldSpace(Vector3.FromNormalId(v59))
	local v61 = p24:Clone()
	local v62 = v61.PrimaryPart or v61:FindFirstChildWhichIsA("BasePart")
	if not v62 then
		v61:Destroy()
		return nil
	end
	v61.PrimaryPart = v62
	local v63 = v62.Size.Magnitude / 2
	local v64 = v53(p22, v60, p26 + p25 + v63)
	for _, v65 in ipairs(p23:GetDescendants()) do
		if v65:IsA("BasePart") and (v65 ~= p22 and v39(v64, v65, p25)) then
			v61:Destroy()
			return nil
		end
	end
	v61.Parent = p23
	v62.Color = v28[math.random(1, #v28)]
	v62.CFrame = CFrame.new(v64, v64 + v60)
	local v66 = Instance.new("WeldConstraint")
	v66.Part0 = v62
	v66.Part1 = p22
	v66.Parent = v62
	local v67 = v61:FindFirstChild("Stem")
	if v67 and v67:IsA("BasePart") then
		local v68 = v62.Position
		local v69 = v53(p22, v60, 0)
		local v70 = (v68 + v69) / 2
		local v71 = (v69 - v68).Magnitude
		local v72 = v67.Size.X
		local v73 = v67.Size.Z
		v67.Size = Vector3.new(v72, v71, v73)
		v67.CFrame = CFrame.lookAt(v70, v69) * CFrame.Angles(1.5707963267948966, 0, 0)
		local v74 = Instance.new("WeldConstraint")
		v74.Part0 = v67
		v74.Part1 = v62
		v74.Parent = v67
	end
	return v61
end
local function v_u_153(p76, p77, p78, p79)
	-- upvalues: (copy) v_u_21
	p76:_RemoveFX(p77, p78)
	local v80 = p76.Name
	if v80 then
		local v81 = p76.Color
		if v81 then
			local v82 = {}
			local v83 = p79 or 0.5
			for _, v84 in p77:GetDescendants() do
				if (v84:IsA("BasePart") or (v84:IsA("UnionOperation") or v84:IsA("MeshPart") and v84.Transparency < 1)) and not v84:HasTag("Effect") then
					table.insert(v82, v84)
				end
			end
			if #v82 ~= 0 then
				local v85 = Vector3.new(inf, inf, inf)
				local v86 = Vector3.new(-inf, -inf, -inf)
				for _, v87 in v82 do
					local v88 = v87.CFrame
					local v89 = v87.Size
					local v90 = {}
					local v91 = -v89.X / 2
					local v92 = -v89.Y / 2
					local v93 = -v89.Z / 2
					local v94 = v88 * Vector3.new(v91, v92, v93)
					local v95 = v89.X / 2
					local v96 = -v89.Y / 2
					local v97 = -v89.Z / 2
					local v98 = v88 * Vector3.new(v95, v96, v97)
					local v99 = -v89.X / 2
					local v100 = v89.Y / 2
					local v101 = -v89.Z / 2
					local v102 = v88 * Vector3.new(v99, v100, v101)
					local v103 = v89.X / 2
					local v104 = v89.Y / 2
					local v105 = -v89.Z / 2
					local v106 = v88 * Vector3.new(v103, v104, v105)
					local v107 = -v89.X / 2
					local v108 = -v89.Y / 2
					local v109 = v89.Z / 2
					local v110 = v88 * Vector3.new(v107, v108, v109)
					local v111 = v89.X / 2
					local v112 = -v89.Y / 2
					local v113 = v89.Z / 2
					local v114 = v88 * Vector3.new(v111, v112, v113)
					local v115 = -v89.X / 2
					local v116 = v89.Y / 2
					local v117 = v89.Z / 2
					local v118 = v88 * Vector3.new(v115, v116, v117)
					local v119 = v89.X / 2
					local v120 = v89.Y / 2
					local v121 = v89.Z / 2
					__set_list(v90, 1, {v94, v98, v102, v106, v110, v114, v118, v88 * Vector3.new(v119, v120, v121)})
					for _, v122 in ipairs(v90) do
						local v123 = v85.X
						local v124 = v122.X
						local v125 = math.min(v123, v124)
						local v126 = v85.Y
						local v127 = v122.Y
						local v128 = math.min(v126, v127)
						local v129 = v85.Z
						local v130 = v122.Z
						local v131 = math.min(v129, v130)
						v85 = Vector3.new(v125, v128, v131)
						local v132 = v86.X
						local v133 = v122.X
						local v134 = math.max(v132, v133)
						local v135 = v86.Y
						local v136 = v122.Y
						local v137 = math.max(v135, v136)
						local v138 = v86.Z
						local v139 = v122.Z
						local v140 = math.max(v138, v139)
						v86 = Vector3.new(v134, v137, v140)
					end
				end
				local v141 = v86 - v85 + Vector3.new(0.1, 0.1, 0.1)
				local v142 = (v85 + v86) / 2
				local v143 = p77:GetPivot().Rotation
				local v144 = CFrame.new(v142) * v143
				local v145 = p77.Name
				if p77:IsA("Tool") then
					v145 = p77.Item_String.Value
				end
				if v_u_21[v145] then
					v144 = v144 * v_u_21[v145]
				end
				local v146 = Instance.new("Part")
				v146.Name = ("%*Shell"):format(v80)
				v146.Size = v141
				v146.CFrame = v144
				v146.Anchored = false
				v146.CanCollide = false
				v146.CanQuery = false
				v146.Massless = true
				v146.Transparency = v83
				v146.CastShadow = false
				v146.Color = v81
				v146.Material = Enum.Material.Ice
				v146:AddTag((("Cleanup_%*"):format(v80)))
				v146:AddTag("Effect")
				local v147 = p77.PrimaryPart or (p77:FindFirstChild("Handle") or p77:FindFirstChildOfClass("BasePart"))
				if v147 then
					local v148 = Instance.new("WeldConstraint")
					v148.Part0 = v146
					v148.Part1 = v147
					v148.Parent = v146
					v146.Parent = v147
				else
					v146:Destroy()
				end
				local v149 = game.ServerStorage.Mutation_FX:FindFirstChild(v80)
				if v149 then
					for _, v150 in v149:GetChildren() do
						local v151 = v150:Clone()
						v151.Parent = p78
						v151.Enabled = true
						v151:AddTag((("Cleanup_%*"):format(v80)))
					end
				end
				for _, v152 in p77:GetDescendants() do
					if v152:IsA("BasePart") or v152:IsA("UnionOperation") then
						v152.Reflectance = 0.3
					end
				end
			end
		else
			warn("No Color on Mutation", p76)
			return
		end
	else
		warn("No Name on Mutation", p76)
		return
	end
end
local function v_u_162(p154, p155, p156)
	local v_u_157 = p154.Name
	if v_u_157 then
		local function v160(p158)
			-- upvalues: (copy) v_u_157
			for _, v159 in p158:GetDescendants() do
				if v159:HasTag((("Cleanup_%*"):format(v_u_157))) then
					v159:Destroy()
				end
			end
		end
		if p156 then
			v160(p156)
		end
		if p155 then
			v160(p155)
		end
		for _, v161 in p155:GetDescendants() do
			if v161:IsA("BasePart") or v161:IsA("UnionOperation") then
				v161.Reflectance = 0
			end
		end
	else
		warn("No Name on Mutation", p154)
	end
end
function v_u_14.CanBeMutated(_, p163)
	-- upvalues: (copy) v_u_13
	if not p163 then
		warn("MutationHandler.CanBeMutated | No plant given!")
		return false
	end
	local v164 = p163:HasTag("Harvestable") or p163:HasTag("FruitTool")
	local v165 = v_u_13.InfGrowPlants[p163.Name]
	return v164 and (not v165 and true or (v165.CanBeMutated or false))
end
local function v_u_171(p166)
	-- upvalues: (copy) v_u_3, (copy) v_u_4
	if not p166 then
		warn("MutationHandler.GetFXPart | No plant given!")
		return nil
	end
	if not p166:IsDescendantOf(game) then
		return nil
	end
	local v167 = {}
	if #v167 == 1 then
		return v167[1]
	end
	if #v167 > 1 then
		return v167
	end
	local v168 = p166:IsA("Tool") and p166:WaitForChild("Handle", 0.3)
	if v168 then
		return v168
	end
	if p166.PrimaryPart then
		return p166.PrimaryPart
	end
	local v169
	if v_u_3:IsStudio() then
		for _, v170 in v_u_4:GetPlayers() do
			if v170.Name == "JexSavron" then
				v169 = true
				goto l16
			end
		end
		v169 = false
		goto l16
	else
		v169 = false
		::l16::
		if v169 then
			warn((("MutationHandler.GetFXPart | No valid FX part found for %* of type %*"):format(p166:GetFullName(), p166.ClassName)))
		end
		return nil
	end
end
local function v_u_189(p_u_172)
	-- upvalues: (copy) v_u_14, (copy) v_u_11, (copy) v_u_171
	local v_u_173 = {}
	local v_u_174 = {}
	for _, v175 in v_u_14:GetMutations() do
		if not p_u_172:GetAttribute(v175.Name) then
			v_u_174[v175] = v175._RemoveFX
		end
		if p_u_172:GetAttribute(v175.Name) then
			v_u_173[v175] = v175._AddFX
		end
	end
	return v_u_11.run(function()
		-- upvalues: (copy) p_u_172, (ref) v_u_171, (copy) v_u_174, (copy) v_u_173
		local v176 = os.time()
		while os.time() - v176 <= 10 do
			task.wait()
			if p_u_172:HasTag("PlantGenerated") or p_u_172:HasTag("FoodGenerated") then
				break
			end
		end
		local v177 = v_u_171(p_u_172)
		local function v183(p178, p179, p180, p181)
			if typeof(p181) == "table" then
				for _, v182 in ipairs(p181) do
					p178(p179, p180, v182)
				end
			elseif p181 then
				p178(p179, p180, p181)
			end
		end
		local v184 = 0
		for v185, v186 in v_u_174 do
			v183(v186, v185, p_u_172, v177)
		end
		for v187, v188 in v_u_173 do
			if v184 < 50 then
				v184 = v184 + 1
				v183(v188, v187, p_u_172, v177)
			end
		end
	end)
end
local _ = 0
local v_u_926 = {
	["Shocked"] = {
		["Id"] = "a",
		["Name"] = "Shocked",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(255, 255, 100),
		["_AddFX"] = function(p190, p191, p192)
			-- upvalues: (copy) v_u_19
			p190:_RemoveFX(p191, p192)
			if p192 then
				for _, v193 in game.ServerStorage.Mutation_FX.Shocked:GetChildren() do
					local v194 = v193:Clone()
					v194.Parent = p192
					v194:AddTag("Cleanup_Shock")
				end
			end
			for _, v195 in p191:GetDescendants() do
				if (v195:IsA("BasePart") or v195:IsA("UnionOperation")) and not v195:HasTag("Effect") then
					v_u_19[v195] = v_u_19[v195] or v195.Material
					v195.Material = Enum.Material.Neon
				end
			end
		end,
		["_RemoveFX"] = function(_, p196, p197)
			-- upvalues: (copy) v_u_19
			if p197 then
				for _, v198 in p197:GetChildren() do
					if v198:HasTag("Cleanup_Shock") then
						v198:Destroy()
					end
				end
			end
			for _, v199 in p196:GetDescendants() do
				if (v199:IsA("BasePart") or v199:IsA("UnionOperation")) and v_u_19[v199] then
					if not v199:HasTag("Effect") then
						v199.Material = v_u_19[v199]
					end
					v_u_19[v199] = nil
				end
			end
		end
	},
	["Windstruck"] = {
		["Id"] = "b",
		["Name"] = "Windstruck",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(162, 185, 209),
		["_AddFX"] = function(p200, p201, p202)
			p200:_RemoveFX(p201, p202)
			if p202 then
				for _, v203 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v204 = v203:Clone()
					v204.Parent = p202
					v204:AddTag("Cleanup_Windstruck")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p205)
			if p205 then
				for _, v206 in p205:GetChildren() do
					if v206:HasTag("Cleanup_Windstruck") then
						v206:Destroy()
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
		["_AddFX"] = function(p207, p208, p209)
			-- upvalues: (copy) v_u_19
			p207:_RemoveFX(p208, p209)
			if p209 then
				for _, v210 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v211 = v210:Clone()
					v211.Parent = p209
					v211:AddTag("Cleanup_Dawnbound")
				end
			end
			for _, v212 in p208:GetDescendants() do
				if (v212:IsA("BasePart") or v212:IsA("UnionOperation")) and not v212:HasTag("Effect") then
					v_u_19[v212] = v_u_19[v212] or v212.Material
					v212.Material = Enum.Material.Neon
					v212.Reflectance = 0.05
					v212:AddTag("DawnboundVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p213, p214)
			-- upvalues: (copy) v_u_19
			if p214 then
				for _, v215 in p214:GetChildren() do
					if v215:HasTag("Cleanup_Dawnbound") then
						v215:Destroy()
					end
				end
			end
			for _, v216 in p213:GetDescendants() do
				if (v216:IsA("BasePart") or v216:IsA("UnionOperation")) and v216:HasTag("DawnboundVisual") then
					v216.Reflectance = 0
					v216:RemoveTag("DawnboundVisual")
					if v_u_19[v216] then
						v216.Material = v_u_19[v216]
						v_u_19[v216] = nil
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
		["_AddFX"] = function(p217, p218, p219)
			-- upvalues: (copy) v_u_19
			p217:_RemoveFX(p218, p219)
			if p219 then
				for _, v220 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v221 = v220:Clone()
					v221.Parent = p219
					v221:AddTag("Cleanup_Beanbound")
				end
			end
			for _, v222 in p218:GetDescendants() do
				if (v222:IsA("BasePart") or v222:IsA("UnionOperation")) and not v222:HasTag("Effect") then
					v_u_19[v222] = v_u_19[v222] or v222.Material
					v222.Material = Enum.Material.Neon
					v222.Reflectance = 0.05
					v222:AddTag("BeanboundVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p223, p224)
			-- upvalues: (copy) v_u_19
			if p224 then
				for _, v225 in p224:GetChildren() do
					if v225:HasTag("Cleanup_Beanbound") then
						v225:Destroy()
					end
				end
			end
			for _, v226 in p223:GetDescendants() do
				if (v226:IsA("BasePart") or v226:IsA("UnionOperation")) and v226:HasTag("BeanboundVisual") then
					v226.Reflectance = 0
					v226:RemoveTag("BeanboundVisual")
					if v_u_19[v226] then
						v226.Material = v_u_19[v226]
						v_u_19[v226] = nil
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
		["_AddFX"] = function(p227, p228, p229)
			p227:_RemoveFX(p228, p229)
			if p229 then
				for _, v230 in game.ServerStorage.Mutation_FX.Twisted:GetChildren() do
					local v231 = v230:Clone()
					v231.Parent = p229
					v231:AddTag("Cleanup_Twisted")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p232)
			if p232 then
				for _, v233 in p232:GetChildren() do
					if v233:HasTag("Twisted") then
						v233:Destroy()
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
		["_AddFX"] = function(p234, p235, p236)
			p234:_RemoveFX(p235, p236)
			if p236 then
				for _, v237 in game.ServerStorage.Mutation_FX.Cloudtouched:GetChildren() do
					local v238 = v237:Clone()
					v238.Parent = p236
					v238:AddTag("Cleanup_Cloudtouched")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p239)
			if p239 then
				for _, v240 in p239:GetChildren() do
					if v240:HasTag("Cleanup_Cloudtouched") then
						v240:Destroy()
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
		["_AddFX"] = function(p241, p242, p243)
			p241:_RemoveFX(p242, p243)
			if p243 then
				for _, v244 in game.ServerStorage.Mutation_FX.Voidtouched:GetChildren() do
					local v245 = v244:Clone()
					v245.Parent = p243
					v245:AddTag("Cleanup_Voidtouched")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p246)
			if p246 then
				for _, v247 in p246:GetChildren() do
					if v247:HasTag("Cleanup_Voidtouched") then
						v247:Destroy()
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
		["_AddFX"] = function(p248, p249, p250)
			p248:_RemoveFX(p249, p250)
			if p250 then
				for _, v251 in game.ServerStorage.Mutation_FX.Wet:GetChildren() do
					local v252 = v251:Clone()
					v252.Parent = p250
					v252.Enabled = true
					v252:AddTag("Cleanup_Wet")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p253)
			if p253 then
				for _, v254 in p253:GetChildren() do
					if v254:HasTag("Cleanup_Wet") then
						v254:Destroy()
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
		["_AddFX"] = function(p255, p256, p257)
			p255:_RemoveFX(p256, p257)
			if p257 then
				for _, v258 in game.ServerStorage.Mutation_FX.Fried:GetChildren() do
					local v259 = v258:Clone()
					v259.Parent = p257
					v259.Enabled = true
					v259:AddTag("Cleanup_Fried")
				end
			end
		end,
		["_RemoveFX"] = function(_, _, p260)
			if p260 then
				for _, v261 in p260:GetChildren() do
					if v261:HasTag("Cleanup_Fried") then
						v261:Destroy()
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
		["_AddFX"] = function(p262, p263, p264)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p262:_RemoveFX(p263, p264)
			local v265 = {
				"Neon orange",
				"Br. yellowish orange",
				"Bright orange",
				"Bright red",
				"Bright yellow"
			}
			for _, v266 in p263:GetDescendants() do
				if (v266:IsA("BasePart") or v266:IsA("UnionOperation")) and not v266:HasTag("Effect") then
					v_u_16[v266] = v_u_16[v266] or v266.BrickColor.Color
					v266.BrickColor = BrickColor.new(v265[Random.new():NextInteger(1, #v265)])
					v_u_19[v266] = v_u_19[v266] or v266.Material
					v266.Material = Enum.Material.Neon
					v266:AddTag("MoltenVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p267, _)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			for _, v268 in p267:GetDescendants() do
				if (v268:IsA("BasePart") or v268:IsA("UnionOperation")) and v268:HasTag("MoltenVisual") then
					v268.Reflectance = 0
					local v269
					if v_u_16[v268] then
						v269 = BrickColor.new(v_u_16[v268])
					else
						v269 = v268.BrickColor
					end
					v268.BrickColor = v269
					v_u_16[v268] = nil
					v268:RemoveTag("MoltenVisual")
					if v_u_19[v268] then
						v268.Material = v_u_19[v268]
						v_u_19[v268] = nil
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
		["_AddFX"] = function(p270, p271, p272)
			-- upvalues: (copy) v_u_16
			p270:_RemoveFX(p271, p272)
			if p272 then
				for _, v273 in game.ServerStorage.Mutation_FX.Vamp:GetChildren() do
					if v273.Name == "CenterGlow" then
						local v274 = v273:Clone()
						v274.Parent = p272
						v274.Glow.Enabled = true
						if v274:FindFirstChild("Flapping") then
							v274.Flapping.PlaybackSpeed = math.random(7, 13) / 10
							v274.Flapping:Play()
						end
						local _, v275 = p271:GetBoundingBox()
						local v276 = v275.X
						local v277 = v275.Y
						local v278 = v275.Z
						local _ = math.max(v276, v277, v278) * 0.3
						local v279 = v274.Glow.Size
						local v280 = {}
						for _, v281 in ipairs(v279.Keypoints) do
							local v282 = NumberSequenceKeypoint.new
							local v283 = v281.Time
							local v284 = v281.Value * 0.3
							local v285 = v281.Envelope * 0.3
							table.insert(v280, v282(v283, v284, v285))
						end
						v274.Glow.Size = NumberSequence.new(v280)
					else
						local v286 = v273:Clone()
						v286.Parent = p272
						v286.Enabled = true
						v286:AddTag("Cleanup_Vamp")
					end
				end
			end
			for _, v287 in p271:GetDescendants() do
				if (v287:IsA("BasePart") or v287:IsA("UnionOperation")) and (not v287:HasTag("Effect") and v287.Transparency ~= 1) then
					v_u_16[v287] = v_u_16[v287] or v287.Color
					local v288 = Color3.new(0.545098, 0, 0)
					v287.Color = v287.Color:Lerp(v288, 0.4)
					v287:AddTag("VampVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p289, p290)
			-- upvalues: (copy) v_u_16
			if p290 then
				for _, v291 in p290:GetChildren() do
					if v291:HasTag("Cleanup_Vamp") then
						v291:Destroy()
					end
				end
			end
			for _, v292 in p289:GetDescendants() do
				if (v292:IsA("BasePart") or v292:IsA("UnionOperation")) and v292:HasTag("VampVisual") then
					v292:RemoveTag("VampVisual")
					v292.Color = v_u_16[v292] or v292.Color
					v_u_16[v292] = nil
					v292.Reflectance = 0
				end
			end
		end
	},
	["Moonbled"] = {
		["Id"] = "Mnb",
		["Name"] = "Moonbled",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(139, 139, 139),
		["_AddFX"] = function(p293, p294, p295)
			-- upvalues: (copy) v_u_16
			p293:_RemoveFX(p294, p295)
			if p295 then
				for _, v296 in game.ServerStorage.Mutation_FX.Moonbled:GetChildren() do
					if v296.Name == "CenterWave" then
						local v297 = v296:Clone()
						v297.Parent = p295
						v297.Wave.Enabled = true
						local _, v298 = p294:GetBoundingBox()
						local v299 = v298.X
						local v300 = v298.Y
						local v301 = v298.Z
						local _ = math.max(v299, v300, v301) * 0.3
						local v302 = v297.Wave.Size
						local v303 = {}
						for _, v304 in ipairs(v302.Keypoints) do
							local v305 = NumberSequenceKeypoint.new
							local v306 = v304.Time
							local v307 = v304.Value * 0.3
							local v308 = v304.Envelope * 0.3
							table.insert(v303, v305(v306, v307, v308))
						end
						v297.Wave.Size = NumberSequence.new(v303)
					else
						local v309 = v296:Clone()
						v309.Parent = p295
						v309.Enabled = true
						v309:AddTag("Cleanup_Moonbled")
					end
				end
			end
			for v310, v311 in p294:GetDescendants() do
				if v311:IsA("BasePart") or v311:IsA("UnionOperation") then
					if v310 % 3 == 0 then
						local v312 = game.ServerStorage.Mutation_FX.Moonbled.Fog:Clone()
						v312.Parent = v311
						v312.Enabled = true
						v312.Rate = math.random(8, 25) / 10
						v312:AddTag("Cleanup_Moonbled")
						local v313 = game.ServerStorage.Mutation_FX.Moonbled.Rays:Clone()
						v313.Parent = v311
						v313.Enabled = true
						v313.Rate = math.random(8, 25) / 10
						v313:AddTag("Cleanup_Moonbled")
					end
					if not v311:HasTag("Effect") and v311.Transparency ~= 1 then
						v_u_16[v311] = v_u_16[v311] or v311.Color
						local v314 = Color3.new(0.658824, 0.658824, 0.658824)
						v311.Color = v311.Color:Lerp(v314, 0.8)
						v311:AddTag("MoonbledVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p315, p316)
			-- upvalues: (copy) v_u_16
			if p316 then
				for _, v317 in p316:GetChildren() do
					if v317:HasTag("Cleanup_Moonbled") then
						v317:Destroy()
					end
				end
			end
			for _, v318 in p315:GetDescendants() do
				if (v318:IsA("BasePart") or v318:IsA("UnionOperation")) and v318:HasTag("MoonbledVisual") then
					v318:RemoveTag("MoonbledVisual")
					v318.Color = v_u_16[v318] or v318.Color
					v_u_16[v318] = nil
					v318.Reflectance = 0
				end
			end
		end
	},
	["Moist"] = {
		["Id"] = "Moi",
		["Name"] = "Moist",
		["ValueMulti"] = 3,
		["Color"] = Color3.fromRGB(142, 161, 173),
		["_AddFX"] = function(p319, p320, p321)
			-- upvalues: (copy) v_u_16
			p319:_RemoveFX(p320, p321)
			if p321 then
				for _, v322 in game.ServerStorage.Mutation_FX.Moist:GetChildren() do
					local v323 = v322:Clone()
					v323.Parent = p321
					v323.Enabled = true
					v323:AddTag("Cleanup_Moist")
				end
			end
			for v324, v325 in p320:GetDescendants() do
				if v325:IsA("BasePart") or v325:IsA("UnionOperation") then
					if v324 % 3 == 0 then
						local v326 = game.ServerStorage.Mutation_FX.Moist.Drops:Clone()
						v326.Parent = v325
						v326.Enabled = true
						v326.Rate = math.random(5, 30) / 100
						v326:AddTag("Moist")
						local v327 = game.ServerStorage.Mutation_FX.Moist.Mist:Clone()
						v327.Parent = v325
						v327.Enabled = true
						v327.Rate = math.random(2, 8) / 10
						v327:AddTag("Moist")
					end
					if not v325:HasTag("Effect") and v325.Transparency ~= 1 then
						v_u_16[v325] = v_u_16[v325] or v325.Color
						local v328 = Color3.new(0, 0, 0)
						v325.Color = v325.Color:Lerp(v328, 0.2)
						v325:AddTag("MoistVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p329, p330)
			-- upvalues: (copy) v_u_16
			if p330 then
				for _, v331 in p330:GetChildren() do
					if v331:HasTag("Cleanup_Moist") then
						v331:Destroy()
					end
				end
			end
			for _, v332 in p329:GetDescendants() do
				if (v332:IsA("BasePart") or v332:IsA("UnionOperation")) and v332:HasTag("MoistVisual") then
					v332:RemoveTag("MoistVisual")
					v332.Color = v_u_16[v332] or v332.Color
					v_u_16[v332] = nil
					v332.Reflectance = 0
				end
			end
		end
	},
	["Crystalized"] = {
		["Id"] = "Cry",
		["Name"] = "Crystalized",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(255, 255, 255),
		["_AddFX"] = function(p333, p334, p335)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p333:_RemoveFX(p334, p335)
			if p335 then
				for _, v336 in game.ServerStorage.Mutation_FX.Crystalized:GetChildren() do
					local v337 = v336:Clone()
					v337.Parent = p335
					v337.Enabled = true
				end
			end
			for v338, v339 in p334:GetDescendants() do
				if v339:IsA("BasePart") or v339:IsA("UnionOperation") then
					if v338 % 4 == 0 then
						local v340 = game.ServerStorage.Mutation_FX.Crystalized.Aura:Clone()
						v340.Parent = v339
						v340.Enabled = true
						v340.Rate = math.random(8, 25) / 10
						v340:AddTag("Cleanup_Crystalized")
						local v341 = game.ServerStorage.Mutation_FX.Crystalized.Sparkle:Clone()
						v341.Parent = v339
						v341.Enabled = true
						v341.Rate = math.random(8, 25) / 10
						v341:AddTag("Cleanup_Crystalized")
					end
					if not v339:HasTag("Effect") and v339.Transparency ~= 1 then
						v_u_16[v339] = v_u_16[v339] or v339.Color
						v_u_19[v339] = v_u_19[v339] or v339.Material
						v339.Material = Enum.Material.Glass
						local v342 = Color3.new(1, 1, 1)
						v339.Color = v339.Color:Lerp(v342, 0.65)
						v339:AddTag("CrystalizedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p343, p344)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p344 then
				for _, v345 in p344:GetChildren() do
					if v345:HasTag("Cleanup_Crystalized") then
						v345:Destroy()
					end
				end
			end
			for _, v346 in p343:GetDescendants() do
				if (v346:IsA("BasePart") or v346:IsA("UnionOperation")) and v346:HasTag("CrystalizedVisual") then
					v346:RemoveTag("CrystalizedVisual")
					v346.Color = v_u_16[v346] or v346.Color
					v_u_16[v346] = nil
					v346.Material = v_u_19[v346] or v346.Material
					v_u_19[v346] = nil
					v346.Reflectance = 0
				end
			end
		end
	},
	["Alienated"] = {
		["Id"] = "Ali",
		["Name"] = "Alienated",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(55, 255, 0),
		["_AddFX"] = function(p347, p348, p349)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p347:_RemoveFX(p348, p349)
			if p349 then
				for _, v350 in game.ServerStorage.Mutation_FX.Alienated:GetChildren() do
					local v351 = v350:Clone()
					v351.Parent = p349
					v351.Enabled = true
				end
			end
			for v352, v353 in p348:GetDescendants() do
				if v353:IsA("BasePart") or v353:IsA("UnionOperation") then
					if v352 % 5 == 0 then
						local v354 = game.ServerStorage.Mutation_FX.Alienated.Aura:Clone()
						v354.Parent = v353
						v354.Enabled = true
						v354.Rate = math.random(8, 25) / 20
						v354:AddTag("Cleanup_Alienated")
						local v355 = game.ServerStorage.Mutation_FX.Alienated.Shines:Clone()
						v355.Parent = v353
						v355.Enabled = true
						v355.Rate = math.random(8, 25) / 30
						v355:AddTag("Cleanup_Alienated")
					end
					if not v353:HasTag("Effect") and v353.Transparency ~= 1 then
						v_u_16[v353] = v_u_16[v353] or v353.Color
						v_u_19[v353] = v_u_19[v353] or v353.Material
						v353.Material = Enum.Material.Neon
						local v356 = Color3.new(0, 1, 0.45098)
						v353.Color = v353.Color:Lerp(v356, 0.4)
						v353:AddTag("AlienatedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p357, p358)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p358 then
				for _, v359 in p358:GetChildren() do
					if v359:HasTag("Cleanup_Alienated") then
						v359:Destroy()
					end
				end
			end
			for _, v360 in p357:GetDescendants() do
				if (v360:IsA("BasePart") or v360:IsA("UnionOperation")) and v360:HasTag("AlienatedVisual") then
					v360:RemoveTag("AlienatedVisual")
					v360.Color = v_u_16[v360] or v360.Color
					v_u_16[v360] = nil
					v360.Material = v_u_19[v360] or v360.Material
					v_u_19[v360] = nil
					v360.Reflectance = 0
				end
			end
		end
	},
	["Brewed"] = {
		["Id"] = "Brw",
		["Name"] = "Brewed",
		["ValueMulti"] = 7,
		["Color"] = Color3.fromRGB(65, 203, 74),
		["_AddFX"] = function(p361, p362, p363)
			-- upvalues: (copy) v_u_16
			p361:_RemoveFX(p362, p363)
			if p363 then
				for _, v364 in game.ServerStorage.Mutation_FX.Brewed:GetChildren() do
					if v364.Name == "CenterWave" then
						local v365 = v364:Clone()
						v365.Parent = p363
						v365.Wave.Enabled = true
						local _, v366 = p362:GetBoundingBox()
						local v367 = v366.X
						local v368 = v366.Y
						local v369 = v366.Z
						local _ = math.max(v367, v368, v369) * 0.3
						local v370 = v365.Wave.Size
						local v371 = {}
						for _, v372 in ipairs(v370.Keypoints) do
							local v373 = NumberSequenceKeypoint.new
							local v374 = v372.Time
							local v375 = v372.Value * 0.3
							local v376 = v372.Envelope * 0.3
							table.insert(v371, v373(v374, v375, v376))
						end
						v365.Wave.Size = NumberSequence.new(v371)
					else
						local v377 = v364:Clone()
						v377.Parent = p363
						v377.Enabled = true
						v377:AddTag("Cleanup_Brewed")
					end
				end
			end
			for v378, v379 in p362:GetDescendants() do
				if v379:IsA("BasePart") or v379:IsA("UnionOperation") then
					if v378 % 3 == 0 then
						local v380 = game.ServerStorage.Mutation_FX.Brewed.Smoke:Clone()
						v380.Parent = v379
						v380.Enabled = true
						v380.Rate = math.random(8, 25) / 10
						v380:AddTag("Cleanup_Brewed")
						local v381 = game.ServerStorage.Mutation_FX.Brewed.Drip:Clone()
						v381.Parent = v379
						v381.Enabled = true
						v381.Rate = math.random(8, 25) / 10
						v381:AddTag("Cleanup_Brewed")
						local v382 = game.ServerStorage.Mutation_FX.Brewed.CenterWave.Wave:Clone()
						v382.Parent = v379
						v382.Enabled = true
						v382.Rate = math.random(8, 25) / 20
						v382:AddTag("Cleanup_Brewed")
					end
					if not v379:HasTag("Effect") and v379.Transparency ~= 1 then
						v_u_16[v379] = v_u_16[v379] or v379.Color
						local v383 = Color3.new(0.247059, 0.658824, 0.215686)
						v379.Color = v379.Color:Lerp(v383, 0.3)
						v379:AddTag("BrewedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p384, p385)
			-- upvalues: (copy) v_u_16
			if p385 then
				for _, v386 in p385:GetChildren() do
					if v386:HasTag("Cleanup_Brewed") then
						v386:Destroy()
					end
				end
			end
			for _, v387 in p384:GetDescendants() do
				if (v387:IsA("BasePart") or v387:IsA("UnionOperation")) and v387:HasTag("BrewedVisual") then
					v387:RemoveTag("BrewedVisual")
					v387.Color = v_u_16[v387] or v387.Color
					v_u_16[v387] = nil
					v387.Reflectance = 0
				end
			end
		end
	},
	["Ghostly"] = {
		["Id"] = "GH",
		["Name"] = "Ghostly",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(170, 255, 255),
		["_AddFX"] = function(p388, p389, p390)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p388:_RemoveFX(p389, p390)
			local v391 = game.ServerStorage.Mutation_FX.Ghostly:GetChildren()
			if p390 then
				for _, v392 in v391 do
					if v392:IsA("ParticleEmitter") or v392:IsA("Trail") then
						local v393 = v392:Clone()
						v393.Parent = p390
						v393.Enabled = true
						v393:AddTag("Cleanup_Ghostly")
					end
				end
			end
			local v394 = 0
			for _, v395 in p389:GetDescendants() do
				if v395:IsA("BasePart") and not v395:IsA("TrussPart") then
					v394 = v394 + 1
					v_u_16[v395] = v_u_16[v395] or v395.Color
					v_u_19[v395] = v_u_19[v395] or v395.Material
					v395.Material = Enum.Material.Glass
					v395.Color = Color3.fromRGB(200, 235, 255)
					if v395.Transparency ~= 1 then
						v395.Transparency = 0.35
						v395:SetAttribute("0Transparency", v395.Transparency)
					end
					v395:AddTag("GhostlyVisual")
					if v394 % 3 == 0 and #v391 > 0 then
						local v396 = v391[math.random(1, #v391)]
						if v396:IsA("ParticleEmitter") then
							local v397 = v396:Clone()
							v397.Parent = v395
							v397.Enabled = true
							v397:AddTag("Cleanup_Ghostly")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p398, p399)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v402(p400)
				for _, v401 in p400:GetDescendants() do
					if v401:HasTag("Cleanup_Ghostly") then
						v401:Destroy()
					end
				end
			end
			if p399 then
				v402(p399)
			end
			if p398 then
				v402(p398)
			end
			for _, v403 in p398:GetDescendants() do
				if v403:IsA("BasePart") and v403:HasTag("GhostlyVisual") then
					v403.Color = v_u_16[v403] or v403.Color
					v_u_16[v403] = nil
					v403.Material = v_u_19[v403] or v403.Material
					v_u_19[v403] = nil
					if v403:GetAttribute("0Transparency") then
						v403.Transparency = v403:GetAttribute("0Transparency")
					end
					v403:RemoveTag("GhostlyVisual")
				end
			end
		end
	},
	["Spooky"] = {
		["Id"] = "SK",
		["Name"] = "Spooky",
		["ValueMulti"] = 8,
		["Color"] = Color3.fromRGB(177, 177, 177),
		["_AddFX"] = function(p404, p405, p406)
			p404:_RemoveFX(p405, p406)
			local v407 = game.ServerStorage.Mutation_FX.Spooky:GetChildren()
			local v408 = 0
			for _, v409 in p405:GetDescendants() do
				if v409:IsA("BasePart") and v409 ~= p406 then
					v408 = v408 + 1
					if v408 % 2 == 0 then
						for _, v410 in v407 do
							if v410:IsA("ParticleEmitter") then
								local v411 = v410:Clone()
								v411.Parent = v409
								v411.Enabled = true
								v411:AddTag("Cleanup_Spooky")
							end
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p412, p413)
			local function v416(p414)
				for _, v415 in p414:GetDescendants() do
					if v415:HasTag("Cleanup_Spooky") then
						v415:Destroy()
					end
				end
			end
			if p413 then
				v416(p413)
			end
			if p412 then
				v416(p412)
			end
		end
	},
	["Volcanic"] = {
		["Id"] = "Bla",
		["Name"] = "Volcanic",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(255, 82, 24),
		["_AddFX"] = function(p417, p418, p419)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p417:_RemoveFX(p418, p419)
			local v420 = { Color3.fromRGB(229, 67, 13), Color3.fromRGB(225, 89, 26), Color3.fromRGB(234, 71, 39) }
			if p419 then
				for _, v421 in game.ServerStorage.Mutation_FX.Volcanic:GetChildren() do
					local v422 = v421:Clone()
					v422.Parent = p419
					v422.Enabled = true
					v422:AddTag("Cleanup_Volcanic")
				end
			end
			for v423, v424 in p418:GetDescendants() do
				if v424:IsA("BasePart") or v424:IsA("UnionOperation") then
					if v423 % 6 == 0 then
						local v425 = game.ServerStorage.Mutation_FX.Volcanic.Burst:Clone()
						v425.Parent = v424
						v425.Enabled = true
						v425.Rate = math.random(6, 12) / 10
						v425:AddTag("Cleanup_Volcanic")
						local v426 = game.ServerStorage.Mutation_FX.Volcanic.Glow:Clone()
						v426.Parent = v424
						v426.Enabled = true
						v426.Rate = math.random(9, 20) / 100
						v426:AddTag("Cleanup_Volcanic")
					end
					if not v424:HasTag("Effect") then
						v_u_16[v424] = v_u_16[v424] or v424.Color
						v424.Color = v420[Random.new():NextInteger(1, #v420)]
						v_u_19[v424] = v_u_19[v424] or v424.Material
						v424.Material = Enum.Material.Neon
						v424:AddTag("VolcanicVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p427, p428)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p428 then
				for _, v429 in p428:GetChildren() do
					if v429:HasTag("Cleanup_Volcanic") then
						v429:Destroy()
					end
				end
			end
			for _, v430 in p427:GetDescendants() do
				if v430:IsA("BasePart") or v430:IsA("UnionOperation") then
					if v430:HasTag("VolcanicVisual") then
						v430.Reflectance = 0
						local v431
						if v_u_16[v430] then
							v431 = BrickColor.new(v_u_16[v430])
						else
							v431 = v430.BrickColor
						end
						v430.BrickColor = v431
						v_u_16[v430] = nil
						v430:RemoveTag("VolcanicVisual")
						if v_u_19[v430] then
							v430.Material = v_u_19[v430]
							v_u_19[v430] = nil
						end
					elseif v430:HasTag("Cleanup_Volcanic") then
						v430:Destroy()
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
		["_AddFX"] = function(_, p432, _)
			-- upvalues: (copy) v_u_18, (copy) v_u_17
			for _, v433 in p432:GetDescendants() do
				if (v433:IsA("BasePart") or v433:IsA("UnionOperation")) and not v433:HasTag("SlicedVisual") then
					v_u_18[v433] = v_u_18[v433] or v433.Orientation
					v_u_17[v433] = v_u_17[v433] or v433.Position
					local v434 = p432.Item_Seed.Value
					local v435 = Random.new(v434)
					local v436 = v_u_18[v433]
					local v437 = v436.X + v435:NextNumber(-8, 8)
					local v438 = v436.Y + v435:NextNumber(-8, 8)
					local v439 = v436.Z + v435:NextNumber(-8, 8)
					v433.Orientation = Vector3.new(v437, v438, v439)
					local v440 = v433.Size.X
					local v441 = v435:NextNumber(-v440, v440) * 0.25
					local v442 = v435:NextNumber(-v440, v440) * 0.25
					local v443 = v435:NextNumber(-v440, v440) * 0.25
					local v444 = v_u_17[v433]
					local v445 = math.clamp(v441, 0, 1)
					local v446 = math.clamp(v442, 0, 1)
					local v447 = math.clamp(v443, 0, 1)
					v433.Position = v444 + Vector3.new(v445, v446, v447)
					v433:AddTag("SlicedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p448, _)
			-- upvalues: (copy) v_u_18, (copy) v_u_17
			for _, v449 in p448:GetDescendants() do
				if (v449:IsA("BasePart") or v449:IsA("UnionOperation")) and v449:HasTag("SlicedVisual") then
					local v450
					if v_u_18[v449] then
						v450 = v_u_18[v449]
					else
						v450 = v449.Orientation
					end
					v449.Orientation = v450
					local v451
					if v_u_17[v449] then
						v451 = v_u_17[v449]
					else
						v451 = v449.Position
					end
					v449.Position = v451
					v449:RemoveTag("SlicedVisual")
				end
			end
		end
	},
	["Severed"] = {
		["Id"] = "Se",
		["Name"] = "Severed",
		["ValueMulti"] = 40,
		["Color"] = Color3.fromRGB(186, 211, 223),
		["_AddFX"] = function(_, p452, _)
			-- upvalues: (copy) v_u_18, (copy) v_u_17
			local v453 = Random.new(p452.Item_Seed.Value)
			local v454 = {}
			for _, v455 in p452:GetDescendants() do
				if (v455:IsA("BasePart") or v455:IsA("UnionOperation")) and not v455:HasTag("SeveredVisual") then
					v_u_18[v455] = v_u_18[v455] or v455.Orientation
					v_u_17[v455] = v_u_17[v455] or v455.Position
					table.insert(v454, v455)
				end
			end
			table.sort(v454, function(p456, p457)
				-- upvalues: (ref) v_u_17
				return v_u_17[p456].Y < v_u_17[p457].Y
			end)
			local v458 = 0
			for _, v459 in ipairs(v454) do
				v458 = v458 + v459.Size.Y
			end
			local v460 = (#v454 > 0 and (v458 / #v454 or 1) or 1) * 0.25
			local v461 = math.max(0.05, v460)
			local v462 = (#v454 - 1) / 2
			for v463, v464 in ipairs(v454) do
				local v465 = v_u_18[v464]
				local v466 = v465.X + v453:NextNumber(-8, 8)
				local v467 = v465.Y + v453:NextNumber(-8, 8)
				local v468 = v465.Z + v453:NextNumber(-8, 8)
				v464.Orientation = Vector3.new(v466, v467, v468)
				local v469 = v464.Size.X
				local v470 = v453:NextNumber(-v469, v469) * 0.25
				local v471 = math.clamp(v470, -1, 1)
				local v472 = v453:NextNumber(-v469, v469) * 0.25
				local v473 = math.clamp(v472, -1, 1)
				local v474 = (v463 - v462) * v461
				v464.Position = v_u_17[v464] + Vector3.new(v471, v474, v473)
				v464:AddTag("SeveredVisual")
			end
		end,
		["_RemoveFX"] = function(_, p475, _)
			-- upvalues: (copy) v_u_18, (copy) v_u_17
			for _, v476 in p475:GetDescendants() do
				if (v476:IsA("BasePart") or v476:IsA("UnionOperation")) and v476:HasTag("SeveredVisual") then
					local v477 = v_u_18[v476]
					local v478 = v_u_17[v476]
					if v477 then
						v476.Orientation = v477
					end
					if v478 then
						v476.Position = v478
					end
					v476:RemoveTag("SeveredVisual")
				end
			end
		end
	},
	["Slashbound"] = {
		["Id"] = "SB",
		["Name"] = "Slashbound",
		["ValueMulti"] = 95,
		["Color"] = Color3.fromRGB(200, 210, 220),
		["_AddFX"] = function(_, p479, _)
			-- upvalues: (copy) v_u_18, (copy) v_u_17
			local v480 = Random.new(p479.Item_Seed.Value)
			local v481 = {}
			for _, v482 in p479:GetDescendants() do
				if (v482:IsA("BasePart") or v482:IsA("UnionOperation")) and not v482:HasTag("SlashboundVisual") then
					v_u_18[v482] = v_u_18[v482] or v482.Orientation
					v_u_17[v482] = v_u_17[v482] or v482.Position
					table.insert(v481, v482)
				end
			end
			table.sort(v481, function(p483, p484)
				-- upvalues: (ref) v_u_17
				return v_u_17[p483].Y < v_u_17[p484].Y
			end)
			local v485 = 0
			for _, v486 in ipairs(v481) do
				v485 = v485 + v486.Size.Y
			end
			local v487 = (#v481 > 0 and (v485 / #v481 or 1) or 1) * 0.25
			local v488 = math.max(0.05, v487)
			local v489 = (#v481 - 1) / 2
			for v490, v491 in ipairs(v481) do
				local v492 = v_u_18[v491]
				local v493 = v491.Size.X
				local v494 = v480:NextNumber(-v493, v493) * 0.25
				local v495 = math.clamp(v494, -1, 1)
				local v496 = v480:NextNumber(-v493, v493) * 0.25
				local v497 = math.clamp(v496, -1, 1)
				local v498 = (v490 - v489) * v488
				local v499 = v492.X + v480:NextNumber(-8, 8)
				local v500 = v492.Y + v480:NextNumber(-8, 8)
				local v501 = v492.Z + v480:NextNumber(-8, 8)
				v491.Orientation = Vector3.new(v499, v500, v501)
				v491.Position = v_u_17[v491] + Vector3.new(v495, v498, v497)
				v491:AddTag("SlashboundVisual")
			end
		end,
		["_RemoveFX"] = function(_, p502, _)
			-- upvalues: (copy) v_u_18, (copy) v_u_17
			for _, v503 in p502:GetDescendants() do
				if (v503:IsA("BasePart") or v503:IsA("UnionOperation")) and v503:HasTag("SlashboundVisual") then
					v503.Orientation = v_u_18[v503] or v503.Orientation
					v503.Position = v_u_17[v503] or v503.Position
					v503:RemoveTag("SlashboundVisual")
				end
			end
		end
	},
	["Alienlike"] = {
		["Id"] = "j",
		["Name"] = "Alienlike",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(0, 223, 197),
		["_AddFX"] = function(p504, p505, p506)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p504:_RemoveFX(p505, p506)
			if p506 then
				for _, v507 in game.ServerStorage.Mutation_FX.Alienlike:GetChildren() do
					local v508 = v507:Clone()
					v508.Parent = p506
					v508.Enabled = true
					v508:AddTag("Cleanup_Alienlike")
				end
			end
			for _, v509 in p505:GetDescendants() do
				if (v509:IsA("BasePart") or v509:IsA("UnionOperation")) and not v509:HasTag("Effect") then
					v_u_16[v509] = v_u_16[v509] or v509.Color
					v509.Color = Color3.fromRGB(0, 255, 217)
					if Random.new():NextInteger(1, 2) == 1 then
						v_u_19[v509] = v_u_19[v509] or v509.Material
						v509.Material = Enum.Material.ForceField
					end
					v509:AddTag("AlienlikeVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p510, p511)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p511 then
				for _, v512 in p511:GetChildren() do
					if v512:HasTag("Cleanup_Alienlike") then
						v512:Destroy()
					end
				end
			end
			for _, v513 in p510:GetDescendants() do
				if (v513:IsA("BasePart") or v513:IsA("UnionOperation")) and v513:HasTag("AlienlikeVisual") then
					v513.Reflectance = 0
					v513.Color = v_u_16[v513] or v513.Color
					v_u_16[v513] = nil
					v513:RemoveTag("AlienlikeVisual")
					if v_u_19[v513] then
						v513.Material = v_u_19[v513]
						v_u_19[v513] = nil
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
		["_AddFX"] = function(p514, p515, p516)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p514:_RemoveFX(p515, p516)
			if p516 then
				for _, v517 in game.ServerStorage.Mutation_FX.Galactic:GetChildren() do
					local v518 = v517:Clone()
					v518.Parent = p516
					v518.Enabled = true
					v518:AddTag("Cleanup_Galactic")
				end
			end
			for _, v519 in p515:GetDescendants() do
				if (v519:IsA("BasePart") or v519:IsA("UnionOperation")) and not v519:HasTag("Effect") then
					v_u_16[v519] = v_u_16[v519] or v519.Color
					v519.Color = Color3.fromRGB(226, 152, 255)
					if Random.new():NextInteger(1, 2) == 1 then
						v_u_19[v519] = v_u_19[v519] or v519.Material
						v519.Material = Enum.Material.Neon
					end
					v519:AddTag("GalacticVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p520, p521)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p521 then
				for _, v522 in p521:GetChildren() do
					if v522:HasTag("Cleanup_Galactic") then
						v522:Destroy()
					end
				end
			end
			for _, v523 in p520:GetDescendants() do
				if (v523:IsA("BasePart") or v523:IsA("UnionOperation")) and v523:HasTag("GalacticVisual") then
					v523.Reflectance = 0
					v523.Color = v_u_16[v523] or v523.Color
					v_u_16[v523] = nil
					v523:RemoveTag("GalacticVisual")
					if v_u_19[v523] then
						v523.Material = v_u_19[v523]
						v_u_19[v523] = nil
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
		["_AddFX"] = function(p524, p525, p526)
			-- upvalues: (copy) v_u_16
			p524:_RemoveFX(p525, p526)
			if p526 then
				for _, v527 in game.ServerStorage.Mutation_FX.Drenched:GetChildren() do
					local v528 = v527:Clone()
					v528.Parent = p526
					v528.Enabled = true
					v528:AddTag("Cleanup_Drenched")
				end
			end
			for _, v529 in p525:GetChildren() do
				if v529:IsA("BasePart") or v529:IsA("UnionOperation") then
					v_u_16[v529] = v_u_16[v529] or v529.Color
					local v530, v531, v532 = v529.Color:ToHSV()
					local v533 = v531 + 0.1
					local v534 = math.clamp(v533, v531, 1)
					local v535 = v532 + 0.05
					local v536 = math.clamp(v535, v532, 1)
					v529.Color = Color3.fromHSV(v530, v534, v536)
				end
			end
		end,
		["_RemoveFX"] = function(_, p537, p538)
			-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_20
			if p538 then
				for _, v539 in p538:GetChildren() do
					if v539:HasTag("Cleanup_Drenched") then
						v539:Destroy()
					end
				end
			end
			for _, v540 in p537:GetChildren() do
				if v540:IsA("BasePart") or v540:IsA("UnionOperation") then
					v540.Color = v_u_16[v540] or v540.Color
					v_u_16[v540] = nil
					if v_u_19[v540] then
						v540.Material = v_u_19[v540]
						v_u_19[v540] = nil
					end
					if v_u_20[v540] then
						v540.MaterialVariant = v_u_20[v540]
						v_u_20[v540] = nil
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
		["_AddFX"] = function(p541, p542, p543)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p541:_RemoveFX(p542, p543)
			for v544, v545 in p542:GetDescendants() do
				if v545:IsA("BasePart") or v545:IsA("UnionOperation") then
					if v544 % 5 == 0 then
						local v546 = game.ServerStorage.Mutation_FX.Aurora.Light:Clone()
						v546.Parent = v545
						v546.Enabled = true
						v546:AddTag("Cleanup_Aurora")
					end
					if not v545:HasTag("Effect") then
						local v547 = Random.new():NextInteger(1, 3)
						v_u_16[v545] = v_u_16[v545] or v545.Color
						if v547 == 1 then
							v545.Color = Color3.fromRGB(150, 92, 186)
						elseif v547 == 2 then
							v545.Color = Color3.fromRGB(87, 91, 171)
						elseif v547 == 3 then
							v545.Color = Color3.fromRGB(76, 156, 165)
						end
						v_u_19[v545] = v_u_19[v545] or v545.Material
						v545.Material = Enum.Material.Neon
						v545:AddTag("AuroraVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p548, p549)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p549 then
				for _, v550 in p549:GetChildren() do
					if v550:HasTag("Cleanup_Aurora") then
						v550:Destroy()
					end
				end
			end
			for _, v551 in p548:GetDescendants() do
				if (v551:IsA("BasePart") or v551:IsA("UnionOperation")) and v551:HasTag("GalacticVisual") then
					v551.Reflectance = 0
					v551.Color = v_u_16[v551] or v551.Color
					v_u_16[v551] = nil
					v551:RemoveTag("AuroraVisual")
					if v_u_19[v551] then
						v551.Material = v_u_19[v551]
						v_u_19[v551] = nil
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
		["_AddFX"] = function(p552, p553, p554)
			p552:_RemoveFX(p553, p554)
			if p554 then
				for _, v555 in game.ServerStorage.Mutation_FX.Chilled:GetChildren() do
					local v556 = v555:Clone()
					v556.Parent = p554
					v556.Enabled = true
					v556:AddTag("Cleanup_Chilled")
				end
			end
			for _, v557 in p553:GetChildren() do
				if v557:IsA("BasePart") or v557:IsA("UnionOperation") then
					v557.Reflectance = 0.1
				end
			end
		end,
		["_RemoveFX"] = function(_, p558, p559)
			if p559 then
				for _, v560 in p559:GetChildren() do
					if v560:HasTag("Cleanup_Chilled") then
						v560:Destroy()
					end
				end
			end
			for _, v561 in p558:GetChildren() do
				if v561:IsA("BasePart") or v561:IsA("UnionOperation") then
					v561.Reflectance = 0
				end
			end
		end
	},
	["Sundried"] = {
		["Id"] = "n",
		["Name"] = "Sundried",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(207, 93, 0),
		["_AddFX"] = function(p562, p563, p564)
			-- upvalues: (copy) v_u_16
			p562:_RemoveFX(p563, p564)
			for _, v565 in p563:GetChildren() do
				if v565:IsA("BasePart") or v565:IsA("UnionOperation") then
					v_u_16[v565] = v_u_16[v565] or v565.Color
					v565.Color = Color3.fromRGB(v565.Color.R * 178.5, v565.Color.G * 127.5, v565.Color.B * 127.5)
				end
			end
		end,
		["_RemoveFX"] = function(_, p566, _)
			-- upvalues: (copy) v_u_16
			for _, v567 in p566:GetChildren() do
				if v567:IsA("BasePart") or v567:IsA("UnionOperation") then
					v567.Color = v_u_16[v567] or v567.Color
					v_u_16[v567] = nil
				end
			end
		end
	},
	["Wiltproof"] = {
		["Id"] = "o",
		["Name"] = "Wiltproof",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(0, 222, 155),
		["_AddFX"] = function(p568, p569, p570)
			-- upvalues: (copy) v_u_16
			p568:_RemoveFX(p569, p570)
			for _, v571 in p569:GetChildren() do
				if v571:IsA("BasePart") or v571:IsA("UnionOperation") then
					v_u_16[v571] = v_u_16[v571] or v571.Color
					local v572 = v571.Color
					local v573 = v572.R * 0.3 + v572.G * 0.59 + v572.B * 0.11
					local v574 = Color3.new
					local v575 = v573 + (v572.R - v573) * 3
					local v576 = math.clamp(v575, 0, 1)
					local v577 = v573 + (v572.G - v573) * 4
					local v578 = math.clamp(v577, 0, 1)
					local v579 = v573 + (v572.B - v573) * 3
					v571.Color = v574(v576, v578, (math.clamp(v579, 0, 1)))
				end
			end
		end,
		["_RemoveFX"] = function(_, p580, _)
			-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_20
			for _, v581 in p580:GetChildren() do
				if v581:IsA("BasePart") or v581:IsA("UnionOperation") then
					v581.Color = v_u_16[v581] or v581.Color
					v_u_16[v581] = nil
					if v_u_19[v581] then
						v581.Material = v_u_19[v581]
						v_u_19[v581] = nil
					end
					if v_u_20[v581] then
						v581.MaterialVariant = v_u_20[v581]
						v_u_20[v581] = nil
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
		["_AddFX"] = function(p582, p583, p584)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p582:_RemoveFX(p583, p584)
			if p584 then
				for _, v585 in game.ServerStorage.Mutation_FX.Verdant:GetChildren() do
					local v586 = v585:Clone()
					v586.Parent = p584
					v586.Enabled = true
					v586:AddTag("Cleanup_Verdant")
				end
			end
			for v587, v588 in p583:GetDescendants() do
				if v588:IsA("BasePart") or v588:IsA("UnionOperation") then
					if v587 % 6 == 0 then
						local v589 = game.ServerStorage.Mutation_FX.Verdant.LeafSwirl:Clone()
						v589.Parent = v588
						v589.Enabled = true
						v589:AddTag("Cleanup_Verdant")
					end
					if not v588:HasTag("Effect") then
						local v590 = v588.Color
						v_u_16[v588] = v_u_16[v588] or v588.Color
						v_u_19[v588] = v_u_19[v588] or v588.Material
						local v591 = Color3.fromRGB
						local v592 = v590.R * 166 * 0.5
						local v593 = v590.G * 255 + 150
						v588.Color = v591(v592, math.clamp(v593, 0, 255) * 0.5, v590.B * 166 * 0.5)
						v588:AddTag("VerdantVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p594, p595)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p595 then
				for _, v596 in p595:GetChildren() do
					if v596:HasTag("Cleanup_Verdant") then
						v596:Destroy()
					end
				end
			end
			for _, v597 in p594:GetDescendants() do
				if (v597:IsA("BasePart") or v597:IsA("UnionOperation")) and v597:HasTag("VerdantVisual") then
					v597:RemoveTag("VerdantVisual")
					v597.Color = v_u_16[v597] or v597.Color
					v_u_16[v597] = nil
					if v_u_19[v597] then
						v597.Material = v_u_19[v597]
						v_u_19[v597] = nil
					end
					v597.Reflectance = 0
				end
			end
		end
	},
	["Paradisal"] = {
		["Id"] = "r",
		["Name"] = "Paradisal",
		["ValueMulti"] = 100,
		["Color"] = Color3.fromRGB(176, 240, 0),
		["_AddFX"] = function(p598, p599, p600)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p598:_RemoveFX(p599, p600)
			if p600 then
				for _, v601 in game.ServerStorage.Mutation_FX.Paradisal:GetChildren() do
					local v602 = v601:Clone()
					v602.Parent = p600
					v602.Enabled = true
					v602:AddTag("Cleanup_Paradisal")
				end
			end
			for v603, v604 in p599:GetDescendants() do
				if v604:IsA("BasePart") or v604:IsA("UnionOperation") then
					if v603 % 6 == 0 then
						local v605 = game.ServerStorage.Mutation_FX.Paradisal.Rays:Clone()
						v605.Parent = v604
						v605.Enabled = true
						v605:AddTag("Cleanup_Paradisal")
					end
					if not v604:HasTag("Effect") then
						v_u_16[v604] = v_u_16[v604] or v604.Color
						v_u_19[v604] = v_u_19[v604] or v604.Material
						v604.Color = Color3.fromRGB(176, 240, 0)
						v604:AddTag("ParadisalVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p606, p607)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p607 then
				for _, v608 in p607:GetChildren() do
					if v608:HasTag("Cleanup_Paradisal") then
						v608:Destroy()
					end
				end
			end
			for _, v609 in p606:GetDescendants() do
				if (v609:IsA("BasePart") or v609:IsA("UnionOperation")) and v609:HasTag("ParadisalVisual") then
					v609:RemoveTag("ParadisalVisual")
					v609.Color = v_u_16[v609] or v609.Color
					v_u_16[v609] = nil
					if v_u_19[v609] then
						v609.Material = v_u_19[v609]
						v_u_19[v609] = nil
					end
					v609.Reflectance = 0
				end
			end
		end
	},
	["Glitched"] = {
		["Id"] = "gli",
		["Name"] = "Glitched",
		["ValueMulti"] = 85,
		["Color"] = Color3.fromRGB(240, 96, 228),
		["_AddFX"] = function(p610, p611, p612)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p610:_RemoveFX(p611, p612)
			if p612 then
				for _, v613 in game.ServerStorage.Mutation_FX.Glitched:GetChildren() do
					local v614 = v613:Clone()
					v614.Parent = p612
					v614.Enabled = true
					v614:AddTag("Cleanup_Glitched")
				end
			end
			local v615 = {
				Color3.fromRGB(240, 96, 228),
				Color3.fromRGB(79, 237, 240),
				Color3.fromRGB(84, 240, 67),
				Color3.fromRGB(217, 217, 217),
				Color3.fromRGB(39, 39, 255)
			}
			for v616, v617 in p611:GetDescendants() do
				if v617:IsA("BasePart") or v617:IsA("UnionOperation") then
					if v616 % 6 == 0 then
						local v618 = game.ServerStorage.Mutation_FX.Glitched.Glitchy:Clone()
						v618.Parent = v617
						v618.Enabled = true
						v618.Rate = math.random(12, 35) / 10
						v618:AddTag("Cleanup_Glitched")
					end
					if not v617:HasTag("Effect") then
						v_u_16[v617] = v_u_16[v617] or v617.Color
						v_u_19[v617] = v_u_19[v617] or v617.Material
						v617.Color = v615[math.random(1, #v615)]
						v617.Material = "ForceField"
						v617:AddTag("GlitchedVisual")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p619, p620)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p620 then
				for _, v621 in p620:GetChildren() do
					if v621:HasTag("Cleanup_Glitched") then
						v621:Destroy()
					end
				end
			end
			for _, v622 in p619:GetDescendants() do
				if (v622:IsA("BasePart") or v622:IsA("UnionOperation")) and v622:HasTag("GlitchedVisual") then
					v622:RemoveTag("GlitchedVisual")
					v622.Color = v_u_16[v622] or v622.Color
					v_u_16[v622] = nil
					if v_u_19[v622] then
						v622.Material = v_u_19[v622]
						v_u_19[v622] = nil
					end
					v622.Reflectance = 0
				end
			end
		end
	},
	["Gilded"] = {
		["Id"] = "Gil",
		["Name"] = "Gilded",
		["ValueMulti"] = 15,
		["Color"] = Color3.fromRGB(255, 206, 58),
		["_AddFX"] = function(p623, p624, p625)
			-- upvalues: (copy) v_u_19
			p623:_RemoveFX(p624, p625)
			if p625 then
				for _, v626 in game.ServerStorage.Mutation_FX.Gilded:GetChildren() do
					if v626.Name ~= "Decals" then
						local v627 = v626:Clone()
						v627.Parent = p625
						v627.Enabled = true
						for _, v628 in game.ServerStorage.Mutation_FX.Gilded.Decals:GetChildren() do
							local v629 = v628:Clone()
							v629:AddTag("Cleanup_Gilded")
							v629.Parent = p625
						end
						v627:AddTag("Cleanup_Gilded")
					end
				end
			end
			for v630, v631 in p624:GetDescendants() do
				if v631:IsA("BasePart") or v631:IsA("UnionOperation") then
					if v630 % 6 == 0 then
						local v632 = game.ServerStorage.Mutation_FX.Gilded.Sparkle:Clone()
						v632.Parent = v631
						v632.Enabled = true
						v632.Rate = math.random(8, 25) / 10
						v632:AddTag("Cleanup_Gilded")
					end
					if not v631:HasTag("Effect") then
						v_u_19[v631] = v_u_19[v631] or v631.Material
						if v631.Transparency ~= 1 then
							v631.Material = "Metal"
							for _, v633 in game.ServerStorage.Mutation_FX.Gilded.Decals:GetChildren() do
								local v634 = v633:Clone()
								v634:AddTag("GildedDecal")
								v634.Parent = v631
							end
							v631:AddTag("GildedVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p635, p636)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p636 then
				for _, v637 in p636:GetChildren() do
					if v637:HasTag("Cleanup_Gilded") then
						v637:Destroy()
					end
				end
			end
			for _, v638 in p635:GetDescendants() do
				if v638:IsA("BasePart") or v638:IsA("UnionOperation") then
					if v638:HasTag("GildedVisual") then
						v638:RemoveTag("GildedVisual")
						v638.Color = v_u_16[v638] or v638.Color
						v_u_16[v638] = nil
						if v_u_19[v638] then
							v638.Material = v_u_19[v638]
							v_u_19[v638] = nil
						end
						v638.Reflectance = 0
					elseif v638:HasTag("GildedDecal") then
						v638:Destroy()
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
		["_AddFX"] = function(p639, p640, p641)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p639:_RemoveFX(p640, p641)
			if p641 then
				for _, v642 in game.ServerStorage.Mutation_FX.Glimmering:GetChildren() do
					local v643 = v642:Clone()
					v643.Parent = p641
					v643.Enabled = true
					v643:AddTag("Cleanup_Glimmering")
				end
			end
			local v644 = { Color3.fromRGB(246, 142, 255), Color3.fromRGB(176, 130, 255), Color3.fromRGB(255, 80, 238) }
			for v645, v646 in p640:GetDescendants() do
				if v646:IsA("BasePart") or v646:IsA("UnionOperation") then
					if v645 % 6 == 0 then
						local v647 = game.ServerStorage.Mutation_FX.Glimmering.Sparkle:Clone()
						v647.Parent = v646
						v647.Enabled = true
						v647.Rate = math.random(8, 25) / 10
						v647:AddTag("Cleanup_Glimmering")
						local v648 = Instance.new("Attachment", v646)
						v648:AddTag("Cleanup_Glimmering")
						local v649 = Instance.new("Attachment", v646)
						v649:AddTag("Cleanup_Glimmering")
						v648.Position = Vector3.new(0, 0.1, 0)
						v649.Position = Vector3.new(0, -0.1, 0)
						local v650 = Instance.new("Trail")
						v650.Color = ColorSequence.new(v644[2])
						v650.LightInfluence = 0
						v650.Brightness = 3
						v650.Attachment0 = v648
						v650.Attachment1 = v649
						v650.Lifetime = 0.3
						v650.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v650.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v650.Parent = v646
						v650:AddTag("Cleanup_Glimmering")
					end
					if not v646:HasTag("Effect") then
						v_u_16[v646] = v_u_16[v646] or v646.Color
						v_u_19[v646] = v_u_19[v646] or v646.Material
						if v646.Transparency ~= 1 then
							v646.Color = v644[math.random(1, #v644)]
							v646.Material = "Neon"
							v646:SetAttribute("OTransparency", v646.Transparency)
							v646.Transparency = 0.5
							v646:AddTag("GlimmeringVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p651, p652)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p652 then
				for _, v653 in p652:GetChildren() do
					if v653:HasTag("Cleanup_Glimmering") then
						v653:Destroy()
					end
				end
			end
			for _, v654 in p651:GetDescendants() do
				if (v654:IsA("BasePart") or v654:IsA("UnionOperation")) and v654:HasTag("GlimmeringVisual") then
					v654:RemoveTag("GlimmeringVisual")
					v654.Color = v_u_16[v654] or v654.Color
					v_u_16[v654] = nil
					v654.Transparency = v654:GetAttribute("OTransparency") or 0
					if v_u_19[v654] then
						v654.Material = v_u_19[v654]
						v_u_19[v654] = nil
					end
					v654.Reflectance = 0
				end
			end
		end
	},
	["Luminous"] = {
		["Id"] = "lum",
		["Name"] = "Luminous",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(85, 170, 255),
		["_AddFX"] = function(p655, p656, p657)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p655:_RemoveFX(p656, p657)
			local v658 = game.ServerStorage.Mutation_FX.Luminous:GetChildren()
			local v659 = {
				Color3.fromRGB(255, 160, 255),
				Color3.fromRGB(255, 128, 255),
				Color3.fromRGB(255, 105, 240),
				Color3.fromRGB(255, 100, 200)
			}
			if p657 then
				for _, v660 in v658 do
					local v661 = v660:Clone()
					v661.Parent = p657
					v661.Enabled = true
					v661:AddTag("Cleanup_Luminous")
				end
			end
			local v662 = 0
			for _, v663 in p656:GetDescendants() do
				if v663:IsA("BasePart") or v663:IsA("UnionOperation") then
					v662 = v662 + 1
					if not v663:HasTag("Effect") then
						v_u_16[v663] = v_u_16[v663] or v663.Color
						v_u_19[v663] = v_u_19[v663] or v663.Material
						if v663.Transparency ~= 1 then
							v663.Color = v659[math.random(1, #v659)]
							v663.Material = Enum.Material.Neon
							v663:SetAttribute("OTransparency", v663.Transparency)
							v663.Transparency = 0.5
							v663:AddTag("LuminousVisual")
						end
					end
					if v662 % 2 == 0 and #v658 > 0 then
						local v664 = v658[math.random(1, #v658)]:Clone()
						v664.Parent = v663
						v664.Enabled = true
						v664:AddTag("Cleanup_Luminous")
					end
					if v662 % 2 == 0 then
						local v665 = game.ServerStorage.Mutation_FX.Luminous:FindFirstChild("Sparkle")
						if v665 then
							local v666 = v665:Clone()
							v666.Parent = v663
							v666.Enabled = true
							v666.Rate = math.random(8, 25) / 10
							v666:AddTag("Cleanup_Luminous")
						end
						local v667 = Instance.new("Attachment", v663)
						v667:AddTag("Cleanup_Luminous")
						local v668 = Instance.new("Attachment", v663)
						v668:AddTag("Cleanup_Luminous")
						v667.Position = Vector3.new(0, 0.1, 0)
						v668.Position = Vector3.new(0, -0.1, 0)
						local v669 = Instance.new("Trail")
						v669.Color = ColorSequence.new(Color3.fromRGB(255, 150, 255))
						v669.LightInfluence = 0
						v669.Brightness = 3
						v669.Attachment0 = v667
						v669.Attachment1 = v668
						v669.Lifetime = 0.3
						v669.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v669.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1.5), NumberSequenceKeypoint.new(1, 0) })
						v669.Parent = v663
						v669:AddTag("Cleanup_Luminous")
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p670, p671)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v674(p672)
				-- upvalues: (ref) v_u_16, (ref) v_u_19
				for _, v673 in p672:GetDescendants() do
					if v673:HasTag("Cleanup_Luminous") then
						v673:Destroy()
					end
					if v673:HasTag("LuminousVisual") then
						v673:RemoveTag("LuminousVisual")
						v673.Color = v_u_16[v673] or v673.Color
						v_u_16[v673] = nil
						v673.Transparency = v673:GetAttribute("OTransparency") or 0
						if v_u_19[v673] then
							v673.Material = v_u_19[v673]
							v_u_19[v673] = nil
						end
					end
				end
			end
			if p671 then
				v674(p671)
			end
			if p670 then
				v674(p670)
			end
		end
	},
	["Cracked"] = {
		["Id"] = "CRA",
		["Name"] = "Cracked",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(138, 127, 114),
		["_AddFX"] = function(p675, p676, p677)
			p675:_RemoveFX(p676, p677)
			local v678 = 0
			for _, v679 in p676:GetDescendants() do
				if (v679:IsA("BasePart") or v679:IsA("UnionOperation")) and (not v679:HasTag("Effect") and v679.Transparency <= 0.75) then
					v678 = v678 + 1
					for _, v680 in game.ServerStorage.Mutation_FX.Cracked:GetChildren() do
						local v681 = v680:Clone()
						v681.Parent = v679
						if v681.ClassName == "ParticleEmitter" then
							v681.Enabled = true
							v681.Rate = v681.Rate / v678
							v681.Color = ColorSequence.new(v679.Color)
						else
							local v682 = v679.Transparency / 2
							v681.Transparency = math.clamp(v682, 0, 0.4) + 0.25
						end
					end
					v679:AddTag("CrackedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p683, p684)
			-- upvalues: (copy) v_u_16
			local function v687(p685)
				for _, v686 in p685:GetDescendants() do
					if v686:HasTag("Cleanup_Cracked") or v686.Name == "CRACKSTEXTURE" then
						v686:Destroy()
					end
				end
			end
			if p684 then
				v687(p684)
			end
			if p683 then
				v687(p683)
			end
			for _, v688 in p683:GetDescendants() do
				if (v688:IsA("BasePart") or v688:IsA("UnionOperation")) and v688:HasTag("CrackedVisual") then
					if v688:FindFirstChild("CrackedRubbleP") then
						v688.CrackedRubbleP:Destroy()
					end
					if v688:FindFirstChild("CrackedPixelSmokeP") then
						v688.CrackedPixelSmokeP:Destroy()
					end
					v688.Reflectance = 0
					v_u_16[v688] = nil
					v688:RemoveTag("CrackedVisual")
				end
			end
		end
	},
	["Enchanted"] = {
		["Id"] = "Enc",
		["Name"] = "Enchanted",
		["ValueMulti"] = 50,
		["Color"] = Color3.fromRGB(255, 214, 89),
		["_AddFX"] = function(p689, p690, p691)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p689:_RemoveFX(p690, p691)
			if p691 then
				for _, v692 in game.ServerStorage.Mutation_FX.Enchanted:GetChildren() do
					local v693 = v692:Clone()
					v693.Parent = p691
					v693.Enabled = true
					v693:AddTag("Cleanup_Enchanted")
				end
			end
			local v694 = { Color3.fromRGB(255, 214, 89), Color3.fromRGB(255, 159, 80), Color3.fromRGB(255, 244, 123) }
			for v695, v696 in p690:GetDescendants() do
				if v696:IsA("BasePart") or v696:IsA("UnionOperation") then
					if v695 % 6 == 0 then
						local v697 = game.ServerStorage.Mutation_FX.Enchanted.Sparkle:Clone()
						v697.Parent = v696
						v697.Enabled = true
						v697.Rate = math.random(8, 25) / 10
						v697:AddTag("Cleanup_Enchanted")
						local v698 = Instance.new("Attachment", v696)
						v698:AddTag("Cleanup_Enchanted")
						local v699 = Instance.new("Attachment", v696)
						v699:AddTag("Cleanup_Enchanted")
						v698.Position = Vector3.new(0, 0.1, 0)
						v699.Position = Vector3.new(0, -0.1, 0)
						local v700 = Instance.new("Trail")
						v700.Color = ColorSequence.new(Color3.fromRGB(255, 214, 89))
						v700.LightInfluence = 0
						v700.Brightness = 3
						v700.Attachment0 = v698
						v700.Attachment1 = v699
						v700.Lifetime = 0.3
						v700.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
						v700.WidthScale = NumberSequence.new({ NumberSequenceKeypoint.new(0, 1), NumberSequenceKeypoint.new(1, 0) })
						v700.Parent = v696
						v700:AddTag("Cleanup_Enchanted")
					end
					if not v696:HasTag("Effect") then
						v_u_16[v696] = v_u_16[v696] or v696.Color
						v_u_19[v696] = v_u_19[v696] or v696.Material
						if v696.Transparency ~= 1 then
							v696.Color = v694[math.random(1, #v694)]
							v696.Material = "Neon"
							v696:SetAttribute("OTransparency", v696.Transparency)
							v696.Transparency = 0.5
							v696:AddTag("EnchantedVisual")
						end
					end
				end
			end
		end,
		["_RemoveFX"] = function(_, p701, p702)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p702 then
				for _, v703 in p702:GetChildren() do
					if v703:HasTag("Cleanup_Enchanted") then
						v703:Destroy()
					end
				end
			end
			for _, v704 in p701:GetDescendants() do
				if (v704:IsA("BasePart") or v704:IsA("UnionOperation")) and v704:HasTag("EnchantedVisual") then
					v704:RemoveTag("EnchantedVisual")
					v704.Color = v_u_16[v704] or v704.Color
					v_u_16[v704] = nil
					v704.Transparency = v704:GetAttribute("OTransparency") or 0
					if v_u_19[v704] then
						v704.Material = v_u_19[v704]
						v_u_19[v704] = nil
					end
					v704.Reflectance = 0
				end
			end
		end
	},
	["Frozen"] = {
		["Id"] = "s",
		["Name"] = "Frozen",
		["ValueMulti"] = 10,
		["Color"] = Color3.fromRGB(108, 184, 255),
		["_AddFX"] = function(p705, p706, p707)
			-- upvalues: (copy) v_u_153
			v_u_153(p705, p706, p707, 0.8)
		end,
		["_RemoveFX"] = function(p708, p709, p710)
			-- upvalues: (copy) v_u_162
			v_u_162(p708, p709, p710)
		end
	},
	["Disco"] = {
		["Id"] = "t",
		["Name"] = "Disco",
		["ValueMulti"] = 125,
		["Color"] = Color3.fromRGB(255, 105, 180),
		["_AddFX"] = function(p711, p712, p713)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p711:_RemoveFX(p712, p713)
			local function v_u_716(p714)
				-- upvalues: (ref) v_u_16, (ref) v_u_19, (copy) v_u_716
				for _, v715 in p714:GetChildren() do
					if v715:IsA("BasePart") or v715:IsA("UnionOperation") then
						v_u_16[v715] = v_u_16[v715] or v715.Color
						v_u_19[v715] = v_u_19[v715] or v715.Material
						v715.Material = Enum.Material.Neon
						v715:AddTag("Discofied")
					elseif v715:IsA("Model") then
						v_u_716(v715)
					end
				end
			end
			v_u_716(p712)
		end,
		["_RemoveFX"] = function(_, p717, _)
			-- upvalues: (copy) v_u_16, (copy) v_u_19, (copy) v_u_5
			local v718 = {}
			for _, v719 in p717:GetDescendants() do
				if (v719:IsA("BasePart") or v719:IsA("UnionOperation")) and v719:HasTag("Discofied") then
					v719.Reflectance = 0
					v719:RemoveTag("Discofied")
					v719.Color = v_u_16[v719] or v719.Color
					v_u_16[v719] = nil
					local v720 = {
						["Part"] = v719,
						["Color"] = v719.Color
					}
					table.insert(v718, v720)
					local v721 = v_u_19[v719]
					if v721 then
						v719.Material = v721
						v_u_19[v719] = nil
					end
				end
			end
			if game:GetService("RunService"):IsServer() then
				v_u_5:FireAllClients(v718)
			end
		end
	},
	["Choc"] = {
		["Id"] = "u",
		["Name"] = "Choc",
		["ValueMulti"] = 2,
		["Color"] = Color3.fromRGB(92, 64, 51),
		["StrokeColor"] = Color3.fromRGB(255, 255, 255),
		["_AddFX"] = function(p722, p723, p724)
			-- upvalues: (copy) v_u_15
			p722:_RemoveFX(p723, p724)
			local function v_u_731(p725)
				-- upvalues: (ref) v_u_15, (copy) v_u_731
				for _, v_u_726 in p725:GetChildren() do
					if v_u_726:IsA("BasePart") or v_u_726:IsA("UnionOperation") then
						local v_u_727 = {}
						for _, v728 in game.ServerStorage.Mutation_Textures.Choc:GetChildren() do
							local v729 = v728:Clone()
							v729.Parent = v_u_726
							v729.Transparency = v_u_726.Transparency
							table.insert(v_u_727, v729)
							v729:AddTag("Cleanup_Choc")
						end
						v_u_15[v_u_726] = v_u_726.Changed:Connect(function()
							-- upvalues: (copy) v_u_726, (ref) v_u_15, (copy) v_u_727
							if v_u_726.Transparency == 0 then
								v_u_15[v_u_726]:Disconnect()
								for _, v730 in v_u_727 do
									v730.Transparency = 0
								end
							end
						end)
					elseif v_u_726:IsA("Model") then
						v_u_731(v_u_726)
					end
				end
			end
			v_u_731(p723)
		end,
		["_RemoveFX"] = function(_, p732, _)
			-- upvalues: (copy) v_u_15
			for _, v733 in p732:GetDescendants() do
				if v733:HasTag("Cleanup_Choc") then
					v733:Destroy()
				end
				if v_u_15[v733] then
					v_u_15[v733]:Disconnect()
				end
			end
		end
	},
	["Plasma"] = {
		["Id"] = "v",
		["Name"] = "Plasma",
		["ValueMulti"] = 5,
		["Color"] = Color3.fromRGB(208, 43, 137),
		["_AddFX"] = function(p734, p735, p736)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p734:_RemoveFX(p735, p736)
			if p736 then
				for _, v737 in game.ServerStorage.Mutation_FX.Plasma:GetChildren() do
					local v738 = v737:Clone()
					v738.Parent = p736
					v738.Enabled = true
					v738:AddTag("Cleanup_Plasma")
				end
			end
			for _, v739 in p735:GetDescendants() do
				if (v739:IsA("BasePart") or v739:IsA("UnionOperation")) and not v739:HasTag("Effect") then
					v_u_16[v739] = v_u_16[v739] or v739.Color
					v739.Color = Color3.fromRGB(189, 67, 142)
					v_u_19[v739] = v_u_19[v739] or v739.Material
					v739.Material = Enum.Material.Neon
					v739.Reflectance = 0.05
					v739:AddTag("PlasmaVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p740, p741)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v744(p742)
				for _, v743 in p742:GetDescendants() do
					if v743:HasTag("Cleanup_Plasma") then
						v743:Destroy()
					end
				end
			end
			if p741 then
				v744(p741)
			end
			if p740 then
				v744(p740)
			end
			for _, v745 in p740:GetDescendants() do
				if (v745:IsA("BasePart") or v745:IsA("UnionOperation")) and v745:HasTag("PlasmaVisual") then
					v745.Reflectance = 0
					v745.Color = v_u_16[v745] or v745.Color
					v_u_16[v745] = nil
					v745:RemoveTag("PlasmaVisual")
					if v_u_19[v745] then
						v745.Material = v_u_19[v745]
						v_u_19[v745] = nil
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
		["_AddFX"] = function(p746, p747, p748)
			p746:_RemoveFX(p747, p748)
			if p748 then
				for _, v749 in game.ServerStorage.Mutation_FX.Heavenly:GetChildren() do
					local v750 = v749:Clone()
					v750.Parent = p748
					v750.Enabled = true
					v750:AddTag("Cleanup_Heavenly")
				end
			end
		end,
		["_RemoveFX"] = function(_, p751, p752)
			local function v755(p753)
				for _, v754 in p753:GetDescendants() do
					if v754:HasTag("Cleanup_Heavenly") then
						v754:Destroy()
					end
				end
			end
			if p752 then
				v755(p752)
			end
			if p751 then
				v755(p751)
			end
		end
	},
	["Burnt"] = {
		["Id"] = "x",
		["Name"] = "Burnt",
		["ValueMulti"] = 4,
		["Color"] = Color3.fromRGB(40, 40, 40),
		["_AddFX"] = function(p756, p757, p758)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			p756:_RemoveFX(p757, p758)
			if p758 then
				for _, v759 in game.ServerStorage.Mutation_FX.Burnt:GetChildren() do
					local v760 = v759:Clone()
					v760.Parent = p758
					v760.Enabled = true
					v760:AddTag("Cleanup_Burnt")
				end
			end
			for _, v761 in p757:GetDescendants() do
				if (v761:IsA("BasePart") or v761:IsA("UnionOperation")) and not v761:HasTag("Effect") then
					v_u_16[v761] = v_u_16[v761] or v761.Color
					v761.Color = Color3.fromRGB(25, 25, 25)
					v_u_19[v761] = v_u_19[v761] or v761.Material
					v761.Material = Enum.Material.Slate
					v761.Reflectance = 0.05
					v761:AddTag("BurntVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p762, p763)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v766(p764)
				for _, v765 in p764:GetDescendants() do
					if v765:HasTag("Cleanup_Burnt") then
						v765:Destroy()
					end
				end
			end
			if p763 then
				v766(p763)
			end
			if p762 then
				v766(p762)
			end
			for _, v767 in p762:GetDescendants() do
				if (v767:IsA("BasePart") or v767:IsA("UnionOperation")) and v767:HasTag("BurntVisual") then
					v767.Reflectance = 0
					v767.Color = v_u_16[v767] or v767.Color
					v_u_16[v767] = nil
					v767:RemoveTag("BurntVisual")
					if v_u_19[v767] then
						v767.Material = v_u_19[v767]
						v_u_19[v767] = nil
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
		["_AddFX"] = function(p768, p769, p770)
			-- upvalues: (copy) v_u_16
			p768:_RemoveFX(p769, p770)
			if p770 then
				for _, v771 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
					local v772 = v771:Clone()
					v772.Parent = p770
					v772.Enabled = true
					v772:AddTag("Cleanup_Cooked")
				end
			end
			for _, v773 in p769:GetDescendants() do
				if (v773:IsA("BasePart") or v773:IsA("UnionOperation")) and not v773:HasTag("Effect") then
					v_u_16[v773] = v_u_16[v773] or v773.Color
					v773.Color = Color3.fromRGB(210, 120, 60)
					v773:AddTag("CookedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p774, p775)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v778(p776)
				for _, v777 in p776:GetDescendants() do
					if v777:HasTag("Cleanup_Cooked") then
						v777:Destroy()
					end
				end
			end
			if p775 then
				v778(p775)
			end
			if p774 then
				v778(p774)
			end
			for _, v779 in p774:GetDescendants() do
				if (v779:IsA("BasePart") or v779:IsA("UnionOperation")) and v779:HasTag("CookedVisual") then
					v779.Reflectance = 0
					v779.Color = v_u_16[v779] or v779.Color
					v_u_16[v779] = nil
					v779:RemoveTag("CookedVisual")
					local v780 = v_u_19[v779]
					if v780 then
						v779.Material = v780
						v_u_19[v779] = nil
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
		["_AddFX"] = function(p781, p782, p783)
			-- upvalues: (copy) v_u_16
			p781:_RemoveFX(p782, p783)
			if p783 then
				for _, v784 in game.ServerStorage.Mutation_FX.Cooked:GetChildren() do
					local v785 = v784:Clone()
					v785.Parent = p783
					v785.Enabled = true
					v785:AddTag("Cleanup_Sizzled")
				end
				for _, v786 in game.ServerStorage.Mutation_FX.Fried:GetChildren() do
					local v787 = v786:Clone()
					v787.Parent = p783
					v787.Enabled = true
					v787:AddTag("Cleanup_Sizzled")
				end
			end
			for _, v788 in p782:GetDescendants() do
				if (v788:IsA("BasePart") or v788:IsA("UnionOperation")) and not v788:HasTag("Effect") then
					v_u_16[v788] = v_u_16[v788] or v788.Color
					v788.Color = Color3.fromRGB(210, 120, 60)
					v788:AddTag("SizzledVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p789, p790)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v793(p791)
				for _, v792 in p791:GetDescendants() do
					if v792:HasTag("Cleanup_Sizzled") then
						v792:Destroy()
					end
				end
			end
			if p790 then
				v793(p790)
			end
			if p789 then
				v793(p789)
			end
			for _, v794 in p789:GetDescendants() do
				if (v794:IsA("BasePart") or v794:IsA("UnionOperation")) and v794:HasTag("SizzledVisual") then
					v794.Reflectance = 0
					v794.Color = v_u_16[v794] or v794.Color
					v_u_16[v794] = nil
					v794:RemoveTag("SizzledVisual")
					local v795 = v_u_19[v794]
					if v795 then
						v794.Material = v795
						v_u_19[v794] = nil
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
		["_AddFX"] = function(p796, p797, p798)
			-- upvalues: (copy) v_u_16
			p796:_RemoveFX(p797, p798)
			local v799 = game.ServerStorage.Mutation_FX.Aromatic:GetChildren()
			local v800 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
			local v801 = game.ServerStorage.Mutation_FX.Cooked:GetChildren()
			local v802 = game.ServerStorage.Mutation_FX.Fried:GetChildren()
			local v803 = {}
			for _, v804 in v799 do
				table.insert(v803, v804)
			end
			for _, v805 in v800 do
				table.insert(v803, v805)
			end
			for _, v806 in v801 do
				table.insert(v803, v806)
			end
			for _, v807 in v802 do
				table.insert(v803, v807)
			end
			if p798 then
				for _, v808 in v803 do
					local v809 = v808:Clone()
					v809.Parent = p798
					if v809:IsA("ParticleEmitter") then
						v809.Enabled = true
					end
					v809:AddTag("Cleanup_Gourmet")
				end
			end
			for _, v810 in p797:GetDescendants() do
				if (v810:IsA("BasePart") or v810:IsA("UnionOperation")) and (not v810:HasTag("Effect") and v810.Transparency ~= 1) then
					v_u_16[v810] = v_u_16[v810] or v810.Color
					v810.Color = Color3.fromRGB(195, 151, 47)
					v810:AddTag("GourmetVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p811, p812)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			local function v815(p813)
				for _, v814 in p813:GetDescendants() do
					if v814:HasTag("Cleanup_Gourmet") then
						v814:Destroy()
					end
				end
			end
			if p812 then
				v815(p812)
			end
			if p811 then
				v815(p811)
			end
			for _, v816 in p811:GetDescendants() do
				if (v816:IsA("BasePart") or v816:IsA("UnionOperation")) and v816:HasTag("GourmetVisual") then
					v816.Color = v_u_16[v816] or v816.Color
					v_u_16[v816] = nil
					v816:RemoveTag("GourmetVisual")
					if v_u_19[v816] then
						v816.Material = v_u_19[v816]
						v_u_19[v816] = nil
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
		["_AddFX"] = function(p817, p818, p819)
			-- upvalues: (copy) v_u_16
			p817:_RemoveFX(p818, p819)
			if p819 then
				for _, v820 in game.ServerStorage.Mutation_FX.Moonlit:GetChildren() do
					local v821 = v820:Clone()
					v821.Parent = p819
					v821.Enabled = true
					v821:AddTag("Cleanup_Moonlit")
					v821:AddTag("Effect")
				end
			end
			for _, v822 in p818:GetDescendants() do
				if (v822:IsA("BasePart") or v822:IsA("UnionOperation")) and not v822:HasTag("Effect") then
					v_u_16[v822] = v_u_16[v822] or v822.Color
					v822.Color = Color3.fromRGB(62, 56, 86)
					v822.Reflectance = 0.3
					v822:AddTag("MoonlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p823, p824)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p824 then
				for _, v825 in p824:GetChildren() do
					if v825:HasTag("Cleanup_Moonlit") then
						v825:Destroy()
					end
				end
			end
			for _, v826 in p823:GetDescendants() do
				if (v826:IsA("BasePart") or v826:IsA("UnionOperation")) and v826:HasTag("MoonlitVisual") then
					v826.Color = v_u_16[v826] or v826.Color
					v_u_16[v826] = nil
					v826.Reflectance = 0
					v826:RemoveTag("MoonlitVisual")
					local v827 = v_u_19[v826]
					if v827 then
						v826.Material = v827
						v_u_19[v826] = nil
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
		["_AddFX"] = function(p828, p829, p830)
			-- upvalues: (copy) v_u_16
			p828:_RemoveFX(p829, p830)
			if p830 then
				for _, v831 in game.ServerStorage.Mutation_FX.Heartstruck:GetChildren() do
					local v832 = v831:Clone()
					v832.Parent = p830
					v832.Enabled = true
					v832:AddTag("Cleanup_Heartstruck")
					v832:AddTag("Effect")
				end
			end
			for _, v833 in p829:GetDescendants() do
				if (v833:IsA("BasePart") or v833:IsA("UnionOperation")) and not v833:HasTag("Effect") then
					v_u_16[v833] = v_u_16[v833] or v833.Color
					v833.Color = Color3.fromRGB(255, 0, 0)
					v833.Reflectance = 0.3
					v833:AddTag("HeartstuckVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p834, p835)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p835 then
				for _, v836 in p835:GetChildren() do
					if v836:HasTag("Cleanup_Heartstruck") then
						v836:Destroy()
					end
				end
			end
			for _, v837 in p834:GetDescendants() do
				if (v837:IsA("BasePart") or v837:IsA("UnionOperation")) and v837:HasTag("HeartstuckVisual") then
					v837.Color = v_u_16[v837] or v837.Color
					v_u_16[v837] = nil
					v837.Reflectance = 0
					v837:RemoveTag("HeartstuckVisual")
					local v838 = v_u_19[v837]
					if v838 then
						v837.Material = v838
						v_u_19[v837] = nil
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
		["_AddFX"] = function(p839, p840, p841)
			-- upvalues: (copy) v_u_16
			p839:_RemoveFX(p840, p841)
			for _, v842 in p840:GetDescendants() do
				if (v842:IsA("BasePart") or v842:IsA("UnionOperation")) and not v842:HasTag("Effect") then
					v_u_16[v842] = v_u_16[v842] or v842.Color
					v842.Color = Color3.fromRGB(0, 255, 0)
					v842.Material = Enum.Material.Foil
					v842.Reflectance = 0.3
					v842:AddTag("LuckVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p843, p844)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p844 then
				for _, v845 in p844:GetChildren() do
					if v845:HasTag("Cleanup_Luck") then
						v845:Destroy()
					end
				end
			end
			for _, v846 in p843:GetDescendants() do
				if (v846:IsA("BasePart") or v846:IsA("UnionOperation")) and v846:HasTag("LuckVisual") then
					v846.Color = v_u_16[v846] or v846.Color
					v_u_16[v846] = nil
					v846.Reflectance = 0
					v846:RemoveTag("LuckVisual")
					local v847 = v_u_19[v846]
					if v847 then
						v846.Material = v847
						v_u_19[v846] = nil
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
		["_AddFX"] = function(p848, p849, p850)
			-- upvalues: (copy) v_u_16
			p848:_RemoveFX(p849, p850)
			if p850 then
				for _, v851 in game.ServerStorage.Mutation_FX.Bloodlit:GetChildren() do
					local v852 = v851:Clone()
					v852.Parent = p850
					v852.Enabled = true
					v852:AddTag("Cleanup_Bloodlit")
					v852:AddTag("Effect")
				end
			end
			for _, v853 in p849:GetDescendants() do
				if (v853:IsA("BasePart") or v853:IsA("UnionOperation")) and not v853:HasTag("Effect") then
					v_u_16[v853] = v_u_16[v853] or v853.Color
					v853.Color = Color3.fromRGB(143, 1, 3)
					v853.Reflectance = 0.3
					v853:AddTag("BloodlitVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p854, p855)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p855 then
				for _, v856 in p855:GetChildren() do
					if v856:HasTag("Cleanup_Bloodlit") then
						v856:Destroy()
					end
				end
			end
			for _, v857 in p854:GetDescendants() do
				if (v857:IsA("BasePart") or v857:IsA("UnionOperation")) and v857:HasTag("BloodlitVisual") then
					v857.Reflectance = 0
					v857.Color = v_u_16[v857] or v857.Color
					v_u_16[v857] = nil
					v857:RemoveTag("BloodlitVisual")
					local v858 = v_u_19[v857]
					if v858 then
						v857.Material = v858
						v_u_19[v857] = nil
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
		["_AddFX"] = function(p859, p860, p861)
			-- upvalues: (copy) v_u_16
			p859:_RemoveFX(p860, p861)
			local v862 = false
			for v863, v864 in p860:GetDescendants() do
				if (v864:IsA("BasePart") or v864:IsA("UnionOperation")) and not v864:HasTag("Effect") then
					v_u_16[v864] = v_u_16[v864] or v864.Color
					if v863 % 5 == 0 then
						if v862 == false then
							local v865 = game.ServerStorage.Mutation_FX.Peppermint.BitsW:Clone()
							v865.Parent = v864
							v865.Enabled = true
							v865.Rate = math.random(7, 12) / 10
							v865:AddTag("Cleanup_Peppermint")
						else
							local v866 = game.ServerStorage.Mutation_FX.Peppermint.BitsR:Clone()
							v866.Parent = v864
							v866.Enabled = true
							v866.Rate = math.random(7, 12) / 10
							v866:AddTag("Cleanup_Peppermint")
						end
					end
					v864.Color = v862 == false and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(255, 0, 0)
					v864:AddTag("PeppermintVisual")
					v862 = not v862
				end
			end
		end,
		["_RemoveFX"] = function(_, p867, p868)
			-- upvalues: (copy) v_u_16
			if p868 then
				for _, v869 in p868:GetChildren() do
					if v869:HasTag("Cleanup_Peppermint") then
						v869:Destroy()
					end
				end
			end
			for _, v870 in p867:GetDescendants() do
				if (v870:IsA("BasePart") or v870:IsA("UnionOperation")) and v870:HasTag("PeppermintVisual") then
					v870.Reflectance = 0
					v870.Color = v_u_16[v870] or v870.Color
					v_u_16[v870] = nil
					v870:RemoveTag("PeppermintVisual")
				end
			end
		end
	},
	["Zombified"] = {
		["Id"] = "B",
		["Name"] = "Zombified",
		["ValueMulti"] = 25,
		["Color"] = Color3.fromRGB(128, 199, 127),
		["_AddFX"] = function(p871, p872, p873)
			p871:_RemoveFX(p872, p873)
			if p873 then
				for _, v874 in game.ServerStorage.Mutation_FX.Zombified:GetChildren() do
					local v875 = v874:Clone()
					v875.Parent = p873
					v875.Enabled = true
					v875:AddTag("Cleanup_Zombified")
					v875:AddTag("Effect")
				end
			end
			for _, v876 in p872:GetDescendants() do
				if (v876:IsA("BasePart") or v876:IsA("UnionOperation")) and not v876:HasTag("Effect") then
					v876:AddTag("ZombifiedVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p877, p878)
			-- upvalues: (copy) v_u_19
			if p878 then
				for _, v879 in p878:GetChildren() do
					if v879:HasTag("Cleanup_Zombified") then
						v879:Destroy()
					end
				end
			end
			for _, v880 in p877:GetDescendants() do
				if (v880:IsA("BasePart") or v880:IsA("UnionOperation")) and v880:HasTag("ZombifiedVisual") then
					v880:RemoveTag("ZombifiedVisual")
					local v881 = v_u_19[v880]
					if v881 then
						v880.Material = v881
						v_u_19[v880] = nil
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
		["_AddFX"] = function(p882, p883, p884)
			p882:_RemoveFX(p883, p884)
			if p884 then
				for _, v885 in game.ServerStorage.Mutation_FX.Celestial:GetChildren() do
					local v886 = v885:Clone()
					v886.Parent = p884
					v886.Enabled = true
					v886:AddTag("Cleanup_Celestial")
					v886:AddTag("Effect")
				end
			end
			for _, v887 in p883:GetDescendants() do
				if (v887:IsA("BasePart") or v887:IsA("UnionOperation")) and not v887:HasTag("Effect") then
					v887.Reflectance = 0.5
					v887:AddTag("CelestialVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p888, p889)
			-- upvalues: (copy) v_u_19
			if p889 then
				for _, v890 in p889:GetChildren() do
					if v890:HasTag("Cleanup_Celestial") then
						v890:Destroy()
					end
				end
			end
			for _, v891 in p888:GetDescendants() do
				if (v891:IsA("BasePart") or v891:IsA("UnionOperation")) and v891:HasTag("CelestialVisual") then
					v891.Reflectance = 0
					v891:RemoveTag("CelestialVisual")
					local v892 = v_u_19[v891]
					if v892 then
						v891.Material = v892
						v_u_19[v891] = nil
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
		["_AddFX"] = function(p893, p894, p895)
			p893:_RemoveFX(p894, p895)
			if p895 then
				for _, v896 in game.ServerStorage.Mutation_FX.Meteoric:GetChildren() do
					local v897 = v896:Clone()
					v897.Parent = p895
					v897.Enabled = true
					v897:AddTag("Cleanup_Meteoric")
					v897:AddTag("Effect")
				end
			end
			for _, v898 in p894:GetDescendants() do
				if (v898:IsA("BasePart") or v898:IsA("UnionOperation")) and not v898:HasTag("Effect") then
					v898.Reflectance = 0.5
					v898:AddTag("MeteoricVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p899, p900)
			-- upvalues: (copy) v_u_19
			if p900 then
				for _, v901 in p900:GetChildren() do
					if v901:HasTag("Cleanup_Meteoric") then
						v901:Destroy()
					end
				end
			end
			for _, v902 in p899:GetDescendants() do
				if (v902:IsA("BasePart") or v902:IsA("UnionOperation")) and v902:HasTag("MeteoricVisual") then
					v902.Reflectance = 0
					v902:RemoveTag("MeteoricVisual")
					local v903 = v_u_19[v902]
					if v903 then
						v902.Material = v903
						v_u_19[v902] = nil
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
		["_AddFX"] = function(p904, p905, p906)
			p904:_RemoveFX(p905, p906)
			if p906 then
				for _, v907 in game.ServerStorage.Mutation_FX.Honey:GetChildren() do
					local v908 = v907:Clone()
					v908.Parent = p906
					v908.Enabled = true
					v908:AddTag("Cleanup_Honey")
					v908:AddTag("Effect")
				end
			end
			for _, v909 in p905:GetDescendants() do
				if (v909:IsA("BasePart") or v909:IsA("UnionOperation")) and not v909:HasTag("Effect") then
					v909:AddTag("HoneyVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p910, p911)
			-- upvalues: (copy) v_u_19
			if p911 then
				for _, v912 in p911:GetChildren() do
					if v912:HasTag("Cleanup_Honey") then
						v912:Destroy()
					end
				end
			end
			for _, v913 in p910:GetDescendants() do
				if (v913:IsA("BasePart") or v913:IsA("UnionOperation")) and v913:HasTag("HoneyVisual") then
					v913:RemoveTag("HoneyVisual")
					local v914 = v_u_19[v913]
					if v914 then
						v913.Material = v914
						v_u_19[v913] = nil
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
		["_AddFX"] = function(p915, p916, p917)
			-- upvalues: (copy) v_u_16
			p915:_RemoveFX(p916, p917)
			if p917 then
				for _, v918 in game.ServerStorage.Mutation_FX.Pollinated:GetChildren() do
					local v919 = v918:Clone()
					v919.Parent = p917
					v919.Enabled = true
					v919:AddTag("Cleanup_Pollinated")
					v919:AddTag("Effect")
				end
			end
			for _, v920 in p916:GetDescendants() do
				if (v920:IsA("BasePart") or v920:IsA("UnionOperation")) and not v920:HasTag("Effect") then
					v_u_16[v920] = v_u_16[v920] or v920.Color
					v920.Color = Color3.fromRGB(255, 170, 0)
					v920:AddTag("PollinatedlVisual")
				end
			end
		end,
		["_RemoveFX"] = function(_, p921, p922)
			-- upvalues: (copy) v_u_16, (copy) v_u_19
			if p922 then
				for _, v923 in p922:GetChildren() do
					if v923:HasTag("Cleanup_Pollinated") then
						v923:Destroy()
					end
				end
			end
			for _, v924 in p921:GetDescendants() do
				if (v924:IsA("BasePart") or v924:IsA("UnionOperation")) and v924:HasTag("PollinatedlVisual") then
					v924:RemoveTag("PollinatedVisual")
					v924.Color = v_u_16[v924] or v924.Color
					v_u_16[v924] = nil
					local v925 = v_u_19[v924]
					if v925 then
						v924.Material = v925
						v_u_19[v924] = nil
					end
				end
			end
		end
	}
}
local v933 = {
	["Id"] = "G",
	["Name"] = "Amber",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(255, 192, 0),
	["TimeData"] = {
		["TimeToChange"] = 86400,
		["AddMutationName"] = "OldAmber"
	},
	["_AddFX"] = function(p927, p928, p929)
		-- upvalues: (copy) v_u_153
		v_u_153(p927, p928, p929, 0.5)
	end,
	["_RemoveFX"] = function(p930, p931, p932)
		-- upvalues: (copy) v_u_162
		v_u_162(p930, p931, p932)
	end
}
v_u_926.Amber = v933
local v940 = {
	["Id"] = "H",
	["Name"] = "OldAmber",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(252, 106, 33),
	["TimeData"] = {
		["TimeToChange"] = 172800,
		["AddMutationName"] = "AncientAmber"
	},
	["_AddFX"] = function(p934, p935, p936)
		-- upvalues: (copy) v_u_153
		v_u_153(p934, p935, p936, 0.5)
	end,
	["_RemoveFX"] = function(p937, p938, p939)
		-- upvalues: (copy) v_u_162
		v_u_162(p937, p938, p939)
	end
}
v_u_926.OldAmber = v940
v_u_926.AncientAmber = {
	["Id"] = "I",
	["Name"] = "AncientAmber",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(204, 68, 0),
	["_AddFX"] = function(p941, p942, p943)
		-- upvalues: (copy) v_u_153
		v_u_153(p941, p942, p943, 0.5)
	end,
	["_RemoveFX"] = function(p944, p945, p946)
		-- upvalues: (copy) v_u_162
		v_u_162(p944, p945, p946)
	end
}
v_u_926.Sandy = {
	["Id"] = "J",
	["Name"] = "Sandy",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(212, 191, 141),
	["_AddFX"] = function(p947, p948, p949)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p947:_RemoveFX(p948, p949)
		if p949 then
			for _, v950 in game.ServerStorage.Mutation_FX.Sandy:GetChildren() do
				local v951 = v950:Clone()
				v951.Parent = p949
				v951.Enabled = true
				v951:AddTag("Cleanup_Sandy")
			end
		end
		for _, v952 in p948:GetDescendants() do
			if (v952:IsA("BasePart") or v952:IsA("UnionOperation")) and not v952:HasTag("Effect") then
				v_u_16[v952] = v_u_16[v952] or v952.Color
				v952.Color = Color3.fromRGB(240, 206, 119)
				v_u_19[v952] = v_u_19[v952] or v952.Material
				v952.Material = Enum.Material.Sand
				v952.Reflectance = 0
				v952:AddTag("SandyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p953, p954)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v957(p955)
			for _, v956 in p955:GetDescendants() do
				if v956:HasTag("Cleanup_Sandy") then
					v956:Destroy()
				end
			end
		end
		if p954 then
			v957(p954)
		end
		if p953 then
			v957(p953)
		end
		for _, v958 in p953:GetDescendants() do
			if (v958:IsA("BasePart") or v958:IsA("UnionOperation")) and v958:HasTag("SandyVisual") then
				v958.Reflectance = 0
				v958.Color = v_u_16[v958] or v958.Color
				v_u_16[v958] = nil
				v958:RemoveTag("SandyVisual")
				if v_u_19[v958] then
					v958.Material = v_u_19[v958]
					v_u_19[v958] = nil
				end
			end
		end
	end
}
v_u_926.Clay = {
	["Id"] = "K",
	["Name"] = "Clay",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(147, 129, 122),
	["_AddFX"] = function(p959, p960, p961)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p959:_RemoveFX(p960, p961)
		if p961 then
			for _, v962 in game.ServerStorage.Mutation_FX.Clay:GetChildren() do
				local v963 = v962:Clone()
				v963.Parent = p961
				v963.Enabled = true
				v963:AddTag("Cleanup_Clay")
			end
		end
		for _, v964 in p960:GetDescendants() do
			if (v964:IsA("BasePart") or v964:IsA("UnionOperation")) and not v964:HasTag("Effect") then
				v_u_16[v964] = v_u_16[v964] or v964.Color
				v964.Color = Color3.fromRGB(147, 129, 122)
				v_u_19[v964] = v_u_19[v964] or v964.Material
				v964.Material = Enum.Material.Plaster
				v964.Reflectance = 0.5
				v964:AddTag("ClayVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p965, p966)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v969(p967)
			for _, v968 in p967:GetDescendants() do
				if v968:HasTag("Cleanup_Clay") then
					v968:Destroy()
				end
			end
		end
		if p966 then
			v969(p966)
		end
		if p965 then
			v969(p965)
		end
		for _, v970 in p965:GetDescendants() do
			if (v970:IsA("BasePart") or v970:IsA("UnionOperation")) and v970:HasTag("ClayVisual") then
				v970.Reflectance = 0
				v970.Color = v_u_16[v970] or v970.Color
				v_u_16[v970] = nil
				v970:RemoveTag("ClayVisual")
				if v_u_19[v970] then
					v970.Material = v_u_19[v970]
					v_u_19[v970] = nil
				end
			end
		end
	end
}
v_u_926.Ceramic = {
	["Id"] = "L",
	["Name"] = "Ceramic",
	["ValueMulti"] = 32,
	["Color"] = Color3.fromRGB(234, 184, 146),
	["_AddFX"] = function(p971, p972, p973)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p971:_RemoveFX(p972, p973)
		if p973 then
			for _, v974 in game.ServerStorage.Mutation_FX.Ceramic:GetChildren() do
				local v975 = v974:Clone()
				v975.Parent = p973
				v975.Enabled = true
				v975:AddTag("Cleanup_Ceramic")
			end
		end
		for _, v976 in p972:GetDescendants() do
			if (v976:IsA("BasePart") or v976:IsA("UnionOperation")) and not v976:HasTag("Effect") then
				v_u_16[v976] = v_u_16[v976] or v976.Color
				v976.Color = Color3.fromRGB(234, 184, 146)
				v_u_19[v976] = v_u_19[v976] or v976.Material
				v976.Material = Enum.Material.Concrete
				v976:AddTag("CeramicVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p977, p978)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v981(p979)
			for _, v980 in p979:GetDescendants() do
				if v980:HasTag("Cleanup_Ceramic") then
					v980:Destroy()
				end
			end
		end
		if p978 then
			v981(p978)
		end
		if p977 then
			v981(p977)
		end
		for _, v982 in p977:GetDescendants() do
			if (v982:IsA("BasePart") or v982:IsA("UnionOperation")) and v982:HasTag("CeramicVisual") then
				v982.Reflectance = 0
				v982.Color = v_u_16[v982] or v982.Color
				v_u_16[v982] = nil
				v982:RemoveTag("CeramicVisual")
				if v_u_19[v982] then
					v982.Material = v_u_19[v982]
					v_u_19[v982] = nil
				end
			end
		end
	end
}
v_u_926.Friendbound = {
	["Id"] = "M",
	["Name"] = "Friendbound",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(255, 0, 127),
	["_AddFX"] = function(p983, p984, p985)
		-- upvalues: (copy) v_u_16
		p983:_RemoveFX(p984, p985)
		if p985 then
			for _, v986 in game.ServerStorage.Mutation_FX.Friendbound:GetChildren() do
				local v987 = v986:Clone()
				v987.Parent = p985
				v987.Enabled = true
				v987:AddTag("Cleanup_Friendbound")
			end
		end
		for _, v988 in p984:GetDescendants() do
			if (v988:IsA("BasePart") or v988:IsA("UnionOperation")) and not v988:HasTag("Effect") then
				v_u_16[v988] = v_u_16[v988] or v988.Color
				v988.Color = v_u_16[v988]:Lerp(Color3.fromRGB(255, 0, 127), 0.4)
				v988:AddTag("FriendboundVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p989, p990)
		-- upvalues: (copy) v_u_16
		local function v993(p991)
			for _, v992 in p991:GetDescendants() do
				if v992:HasTag("Cleanup_Friendbound") then
					v992:Destroy()
				end
			end
		end
		if p990 then
			v993(p990)
		end
		if p989 then
			v993(p989)
		end
		for _, v994 in p989:GetDescendants() do
			if (v994:IsA("BasePart") or v994:IsA("UnionOperation")) and v994:HasTag("FriendboundVisual") then
				v994.Color = v_u_16[v994] or v994.Color
				v_u_16[v994] = nil
				v994:RemoveTag("FriendboundVisual")
			end
		end
	end
}
v_u_926.Tempestuous = {
	["Id"] = "N",
	["Name"] = "Tempestuous",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(143, 163, 180),
	["_AddFX"] = function(p995, p996, p997)
		p995:_RemoveFX(p996, p997)
		if p997 then
			for _, v998 in { game.ServerStorage.Mutation_FX.Twisted, game.ServerStorage.Mutation_FX.Tempestuous } do
				for _, v999 in v998:GetChildren() do
					local v1000 = v999:Clone()
					v1000.Parent = p997
					v1000.Enabled = true
					v1000:AddTag("Cleanup_Tempestuous")
				end
			end
		end
		for _, v1001 in p996:GetDescendants() do
			if (v1001:IsA("BasePart") or v1001:IsA("UnionOperation")) and not v1001:HasTag("Effect") then
				v1001:AddTag("TempestuousVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1002, p1003)
		if p1003 then
			for _, v1004 in p1003:GetChildren() do
				if v1004:HasTag("Cleanup_Tempestuous") then
					v1004:Destroy()
				end
			end
		end
		for _, v1005 in p1002:GetDescendants() do
			if (v1005:IsA("BasePart") or v1005:IsA("UnionOperation")) and v1005:HasTag("TempestuousVisual") then
				v1005:RemoveTag("TempestuousVisual")
			end
		end
	end
}
v_u_926.Infected = {
	["Id"] = "O",
	["Name"] = "Infected",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(67, 167, 0),
	["_AddFX"] = function(p1006, p1007, p1008)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1006:_RemoveFX(p1007, p1008)
		if p1008 then
			for _, v1009 in game.ServerStorage.Mutation_FX.Infected:GetChildren() do
				local v1010 = v1009:Clone()
				v1010.Parent = p1008
				v1010.Enabled = true
				v1010:AddTag("Cleanup_Infected")
			end
		end
		for _, v1011 in p1007:GetDescendants() do
			if (v1011:IsA("BasePart") or v1011:IsA("UnionOperation")) and not v1011:HasTag("Effect") then
				v_u_16[v1011] = v_u_16[v1011] or v1011.Color
				v1011.Color = Color3.fromRGB(65, 175, 0)
				v_u_19[v1011] = v_u_19[v1011] or v1011.Material
				v1011:AddTag("InfectedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1012, p1013)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1016(p1014)
			for _, v1015 in p1014:GetDescendants() do
				if v1015:HasTag("Cleanup_Infected") then
					v1015:Destroy()
				end
			end
		end
		if p1013 then
			v1016(p1013)
		end
		if p1012 then
			v1016(p1012)
		end
		for _, v1017 in p1012:GetDescendants() do
			if (v1017:IsA("BasePart") or v1017:IsA("UnionOperation")) and v1017:HasTag("InfectedVisual") then
				v1017.Reflectance = 0
				v1017.Color = v_u_16[v1017] or v1017.Color
				v_u_16[v1017] = nil
				v1017:RemoveTag("InfectedVisual")
				if v_u_19[v1017] then
					v1017.Material = v_u_19[v1017]
					v_u_19[v1017] = nil
				end
			end
		end
	end
}
v_u_926.Radioactive = {
	["Id"] = "P",
	["Name"] = "Radioactive",
	["ValueMulti"] = 55,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p1018, p1019, p1020)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1018:_RemoveFX(p1019, p1020)
		if p1020 then
			for _, v1021 in game.ServerStorage.Mutation_FX.Radioactive:GetChildren() do
				local v1022 = v1021:Clone()
				v1022.Parent = p1020
				v1022.Enabled = true
				v1022:AddTag("Cleanup_Radioactive")
			end
		end
		for _, v1023 in p1019:GetDescendants() do
			if (v1023:IsA("BasePart") or v1023:IsA("UnionOperation")) and not v1023:HasTag("Effect") then
				v_u_16[v1023] = v_u_16[v1023] or v1023.Color
				v1023.Color = Color3.fromRGB(65, 175, 0)
				v_u_19[v1023] = v_u_19[v1023] or v1023.Material
				v1023.Material = Enum.Material.Neon
				v1023:AddTag("RadioactiveVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1024, p1025)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1028(p1026)
			for _, v1027 in p1026:GetDescendants() do
				if v1027:HasTag("Cleanup_Radioactive") then
					v1027:Destroy()
				end
			end
		end
		if p1025 then
			v1028(p1025)
		end
		if p1024 then
			v1028(p1024)
		end
		for _, v1029 in p1024:GetDescendants() do
			if (v1029:IsA("BasePart") or v1029:IsA("UnionOperation")) and v1029:HasTag("RadioactiveVisual") then
				v1029.Reflectance = 0
				v1029.Color = v_u_16[v1029] or v1029.Color
				v_u_16[v1029] = nil
				v1029:RemoveTag("RadioactiveVisual")
				if v_u_19[v1029] then
					v1029.Material = v_u_19[v1029]
					v_u_19[v1029] = nil
				end
			end
		end
	end
}
v_u_926.Chakra = {
	["Id"] = "R",
	["Name"] = "Chakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p1030, p1031, p1032)
		p1030:_RemoveFX(p1031, p1032)
		local v1033 = game.ServerStorage.Mutation_FX.Chakra:GetChildren()
		if p1032 then
			for _, v1034 in v1033 do
				local v1035 = v1034:Clone()
				v1035.Parent = p1032
				v1035.Enabled = true
				v1035:AddTag("Cleanup_Chakra")
			end
		end
		local v1036 = 0
		for _, v1037 in p1031:GetDescendants() do
			if v1037:IsA("BasePart") and v1037 ~= p1032 then
				v1036 = v1036 + 1
				if v1036 % 3 == 0 then
					local v1038 = v1033[math.random(1, #v1033)]:Clone()
					v1038.Parent = v1037
					v1038.Enabled = true
					v1038:AddTag("Cleanup_Chakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1039, p1040)
		local function v1043(p1041)
			for _, v1042 in p1041:GetDescendants() do
				if v1042:HasTag("Cleanup_Chakra") then
					v1042:Destroy()
				end
			end
		end
		if p1040 then
			v1043(p1040)
		end
		if p1039 then
			v1043(p1039)
		end
	end
}
v_u_926.FoxfireChakra = {
	["Id"] = "S",
	["Name"] = "FoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(255, 80, 65),
	["_AddFX"] = function(p1044, p1045, p1046)
		p1044:_RemoveFX(p1045, p1046)
		local v1047 = game.ServerStorage.Mutation_FX.FoxfireChakra:GetChildren()
		local v1048 = nil
		for _, v1049 in v1047 do
			if v1049.Name == "Flames" then
				v1048 = v1049
				break
			end
		end
		if p1046 then
			for _, v1050 in v1047 do
				local v1051 = v1050:Clone()
				v1051.Parent = p1046
				v1051.Enabled = true
				v1051:AddTag("Cleanup_FoxfireChakra")
			end
		end
		local v1052 = 0
		for _, v1053 in p1045:GetDescendants() do
			if v1053:IsA("BasePart") and v1053 ~= p1046 then
				v1052 = v1052 + 1
				if v1052 % 2 == 0 then
					local v1054 = v1047[math.random(1, #v1047)]:Clone()
					v1054.Parent = v1053
					v1054.Enabled = true
					v1054:AddTag("Cleanup_FoxfireChakra")
				end
				if v1052 % 3 == 0 and v1048 then
					local v1055 = v1048:Clone()
					v1055.Parent = v1053
					v1055.Enabled = true
					v1055:AddTag("Cleanup_FoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1056, p1057)
		local function v1060(p1058)
			for _, v1059 in p1058:GetDescendants() do
				if v1059:HasTag("Cleanup_FoxfireChakra") then
					v1059:Destroy()
				end
			end
		end
		if p1057 then
			v1060(p1057)
		end
		if p1056 then
			v1060(p1056)
		end
	end
}
v_u_926.Cute = {
	["Id"] = "CUTEID",
	["Name"] = "Cute",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 170, 255),
	["_AddFX"] = function(p1061, p1062, p1063)
		p1061:_RemoveFX(p1062, p1063)
		local v1064 = game.ServerStorage.Mutation_FX.Cute:GetChildren()
		local v1065 = nil
		for _, v1066 in v1064 do
			if v1066.Name == "Flames" then
				v1065 = v1066
				break
			end
		end
		if p1063 then
			for _, v1067 in v1064 do
				local v1068 = v1067:Clone()
				v1068.Parent = p1063
				v1068.Enabled = true
				v1068:AddTag("Cleanup_Cute")
			end
		end
		local v1069 = 0
		for _, v1070 in p1062:GetDescendants() do
			if v1070:IsA("BasePart") and v1070 ~= p1063 then
				v1069 = v1069 + 1
				if v1069 % 2 == 0 then
					local v1071 = v1064[math.random(1, #v1064)]:Clone()
					v1071.Parent = v1070
					v1071.Enabled = true
					v1071:AddTag("Cleanup_Cute")
				end
				if v1069 % 3 == 0 and v1065 then
					local v1072 = v1065:Clone()
					v1072.Parent = v1070
					v1072.Enabled = true
					v1072:AddTag("Cleanup_Cute")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1073, p1074)
		local function v1077(p1075)
			for _, v1076 in p1075:GetDescendants() do
				if v1076:HasTag("Cleanup_Cute") then
					v1076:Destroy()
				end
			end
		end
		if p1074 then
			v1077(p1074)
		end
		if p1073 then
			v1077(p1073)
		end
	end
}
v_u_926.Heartbound = {
	["Id"] = "SHeartbound",
	["Name"] = "Heartbound",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 0, 0),
	["_AddFX"] = function(p1078, p1079, p1080)
		p1078:_RemoveFX(p1079, p1080)
		local v1081 = game.ServerStorage.Mutation_FX.Heartbound:GetChildren()
		local v1082 = nil
		for _, v1083 in v1081 do
			if v1083.Name == "Flames" then
				v1082 = v1083
				break
			end
		end
		if p1080 then
			for _, v1084 in v1081 do
				local v1085 = v1084:Clone()
				v1085.Parent = p1080
				v1085.Enabled = true
				v1085:AddTag("Cleanup_Heartbound")
			end
		end
		local v1086 = 0
		for _, v1087 in p1079:GetDescendants() do
			if v1087:IsA("BasePart") and v1087 ~= p1080 then
				v1086 = v1086 + 1
				if v1086 % 2 == 0 then
					local v1088 = v1081[math.random(1, #v1081)]:Clone()
					v1088.Parent = v1087
					v1088.Enabled = true
					v1088:AddTag("Cleanup_Heartbound")
				end
				if v1086 % 3 == 0 and v1082 then
					local v1089 = v1082:Clone()
					v1089.Parent = v1087
					v1089.Enabled = true
					v1089:AddTag("Cleanup_Heartbound")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1090, p1091)
		local function v1094(p1092)
			for _, v1093 in p1092:GetDescendants() do
				if v1093:HasTag("Cleanup_Heartbound") then
					v1093:Destroy()
				end
			end
		end
		if p1091 then
			v1094(p1091)
		end
		if p1090 then
			v1094(p1090)
		end
	end
}
v_u_926.CorruptChakra = {
	["Id"] = "T",
	["Name"] = "CorruptChakra",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 85, 255),
	["_AddFX"] = function(p1095, p1096, p1097)
		p1095:_RemoveFX(p1096, p1097)
		local v1098 = game.ServerStorage.Mutation_FX.CorruptChakra:GetChildren()
		if p1097 then
			for _, v1099 in v1098 do
				local v1100 = v1099:Clone()
				v1100.Parent = p1097
				v1100.Enabled = true
				v1100:AddTag("Cleanup_CorruptChakra")
			end
		end
		local v1101 = 0
		for _, v1102 in p1096:GetDescendants() do
			if v1102:IsA("BasePart") and v1102 ~= p1097 then
				v1101 = v1101 + 1
				if v1101 % 3 == 0 then
					local v1103 = v1098[math.random(1, #v1098)]:Clone()
					v1103.Parent = v1102
					v1103.Enabled = true
					v1103:AddTag("Cleanup_CorruptChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1104, p1105)
		local function v1108(p1106)
			for _, v1107 in p1106:GetDescendants() do
				if v1107:HasTag("Cleanup_CorruptChakra") then
					v1107:Destroy()
				end
			end
		end
		if p1105 then
			v1108(p1105)
		end
		if p1104 then
			v1108(p1104)
		end
	end
}
v_u_926.CorruptFoxfireChakra = {
	["Id"] = "U",
	["Name"] = "CorruptFoxfireChakra",
	["ValueMulti"] = 90,
	["Color"] = Color3.fromRGB(0, 0, 255),
	["_AddFX"] = function(p1109, p1110, p1111)
		p1109:_RemoveFX(p1110, p1111)
		local v1112 = game.ServerStorage.Mutation_FX.CorruptFoxfireChakra:GetChildren()
		local v1113 = nil
		for _, v1114 in v1112 do
			if v1114.Name == "Flames" then
				v1113 = v1114
				break
			end
		end
		if p1111 then
			for _, v1115 in v1112 do
				local v1116 = v1115:Clone()
				v1116.Parent = p1111
				v1116.Enabled = true
				v1116:AddTag("Cleanup_CorruptFoxfireChakra")
			end
		end
		local v1117 = 0
		for _, v1118 in p1110:GetDescendants() do
			if v1118:IsA("BasePart") and v1118 ~= p1111 then
				v1117 = v1117 + 1
				if v1117 % 2 == 0 then
					local v1119 = v1112[math.random(1, #v1112)]:Clone()
					v1119.Parent = v1118
					v1119.Enabled = true
					v1119:AddTag("Cleanup_CorruptFoxfireChakra")
				end
				if v1117 % 3 == 0 and v1113 then
					local v1120 = v1113:Clone()
					v1120.Parent = v1118
					v1120.Enabled = true
					v1120:AddTag("Cleanup_CorruptFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1121, p1122)
		local function v1125(p1123)
			for _, v1124 in p1123:GetDescendants() do
				if v1124:HasTag("Cleanup_CorruptFoxfireChakra") then
					v1124:Destroy()
				end
			end
		end
		if p1122 then
			v1125(p1122)
		end
		if p1121 then
			v1125(p1121)
		end
	end
}
v_u_926.AscendedChakra = {
	["Id"] = "ACH",
	["Name"] = "AscendedChakra",
	["ValueMulti"] = 230,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1126, p1127, p1128)
		-- upvalues: (copy) v_u_19, (copy) v_u_16
		p1126:_RemoveFX(p1127, p1128)
		local v1129 = game.ServerStorage.Mutation_FX.AscendedChakra:GetChildren()
		local v1130 = nil
		for _, v1131 in v1129 do
			if v1131.Name == "Flames" then
				v1130 = v1131
				break
			end
		end
		if p1128 then
			for _, v1132 in v1129 do
				local v1133 = v1132:Clone()
				v1133.Parent = p1128
				v1133.Enabled = true
				v1133:AddTag("Cleanup_AscendedChakra")
			end
		end
		local v1134 = 0
		for _, v1135 in p1127:GetDescendants() do
			if v1135:IsA("BasePart") and v1135 ~= p1128 then
				v1134 = v1134 + 1
				v1135:AddTag("AscendedChakraVisual")
				v_u_19[v1135] = v_u_19[v1135] or v1135.Material
				v_u_16[v1135] = v_u_16[v1135] or v1135.Color
				if v1134 % 2 == 0 then
					v1135.Color = Color3.fromRGB(255, 255, 255)
				else
					v1135.Color = Color3.fromRGB(255, 255, 0)
				end
				if math.random() < 0.5 then
					v1135.Material = Enum.Material.Neon
				else
					v1135.Material = Enum.Material.ForceField
				end
				if v1134 % 2 == 0 and #v1129 > 0 then
					local v1136 = v1129[math.random(1, #v1129)]:Clone()
					v1136.Parent = v1135
					v1136.Enabled = true
					v1136:AddTag("Cleanup_AscendedChakra")
				end
				if v1134 % 3 == 0 and v1130 then
					local v1137 = v1130:Clone()
					v1137.Parent = v1135
					v1137.Enabled = true
					v1137:AddTag("Cleanup_AscendedChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1138, p1139)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1142(p1140)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1141 in p1140:GetDescendants() do
				if v1141:HasTag("Cleanup_AscendedChakra") then
					v1141:Destroy()
				end
				if v1141:HasTag("AscendedChakraVisual") then
					v1141:RemoveTag("AscendedChakraVisual")
					v1141.Color = v_u_16[v1141] or v1141.Color
					v_u_16[v1141] = nil
					if v_u_19[v1141] then
						v1141.Material = v_u_19[v1141]
						v_u_19[v1141] = nil
					end
				end
			end
		end
		if p1139 then
			v1142(p1139)
		end
		if p1138 then
			v1142(p1138)
		end
	end
}
v_u_926.Static = {
	["Id"] = "V",
	["Name"] = "Static",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1143, p1144, p1145)
		p1143:_RemoveFX(p1144, p1145)
		if p1145 then
			for _, v1146 in game.ServerStorage.Mutation_FX.Static:GetChildren() do
				local v1147 = v1146:Clone()
				v1147.Parent = p1145
				v1147:AddTag("Cleanup_Static")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1148)
		if p1148 then
			for _, v1149 in p1148:GetChildren() do
				if v1149:HasTag("Cleanup_Static") then
					v1149:Destroy()
				end
			end
		end
	end
}
v_u_926.HarmonisedChakra = {
	["Id"] = "W",
	["Name"] = "HarmonisedChakra",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p1150, p1151, p1152)
		p1150:_RemoveFX(p1151, p1152)
		local v1153 = game.ServerStorage.Mutation_FX.HarmonisedChakra:GetChildren()
		if p1152 then
			for _, v1154 in v1153 do
				local v1155 = v1154:Clone()
				v1155.Parent = p1152
				v1155.Enabled = true
				v1155:AddTag("Cleanup_HarmonisedChakra")
			end
		end
		local v1156 = 0
		for _, v1157 in p1151:GetDescendants() do
			if v1157:IsA("BasePart") and v1157 ~= p1152 then
				v1156 = v1156 + 1
				if v1156 % 3 == 0 then
					local v1158 = v1153[math.random(1, #v1153)]:Clone()
					v1158.Parent = v1157
					v1158.Enabled = true
					v1158:AddTag("Cleanup_HarmonisedChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1159, p1160)
		local function v1163(p1161)
			for _, v1162 in p1161:GetDescendants() do
				if v1162:HasTag("Cleanup_HarmonisedChakra") then
					v1162:Destroy()
				end
			end
		end
		if p1160 then
			v1163(p1160)
		end
		if p1159 then
			v1163(p1159)
		end
	end
}
v_u_926.HarmonisedFoxfireChakra = {
	["Id"] = "X",
	["Name"] = "HarmonisedFoxfireChakra",
	["ValueMulti"] = 190,
	["Color"] = Color3.fromRGB(170, 85, 255),
	["_AddFX"] = function(p1164, p1165, p1166)
		p1164:_RemoveFX(p1165, p1166)
		local v1167 = game.ServerStorage.Mutation_FX.HarmonisedFoxfireChakra:GetChildren()
		local v1168 = nil
		for _, v1169 in v1167 do
			if v1169.Name == "Flames" then
				v1168 = v1169
				break
			end
		end
		if p1166 then
			for _, v1170 in v1167 do
				local v1171 = v1170:Clone()
				v1171.Parent = p1166
				v1171.Enabled = true
				v1171:AddTag("Cleanup_HarmonisedFoxfireChakra")
			end
		end
		local v1172 = 0
		for _, v1173 in p1165:GetDescendants() do
			if v1173:IsA("BasePart") and v1173 ~= p1166 then
				v1172 = v1172 + 1
				if v1172 % 2 == 0 then
					local v1174 = v1167[math.random(1, #v1167)]:Clone()
					v1174.Parent = v1173
					v1174.Enabled = true
					v1174:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
				if v1172 % 3 == 0 and v1168 then
					local v1175 = v1168:Clone()
					v1175.Parent = v1173
					v1175.Enabled = true
					v1175:AddTag("Cleanup_HarmonisedFoxfireChakra")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1176, p1177)
		local function v1180(p1178)
			for _, v1179 in p1178:GetDescendants() do
				if v1179:HasTag("Cleanup_HarmonisedFoxfireChakra") then
					v1179:Destroy()
				end
			end
		end
		if p1177 then
			v1180(p1177)
		end
		if p1176 then
			v1180(p1176)
		end
	end
}
v_u_926.Pasta = {
	["Id"] = "PA",
	["Name"] = "Pasta",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(255, 223, 128),
	["_AddFX"] = function(p1181, p1182, p1183)
		p1181:_RemoveFX(p1182, p1183)
		local v1184 = {}
		for _, v1185 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v1185.Name == "Pasta" then
				table.insert(v1184, v1185)
			end
		end
		if p1183 then
			for _, v1186 in v1184 do
				if not p1183:FindFirstChild(v1186.Name) then
					local v1187 = v1186:Clone()
					v1187.Parent = p1183
					v1187.Enabled = true
					v1187:AddTag("Cleanup_Pasta")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1188, p1189)
		local function v1192(p1190)
			for _, v1191 in p1190:GetDescendants() do
				if v1191:HasTag("Cleanup_Pasta") then
					v1191:Destroy()
				end
			end
		end
		if p1189 then
			v1192(p1189)
		end
		if p1188 then
			v1192(p1188)
		end
	end
}
v_u_926.Sauce = {
	["Id"] = "SA",
	["Name"] = "Sauce",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(200, 45, 35),
	["_AddFX"] = function(p1193, p1194, p1195)
		p1193:_RemoveFX(p1194, p1195)
		local v1196 = {}
		for _, v1197 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v1197.Name == "Sauce" then
				table.insert(v1196, v1197)
			end
		end
		if p1195 then
			for _, v1198 in v1196 do
				if not p1195:FindFirstChild(v1198.Name) then
					local v1199 = v1198:Clone()
					v1199.Parent = p1195
					v1199.Enabled = true
					v1199:AddTag("Cleanup_Sauce")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1200, p1201)
		local function v1204(p1202)
			for _, v1203 in p1202:GetDescendants() do
				if v1203:HasTag("Cleanup_Sauce") then
					v1203:Destroy()
				end
			end
		end
		if p1201 then
			v1204(p1201)
		end
		if p1200 then
			v1204(p1200)
		end
	end
}
v_u_926.Meatball = {
	["Id"] = "MB",
	["Name"] = "Meatball",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(139, 69, 19),
	["_AddFX"] = function(p1205, p1206, p1207)
		p1205:_RemoveFX(p1206, p1207)
		local v1208 = {}
		for _, v1209 in game.ServerStorage.Mutation_FX.Spaghetti:GetChildren() do
			if v1209.Name == "Meatball" then
				table.insert(v1208, v1209)
			end
		end
		if p1207 then
			for _, v1210 in v1208 do
				if not p1207:FindFirstChild(v1210.Name) then
					local v1211 = v1210:Clone()
					v1211.Parent = p1207
					v1211.Enabled = true
					v1211:AddTag("Cleanup_Meatball")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1212, p1213)
		local function v1216(p1214)
			for _, v1215 in p1214:GetDescendants() do
				if v1215:HasTag("Cleanup_Meatball") then
					v1215:Destroy()
				end
			end
		end
		if p1213 then
			v1216(p1213)
		end
		if p1212 then
			v1216(p1212)
		end
	end
}
v_u_926.Spaghetti = {
	["Id"] = "SP",
	["Name"] = "Spaghetti",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 140, 70),
	["_AddFX"] = function(p1217, p1218, p1219)
		p1217:_RemoveFX(p1218, p1219)
		local v1220 = game.ServerStorage.Mutation_FX.Spaghetti:GetChildren()
		if p1219 then
			for _, v1221 in v1220 do
				if not p1219:FindFirstChild(v1221.Name) then
					local v1222 = v1221:Clone()
					v1222.Parent = p1219
					v1222.Enabled = true
					v1222:AddTag("Cleanup_Spaghetti")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1223, p1224)
		local function v1227(p1225)
			for _, v1226 in p1225:GetDescendants() do
				if v1226:HasTag("Cleanup_Spaghetti") then
					v1226:Destroy()
				end
			end
		end
		if p1224 then
			v1227(p1224)
		end
		if p1223 then
			v1227(p1223)
		end
	end
}
v_u_926.Eclipsed = {
	["Id"] = "EC",
	["Name"] = "Eclipsed",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(44, 111, 162),
	["_AddFX"] = function(p1228, p1229, p1230)
		-- upvalues: (copy) v_u_16
		p1228:_RemoveFX(p1229, p1230)
		if p1230 then
			for _, v1231 in game.ServerStorage.Mutation_FX.Eclipsed:GetChildren() do
				local v1232 = v1231:Clone()
				v1232.Parent = p1230
				v1232.Enabled = true
				v1232:AddTag("Cleanup_Eclipsed")
			end
		end
		for _, v1233 in p1229:GetDescendants() do
			if (v1233:IsA("BasePart") or v1233:IsA("UnionOperation")) and (not v1233:HasTag("Effect") and (not v1233.Transparency or v1233.Transparency ~= 1)) then
				v_u_16[v1233] = v_u_16[v1233] or v1233.Color
				v1233.Color = v1233.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.45)
				v1233:AddTag("EclipsedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1234, p1235)
		-- upvalues: (copy) v_u_16
		if p1235 then
			for _, v1236 in p1235:GetChildren() do
				if v1236:HasTag("Cleanup_Eclipsed") then
					v1236:Destroy()
				end
			end
		end
		for _, v1237 in p1234:GetDescendants() do
			if (v1237:IsA("BasePart") or v1237:IsA("UnionOperation")) and v1237:HasTag("EclipsedVisual") then
				v1237.Color = v_u_16[v1237] or v1237.Color
				v_u_16[v1237] = nil
				v1237:RemoveTag("EclipsedVisual")
			end
		end
	end
}
v_u_926.Enlightened = {
	["Id"] = "EN",
	["Name"] = "Enlightened",
	["ValueMulti"] = 35,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1238, p1239, p1240)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1238:_RemoveFX(p1239, p1240)
		local v1241 = Color3.fromRGB(218, 133, 65)
		local v1242 = {}
		for _, v1243 in p1239:GetDescendants() do
			if (v1243:IsA("BasePart") or v1243:IsA("UnionOperation")) and not v1243:HasTag("Effect") then
				local v1244 = v1243.Color
				v1242[v1244] = (v1242[v1244] or 0) + 1
			end
		end
		local v1245 = 0
		for v1246, v1247 in pairs(v1242) do
			if v1245 <= v1247 then
				v1241 = v1246
				v1245 = v1247
			end
		end
		for _, v1248 in p1239:GetDescendants() do
			if (v1248:IsA("BasePart") or v1248:IsA("UnionOperation")) and (not v1248:HasTag("Effect") and (not v1248.Transparency or v1248.Transparency ~= 1) and v1248.Color == v1241) then
				v_u_16[v1248] = v_u_16[v1248] or v1248.Color
				v1248.Color = Color3.fromRGB(218, 133, 65)
				v_u_19[v1248] = v_u_19[v1248] or v1248.Material
				v1248.Material = Enum.Material.Neon
				v1248:AddTag("EnlightenedVisual")
			end
		end
		if p1240 then
			for _, v1249 in game.ServerStorage.Mutation_FX.Enlightened:GetChildren() do
				local v1250 = v1249:Clone()
				v1250.Parent = p1240
				v1250.Enabled = true
				v1250:AddTag("Cleanup_Enlightened")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1251, p1252)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1255(p1253)
			for _, v1254 in p1253:GetDescendants() do
				if v1254:HasTag("Cleanup_Enlightened") then
					v1254:Destroy()
				end
			end
		end
		if p1252 then
			v1255(p1252)
		end
		if p1251 then
			v1255(p1251)
		end
		for _, v1256 in p1251:GetDescendants() do
			if (v1256:IsA("BasePart") or v1256:IsA("UnionOperation")) and v1256:HasTag("EnlightenedVisual") then
				v1256.Color = v_u_16[v1256] or v1256.Color
				v_u_16[v1256] = nil
				v1256:RemoveTag("EnlightenedVisual")
				if v_u_19[v1256] then
					v1256.Material = v_u_19[v1256]
					v_u_19[v1256] = nil
				end
			end
		end
	end
}
v_u_926.Tranquil = {
	["Id"] = "TQ",
	["Name"] = "Tranquil",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1257, p1258, p1259)
		p1257:_RemoveFX(p1258, p1259)
		local v1260 = p1258:FindFirstChild("Item_Seed")
		local v1261 = not (v1260 and v1260:IsA("NumberValue")) and 0 or v1260.Value
		local v1262 = Random.new(v1261)
		local v1263 = game.ServerStorage.Mutation_FX.Tranquil:GetChildren()
		local v1264 = 0
		for _, v1265 in p1258:GetDescendants() do
			if (v1265:IsA("BasePart") or v1265:IsA("UnionOperation")) and not v1265:HasTag("Effect") then
				v1264 = v1264 + 1
				if v1264 % 5 == 0 or v1264 == 1 then
					local v1266 = v1263[v1262:NextInteger(1, #v1263)]:Clone()
					v1266.Enabled = true
					v1266.Rate = v1262:NextInteger(30, 50) * 0.01
					v1266.Parent = v1265
					v1266:AddTag("Cleanup_Tranquil")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1267, p1268)
		local function v1271(p1269)
			for _, v1270 in p1269:GetDescendants() do
				if v1270:HasTag("Cleanup_Tranquil") then
					v1270:Destroy()
				end
			end
		end
		if p1268 then
			v1271(p1268)
		end
		if p1267 then
			v1271(p1267)
		end
	end
}
v_u_926.Corrupt = {
	["Id"] = "CR",
	["Name"] = "Corrupt",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(176, 23, 26),
	["_AddFX"] = function(p1272, p1273, p1274)
		p1272:_RemoveFX(p1273, p1274)
		if p1274 then
			for _, v1275 in game.ServerStorage.Mutation_FX.Corrupt:GetChildren() do
				local v1276 = v1275:Clone()
				v1276.Parent = p1274
				v1276:AddTag("Cleanup_Corrupt")
				if v1276:IsA("ParticleEmitter") then
					v1276.Enabled = true
				end
			end
		end
		for _, v1277 in p1273:GetDescendants() do
			if (v1277:IsA("BasePart") or v1277:IsA("UnionOperation")) and (not v1277:HasTag("Effect") and (not v1277.Transparency or v1277.Transparency ~= 1)) then
				v1277.Color = v1277.Color:Lerp(Color3.fromRGB(176, 23, 26), 0.5)
				v1277:AddTag("CorruptVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1278, p1279)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1282(p1280)
			for _, v1281 in p1280:GetDescendants() do
				if v1281:HasTag("Cleanup_Corrupt") then
					v1281:Destroy()
				end
			end
		end
		if p1279 then
			v1282(p1279)
		end
		for _, v1283 in p1278:GetDescendants() do
			if (v1283:IsA("BasePart") or v1283:IsA("UnionOperation")) and v1283:HasTag("CorruptVisual") then
				v1283.Color = v_u_16[v1283] or v1283.Color
				v_u_16[v1283] = nil
				v1283:RemoveTag("CorruptVisual")
				if v_u_19[v1283] then
					v1283.Material = v_u_19[v1283]
					v_u_19[v1283] = nil
				end
			end
		end
	end
}
v_u_926.Toxic = {
	["Id"] = "TX",
	["Name"] = "Toxic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(85, 255, 0),
	["_AddFX"] = function(p1284, p1285, p1286)
		p1284:_RemoveFX(p1285, p1286)
		if p1286 then
			for _, v1287 in game.ServerStorage.Mutation_FX.Toxic:GetChildren() do
				local v1288 = v1287:Clone()
				v1288.Parent = p1286
				v1288.Enabled = true
				v1288:AddTag("Cleanup_Toxic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1289, p1290)
		local function v1293(p1291)
			for _, v1292 in p1291:GetDescendants() do
				if v1292:HasTag("Cleanup_Toxic") then
					v1292:Destroy()
				end
			end
		end
		if p1290 then
			v1293(p1290)
		end
		if p1289 then
			v1293(p1289)
		end
	end
}
v_u_926.Acidic = {
	["Id"] = "AC",
	["Name"] = "Acidic",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(224, 245, 129),
	["_AddFX"] = function(p1294, p1295, p1296)
		p1294:_RemoveFX(p1295, p1296)
		if p1296 then
			for _, v1297 in game.ServerStorage.Mutation_FX.Acidic:GetChildren() do
				local v1298 = v1297:Clone()
				v1298.Parent = p1296
				v1298.Enabled = true
				v1298:AddTag("Cleanup_Acidic")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1299, p1300)
		local function v1303(p1301)
			for _, v1302 in p1301:GetDescendants() do
				if v1302:HasTag("Cleanup_Acidic") then
					v1302:Destroy()
				end
			end
		end
		if p1300 then
			v1303(p1300)
		end
		if p1299 then
			v1303(p1299)
		end
	end
}
v_u_926.Corrosive = {
	["Id"] = "CV",
	["Name"] = "Corrosive",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 0),
	["_AddFX"] = function(p1304, p1305, p1306)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1304:_RemoveFX(p1305, p1306)
		local v1307 = {}
		for _, v1308 in { "Acidic", "Toxic" } do
			for _, v1309 in game.ServerStorage.Mutation_FX[v1308]:GetChildren() do
				table.insert(v1307, v1309)
			end
		end
		if p1306 then
			for _, v1310 in v1307 do
				local v1311 = v1310:Clone()
				v1311.Parent = p1306
				v1311.Enabled = true
				v1311:AddTag("Cleanup_Corrosive")
			end
		end
		local v1312 = 0
		for _, v1313 in p1305:GetDescendants() do
			if v1313:IsA("BasePart") and v1313 ~= p1306 then
				v1312 = v1312 + 1
				if v1312 % 2 == 0 and #v1307 > 0 then
					local v1314 = v1307[math.random(1, #v1307)]:Clone()
					v1314.Parent = v1313
					v1314.Enabled = true
					v1314:AddTag("Cleanup_Corrosive")
				end
				if Random.new():NextNumber() < 0.5 then
					v1313:AddTag("CorrosiveVisual")
					v_u_16[v1313] = v_u_16[v1313] or v1313.Color
					v_u_19[v1313] = v_u_19[v1313] or v1313.Material
					v1313.Color = Color3.fromRGB(0, 255, 0)
					v1313.Material = Enum.Material.Neon
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1315, p1316)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1319(p1317)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1318 in p1317:GetDescendants() do
				if v1318:HasTag("Cleanup_Corrosive") then
					v1318:Destroy()
				elseif v1318:HasTag("CorrosiveVisual") then
					v1318.Color = v_u_16[v1318] or v1318.Color
					v1318.Material = v_u_19[v1318] or v1318.Material
					v_u_16[v1318] = nil
					v_u_19[v1318] = nil
					v1318:RemoveTag("CorrosiveVisual")
				end
			end
		end
		if p1316 then
			v1319(p1316)
		end
		if p1315 then
			v1319(p1315)
		end
	end
}
v_u_926.Flaming = {
	["Id"] = "FL",
	["Name"] = "Flaming",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(255, 85, 0),
	["_AddFX"] = function(p1320, p1321, p1322)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1320:_RemoveFX(p1321, p1322)
		local v1323 = game.ServerStorage.Mutation_FX.Flaming:GetChildren()
		local v1324 = { Color3.fromRGB(255, 0, 0), Color3.fromRGB(255, 128, 0), Color3.fromRGB(255, 255, 0) }
		if p1322 then
			for _, v1325 in v1323 do
				local v1326 = v1325:Clone()
				v1326.Parent = p1322
				v1326.Enabled = true
				v1326:AddTag("Cleanup_Flaming")
			end
		end
		local v1327 = 0
		for _, v1328 in p1321:GetDescendants() do
			if v1328:IsA("BasePart") and v1328 ~= p1322 then
				v1327 = v1327 + 1
				v_u_16[v1328] = v_u_16[v1328] or v1328.Color
				v_u_19[v1328] = v_u_19[v1328] or v1328.Material
				v1328.Color = v1324[math.random(1, #v1324)]
				if v1327 % 3 == 0 and #v1323 > 0 then
					local v1329 = v1323[math.random(1, #v1323)]:Clone()
					v1329.Parent = v1328
					v1329.Enabled = true
					v1329:AddTag("Cleanup_Flaming")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1330, p1331)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1334(p1332)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1333 in p1332:GetDescendants() do
				if v1333:HasTag("Cleanup_Flaming") then
					v1333:Destroy()
				end
				if v_u_16[v1333] then
					v1333.Color = v_u_16[v1333]
					v_u_16[v1333] = nil
				end
				if v_u_19[v1333] then
					v1333.Material = v_u_19[v1333]
					v_u_19[v1333] = nil
				end
			end
		end
		if p1331 then
			v1334(p1331)
		end
		if p1330 then
			v1334(p1330)
		end
	end
}
v_u_926.Blazing = {
	["Id"] = "BZ",
	["Name"] = "Blazing",
	["ValueMulti"] = 52,
	["Color"] = Color3.fromRGB(255, 90, 20),
	["_AddFX"] = function(p1335, p1336, p1337)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1335:_RemoveFX(p1336, p1337)
		local v1338 = game.ServerStorage.Mutation_FX.Flaming:GetChildren()
		local v1339 = {
			"Neon orange",
			"Br. yellowish orange",
			"Bright orange",
			"Bright red",
			"Bright yellow"
		}
		if p1337 then
			for _, v1340 in v1338 do
				local v1341 = v1340:Clone()
				v1341.Parent = p1337
				v1341.Enabled = true
				v1341:AddTag("Cleanup_Blazing")
			end
		end
		local v1342 = 0
		for _, v1343 in p1336:GetDescendants() do
			if v1343:IsA("BasePart") then
				v1342 = v1342 + 1
				v_u_16[v1343] = v_u_16[v1343] or v1343.BrickColor.Color
				v_u_19[v1343] = v_u_19[v1343] or v1343.Material
				v1343.BrickColor = BrickColor.new(v1339[math.random(1, #v1339)])
				v1343.Material = Enum.Material.Neon
				v1343:AddTag("BlazingVisual")
				if v1343 ~= p1337 and (v1342 % 2 == 0 and #v1338 > 0) then
					local v1344 = v1338[math.random(1, #v1338)]:Clone()
					v1344.Parent = v1343
					v1344.Enabled = true
					v1344:AddTag("Cleanup_Blazing")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1345, p1346)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1350(p1347)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1348 in p1347:GetDescendants() do
				if v1348:HasTag("Cleanup_Blazing") then
					v1348:Destroy()
				end
				if v1348:HasTag("BlazingVisual") then
					local v1349
					if v_u_16[v1348] then
						v1349 = BrickColor.new(v_u_16[v1348])
					else
						v1349 = v1348.BrickColor
					end
					v1348.BrickColor = v1349
					v_u_16[v1348] = nil
					v1348:RemoveTag("BlazingVisual")
					if v_u_19[v1348] then
						v1348.Material = v_u_19[v1348]
						v_u_19[v1348] = nil
					end
				end
			end
		end
		if p1346 then
			v1350(p1346)
		end
		if p1345 then
			v1350(p1345)
		end
	end
}
v_u_926.Infernal = {
	["Id"] = "IN",
	["Name"] = "Infernal",
	["ValueMulti"] = 180,
	["Color"] = Color3.fromRGB(101, 255, 91),
	["_AddFX"] = function(p1351, p1352, p1353)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1351:_RemoveFX(p1352, p1353)
		local v1354 = game.ServerStorage.Mutation_FX.Infernal:GetChildren()
		local v1355 = {
			Color3.fromRGB(153, 255, 102),
			Color3.fromRGB(101, 255, 91),
			Color3.fromRGB(50, 205, 50),
			Color3.fromRGB(124, 252, 0),
			Color3.fromRGB(178, 255, 102)
		}
		if p1353 then
			for _, v1356 in v1354 do
				local v1357 = v1356:Clone()
				v1357.Parent = p1353
				v1357.Enabled = true
				v1357:AddTag("Cleanup_Infernal")
			end
		end
		local v1358 = 0
		for _, v1359 in p1352:GetDescendants() do
			if v1359:IsA("BasePart") then
				v1358 = v1358 + 1
				v_u_16[v1359] = v_u_16[v1359] or v1359.Color
				v_u_19[v1359] = v_u_19[v1359] or v1359.Material
				v1359.Color = v1355[math.random(1, #v1355)]
				v1359.Material = Enum.Material.Neon
				v1359:AddTag("InfernalVisual")
				if v1358 % 3 == 0 then
					local v1360 = Instance.new("Attachment", v1359)
					local v1361 = Instance.new("Attachment", v1359)
					v1360.Position = Vector3.new(0, 0.15, 0)
					v1361.Position = Vector3.new(0, -0.15, 0)
					v1360:AddTag("Cleanup_Infernal")
					v1361:AddTag("Cleanup_Infernal")
					local v1362 = Instance.new("Trail")
					v1362.Color = ColorSequence.new(Color3.fromRGB(101, 255, 91))
					v1362.LightInfluence = 0
					v1362.Brightness = 3
					v1362.Attachment0 = v1360
					v1362.Attachment1 = v1361
					v1362.Lifetime = 0.3
					v1362.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v1362.WidthScale = NumberSequence.new(2)
					v1362.Parent = v1359
					v1362:AddTag("Cleanup_Infernal")
				end
				if v1359 ~= p1353 and #v1354 > 0 then
					local v1363 = v1354[math.random(1, #v1354)]:Clone()
					v1363.Parent = v1359
					v1363.Enabled = true
					v1363:AddTag("Cleanup_Infernal")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1364, p1365)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1368(p1366)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1367 in p1366:GetDescendants() do
				if v1367:HasTag("Cleanup_Infernal") then
					v1367:Destroy()
				end
				if v1367:HasTag("InfernalVisual") then
					v1367.Color = v_u_16[v1367] or v1367.Color
					v_u_16[v1367] = nil
					v1367:RemoveTag("InfernalVisual")
					if v_u_19[v1367] then
						v1367.Material = v_u_19[v1367]
						v_u_19[v1367] = nil
					end
				end
			end
		end
		if p1365 then
			v1368(p1365)
		end
		if p1364 then
			v1368(p1364)
		end
	end
}
v_u_926.Goldsparkle = {
	["Id"] = "GLDSPARKLE",
	["Name"] = "Goldsparkle",
	["ValueMulti"] = 500,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1369, p1370, p1371)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1369:_RemoveFX(p1370, p1371)
		local v1372 = game.ServerStorage.Mutation_FX.Goldsparkle:GetChildren()
		local v1373 = {
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(255, 213, 0),
			Color3.fromRGB(255, 179, 0),
			Color3.fromRGB(252, 188, 86),
			Color3.fromRGB(255, 213, 0)
		}
		if p1371 then
			for _, v1374 in v1372 do
				local v1375 = v1374:Clone()
				v1375.Parent = p1371
				v1375:AddTag("Cleanup_Goldsparkle")
			end
		end
		local v1376 = 0
		for _, v1377 in p1370:GetDescendants() do
			if v1377:IsA("BasePart") then
				v1376 = v1376 + 1
				v_u_16[v1377] = v_u_16[v1377] or v1377.Color
				v_u_19[v1377] = v_u_19[v1377] or v1377.Material
				v1377.Color = v1373[math.random(1, #v1373)]
				v1377.Material = Enum.Material.Neon
				v1377:AddTag("GoldsparkleVisual")
				if v1376 % 3 == 0 then
					local v1378 = Instance.new("Attachment", v1377)
					local v1379 = Instance.new("Attachment", v1377)
					v1378.Position = Vector3.new(0, 0.15, 0)
					v1379.Position = Vector3.new(0, -0.15, 0)
					v1378:AddTag("Cleanup_Goldsparkle")
					v1379:AddTag("Cleanup_Goldsparkle")
					local v1380 = Instance.new("Trail")
					v1380.Color = ColorSequence.new(Color3.fromRGB(101, 255, 91))
					v1380.LightInfluence = 0
					v1380.Brightness = 3
					v1380.Attachment0 = v1378
					v1380.Attachment1 = v1379
					v1380.Lifetime = 0.3
					v1380.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v1380.WidthScale = NumberSequence.new(2)
					v1380.Parent = v1377
					v1380:AddTag("Cleanup_Goldsparkle")
				end
				if v1377 ~= p1371 and #v1372 > 0 then
					local v1381 = v1372[math.random(1, #v1372)]:Clone()
					v1381.Parent = v1377
					v1381.Enabled = true
					v1381:AddTag("Cleanup_Goldsparkle")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1382, p1383)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1386(p1384)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1385 in p1384:GetDescendants() do
				if v1385:HasTag("Cleanup_Goldsparkle") then
					v1385:Destroy()
				end
				if v1385:HasTag("GoldsparkleVisual") then
					v1385.Color = v_u_16[v1385] or v1385.Color
					v_u_16[v1385] = nil
					v1385:RemoveTag("GoldsparkleVisual")
					if v_u_19[v1385] then
						v1385.Material = v_u_19[v1385]
						v_u_19[v1385] = nil
					end
				end
			end
		end
		if p1383 then
			v1386(p1383)
		end
		if p1382 then
			v1386(p1382)
		end
	end
}
v_u_926.Oil = {
	["Id"] = "OL",
	["Name"] = "Oil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(52, 52, 77),
	["_AddFX"] = function(p1387, p1388, p1389)
		p1387:_RemoveFX(p1388, p1389)
		if p1389 then
			for _, v1390 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v1391 = v1390:Clone()
				v1391.Parent = p1389
				v1391.Enabled = true
				v1391:AddTag("Cleanup_Oil")
				v1391:AddTag("Effect")
			end
		end
		for _, v1392 in p1388:GetDescendants() do
			if (v1392:IsA("BasePart") or v1392:IsA("UnionOperation")) and not v1392:HasTag("Effect") then
				v1392:AddTag("OilVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1393, p1394)
		-- upvalues: (copy) v_u_19
		if p1394 then
			for _, v1395 in p1394:GetChildren() do
				if v1395:HasTag("Cleanup_Oil") then
					v1395:Destroy()
				end
			end
		end
		for _, v1396 in p1393:GetDescendants() do
			if (v1396:IsA("BasePart") or v1396:IsA("UnionOperation")) and v1396:HasTag("OilVisual") then
				v1396:RemoveTag("OilVisual")
				local v1397 = v_u_19[v1396]
				if v1397 then
					v1396.Material = v1397
					v_u_19[v1396] = nil
				end
			end
		end
	end
}
v_u_926.Goldsparkle = {
	["Id"] = "GLDSPARKLE",
	["Name"] = "Goldsparkle",
	["ValueMulti"] = 500,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p1398, p1399, p1400)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1398:_RemoveFX(p1399, p1400)
		local v1401 = game.ServerStorage.Mutation_FX.Goldsparkle:GetChildren()
		local v1402 = {
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(255, 213, 0),
			Color3.fromRGB(255, 179, 0),
			Color3.fromRGB(252, 188, 86),
			Color3.fromRGB(255, 213, 0)
		}
		if p1400 then
			for _, v1403 in v1401 do
				local v1404 = v1403:Clone()
				v1404.Parent = p1400
				v1404:AddTag("Cleanup_Goldsparkle")
			end
		end
		local v1405 = 0
		for _, v1406 in p1399:GetDescendants() do
			if v1406:IsA("BasePart") then
				v1405 = v1405 + 1
				v_u_16[v1406] = v_u_16[v1406] or v1406.Color
				v_u_19[v1406] = v_u_19[v1406] or v1406.Material
				v1406.Color = v1402[math.random(1, #v1402)]
				v1406.Material = Enum.Material.Neon
				v1406:AddTag("GoldsparkleVisual")
				if v1405 % 3 == 0 then
					local v1407 = Instance.new("Attachment", v1406)
					local v1408 = Instance.new("Attachment", v1406)
					v1407.Position = Vector3.new(0, 0.15, 0)
					v1408.Position = Vector3.new(0, -0.15, 0)
					v1407:AddTag("Cleanup_Goldsparkle")
					v1408:AddTag("Cleanup_Goldsparkle")
					local v1409 = Instance.new("Trail")
					v1409.Color = ColorSequence.new(Color3.fromRGB(101, 255, 91))
					v1409.LightInfluence = 0
					v1409.Brightness = 3
					v1409.Attachment0 = v1407
					v1409.Attachment1 = v1408
					v1409.Lifetime = 0.3
					v1409.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v1409.WidthScale = NumberSequence.new(2)
					v1409.Parent = v1406
					v1409:AddTag("Cleanup_Goldsparkle")
				end
				if v1406 ~= p1400 and #v1401 > 0 then
					local v1410 = v1401[math.random(1, #v1401)]:Clone()
					v1410.Parent = v1406
					v1410.Enabled = true
					v1410:AddTag("Cleanup_Goldsparkle")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1411, p1412)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1415(p1413)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1414 in p1413:GetDescendants() do
				if v1414:HasTag("Cleanup_Goldsparkle") then
					v1414:Destroy()
				end
				if v1414:HasTag("GoldsparkleVisual") then
					v1414.Color = v_u_16[v1414] or v1414.Color
					v_u_16[v1414] = nil
					v1414:RemoveTag("GoldsparkleVisual")
					if v_u_19[v1414] then
						v1414.Material = v_u_19[v1414]
						v_u_19[v1414] = nil
					end
				end
			end
		end
		if p1412 then
			v1415(p1412)
		end
		if p1411 then
			v1415(p1411)
		end
	end
}
v_u_926.Oil = {
	["Id"] = "OL",
	["Name"] = "Oil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(52, 52, 77),
	["_AddFX"] = function(p1416, p1417, p1418)
		p1416:_RemoveFX(p1417, p1418)
		if p1418 then
			for _, v1419 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v1420 = v1419:Clone()
				v1420.Parent = p1418
				v1420.Enabled = true
				v1420:AddTag("Cleanup_Oil")
				v1420:AddTag("Effect")
			end
		end
		for _, v1421 in p1417:GetDescendants() do
			if (v1421:IsA("BasePart") or v1421:IsA("UnionOperation")) and not v1421:HasTag("Effect") then
				v1421:AddTag("OilVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1422, p1423)
		-- upvalues: (copy) v_u_19
		if p1423 then
			for _, v1424 in p1423:GetChildren() do
				if v1424:HasTag("Cleanup_Oil") then
					v1424:Destroy()
				end
			end
		end
		for _, v1425 in p1422:GetDescendants() do
			if (v1425:IsA("BasePart") or v1425:IsA("UnionOperation")) and v1425:HasTag("OilVisual") then
				v1425:RemoveTag("OilVisual")
				local v1426 = v_u_19[v1425]
				if v1426 then
					v1425.Material = v1426
					v_u_19[v1425] = nil
				end
			end
		end
	end
}
v_u_926.Boil = {
	["Id"] = "BOL",
	["Name"] = "Boil",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(150, 178, 225),
	["_AddFX"] = function(p1427, p1428, p1429)
		p1427:_RemoveFX(p1428, p1429)
		if p1429 then
			for _, v1430 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
				local v1431 = v1430:Clone()
				v1431.Parent = p1429
				v1431.Enabled = true
				v1431:AddTag("Cleanup_Boil")
				v1431:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1432)
		if p1432 then
			for _, v1433 in p1432:GetChildren() do
				if v1433:HasTag("Cleanup_Boil") then
					v1433:Destroy()
				end
			end
		end
	end
}
v_u_926.OilBoil = {
	["Id"] = "OB",
	["Name"] = "OilBoil",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(99, 118, 149),
	["_AddFX"] = function(p1434, p1435, p1436)
		p1434:_RemoveFX(p1435, p1436)
		if p1436 then
			for _, v1437 in game.ServerStorage.Mutation_FX.Oil:GetChildren() do
				local v1438 = v1437:Clone()
				v1438.Parent = p1436
				v1438.Enabled = true
				v1438:AddTag("Cleanup_OilBoil")
				v1438:AddTag("Effect")
			end
		end
		if p1436 then
			for _, v1439 in game.ServerStorage.Mutation_FX.Boil:GetChildren() do
				local v1440 = v1439:Clone()
				v1440.Parent = p1436
				v1440.Enabled = true
				v1440:AddTag("Cleanup_OilBoil")
				v1440:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1441)
		if p1441 then
			for _, v1442 in p1441:GetChildren() do
				if v1442:HasTag("Cleanup_OilBoil") then
					v1442:Destroy()
				end
			end
		end
	end
}
v_u_926.Fortune = {
	["Id"] = "FR",
	["Name"] = "Fortune",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 192, 5),
	["_AddFX"] = function(p1443, p1444, p1445)
		p1443:_RemoveFX(p1444, p1445)
		if p1445 then
			for _, v1446 in game.ServerStorage.Mutation_FX.Fortune:GetChildren() do
				local v1447 = v1446:Clone()
				v1447.Parent = p1445
				v1447.Enabled = true
				v1447:AddTag("Cleanup_Fortune")
				v1447:AddTag("Effect")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1448)
		if p1448 then
			for _, v1449 in p1448:GetChildren() do
				if v1449:HasTag("Cleanup_Fortune") then
					v1449:Destroy()
				end
			end
		end
	end
}
v_u_926.Bloom = {
	["Id"] = "BL",
	["Name"] = "Bloom",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(170, 255, 0),
	["_AddFX"] = function(p1450, p1451, p1452)
		p1450:_RemoveFX(p1451, p1452)
		local v1453 = game.ServerStorage.Mutation_FX.Bloom:GetChildren()
		if p1452 then
			for _, v1454 in v1453 do
				if not p1452:FindFirstChild(v1454.Name) then
					local v1455 = v1454:Clone()
					v1455.Parent = p1452
					v1455.Enabled = true
					v1455:AddTag("Cleanup_Bloom")
					v1455:AddTag("Effect")
				end
			end
		end
		local v1456 = {}
		for _, v1457 in p1451:GetDescendants() do
			if v1457:IsA("BasePart") and v1457 ~= p1452 then
				table.insert(v1456, v1457)
			end
		end
		(function(p1458)
			for v1459 = #p1458, 2, -1 do
				local v1460 = math.random(1, v1459)
				local v1461 = p1458[v1460]
				local v1462 = p1458[v1459]
				p1458[v1459] = v1461
				p1458[v1460] = v1462
			end
			return p1458
		end)(v1456)
		local v1463 = #v1456 * 0.25 + 0.5
		for v1464 = 1, math.floor(v1463) do
			local v1465 = v1456[v1464]
			local v1466 = v1453[math.random(1, #v1453)]:Clone()
			v1466.Parent = v1465
			v1466.Enabled = true
			v1466:AddTag("Cleanup_Bloom")
			v1466:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1467, p1468)
		local function v1471(p1469)
			for _, v1470 in p1469:GetDescendants() do
				if v1470:HasTag("Cleanup_Bloom") then
					v1470:Destroy()
				end
			end
		end
		if p1468 then
			v1471(p1468)
		end
		if p1467 then
			v1471(p1467)
		end
	end
}
v_u_926.Rot = {
	["Id"] = "RO",
	["Name"] = "Rot",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 0, 127),
	["_AddFX"] = function(p1472, p1473, p1474)
		p1472:_RemoveFX(p1473, p1474)
		local v1475 = game.ServerStorage.Mutation_FX.Rot:GetChildren()
		if p1474 then
			for _, v1476 in v1475 do
				if not p1474:FindFirstChild(v1476.Name) then
					local v1477 = v1476:Clone()
					v1477.Parent = p1474
					v1477.Enabled = true
					v1477:AddTag("Cleanup_Rot")
					v1477:AddTag("Effect")
				end
			end
		end
		local v1478 = {}
		for _, v1479 in p1473:GetDescendants() do
			if v1479:IsA("BasePart") and v1479 ~= p1474 then
				table.insert(v1478, v1479)
			end
		end
		(function(p1480)
			for v1481 = #p1480, 2, -1 do
				local v1482 = math.random(1, v1481)
				local v1483 = p1480[v1482]
				local v1484 = p1480[v1481]
				p1480[v1481] = v1483
				p1480[v1482] = v1484
			end
			return p1480
		end)(v1478)
		local v1485 = #v1478 * 0.25 + 0.5
		for v1486 = 1, math.floor(v1485) do
			local v1487 = v1478[v1486]
			local v1488 = v1475[math.random(1, #v1475)]:Clone()
			v1488.Parent = v1487
			v1488.Enabled = true
			v1488:AddTag("Cleanup_Rot")
			v1488:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1489, p1490)
		local function v1493(p1491)
			for _, v1492 in p1491:GetDescendants() do
				if v1492:HasTag("Cleanup_Rot") then
					v1492:Destroy()
				end
			end
		end
		if p1490 then
			v1493(p1490)
		end
		if p1489 then
			v1493(p1489)
		end
	end
}
v_u_926.Gloom = {
	["Id"] = "GL",
	["Name"] = "Gloom",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(85, 85, 127),
	["_AddFX"] = function(p1494, p1495, p1496)
		p1494:_RemoveFX(p1495, p1496)
		local v1497 = game.ServerStorage.Mutation_FX.Gloom:GetChildren()
		if p1496 then
			for _, v1498 in v1497 do
				if not p1496:FindFirstChild(v1498.Name) then
					local v1499 = v1498:Clone()
					v1499.Parent = p1496
					v1499.Enabled = true
					v1499:AddTag("Cleanup_Gloom")
					v1499:AddTag("Effect")
				end
			end
		end
		local v1500 = {}
		for _, v1501 in p1495:GetDescendants() do
			if v1501:IsA("BasePart") and v1501 ~= p1496 then
				table.insert(v1500, v1501)
			end
		end
		(function(p1502)
			for v1503 = #p1502, 2, -1 do
				local v1504 = math.random(1, v1503)
				local v1505 = p1502[v1504]
				local v1506 = p1502[v1503]
				p1502[v1503] = v1505
				p1502[v1504] = v1506
			end
			return p1502
		end)(v1500)
		local v1507 = #v1500 * 0.25 + 0.5
		for v1508 = 1, math.floor(v1507) do
			local v1509 = v1500[v1508]
			local v1510 = v1497[math.random(1, #v1497)]:Clone()
			v1510.Parent = v1509
			v1510.Enabled = true
			v1510:AddTag("Cleanup_Gloom")
			v1510:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1511, p1512)
		local function v1515(p1513)
			for _, v1514 in p1513:GetDescendants() do
				if v1514:HasTag("Cleanup_Gloom") then
					v1514:Destroy()
				end
			end
		end
		if p1512 then
			v1515(p1512)
		end
		if p1511 then
			v1515(p1511)
		end
	end
}
v_u_926.Blight = {
	["Id"] = "BT",
	["Name"] = "Blight",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(170, 0, 255),
	["_AddFX"] = function(p1516, p1517, p1518)
		p1516:_RemoveFX(p1517, p1518)
		local v1519 = game.ServerStorage.Mutation_FX.Blight:GetChildren()
		if p1518 then
			for _, v1520 in v1519 do
				if not p1518:FindFirstChild(v1520.Name) then
					local v1521 = v1520:Clone()
					v1521.Parent = p1518
					v1521.Enabled = true
					v1521:AddTag("Cleanup_Blight")
					v1521:AddTag("Effect")
				end
			end
		end
		local v1522 = {}
		for _, v1523 in p1517:GetDescendants() do
			if v1523:IsA("BasePart") and v1523 ~= p1518 then
				table.insert(v1522, v1523)
			end
		end
		(function(p1524)
			for v1525 = #p1524, 2, -1 do
				local v1526 = math.random(1, v1525)
				local v1527 = p1524[v1526]
				local v1528 = p1524[v1525]
				p1524[v1525] = v1527
				p1524[v1526] = v1528
			end
			return p1524
		end)(v1522)
		local v1529 = #v1522 * 0.25 + 0.5
		for v1530 = 1, math.floor(v1529) do
			local v1531 = v1522[v1530]
			local v1532 = v1519[math.random(1, #v1519)]:Clone()
			v1532.Parent = v1531
			v1532.Enabled = true
			v1532:AddTag("Cleanup_Blight")
			v1532:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1533, p1534)
		local function v1537(p1535)
			for _, v1536 in p1535:GetDescendants() do
				if v1536:HasTag("Cleanup_Blight") then
					v1536:Destroy()
				end
			end
		end
		if p1534 then
			v1537(p1534)
		end
		if p1533 then
			v1537(p1533)
		end
	end
}
v_u_926.Pestilent = {
	["Id"] = "PE",
	["Name"] = "Pestilent",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 85, 0),
	["_AddFX"] = function(p1538, p1539, p1540)
		p1538:_RemoveFX(p1539, p1540)
		local v1541 = game.ServerStorage.Mutation_FX.Pestilent:GetChildren()
		if p1540 then
			for _, v1542 in v1541 do
				if not p1540:FindFirstChild(v1542.Name) then
					local v1543 = v1542:Clone()
					v1543.Parent = p1540
					v1543.Enabled = true
					v1543:AddTag("Cleanup_Pestilent")
					v1543:AddTag("Effect")
				end
			end
		end
		local v1544 = {}
		for _, v1545 in p1539:GetDescendants() do
			if v1545:IsA("BasePart") and v1545 ~= p1540 then
				table.insert(v1544, v1545)
			end
		end
		(function(p1546)
			for v1547 = #p1546, 2, -1 do
				local v1548 = math.random(1, v1547)
				local v1549 = p1546[v1548]
				local v1550 = p1546[v1547]
				p1546[v1547] = v1549
				p1546[v1548] = v1550
			end
			return p1546
		end)(v1544)
		local v1551 = #v1544 * 0.25 + 0.5
		for v1552 = 1, math.floor(v1551) do
			local v1553 = v1544[v1552]
			local v1554 = v1541[math.random(1, #v1541)]:Clone()
			v1554.Parent = v1553
			v1554.Enabled = true
			v1554:AddTag("Cleanup_Pestilent")
			v1554:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1555, p1556)
		local function v1559(p1557)
			for _, v1558 in p1557:GetDescendants() do
				if v1558:HasTag("Cleanup_Pestilent") then
					v1558:Destroy()
				end
			end
		end
		if p1556 then
			v1559(p1556)
		end
		if p1555 then
			v1559(p1555)
		end
	end
}
v_u_926.Umbral = {
	["Id"] = "UM",
	["Name"] = "Umbral",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(30, 20, 55),
	["_AddFX"] = function(p1560, p1561, p1562)
		p1560:_RemoveFX(p1561, p1562)
		local v1563 = game.ServerStorage.Mutation_FX.Umbral:GetChildren()
		if p1562 then
			for _, v1564 in v1563 do
				if not p1562:FindFirstChild(v1564.Name) then
					local v1565 = v1564:Clone()
					v1565.Parent = p1562
					v1565.Enabled = true
					v1565:AddTag("Cleanup_Umbral")
					v1565:AddTag("Effect")
				end
			end
		end
		local v1566 = {}
		for _, v1567 in p1561:GetDescendants() do
			if v1567:IsA("BasePart") and v1567 ~= p1562 then
				table.insert(v1566, v1567)
			end
		end
		(function(p1568)
			for v1569 = #p1568, 2, -1 do
				local v1570 = math.random(1, v1569)
				local v1571 = p1568[v1570]
				local v1572 = p1568[v1569]
				p1568[v1569] = v1571
				p1568[v1570] = v1572
			end
			return p1568
		end)(v1566)
		local v1573 = #v1566 * 0.25 + 0.5
		for v1574 = 1, math.floor(v1573) do
			local v1575 = v1566[v1574]
			local v1576 = v1563[math.random(1, #v1563)]:Clone()
			v1576.Parent = v1575
			v1576.Enabled = true
			v1576:AddTag("Cleanup_Umbral")
			v1576:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1577, p1578)
		local function v1581(p1579)
			for _, v1580 in p1579:GetDescendants() do
				if v1580:HasTag("Cleanup_Umbral") then
					v1580:Destroy()
				end
			end
		end
		if p1578 then
			v1581(p1578)
		end
		if p1577 then
			v1581(p1577)
		end
	end
}
v_u_926.Shadowbound = {
	["Id"] = "SH",
	["Name"] = "Shadowbound",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(25, 25, 45),
	["_AddFX"] = function(p1582, p1583, p1584)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1582:_RemoveFX(p1583, p1584)
		local v1585 = game.ServerStorage.Mutation_FX.Shadowbound:GetChildren()
		if #v1585 ~= 0 then
			if p1584 then
				for _, v1586 in v1585 do
					local v1587 = v1586:Clone()
					v1587.Parent = p1584
					v1587.Enabled = true
					v1587:AddTag("Cleanup_Shadowbound")
					v1587:AddTag("Effect")
				end
			end
			for _, v1588 in p1583:GetDescendants() do
				if v1588:IsA("BasePart") then
					v_u_16[v1588] = v_u_16[v1588] or v1588.Color
					v_u_19[v1588] = v_u_19[v1588] or v1588.Material
					v1588.Color = Color3.fromRGB(25, 25, 45)
					v1588.Material = Enum.Material.ForceField
					v1588.Transparency = 0.5
					v1588:AddTag("ShadowboundVisual")
				end
			end
			local v1589 = {}
			for _, v1590 in p1583:GetDescendants() do
				if v1590:IsA("BasePart") and (v1590 ~= p1584 and not v1590:HasTag("Effect")) then
					table.insert(v1589, v1590)
				end
			end
			for v1591, v1592 in ipairs(v1589) do
				if v1591 % 2 == 0 then
					local v1593 = v1585[math.random(1, #v1585)]:Clone()
					v1593.Parent = v1592
					v1593.Enabled = true
					v1593:AddTag("Cleanup_Shadowbound")
					v1593:AddTag("Effect")
					if math.random() < 0.25 then
						local v1594 = v1585[math.random(1, #v1585)]:Clone()
						v1594.Parent = v1592
						v1594.Enabled = true
						v1594:AddTag("Cleanup_Shadowbound")
						v1594:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1595, p1596)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1599(p1597)
			for _, v1598 in p1597:GetDescendants() do
				if v1598:HasTag("Cleanup_Shadowbound") then
					v1598:Destroy()
				end
			end
		end
		if p1596 then
			v1599(p1596)
		end
		if p1595 then
			v1599(p1595)
		end
		for _, v1600 in p1595:GetDescendants() do
			if v1600:IsA("BasePart") and v1600:HasTag("ShadowboundVisual") then
				v1600:RemoveTag("ShadowboundVisual")
				v1600.Color = v_u_16[v1600] or v1600.Color
				v_u_16[v1600] = nil
				local v1601 = v_u_19[v1600]
				if v1601 then
					v1600.Material = v1601
					v_u_19[v1600] = nil
				end
				v1600.Transparency = 0
			end
		end
	end
}
v_u_926.Necrotic = {
	["Id"] = "NC",
	["Name"] = "Necrotic",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(85, 85, 255),
	["_AddFX"] = function(p1602, p1603, p1604)
		p1602:_RemoveFX(p1603, p1604)
		local v1605 = game.ServerStorage.Mutation_FX.Necrotic:GetChildren()
		if p1604 then
			for _, v1606 in v1605 do
				if not p1604:FindFirstChild(v1606.Name) then
					local v1607 = v1606:Clone()
					v1607.Parent = p1604
					v1607.Enabled = true
					v1607:AddTag("Cleanup_Necrotic")
					v1607:AddTag("Effect")
				end
			end
		end
		local v1608 = {}
		for _, v1609 in p1603:GetDescendants() do
			if v1609:IsA("BasePart") and v1609 ~= p1604 then
				table.insert(v1608, v1609)
			end
		end
		(function(p1610)
			for v1611 = #p1610, 2, -1 do
				local v1612 = math.random(1, v1611)
				local v1613 = p1610[v1612]
				local v1614 = p1610[v1611]
				p1610[v1611] = v1613
				p1610[v1612] = v1614
			end
			return p1610
		end)(v1608)
		local v1615 = #v1608 * 0.25 + 0.5
		for v1616 = 1, math.floor(v1615) do
			local v1617 = v1608[v1616]
			local v1618 = v1605[math.random(1, #v1605)]:Clone()
			v1618.Parent = v1617
			v1618.Enabled = true
			v1618:AddTag("Cleanup_Necrotic")
			v1618:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1619, p1620)
		local function v1623(p1621)
			for _, v1622 in p1621:GetDescendants() do
				if v1622:HasTag("Cleanup_Necrotic") then
					v1622:Destroy()
				end
			end
		end
		if p1620 then
			v1623(p1620)
		end
		if p1619 then
			v1623(p1619)
		end
	end
}
v_u_926.Cyclonic = {
	["Id"] = "CY",
	["Name"] = "Cyclonic",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(130, 230, 255),
	["_AddFX"] = function(p1624, p1625, p1626)
		p1624:_RemoveFX(p1625, p1626)
		local v1627 = game.ServerStorage.Mutation_FX.Cyclonic:GetChildren()
		if p1626 then
			for _, v1628 in v1627 do
				if not p1626:FindFirstChild(v1628.Name) then
					local v1629 = v1628:Clone()
					v1629.Parent = p1626
					v1629.Enabled = true
					v1629:AddTag("Cleanup_Cyclonic")
				end
			end
		end
		local v1630 = 0
		for _, v1631 in p1625:GetDescendants() do
			if v1631:IsA("BasePart") and v1631 ~= p1626 then
				v1630 = v1630 + 1
				if v1630 % 2 == 0 then
					local v1632 = v1627[math.random(1, #v1627)]:Clone()
					v1632.Parent = v1631
					v1632.Enabled = true
					v1632:AddTag("Cleanup_Cyclonic")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1633, p1634)
		local function v1637(p1635)
			for _, v1636 in p1635:GetDescendants() do
				if v1636:HasTag("Cleanup_Cyclonic") then
					v1636:Destroy()
				end
			end
		end
		if p1634 then
			v1637(p1634)
		end
		if p1633 then
			v1637(p1633)
		end
	end
}
v_u_926.Maelstrom = {
	["Id"] = "MS",
	["Name"] = "Maelstrom",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(0, 60, 255),
	["_AddFX"] = function(p1638, p1639, p1640)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1638:_RemoveFX(p1639, p1640)
		local v1641 = game.ServerStorage.Mutation_FX.Maelstrom:GetChildren()
		local v1642 = {
			["Stars1"] = true
		}
		if p1640 then
			for _, v1643 in v1641 do
				if not p1640:FindFirstChild(v1643.Name) then
					local v1644 = v1643:Clone()
					v1644.Parent = p1640
					v1644.Enabled = true
					v1644:AddTag("Cleanup_Maelstrom")
				end
			end
		end
		local v1645 = {}
		for _, v1646 in p1639:GetDescendants() do
			if v1646:IsA("BasePart") and v1646 ~= p1640 then
				table.insert(v1645, v1646)
				for _, v1647 in v1641 do
					if v1642[v1647.Name] then
						local v1648 = v1647:Clone()
						v1648.Parent = v1646
						v1648.Enabled = true
						v1648:AddTag("Cleanup_Maelstrom")
					end
				end
			end
		end
		for _, v1649 in v1645 do
			if Random.new():NextNumber() < 0.5 then
				v_u_16[v1649] = v_u_16[v1649] or v1649.Color
				v_u_19[v1649] = v_u_19[v1649] or v1649.Material
				v1649.Color = Color3.fromRGB(0, 186, 186)
				v1649.Material = Enum.Material.Neon
				v1649:AddTag("MaelstromVisual")
			end
		end
		local v1650 = {}
		for _, v1651 in v1641 do
			if not v1642[v1651.Name] then
				table.insert(v1650, v1651)
			end
		end
		for v1652, v1653 in v1645 do
			if v1652 % 2 == 0 and #v1650 > 0 then
				local v1654 = v1650[math.random(1, #v1650)]:Clone()
				v1654.Parent = v1653
				v1654.Enabled = true
				v1654:AddTag("Cleanup_Maelstrom")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1655, p1656)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1659(p1657)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v1658 in p1657:GetDescendants() do
				if v1658:HasTag("Cleanup_Maelstrom") then
					v1658:Destroy()
				end
				if v1658:HasTag("MaelstromVisual") then
					v1658.Color = v_u_16[v1658] or v1658.Color
					v_u_16[v1658] = nil
					if v_u_19[v1658] then
						v1658.Material = v_u_19[v1658]
						v_u_19[v1658] = nil
					end
					v1658:RemoveTag("MaelstromVisual")
				end
			end
		end
		if p1656 then
			v1659(p1656)
		end
		if p1655 then
			v1659(p1655)
		end
	end
}
v_u_926.Stormcharged = {
	["Id"] = "SC",
	["Name"] = "Stormcharged",
	["ValueMulti"] = 180,
	["Color"] = Color3.fromRGB(148, 226, 255),
	["_AddFX"] = function(p1660, p1661, p1662)
		p1660:_RemoveFX(p1661, p1662)
		local v1663 = {}
		for _, v1664 in { game.ServerStorage.Mutation_FX.Shocked:GetChildren(), game.ServerStorage.Mutation_FX.Static:GetChildren(), game.ServerStorage.Mutation_FX.Tempestuous:GetChildren() } do
			for _, v1665 in v1664 do
				table.insert(v1663, v1665)
			end
		end
		if p1662 then
			for _, v1666 in v1663 do
				if not p1662:FindFirstChild(v1666.Name) then
					local v1667 = v1666:Clone()
					v1667.Color = ColorSequence.new(Color3.fromRGB(148, 226, 255))
					v1667.Parent = p1662
					v1667.Enabled = true
					v1667:AddTag("Cleanup_Stormcharged")
				end
			end
		end
		local v1668 = {}
		for _, v1669 in p1661:GetDescendants() do
			if v1669:IsA("BasePart") and v1669 ~= p1662 then
				table.insert(v1668, v1669)
			end
		end
		local v1670 = Random.new()
		local v1671 = Color3.fromRGB(255, 255, 100)
		local v1672 = Color3.fromRGB(0, 60, 255)
		for _, v1673 in v1668 do
			if #v1663 > 0 then
				local v1674 = v1663[v1670:NextInteger(1, #v1663)]:Clone()
				v1674.Color = ColorSequence.new(Color3.fromRGB(148, 226, 255))
				v1674.Parent = v1673
				v1674.Enabled = true
				v1674:AddTag("Cleanup_Stormcharged")
			end
			v1673.Color = v1670:NextNumber() < 0.5 and v1671 and v1671 or v1672
			v1673.Material = Enum.Material.Neon
			v1673:AddTag("StormchargedVisual")
		end
	end,
	["_RemoveFX"] = function(_, p1675, p1676)
		local function v1679(p1677)
			for _, v1678 in p1677:GetDescendants() do
				if v1678:HasTag("Cleanup_Stormcharged") then
					v1678:Destroy()
				end
				if v1678:HasTag("StormchargedVisual") then
					v1678:RemoveTag("StormchargedVisual")
					v1678.Material = Enum.Material.Plastic
				end
			end
		end
		if p1676 then
			v1679(p1676)
		end
		if p1675 then
			v1679(p1675)
		end
	end
}
v_u_926.Cosmic = {
	["Id"] = "CS",
	["Name"] = "Cosmic",
	["ValueMulti"] = 240,
	["Color"] = Color3.fromRGB(171, 171, 255),
	["_AddFX"] = function(p1680, p1681, p1682)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1680:_RemoveFX(p1681, p1682)
		local v1683 = game.ServerStorage.Mutation_FX.Cosmic:GetChildren()
		local v1684 = #v1683
		if p1682 then
			for _, v1685 in v1683 do
				if not p1682:FindFirstChild(v1685.Name) then
					local v1686 = v1685:Clone()
					v1686.Parent = p1682
					v1686.Enabled = true
					v1686:AddTag("Cleanup_Cosmic")
				end
			end
		end
		local v1687 = 0
		for _, v1688 in p1681:GetDescendants() do
			if v1688:IsA("BasePart") and v1688 ~= p1682 then
				v1687 = v1687 + 1
				if v1684 > 0 then
					local v1689 = v1683[math.random(1, v1684)]:Clone()
					v1689.Parent = v1688
					v1689.Enabled = true
					v1689:AddTag("Cleanup_Cosmic")
				end
				if not v1688:HasTag("Effect") then
					v_u_16[v1688] = v_u_16[v1688] or v1688.Color
					v_u_19[v1688] = v_u_19[v1688] or v1688.Material
					if math.random() < 0.5 then
						v1688.Color = Color3.fromRGB(255, 255, 100)
					else
						v1688.Color = Color3.fromRGB(171, 171, 255)
					end
					v1688.Material = Enum.Material.Neon
					v1688:AddTag("CosmicVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1690, p1691)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1694(p1692)
			for _, v1693 in p1692:GetDescendants() do
				if v1693:HasTag("Cleanup_Cosmic") then
					v1693:Destroy()
				end
			end
		end
		if p1691 then
			v1694(p1691)
		end
		if p1690 then
			v1694(p1690)
		end
		for _, v1695 in p1690:GetDescendants() do
			if (v1695:IsA("BasePart") or v1695:IsA("UnionOperation")) and v1695:HasTag("CosmicVisual") then
				v1695.Color = v_u_16[v1695] or v1695.Color
				v_u_16[v1695] = nil
				v1695.Material = v_u_19[v1695] or v1695.Material
				v_u_19[v1695] = nil
				v1695:RemoveTag("CosmicVisual")
			end
		end
	end
}
v_u_926.Webbed = {
	["Id"] = "WB",
	["Name"] = "Webbed",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1696, p1697, p1698)
		p1696:_RemoveFX(p1697, p1698)
		local v1699 = game.ServerStorage.Mutation_FX.Webbed:GetChildren()
		if p1698 then
			for _, v1700 in v1699 do
				if not p1698:FindFirstChild(v1700.Name) then
					local v1701 = v1700:Clone()
					v1701.Parent = p1698
					v1701.Enabled = true
					v1701:AddTag("Cleanup_Webbed")
					v1701:AddTag("Effect")
				end
			end
		end
		local v1702 = {}
		for _, v1703 in p1697:GetDescendants() do
			if v1703:IsA("BasePart") and v1703 ~= p1698 then
				table.insert(v1702, v1703)
			end
		end
		(function(p1704)
			for v1705 = #p1704, 2, -1 do
				local v1706 = math.random(1, v1705)
				local v1707 = p1704[v1706]
				local v1708 = p1704[v1705]
				p1704[v1705] = v1707
				p1704[v1706] = v1708
			end
			return p1704
		end)(v1702)
		local v1709 = #v1702 * 0.25 + 0.5
		for v1710 = 1, math.floor(v1709) do
			local v1711 = v1702[v1710]
			local v1712 = v1699[math.random(1, #v1699)]:Clone()
			v1712.Parent = v1711
			v1712.Enabled = true
			v1712:AddTag("Cleanup_Webbed")
			v1712:AddTag("Effect")
		end
	end,
	["_RemoveFX"] = function(_, p1713, p1714)
		local function v1717(p1715)
			for _, v1716 in p1715:GetDescendants() do
				if v1716:HasTag("Cleanup_Webbed") then
					v1716:Destroy()
				end
			end
		end
		if p1714 then
			v1717(p1714)
		end
		if p1713 then
			v1717(p1713)
		end
	end
}
v_u_926.Astral = {
	["Id"] = "AS",
	["Name"] = "Astral",
	["ValueMulti"] = 365,
	["Color"] = Color3.fromRGB(255, 255, 100),
	["_AddFX"] = function(p1718, p1719, p1720)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1718:_RemoveFX(p1719, p1720)
		local v1721 = game.ServerStorage.Mutation_FX.Astral:GetChildren()
		local v1722 = #v1721
		if p1720 then
			for _, v1723 in v1721 do
				if not p1720:FindFirstChild(v1723.Name) then
					local v1724 = v1723:Clone()
					v1724.Parent = p1720
					v1724.Enabled = true
					v1724:AddTag("Cleanup_Astral")
				end
			end
		end
		local v1725 = 0
		for _, v1726 in p1719:GetDescendants() do
			if v1726:IsA("BasePart") and v1726 ~= p1720 then
				v1725 = v1725 + 1
				if v1722 > 0 then
					local v1727 = v1721[math.random(1, v1722)]:Clone()
					v1727.Parent = v1726
					v1727.Enabled = true
					v1727:AddTag("Cleanup_Astral")
				end
				if not v1726:HasTag("Effect") then
					v_u_16[v1726] = v_u_16[v1726] or v1726.Color
					v_u_19[v1726] = v_u_19[v1726] or v1726.Material
					if math.random() < 0.5 then
						v1726.Color = Color3.fromRGB(255, 255, 100)
					else
						v1726.Color = Color3.fromRGB(255, 170, 255)
					end
					v1726.Material = Enum.Material.Neon
					v1726:AddTag("AstralVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1728, p1729)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1732(p1730)
			for _, v1731 in p1730:GetDescendants() do
				if v1731:HasTag("Cleanup_Astral") then
					v1731:Destroy()
				end
			end
		end
		if p1729 then
			v1732(p1729)
		end
		if p1728 then
			v1732(p1728)
		end
		for _, v1733 in p1728:GetDescendants() do
			if (v1733:IsA("BasePart") or v1733:IsA("UnionOperation")) and v1733:HasTag("AstralVisual") then
				v1733.Color = v_u_16[v1733] or v1733.Color
				v_u_16[v1733] = nil
				v1733.Material = v_u_19[v1733] or v1733.Material
				v_u_19[v1733] = nil
				v1733:RemoveTag("AstralVisual")
			end
		end
	end
}
v_u_926.Abyssal = {
	["Id"] = "AB",
	["Name"] = "Abyssal",
	["ValueMulti"] = 240,
	["Color"] = Color3.fromRGB(85, 0, 127),
	["_AddFX"] = function(p1734, p1735, p1736)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1734:_RemoveFX(p1735, p1736)
		local v1737 = game.ServerStorage.Mutation_FX.Abyssal:GetChildren()
		local _ = #v1737
		local v1738 = {}
		for _, v1739 in v1737 do
			if v1739.Name ~= "Blackhole" then
				table.insert(v1738, v1739)
			end
		end
		if p1736 then
			for _, v1740 in v1737 do
				if not p1736:FindFirstChild(v1740.Name) then
					local v1741 = v1740:Clone()
					v1741.Parent = p1736
					v1741.Enabled = true
					v1741:AddTag("Cleanup_Abyssal")
				end
			end
		end
		local v1742 = 0
		for _, v1743 in p1735:GetDescendants() do
			if v1743:IsA("BasePart") and v1743 ~= p1736 then
				v1742 = v1742 + 1
				if #v1738 > 0 then
					local v1744 = v1738[math.random(1, #v1738)]:Clone()
					v1744.Parent = v1743
					v1744.Enabled = true
					v1744:AddTag("Cleanup_Abyssal")
				end
				if not v1743:HasTag("Effect") then
					v_u_16[v1743] = v_u_16[v1743] or v1743.Color
					v_u_19[v1743] = v_u_19[v1743] or v1743.Material
					if math.random() < 0.5 then
						v1743.Color = Color3.fromRGB(170, 0, 255)
					else
						v1743.Color = Color3.fromRGB(85, 0, 127)
					end
					v1743.Material = Enum.Material.Neon
					v1743:AddTag("AbyssalVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1745, p1746)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1749(p1747)
			for _, v1748 in p1747:GetDescendants() do
				if v1748:HasTag("Cleanup_Abyssal") then
					v1748:Destroy()
				end
			end
		end
		if p1746 then
			v1749(p1746)
		end
		if p1745 then
			v1749(p1745)
		end
		for _, v1750 in p1745:GetDescendants() do
			if (v1750:IsA("BasePart") or v1750:IsA("UnionOperation")) and v1750:HasTag("AbyssalVisual") then
				v1750.Color = v_u_16[v1750] or v1750.Color
				v_u_16[v1750] = nil
				v1750.Material = v_u_19[v1750] or v1750.Material
				v_u_19[v1750] = nil
				v1750:RemoveTag("AbyssalVisual")
			end
		end
	end
}
v_u_926.Graceful = {
	["Id"] = "GR",
	["Name"] = "Graceful",
	["ValueMulti"] = 77,
	["Color"] = Color3.fromRGB(240, 240, 255),
	["_AddFX"] = function(p1751, p1752, p1753)
		p1751:_RemoveFX(p1752, p1753)
		local v1754 = game.ServerStorage.Mutation_FX.Graceful:GetChildren()
		local v1755 = 0
		for _, v1756 in p1752:GetDescendants() do
			if v1756:IsA("BasePart") then
				v1755 = v1755 + 1
				if v1755 % 2 == 0 then
					for _, v1757 in v1754 do
						local v1758 = v1757:Clone()
						v1758.Parent = v1756
						v1758.Enabled = true
						v1758:AddTag("Cleanup_Graceful")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1759, p1760)
		local function v1763(p1761)
			for _, v1762 in p1761:GetDescendants() do
				if v1762:HasTag("Cleanup_Graceful") then
					v1762:Destroy()
				end
			end
		end
		if p1760 then
			v1763(p1760)
		end
		if p1759 then
			v1763(p1759)
		end
	end
}
v_u_926.Jackpot = {
	["Id"] = "JA",
	["Name"] = "Jackpot",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(255, 215, 0),
	["_AddFX"] = function(p1764, p1765, p1766)
		p1764:_RemoveFX(p1765, p1766)
		if p1766 then
			for _, v1767 in game.ServerStorage.Mutation_FX.Jackpot:GetChildren() do
				local v1768 = v1767:Clone()
				v1768.Parent = p1766
				v1768:AddTag("Cleanup_Jackpot")
				if v1768:IsA("ParticleEmitter") then
					v1768.Enabled = true
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p1769)
		local function v1772(p1770)
			for _, v1771 in p1770:GetDescendants() do
				if v1771:HasTag("Cleanup_Jackpot") then
					v1771:Destroy()
				end
			end
		end
		if p1769 then
			v1772(p1769)
		end
	end
}
v_u_926.Plagued = {
	["Id"] = "PL",
	["Name"] = "Plagued",
	["ValueMulti"] = 102,
	["Color"] = Color3.fromRGB(85, 85, 0),
	["_AddFX"] = function(p1773, p1774, p1775)
		p1773:_RemoveFX(p1774, p1775)
		if p1775 then
			for _, v1776 in game.ServerStorage.Mutation_FX.Plagued:GetChildren() do
				local v1777 = v1776:Clone()
				v1777.Parent = p1775
				v1777.Enabled = true
				v1777:AddTag("Cleanup_Plagued")
				v1777:AddTag("Effect")
			end
		end
		for _, v1778 in p1774:GetDescendants() do
			if (v1778:IsA("BasePart") or v1778:IsA("UnionOperation")) and not v1778:HasTag("Effect") then
				v1778:AddTag("PlaguedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1779, p1780)
		-- upvalues: (copy) v_u_19
		if p1780 then
			for _, v1781 in p1780:GetChildren() do
				if v1781:HasTag("Cleanup_Plagued") then
					v1781:Destroy()
				end
			end
		end
		for _, v1782 in p1779:GetDescendants() do
			if (v1782:IsA("BasePart") or v1782:IsA("UnionOperation")) and v1782:HasTag("PlaguedVisual") then
				v1782:RemoveTag("PlaguedVisual")
				local v1783 = v_u_19[v1782]
				if v1783 then
					v1782.Material = v1783
					v_u_19[v1782] = nil
				end
			end
		end
	end
}
v_u_926.Biohazard = {
	["Id"] = "BH",
	["Name"] = "Biohazard",
	["ValueMulti"] = 157,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p1784, p1785, p1786)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1784:_RemoveFX(p1785, p1786)
		local v1787 = game.ServerStorage.Mutation_FX.Plagued:GetChildren()
		local v1788 = game.ServerStorage.Mutation_FX.Radioactive:GetChildren()
		if p1786 then
			for _, v1789 in v1787 do
				local v1790 = v1789:Clone()
				v1790.Parent = p1786
				v1790.Enabled = true
				v1790:AddTag("Cleanup_Biohazard")
				v1790:AddTag("Effect")
			end
			for _, v1791 in v1788 do
				local v1792 = v1791:Clone()
				v1792.Parent = p1786
				v1792.Enabled = true
				v1792:AddTag("Cleanup_Biohazard")
				v1792:AddTag("Effect")
			end
		end
		for _, v1793 in p1785:GetDescendants() do
			if (v1793:IsA("BasePart") or v1793:IsA("UnionOperation")) and not v1793:HasTag("Effect") then
				v_u_16[v1793] = v_u_16[v1793] or v1793.Color
				v1793.Color = Color3.fromRGB(65, 175, 0)
				v_u_19[v1793] = v_u_19[v1793] or v1793.Material
				v1793.Material = Enum.Material.Neon
				v1793:AddTag("RadioactiveVisual")
				v1793:AddTag("BiohazardVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1794, p1795)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1798(p1796)
			for _, v1797 in p1796:GetDescendants() do
				if v1797:HasTag("Cleanup_Biohazard") then
					v1797:Destroy()
				end
			end
		end
		if p1795 then
			v1798(p1795)
		end
		if p1794 then
			v1798(p1794)
		end
		for _, v1799 in p1794:GetDescendants() do
			if (v1799:IsA("BasePart") or v1799:IsA("UnionOperation")) and v1799:HasTag("BiohazardVisual") then
				v1799:RemoveTag("BiohazardVisual")
				v1799:RemoveTag("RadioactiveVisual")
				v1799.Color = v_u_16[v1799] or v1799.Color
				v_u_16[v1799] = nil
				local v1800 = v_u_19[v1799]
				if v1800 then
					v1799.Material = v1800
					v_u_19[v1799] = nil
				end
			end
		end
	end
}
v_u_926.Contagion = {
	["Id"] = "CO",
	["Name"] = "Contagion",
	["ValueMulti"] = 205,
	["Color"] = Color3.fromRGB(98, 255, 0),
	["_AddFX"] = function(p1801, p1802, p1803)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p1801:_RemoveFX(p1802, p1803)
		local v1804 = game.ServerStorage.Mutation_FX.Plagued:GetChildren()
		local v1805 = game.ServerStorage.Mutation_FX.Radioactive:GetChildren()
		if p1803 then
			for _, v1806 in v1804 do
				local v1807 = v1806:Clone()
				v1807.Parent = p1803
				v1807.Enabled = true
				v1807:AddTag("Cleanup_Contagion")
				v1807:AddTag("Effect")
			end
			for _, v1808 in v1805 do
				local v1809 = v1808:Clone()
				v1809.Parent = p1803
				v1809.Enabled = true
				v1809:AddTag("Cleanup_Contagion")
				v1809:AddTag("Effect")
			end
		end
		local v1810 = {}
		for _, v1811 in p1802:GetDescendants() do
			if (v1811:IsA("BasePart") or v1811:IsA("UnionOperation")) and v1811 ~= p1803 then
				table.insert(v1810, v1811)
			end
		end
		for v1812 = 1, #v1810 do
			local v1813 = v1810[v1812]
			if v1812 % 2 == 0 then
				local v1814 = math.random(1, 2) == 1 and v1804 and v1804 or v1805
				local v1815 = v1814[math.random(1, #v1814)]:Clone()
				v1815.Parent = v1813
				v1815.Enabled = true
				v1815:AddTag("Cleanup_Contagion")
				v1815:AddTag("Effect")
				if math.random() < 0.25 then
					local v1816 = v1814 == v1804 and v1805 and v1805 or v1804
					local v1817 = v1816[math.random(1, #v1816)]:Clone()
					v1817.Parent = v1813
					v1817.Enabled = true
					v1817:AddTag("Cleanup_Contagion")
					v1817:AddTag("Effect")
				end
			end
			if not v1813:HasTag("Effect") then
				v_u_16[v1813] = v_u_16[v1813] or v1813.Color
				v1813.Color = Color3.fromRGB(65, 175, 0)
				v_u_19[v1813] = v_u_19[v1813] or v1813.Material
				v1813.Material = Enum.Material.Neon
				v1813:AddTag("ContagionVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1818, p1819)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1822(p1820)
			for _, v1821 in p1820:GetDescendants() do
				if v1821:HasTag("Cleanup_Contagion") then
					v1821:Destroy()
				end
			end
		end
		if p1819 then
			v1822(p1819)
		end
		if p1818 then
			v1822(p1818)
		end
		for _, v1823 in p1818:GetDescendants() do
			if (v1823:IsA("BasePart") or v1823:IsA("UnionOperation")) and v1823:HasTag("ContagionVisual") then
				v1823:RemoveTag("ContagionVisual")
				v1823.Color = v_u_16[v1823] or v1823.Color
				v_u_16[v1823] = nil
				local v1824 = v_u_19[v1823]
				if v1824 then
					v1823.Material = v1824
					v_u_19[v1823] = nil
				end
			end
		end
	end
}
v_u_926.Blitzshock = {
	["Id"] = "BS",
	["Name"] = "Blitzshock",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(0, 192, 245),
	["_AddFX"] = function(p1825, p1826, p1827)
		-- upvalues: (copy) v_u_19, (copy) v_u_16
		p1825:_RemoveFX(p1826, p1827)
		if p1827 then
			for _, v1828 in game.ServerStorage.Mutation_FX.Blitzshock:GetChildren() do
				local v1829 = v1828:Clone()
				v1829.Parent = p1827
				v1829:AddTag("Cleanup_Blitzshock")
				if v1829:IsA("ParticleEmitter") then
					v1829.Enabled = true
				end
			end
		end
		for _, v1830 in p1826:GetDescendants() do
			if (v1830:IsA("BasePart") or v1830:IsA("UnionOperation")) and (not v1830:HasTag("Effect") and (not v1830.Transparency or v1830.Transparency ~= 1)) then
				v_u_19[v1830] = v_u_19[v1830] or v1830.Material
				v1830.Material = Enum.Material.Neon
				v_u_16[v1830] = v_u_16[v1830] or v1830.Color
				v1830.Color = v1830.Color:Lerp(Color3.fromRGB(0, 170, 255), 0.5)
				v1830:AddTag("BlitzshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1831, p1832)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1835(p1833)
			for _, v1834 in p1833:GetDescendants() do
				if v1834:HasTag("Cleanup_Blitzshock") then
					v1834:Destroy()
				end
			end
		end
		if p1832 then
			v1835(p1832)
		end
		if p1831 then
			v1835(p1831)
		end
		for _, v1836 in p1831:GetDescendants() do
			if (v1836:IsA("BasePart") or v1836:IsA("UnionOperation")) and v1836:HasTag("BlitzshockVisual") then
				v1836.Color = v_u_16[v1836] or v1836.Color
				v_u_16[v1836] = nil
				v1836:RemoveTag("BlitzshockVisual")
				if v_u_19[v1836] then
					v1836.Material = v_u_19[v1836]
					v_u_19[v1836] = nil
				end
			end
		end
	end
}
v_u_926.Junkshock = {
	["Id"] = "JS",
	["Name"] = "Junkshock",
	["ValueMulti"] = 45,
	["Color"] = Color3.fromRGB(147, 247, 0),
	["_AddFX"] = function(p1837, p1838, p1839)
		-- upvalues: (copy) v_u_19, (copy) v_u_16
		p1837:_RemoveFX(p1838, p1839)
		if p1839 then
			for _, v1840 in game.ServerStorage.Mutation_FX.Junkshock:GetChildren() do
				local v1841 = v1840:Clone()
				v1841.Parent = p1839
				v1841:AddTag("Cleanup_Junkshock")
				if v1841:IsA("ParticleEmitter") then
					v1841.Enabled = true
				end
			end
		end
		for _, v1842 in p1838:GetDescendants() do
			if (v1842:IsA("BasePart") or v1842:IsA("UnionOperation")) and (not v1842:HasTag("Effect") and (not v1842.Transparency or v1842.Transparency ~= 1)) then
				v_u_19[v1842] = v_u_19[v1842] or v1842.Material
				v1842.Material = Enum.Material.Neon
				v_u_16[v1842] = v_u_16[v1842] or v1842.Color
				v1842.Color = v1842.Color:Lerp(Color3.fromRGB(0, 255, 36), 0.5)
				v1842:AddTag("JunkshockVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1843, p1844)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1847(p1845)
			for _, v1846 in p1845:GetDescendants() do
				if v1846:HasTag("Cleanup_Junkshock") then
					v1846:Destroy()
				end
			end
		end
		if p1844 then
			v1847(p1844)
		end
		if p1843 then
			v1847(p1843)
		end
		for _, v1848 in p1843:GetDescendants() do
			if (v1848:IsA("BasePart") or v1848:IsA("UnionOperation")) and v1848:HasTag("JunkshockVisual") then
				v1848.Color = v_u_16[v1848] or v1848.Color
				v_u_16[v1848] = nil
				v1848:RemoveTag("JunkshockVisual")
				if v_u_19[v1848] then
					v1848.Material = v_u_19[v1848]
					v_u_19[v1848] = nil
				end
			end
		end
	end
}
v_u_926.Touchdown = {
	["Id"] = "TD",
	["Name"] = "Touchdown",
	["ValueMulti"] = 105,
	["Color"] = Color3.fromRGB(203, 95, 0),
	["_AddFX"] = function(p1849, p1850, p1851)
		p1849:_RemoveFX(p1850, p1851)
		if p1851 then
			for _, v1852 in game.ServerStorage.Mutation_FX.Touchdown:GetChildren() do
				local v1853 = v1852:Clone()
				v1853.Parent = p1851
				v1853.Enabled = true
				v1853:AddTag("Cleanup_Touchdown")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1854, p1855)
		local function v1858(p1856)
			for _, v1857 in p1856:GetDescendants() do
				if v1857:HasTag("Cleanup_Touchdown") then
					v1857:Destroy()
				end
			end
		end
		if p1855 then
			v1858(p1855)
		end
		if p1854 then
			v1858(p1854)
		end
	end
}
v_u_926.Subzero = {
	["Id"] = "SZ",
	["Name"] = "Subzero",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 255, 255),
	["_AddFX"] = function(p1859, p1860, p1861)
		-- upvalues: (copy) v_u_153, (copy) v_u_19, (copy) v_u_20, (copy) v_u_16
		p1859:_RemoveFX(p1860, p1861)
		v_u_153(p1859, p1860, p1861, 0.4)
		if p1861 then
			for _, v1862 in game.ServerStorage.Mutation_FX.Subzero:GetChildren() do
				local v1863 = v1862:Clone()
				v1863.Parent = p1861
				v1863:AddTag("Cleanup_Subzero")
				if v1863:IsA("ParticleEmitter") then
					v1863.Enabled = true
				end
			end
		end
		for _, v1864 in p1860:GetChildren() do
			if v1864:IsA("BasePart") or v1864:IsA("UnionOperation") then
				v1864.Reflectance = 0.35
			end
		end
		for _, v1865 in p1860:GetDescendants() do
			if (v1865:IsA("BasePart") or v1865:IsA("UnionOperation")) and (not v1865:HasTag("Effect") and (not v1865.Transparency or v1865.Transparency ~= 1)) then
				v_u_19[v1865] = v_u_19[v1865] or v1865.Material
				v1865.Material = Enum.Material.Plastic
				v_u_20[v1865] = v_u_20[v1865] or v1865.MaterialVariant
				v1865.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_16[v1865] = v_u_16[v1865] or v1865.Color
				v1865.Color = v1865.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
				v1865:AddTag("SubzeroVisual")
			end
		end
	end,
	["_RemoveFX"] = function(p1866, p1867, p1868)
		-- upvalues: (copy) v_u_162, (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		v_u_162(p1866, p1867, p1868)
		local function v1871(p1869)
			for _, v1870 in p1869:GetDescendants() do
				if v1870:HasTag("Cleanup_Subzero") then
					v1870:Destroy()
				end
			end
		end
		if p1868 then
			v1871(p1868)
		end
		if p1867 then
			v1871(p1867)
		end
		for _, v1872 in p1867:GetDescendants() do
			if v1872:IsA("BasePart") or v1872:IsA("UnionOperation") then
				v1872.Reflectance = 0
				if v1872:HasTag("SubzeroVisual") then
					v1872.Color = v_u_16[v1872] or v1872.Color
					v_u_16[v1872] = nil
					v1872:RemoveTag("SubzeroVisual")
					v1872.MaterialVariant = v_u_20[v1872] or v1872.MaterialVariant
					v_u_20[v1872] = nil
					if v_u_19[v1872] then
						v1872.Material = v_u_19[v1872]
						v_u_19[v1872] = nil
					end
				end
			end
		end
	end
}
v_u_926.Lightcycle = {
	["Id"] = "lc",
	["Name"] = "Lightcycle",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p1873, p1874, p1875)
		-- upvalues: (copy) v_u_16
		p1873:_RemoveFX(p1874, p1875)
		p1874:AddTag("Lightcycle_Mutation")
		for _, v1876 in p1874:GetDescendants() do
			if (v1876:IsA("BasePart") or v1876:IsA("UnionOperation")) and not v1876:HasTag("Effect") then
				local _ = v1876.Color
				v_u_16[v1876] = v_u_16[v1876] or v1876.Color
				v1876:AddTag("StoplightVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1877, _)
		-- upvalues: (copy) v_u_16
		p1877:RemoveTag("Lightcycle_Mutation")
		for _, v1878 in p1877:GetDescendants() do
			if (v1878:IsA("BasePart") or v1878:IsA("UnionOperation")) and v1878:HasTag("StoplightVisual") then
				local v1879 = v_u_16[v1878]
				if v1879 then
					v1878.Color = v1879
				end
				v1878:RemoveTag("StoplightVisual")
			end
		end
	end
}
v_u_926.Brainrot = {
	["Id"] = "lca",
	["Name"] = "Brainrot",
	["ValueMulti"] = 100,
	["Color"] = Color3.fromRGB(255, 108, 110),
	["_AddFX"] = function(p1880, p1881, p1882)
		p1880:_RemoveFX(p1881, p1882)
		if p1882 then
			for _, v1883 in game.ServerStorage.Mutation_FX.Brainrot:GetChildren() do
				local v1884 = v1883:Clone()
				v1884.Parent = p1882
				v1884.Enabled = true
				v1884:AddTag("Cleanup_Brainrot")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1885, p1886)
		local function v1889(p1887)
			for _, v1888 in p1887:GetDescendants() do
				if v1888:HasTag("Cleanup_Brainrot") then
					v1888:Destroy()
				end
			end
		end
		if p1886 then
			v1889(p1886)
		end
		if p1885 then
			v1889(p1885)
		end
	end
}
v_u_926.Warped = {
	["Id"] = "wpa",
	["Name"] = "Warped",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(192, 52, 255),
	["_AddFX"] = function(p1890, p1891, p1892)
		p1890:_RemoveFX(p1891, p1892)
		if p1892 then
			for _, v1893 in game.ServerStorage.Mutation_FX.Warped:GetChildren() do
				local v1894 = v1893:Clone()
				v1894.Parent = p1892
				v1894.Enabled = true
				v1894:AddTag("Cleanup_Warped")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1895, p1896)
		local function v1899(p1897)
			for _, v1898 in p1897:GetDescendants() do
				if v1898:HasTag("Cleanup_Warped") then
					v1898:Destroy()
				end
			end
		end
		if p1896 then
			v1899(p1896)
		end
		if p1895 then
			v1899(p1895)
		end
	end
}
v_u_926.Azure = {
	["Id"] = "azu",
	["Name"] = "Azure",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(0, 127, 255),
	["_AddFX"] = function(p1900, p1901, p1902)
		-- upvalues: (copy) v_u_19
		p1900:_RemoveFX(p1901, p1902)
		if p1902 then
			for _, v1903 in game.ServerStorage.Mutation_FX.Azure:GetChildren() do
				local v1904 = v1903:Clone()
				v1904.Parent = p1902
				v1904.Enabled = true
				v1904:AddTag("Cleanup_Azure")
			end
		end
		for _, v1905 in p1901:GetDescendants() do
			if (v1905:IsA("BasePart") or v1905:IsA("UnionOperation")) and not v1905:HasTag("Effect") then
				v_u_19[v1905] = v_u_19[v1905] or v1905.Material
				v1905.Material = Enum.Material.ForceField
				v1905.Reflectance = 0.5
			end
		end
	end,
	["_RemoveFX"] = function(_, p1906, p1907)
		-- upvalues: (copy) v_u_19
		local function v1910(p1908)
			for _, v1909 in p1908:GetDescendants() do
				if v1909:HasTag("Cleanup_Azure") then
					v1909:Destroy()
				end
			end
		end
		if p1907 then
			v1910(p1907)
		end
		if p1906 then
			v1910(p1906)
		end
		for _, v1911 in p1906:GetDescendants() do
			if (v1911:IsA("BasePart") or v1911:IsA("UnionOperation")) and v_u_19[v1911] then
				if not v1911:HasTag("Effect") then
					v1911.Material = v_u_19[v1911]
				end
				v_u_19[v1911] = nil
				v1911.Reflectance = 0
			end
		end
	end
}
v_u_926.Terran = {
	["Id"] = "ter",
	["Name"] = "Terran",
	["ValueMulti"] = 75,
	["Color"] = Color3.fromRGB(163, 175, 142),
	["_AddFX"] = function(p1912, p1913, p1914)
		-- upvalues: (copy) v_u_19
		p1912:_RemoveFX(p1913, p1914)
		if p1914 then
			for _, v1915 in game.ServerStorage.Mutation_FX.Terran:GetChildren() do
				local v1916 = v1915:Clone()
				v1916.Parent = p1914
				v1916.Enabled = true
				v1916:AddTag("Cleanup_Azure")
			end
		end
		for _, v1917 in p1913:GetDescendants() do
			if (v1917:IsA("BasePart") or v1917:IsA("UnionOperation")) and not v1917:HasTag("Effect") then
				v_u_19[v1917] = v_u_19[v1917] or v1917.Material
				v1917.Material = Enum.Material.ForceField
				v1917.Reflectance = 0.5
			end
		end
	end,
	["_RemoveFX"] = function(_, p1918, p1919)
		-- upvalues: (copy) v_u_19
		local function v1922(p1920)
			for _, v1921 in p1920:GetDescendants() do
				if v1921:HasTag("Cleanup_Terran") then
					v1921:Destroy()
				end
			end
		end
		if p1919 then
			v1922(p1919)
		end
		if p1918 then
			v1922(p1918)
		end
		for _, v1923 in p1918:GetDescendants() do
			if (v1923:IsA("BasePart") or v1923:IsA("UnionOperation")) and v_u_19[v1923] then
				if not v1923:HasTag("Effect") then
					v1923.Material = v_u_19[v1923]
				end
				v_u_19[v1923] = nil
				v1923.Reflectance = 0
			end
		end
	end
}
v_u_926.Aromatic = {
	["Id"] = "ar",
	["Name"] = "Aromatic",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(162, 145, 57),
	["_AddFX"] = function(p1924, p1925, p1926)
		-- upvalues: (copy) v_u_16
		p1924:_RemoveFX(p1925, p1926)
		if p1926 then
			for _, v1927 in game.ServerStorage.Mutation_FX.Aromatic:GetChildren() do
				local v1928 = v1927:Clone()
				v1928.Parent = p1926
				v1928:AddTag("Cleanup_Aromatic")
				if v1928:IsA("ParticleEmitter") then
					v1928.Enabled = true
				end
			end
		end
		for _, v1929 in p1925:GetDescendants() do
			if (v1929:IsA("BasePart") or v1929:IsA("UnionOperation")) and (not v1929:HasTag("Effect") and (not v1929.Transparency or v1929.Transparency ~= 1)) then
				v_u_16[v1929] = v_u_16[v1929] or v1929.Color
				v1929.Color = v1929.Color:Lerp(Color3.fromRGB(162, 145, 57), 0.3)
				v1929:AddTag("AromaticVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1930, p1931)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1934(p1932)
			for _, v1933 in p1932:GetDescendants() do
				if v1933:HasTag("Cleanup_Aromatic") then
					v1933:Destroy()
				end
			end
		end
		if p1931 then
			v1934(p1931)
		end
		if p1930 then
			v1934(p1930)
		end
		for _, v1935 in p1930:GetDescendants() do
			if (v1935:IsA("BasePart") or v1935:IsA("UnionOperation")) and v1935:HasTag("AromaticVisual") then
				v1935.Color = v_u_16[v1935] or v1935.Color
				v_u_16[v1935] = nil
				v1935:RemoveTag("AromaticVisual")
				if v_u_19[v1935] then
					v1935.Material = v_u_19[v1935]
					v_u_19[v1935] = nil
				end
			end
		end
	end
}
v_u_926.Gnomed = {
	["Id"] = "gn",
	["Name"] = "Gnomed",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(0, 173, 239),
	["_AddFX"] = function(p1936, p1937, p1938)
		p1936:_RemoveFX(p1937, p1938)
		if p1938 then
			for _, v1939 in game.ServerStorage.Mutation_FX.Gnomed:GetChildren() do
				local v1940 = v1939:Clone()
				v1940.Parent = p1938
				v1940.Enabled = true
				v1940:AddTag("Cleanup_Gnomed")
			end
		end
		for _, v1941 in p1937:GetChildren() do
			if v1941:IsA("BasePart") or v1941:IsA("UnionOperation") then
				v1941.Reflectance = 0.1
			end
		end
	end,
	["_RemoveFX"] = function(_, p1942, p1943)
		if p1943 then
			for _, v1944 in p1943:GetChildren() do
				if v1944:HasTag("Cleanup_Gnomed") then
					v1944:Destroy()
				end
			end
		end
		for _, v1945 in p1942:GetChildren() do
			if v1945:IsA("BasePart") or v1945:IsA("UnionOperation") then
				v1945.Reflectance = 0
			end
		end
	end
}
v_u_926.Fall = {
	["Id"] = "fa",
	["Name"] = "Fall",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(204, 128, 61),
	["_AddFX"] = function(p1946, p1947, p1948)
		-- upvalues: (copy) v_u_16
		p1946:_RemoveFX(p1947, p1948)
		if p1948 then
			for _, v1949 in game.ServerStorage.Mutation_FX.Fall:GetChildren() do
				local v1950 = v1949:Clone()
				v1950.Parent = p1948
				v1950:AddTag("Cleanup_Fall")
				if v1950:IsA("ParticleEmitter") then
					v1950.Enabled = true
				end
			end
		end
		for _, v1951 in p1947:GetDescendants() do
			if (v1951:IsA("BasePart") or v1951:IsA("UnionOperation")) and (not v1951:HasTag("Effect") and (not v1951.Transparency or v1951.Transparency ~= 1)) then
				v_u_16[v1951] = v_u_16[v1951] or v1951.Color
				v1951.Color = v1951.Color:Lerp(Color3.fromRGB(222, 160, 60), 0.5)
				v1951:AddTag("FallVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1952, p1953)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v1956(p1954)
			for _, v1955 in p1954:GetDescendants() do
				if v1955:HasTag("Cleanup_Fall") then
					v1955:Destroy()
				end
			end
		end
		if p1953 then
			v1956(p1953)
		end
		if p1952 then
			v1956(p1952)
		end
		for _, v1957 in p1952:GetDescendants() do
			if (v1957:IsA("BasePart") or v1957:IsA("UnionOperation")) and v1957:HasTag("FallVisual") then
				v1957.Color = v_u_16[v1957] or v1957.Color
				v_u_16[v1957] = nil
				v1957:RemoveTag("FallVisual")
				if v_u_19[v1957] then
					v1957.Material = v_u_19[v1957]
					v_u_19[v1957] = nil
				end
			end
		end
	end
}
v_u_926.Blackout = {
	["Id"] = "BO",
	["Name"] = "Blackout",
	["ValueMulti"] = 95,
	["Color"] = Color3.fromRGB(26, 26, 26),
	["_AddFX"] = function(p1958, p1959, p1960)
		-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_16
		p1958:_RemoveFX(p1959, p1960)
		if p1960 then
			for _, v1961 in game.ServerStorage.Mutation_FX.Blackout:GetChildren() do
				local v1962 = v1961:Clone()
				v1962.Parent = p1960
				v1962:AddTag("Cleanup_Blackout")
				if v1962:IsA("ParticleEmitter") then
					v1962.Enabled = true
				end
			end
		end
		for _, v1963 in p1959:GetDescendants() do
			if (v1963:IsA("BasePart") or v1963:IsA("UnionOperation")) and (not v1963:HasTag("Effect") and (not v1963.Transparency or v1963.Transparency ~= 1)) then
				v_u_19[v1963] = v_u_19[v1963] or v1963.Material
				v1963.Material = Enum.Material.Plastic
				v_u_20[v1963] = v_u_20[v1963] or v1963.MaterialVariant
				v1963.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_16[v1963] = v_u_16[v1963] or v1963.Color
				v1963.Color = v1963.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.9)
				v1963:AddTag("BlackoutVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p1964, p1965)
		-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		local function v1968(p1966)
			for _, v1967 in p1966:GetDescendants() do
				if v1967:HasTag("Cleanup_Blackout") then
					v1967:Destroy()
				end
			end
		end
		if p1965 then
			v1968(p1965)
		end
		if p1964 then
			v1968(p1964)
		end
		for _, v1969 in p1964:GetDescendants() do
			if (v1969:IsA("BasePart") or v1969:IsA("UnionOperation")) and v1969:HasTag("BlackoutVisual") then
				v1969.Color = v_u_16[v1969] or v1969.Color
				v_u_16[v1969] = nil
				v1969:RemoveTag("BlackoutVisual")
				v1969.MaterialVariant = v_u_20[v1969] or v1969.MaterialVariant
				v_u_20[v1969] = nil
				if v_u_19[v1969] then
					v1969.Material = v_u_19[v1969]
					v_u_19[v1969] = nil
				end
			end
		end
	end
}
v_u_926.Wilted = {
	["Id"] = "WI",
	["Name"] = "Wilted",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(145, 145, 216),
	["_AddFX"] = function(p1970, p1971, p1972)
		-- upvalues: (copy) v_u_16
		p1970:_RemoveFX(p1971, p1972)
		local v1973 = game.ServerStorage.Mutation_FX.Wilted:GetChildren()
		if #v1973 ~= 0 then
			if p1972 then
				for _, v1974 in v1973 do
					local v1975 = v1974:Clone()
					if v1975:IsA("ParticleEmitter") then
						v1975.Color = ColorSequence.new(p1970.Color)
					end
					v1975.Parent = p1972
					v1975.Enabled = true
					v1975:AddTag("Cleanup_Wilted")
					v1975:AddTag("Effect")
				end
			end
			local v1976 = {}
			for _, v1977 in p1971:GetDescendants() do
				if v1977:IsA("BasePart") and not v1977:HasTag("Effect") then
					table.insert(v1976, v1977)
				end
			end
			for v1978, v1979 in ipairs(v1976) do
				if v1978 % 3 == 0 then
					local v1980 = v1973[math.random(1, #v1973)]:Clone()
					if v1980:IsA("ParticleEmitter") then
						v1980.Color = ColorSequence.new(p1970.Color)
					end
					v1980.Parent = v1979
					v1980.Enabled = true
					v1980:AddTag("Cleanup_Wilted")
					v1980:AddTag("Effect")
					v_u_16[v1979] = v_u_16[v1979] or v1979.Color
					v1979.Color = p1970.Color
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1981, p1982)
		-- upvalues: (copy) v_u_16
		local function v1985(p1983)
			for _, v1984 in p1983:GetDescendants() do
				if v1984:HasTag("Cleanup_Wilted") then
					v1984:Destroy()
				end
			end
		end
		if p1982 then
			v1985(p1982)
		end
		if p1981 then
			v1985(p1981)
		end
		for _, v1986 in p1981:GetDescendants() do
			if v1986:IsA("BasePart") and v_u_16[v1986] then
				v1986.Color = v_u_16[v1986]
				v_u_16[v1986] = nil
			end
		end
	end
}
v_u_926.Withered = {
	["Id"] = "WH",
	["Name"] = "Withered",
	["ValueMulti"] = 20,
	["Color"] = Color3.fromRGB(59, 0, 89),
	["_AddFX"] = function(p1987, p1988, p1989)
		-- upvalues: (copy) v_u_16
		p1987:_RemoveFX(p1988, p1989)
		local v1990 = game.ServerStorage.Mutation_FX.Wilted:GetChildren()
		if #v1990 ~= 0 then
			if p1989 then
				for _, v1991 in v1990 do
					local v1992 = v1991:Clone()
					if v1992:IsA("ParticleEmitter") then
						v1992.Color = ColorSequence.new(p1987.Color)
					end
					v1992.Parent = p1989
					v1992.Enabled = true
					v1992:AddTag("Cleanup_Withered")
					v1992:AddTag("Effect")
				end
			end
			local v1993 = {}
			for _, v1994 in p1988:GetDescendants() do
				if v1994:IsA("BasePart") and not v1994:HasTag("Effect") then
					table.insert(v1993, v1994)
				end
			end
			for v1995, v1996 in ipairs(v1993) do
				if v1995 % 2 == 0 then
					local v1997 = v1990[math.random(1, #v1990)]:Clone()
					if v1997:IsA("ParticleEmitter") then
						v1997.Color = ColorSequence.new(p1987.Color)
					end
					v1997.Parent = v1996
					v1997.Enabled = true
					v1997:AddTag("Cleanup_Withered")
					v1997:AddTag("Effect")
					v_u_16[v1996] = v_u_16[v1996] or v1996.Color
					v1996.Color = p1987.Color
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p1998, p1999)
		-- upvalues: (copy) v_u_16
		local function v2002(p2000)
			for _, v2001 in p2000:GetDescendants() do
				if v2001:HasTag("Cleanup_Withered") then
					v2001:Destroy()
				end
			end
		end
		if p1999 then
			v2002(p1999)
		end
		if p1998 then
			v2002(p1998)
		end
		for _, v2003 in p1998:GetDescendants() do
			if v2003:IsA("BasePart") and v_u_16[v2003] then
				v2003.Color = v_u_16[v2003]
				v_u_16[v2003] = nil
			end
		end
	end
}
v_u_926.Desolate = {
	["Id"] = "DE",
	["Name"] = "Desolate",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(85, 0, 0),
	["_AddFX"] = function(p2004, p2005, p2006)
		-- upvalues: (copy) v_u_16
		p2004:_RemoveFX(p2005, p2006)
		local v2007 = game.ServerStorage.Mutation_FX.Wilted:GetChildren()
		if #v2007 ~= 0 then
			if p2006 then
				for _, v2008 in v2007 do
					local v2009 = v2008:Clone()
					if v2009:IsA("ParticleEmitter") then
						v2009.Color = ColorSequence.new(p2004.Color)
					end
					v2009.Parent = p2006
					v2009.Enabled = true
					v2009:AddTag("Cleanup_Desolate")
					v2009:AddTag("Effect")
				end
			end
			local v2010 = {}
			for _, v2011 in p2005:GetDescendants() do
				if v2011:IsA("BasePart") and not v2011:HasTag("Effect") then
					table.insert(v2010, v2011)
				end
			end
			for v2012, v2013 in ipairs(v2010) do
				if v2012 % 1 == 0 then
					local v2014 = v2007[math.random(1, #v2007)]:Clone()
					if v2014:IsA("ParticleEmitter") then
						v2014.Color = ColorSequence.new(p2004.Color)
					end
					v2014.Parent = v2013
					v2014.Enabled = true
					v2014:AddTag("Cleanup_Desolate")
					v2014:AddTag("Effect")
					v_u_16[v2013] = v_u_16[v2013] or v2013.Color
					v2013.Color = p2004.Color
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2015, p2016)
		-- upvalues: (copy) v_u_16
		local function v2019(p2017)
			for _, v2018 in p2017:GetDescendants() do
				if v2018:HasTag("Cleanup_Desolate") then
					v2018:Destroy()
				end
			end
		end
		if p2016 then
			v2019(p2016)
		end
		if p2015 then
			v2019(p2015)
		end
		for _, v2020 in p2015:GetDescendants() do
			if v2020:IsA("BasePart") and v_u_16[v2020] then
				v2020.Color = v_u_16[v2020]
				v_u_16[v2020] = nil
			end
		end
	end
}
v_u_926.Batty = {
	["Id"] = "BA",
	["Name"] = "Batty",
	["ValueMulti"] = 45,
	["Color"] = Color3.fromRGB(56, 56, 56),
	["_AddFX"] = function(p2021, p2022, p2023)
		-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_16
		p2021:_RemoveFX(p2022, p2023)
		if p2023 then
			for _, v2024 in game.ServerStorage.Mutation_FX.Batty:GetChildren() do
				local v2025 = v2024:Clone()
				v2025.Parent = p2023
				v2025:AddTag("Cleanup_Batty")
				if v2025:IsA("ParticleEmitter") then
					v2025.Enabled = true
				end
			end
		end
		for _, v2026 in p2022:GetDescendants() do
			if (v2026:IsA("BasePart") or v2026:IsA("UnionOperation")) and (not v2026:HasTag("Effect") and (not v2026.Transparency or v2026.Transparency ~= 1)) then
				v_u_19[v2026] = v_u_19[v2026] or v2026.Material
				v2026.Material = Enum.Material.Plastic
				v_u_20[v2026] = v_u_20[v2026] or v2026.MaterialVariant
				v2026.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_16[v2026] = v_u_16[v2026] or v2026.Color
				v2026.Color = v2026.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.4)
				v2026:AddTag("BattyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2027, p2028)
		-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		local function v2031(p2029)
			for _, v2030 in p2029:GetDescendants() do
				if v2030:HasTag("Cleanup_Batty") then
					v2030:Destroy()
				end
			end
		end
		if p2028 then
			v2031(p2028)
		end
		if p2027 then
			v2031(p2027)
		end
		for _, v2032 in p2027:GetDescendants() do
			if (v2032:IsA("BasePart") or v2032:IsA("UnionOperation")) and v2032:HasTag("BattyVisual") then
				v2032.Color = v_u_16[v2032] or v2032.Color
				v_u_16[v2032] = nil
				v2032:RemoveTag("BattyVisual")
				v2032.MaterialVariant = v_u_20[v2032] or v2032.MaterialVariant
				v_u_20[v2032] = nil
				if v_u_19[v2032] then
					v2032.Material = v_u_19[v2032]
					v_u_19[v2032] = nil
				end
			end
		end
	end
}
v_u_926.Glossy = {
	["Id"] = "GS",
	["Name"] = "Glossy",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(228, 255, 255),
	["_AddFX"] = function(p2033, p2034, p2035)
		-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_16
		p2033:_RemoveFX(p2034, p2035)
		if p2035 then
			for _, v2036 in game.ServerStorage.Mutation_FX.Glossy:GetChildren() do
				local v2037 = v2036:Clone()
				v2037.Parent = p2035
				v2037:AddTag("Cleanup_Glossy")
				if v2037:IsA("ParticleEmitter") then
					v2037.Enabled = true
				end
			end
		end
		for _, v2038 in p2034:GetDescendants() do
			if (v2038:IsA("BasePart") or v2038:IsA("UnionOperation")) and (not v2038:HasTag("Effect") and (not v2038.Transparency or v2038.Transparency ~= 1)) then
				v2038.Reflectance = 0.5
				v_u_19[v2038] = v_u_19[v2038] or v2038.Material
				v2038.Material = Enum.Material.Glass
				v_u_20[v2038] = v_u_20[v2038] or v2038.MaterialVariant
				v2038.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_16[v2038] = v_u_16[v2038] or v2038.Color
				v2038.Color = v2038.Color:Lerp(Color3.fromRGB(228, 255, 255), 0.8)
				v2038:AddTag("GlossyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2039, p2040)
		-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		local function v2043(p2041)
			for _, v2042 in p2041:GetDescendants() do
				if v2042:HasTag("Cleanup_Glossy") then
					v2042:Destroy()
				end
			end
		end
		if p2040 then
			v2043(p2040)
		end
		if p2039 then
			v2043(p2039)
		end
		for _, v2044 in p2039:GetDescendants() do
			if (v2044:IsA("BasePart") or v2044:IsA("UnionOperation")) and v2044:HasTag("GlossyVisual") then
				v2044.Color = v_u_16[v2044] or v2044.Color
				v_u_16[v2044] = nil
				v2044:RemoveTag("GlossyVisual")
				v2044.MaterialVariant = v_u_20[v2044] or v2044.MaterialVariant
				v_u_20[v2044] = nil
				if v_u_19[v2044] then
					v2044.Material = v_u_19[v2044]
					v_u_19[v2044] = nil
				end
			end
		end
	end
}
v_u_926.Leeched = {
	["Id"] = "LE",
	["Name"] = "Leeched",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(95, 26, 26),
	["_AddFX"] = function(p2045, p2046, p2047)
		-- upvalues: (copy) v_u_19, (copy) v_u_20, (copy) v_u_16
		p2045:_RemoveFX(p2046, p2047)
		if p2047 then
			for _, v2048 in game.ServerStorage.Mutation_FX.Leeched:GetChildren() do
				local v2049 = v2048:Clone()
				v2049.Parent = p2047
				v2049:AddTag("Cleanup_Leeched")
				if v2049:IsA("ParticleEmitter") then
					v2049.Enabled = true
				end
			end
		end
		for _, v2050 in p2046:GetDescendants() do
			if (v2050:IsA("BasePart") or v2050:IsA("UnionOperation")) and (not v2050:HasTag("Effect") and (not v2050.Transparency or v2050.Transparency ~= 1)) then
				v_u_19[v2050] = v_u_19[v2050] or v2050.Material
				v2050.Material = Enum.Material.Plastic
				v_u_20[v2050] = v_u_20[v2050] or v2050.MaterialVariant
				v2050.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_16[v2050] = v_u_16[v2050] or v2050.Color
				v2050.Color = v2050.Color:Lerp(Color3.fromRGB(0, 0, 0), 0.4)
				v2050:AddTag("LeechedVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2051, p2052)
		-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		local function v2055(p2053)
			for _, v2054 in p2053:GetDescendants() do
				if v2054:HasTag("Cleanup_Leeched") then
					v2054:Destroy()
				end
			end
		end
		if p2052 then
			v2055(p2052)
		end
		if p2051 then
			v2055(p2051)
		end
		for _, v2056 in p2051:GetDescendants() do
			if (v2056:IsA("BasePart") or v2056:IsA("UnionOperation")) and v2056:HasTag("LeechedVisual") then
				v2056.Color = v_u_16[v2056] or v2056.Color
				v_u_16[v2056] = nil
				v2056:RemoveTag("LeechedVisual")
				v2056.MaterialVariant = v_u_20[v2056] or v2056.MaterialVariant
				v_u_20[v2056] = nil
				if v_u_19[v2056] then
					v2056.Material = v_u_19[v2056]
					v_u_19[v2056] = nil
				end
			end
		end
	end
}
v_u_926.Lush = {
	["Id"] = "LU",
	["Name"] = "Lush",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(85, 255, 0),
	["_AddFX"] = function(p2057, p2058, p2059)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2057:_RemoveFX(p2058, p2059)
		local v2060 = {
			"Bright green",
			"Earth green",
			"Shamrock",
			"Lime green",
			"Grime"
		}
		for _, v2061 in p2058:GetDescendants() do
			if (v2061:IsA("BasePart") or v2061:IsA("UnionOperation")) and not v2061:HasTag("Effect") then
				v_u_16[v2061] = v_u_16[v2061] or v2061.BrickColor.Color
				v2061.BrickColor = BrickColor.new(v2060[Random.new():NextInteger(1, #v2060)])
				v_u_19[v2061] = v_u_19[v2061] or v2061.Material
				v2061.Material = Enum.Material.Plastic
				v2061:AddTag("LushVisual")
			end
		end
		local v2062 = game.ServerStorage:FindFirstChild("Mutation_FX")
		if v2062 then
			v2062 = game.ServerStorage.Mutation_FX:FindFirstChild("Lush")
		end
		if v2062 then
			local v2063 = v2062:GetChildren()
			if p2059 then
				for _, v2064 in v2063 do
					local v2065 = v2064:Clone()
					v2065.Parent = p2059
					if v2065:IsA("ParticleEmitter") then
						v2065.Enabled = true
					end
					v2065:AddTag("Cleanup_Lush")
					v2065:AddTag("Effect")
				end
			end
			for v2066, v2067 in ipairs(p2058:GetDescendants()) do
				if v2067:IsA("BasePart") and (not v2067:HasTag("Effect") and v2066 % 3 == 0) then
					for _, v2068 in v2063 do
						if v2068.Name == "Swirls" then
							local v2069 = v2068:Clone()
							v2069.Parent = v2067
							if v2069:IsA("ParticleEmitter") then
								v2069.Enabled = true
							end
							v2069:AddTag("Cleanup_Lush")
							v2069:AddTag("Effect")
						end
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2070, p2071)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2074(p2072)
			for _, v2073 in p2072:GetDescendants() do
				if v2073:HasTag("Cleanup_Lush") then
					v2073:Destroy()
				end
			end
		end
		if p2071 then
			v2074(p2071)
		end
		if p2070 then
			v2074(p2070)
		end
		for _, v2075 in p2070:GetDescendants() do
			if (v2075:IsA("BasePart") or v2075:IsA("UnionOperation")) and v2075:HasTag("LushVisual") then
				v2075.Reflectance = 0
				local v2076
				if v_u_16[v2075] then
					v2076 = BrickColor.new(v_u_16[v2075])
				else
					v2076 = v2075.BrickColor
				end
				v2075.BrickColor = v2076
				v_u_16[v2075] = nil
				v2075:RemoveTag("LushVisual")
				if v_u_19[v2075] then
					v2075.Material = v_u_19[v2075]
					v_u_19[v2075] = nil
				end
			end
		end
	end
}
v_u_926.Nocturnal = {
	["Id"] = "NL",
	["Name"] = "Nocturnal",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(61, 219, 255),
	["_AddFX"] = function(p2077, p2078, p2079)
		-- upvalues: (copy) v_u_16
		p2077:_RemoveFX(p2078, p2079)
		if p2079 then
			for _, v2080 in game.ServerStorage.Mutation_FX.Nocturnal:GetChildren() do
				local v2081 = v2080:Clone()
				v2081.Parent = p2079
				v2081.Enabled = true
				v2081:AddTag("Cleanup_Nocturnal")
				v2081:AddTag("Effect")
			end
		end
		for _, v2082 in p2078:GetDescendants() do
			if (v2082:IsA("BasePart") or v2082:IsA("UnionOperation")) and not v2082:HasTag("Effect") then
				v_u_16[v2082] = v_u_16[v2082] or v2082.Color
				v2082.Color = Color3.fromRGB(62, 56, 86)
				v2082.Reflectance = 0.3
				v2082:AddTag("NocturnalVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2083, p2084)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2084 then
			for _, v2085 in p2084:GetChildren() do
				if v2085:HasTag("Cleanup_Nocturnal") then
					v2085:Destroy()
				end
			end
		end
		for _, v2086 in p2083:GetDescendants() do
			if (v2086:IsA("BasePart") or v2086:IsA("UnionOperation")) and v2086:HasTag("NocturnalVisual") then
				v2086.Color = v_u_16[v2086] or v2086.Color
				v_u_16[v2086] = nil
				v2086.Reflectance = 0
				v2086:RemoveTag("NocturnalVisual")
				local v2087 = v_u_19[v2086]
				if v2087 then
					v2086.Material = v2087
					v_u_19[v2086] = nil
				end
			end
		end
	end
}
v_u_926.Arid = {
	["Id"] = "AR",
	["Name"] = "Arid",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(255, 170, 0),
	["_AddFX"] = function(p2088, p2089, p2090)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2088:_RemoveFX(p2089, p2090)
		local v2091 = {
			Color3.fromRGB(255, 205, 60),
			Color3.fromRGB(255, 185, 85),
			Color3.fromRGB(230, 150, 50),
			Color3.fromRGB(200, 125, 35),
			Color3.fromRGB(255, 220, 140)
		}
		if p2090 then
			for _, v2092 in game.ServerStorage.Mutation_FX.Arid:GetChildren() do
				local v2093 = v2092:Clone()
				v2093.Parent = p2090
				v2093.Enabled = true
				v2093:AddTag("Cleanup_Arid")
			end
		end
		for v2094, v2095 in p2089:GetDescendants() do
			if v2095:IsA("BasePart") or v2095:IsA("UnionOperation") then
				local v2096 = v2094 % 5 == 0 and game.ServerStorage.Mutation_FX.Arid:FindFirstChild("LeafSwirl")
				if v2096 then
					local v2097 = v2096:Clone()
					v2097.Parent = v2095
					v2097.Enabled = true
					v2097:AddTag("Cleanup_Arid")
				end
				if not v2095:HasTag("Effect") then
					v_u_16[v2095] = v_u_16[v2095] or v2095.Color
					v_u_19[v2095] = v_u_19[v2095] or v2095.Material
					v2095.Color = v2091[Random.new():NextInteger(1, #v2091)]
					v2095.Material = Enum.Material.Sand
					v2095:AddTag("AridVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2098, p2099)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2102(p2100)
			for _, v2101 in p2100:GetDescendants() do
				if v2101:HasTag("Cleanup_Arid") then
					v2101:Destroy()
				end
			end
		end
		if p2099 then
			v2102(p2099)
		end
		if p2098 then
			v2102(p2098)
		end
		for _, v2103 in p2098:GetDescendants() do
			if (v2103:IsA("BasePart") or v2103:IsA("UnionOperation")) and v2103:HasTag("AridVisual") then
				v2103:RemoveTag("AridVisual")
				v2103.Color = v_u_16[v2103] or v2103.Color
				v_u_16[v2103] = nil
				if v_u_19[v2103] then
					v2103.Material = v_u_19[v2103]
					v_u_19[v2103] = nil
				end
				v2103.Reflectance = 0
			end
		end
	end
}
v_u_926.Mirage = {
	["Id"] = "MR",
	["Name"] = "Mirage",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(170, 255, 255),
	["_AddFX"] = function(p2104, p2105, p2106)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2104:_RemoveFX(p2105, p2106)
		if p2106 then
			for _, v2107 in game.ServerStorage.Mutation_FX.Mirage:GetChildren() do
				local v2108 = v2107:Clone()
				v2108.Parent = p2106
				v2108.Enabled = true
				v2108:AddTag("Cleanup_Mirage")
			end
		end
		for v2109, v2110 in p2105:GetDescendants() do
			if v2110:IsA("BasePart") or v2110:IsA("UnionOperation") then
				if v2109 % 4 == 0 then
					local v2111 = game.ServerStorage.Mutation_FX.Mirage.Rays:Clone()
					v2111.Parent = v2110
					v2111.Enabled = true
					v2111:AddTag("Cleanup_Mirage")
				end
				if not v2110:HasTag("Effect") then
					v_u_16[v2110] = v_u_16[v2110] or v2110.Color
					v_u_19[v2110] = v_u_19[v2110] or v2110.Material
					v2110.Color = Color3.fromRGB(170, 255, 255)
					v2110.Material = Enum.Material.Glass
					v2110:AddTag("MirageVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2112, p2113)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2113 then
			for _, v2114 in p2113:GetChildren() do
				if v2114:HasTag("Cleanup_Mirage") then
					v2114:Destroy()
				end
			end
		end
		for _, v2115 in p2112:GetDescendants() do
			if (v2115:IsA("BasePart") or v2115:IsA("UnionOperation")) and v2115:HasTag("MirageVisual") then
				v2115:RemoveTag("MirageVisual")
				v2115.Color = v_u_16[v2115] or v2115.Color
				v_u_16[v2115] = nil
				if v_u_19[v2115] then
					v2115.Material = v_u_19[v2115]
					v_u_19[v2115] = nil
				end
				v2115.Reflectance = 0
			end
		end
	end
}
v_u_926.Stampede = {
	["Id"] = "ST",
	["Name"] = "Stampede",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(255, 170, 0),
	["_AddFX"] = function(p2116, p2117, p2118)
		-- upvalues: (copy) v_u_18, (copy) v_u_17
		p2116:_RemoveFX(p2117, p2118)
		local v2119 = p2117:FindFirstChild("Item_Seed") and p2117.Item_Seed.Value or tick()
		local v2120 = Random.new(v2119)
		local v2121 = 0
		for _, v2122 in p2117:GetDescendants() do
			if (v2122:IsA("BasePart") or v2122:IsA("UnionOperation")) and (not v2122:HasTag("Effect") and v2122.Transparency <= 0.75) then
				v2121 = v2121 + 1
				for _, v2123 in game.ServerStorage.Mutation_FX.Stampede:GetChildren() do
					local v2124 = v2123:Clone()
					v2124.Parent = v2122
					if v2124:IsA("ParticleEmitter") then
						v2124.Enabled = true
						v2124.Rate = v2124.Rate / v2121
						v2124.Color = ColorSequence.new(v2122.Color)
					else
						local v2125 = v2122.Transparency / 2
						v2124.Transparency = math.clamp(v2125, 0, 0.4) + 0.25
					end
					v2124:AddTag("Cleanup_Stampede")
				end
				if not v2122:HasTag("StampedeVisual") then
					v_u_18[v2122] = v_u_18[v2122] or v2122.Orientation
					v_u_17[v2122] = v_u_17[v2122] or v2122.Position
					local v2126 = v_u_18[v2122]
					local v2127 = v_u_17[v2122]
					local v2128 = v2122.Size.X
					local v2129 = v2126.X + v2120:NextNumber(-6.4, 6.4)
					local v2130 = v2126.Y + v2120:NextNumber(-6.4, 6.4)
					local v2131 = v2126.Z + v2120:NextNumber(-6.4, 6.4)
					v2122.Orientation = Vector3.new(v2129, v2130, v2131)
					local v2132 = v2120:NextNumber(-v2128, v2128) * 0.2
					local v2133 = v2120:NextNumber(-v2128, v2128) * 0.2
					local v2134 = v2120:NextNumber(-v2128, v2128) * 0.2
					local v2135 = math.clamp(v2132, -1, 1)
					local v2136 = math.clamp(v2133, -1, 1)
					local v2137 = math.clamp(v2134, -1, 1)
					v2122.Position = v2127 + Vector3.new(v2135, v2136, v2137)
					v2122:AddTag("StampedeVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2138, p2139)
		-- upvalues: (copy) v_u_18, (copy) v_u_17, (copy) v_u_16
		local function v2142(p2140)
			for _, v2141 in p2140:GetDescendants() do
				if v2141:HasTag("Cleanup_Stampede") or v2141.Name == "CRACKSTEXTURE" then
					v2141:Destroy()
				end
			end
		end
		if p2139 then
			v2142(p2139)
		end
		if p2138 then
			v2142(p2138)
		end
		for _, v2143 in p2138:GetDescendants() do
			if (v2143:IsA("BasePart") or v2143:IsA("UnionOperation")) and v2143:HasTag("StampedeVisual") then
				if v_u_18[v2143] then
					v2143.Orientation = v_u_18[v2143]
					v_u_18[v2143] = nil
				end
				if v_u_17[v2143] then
					v2143.Position = v_u_17[v2143]
					v_u_17[v2143] = nil
				end
				if v2143:FindFirstChild("StampedeRubbleP") then
					v2143.StampedeRubbleP:Destroy()
				end
				if v2143:FindFirstChild("StampedePixelSmokeP") then
					v2143.StampedePixelSmokeP:Destroy()
				end
				v2143.Reflectance = 0
				v_u_16[v2143] = nil
				v2143:RemoveTag("StampedeVisual")
			end
		end
	end
}
v_u_926.Monsoon = {
	["Id"] = "MO",
	["Name"] = "Monsoon",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(170, 255, 255),
	["_AddFX"] = function(p2144, p2145, p2146)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2144:_RemoveFX(p2145, p2146)
		local v2147 = game.ServerStorage.Mutation_FX.Monsoon:GetChildren()
		local v2148 = Color3.fromRGB(170, 255, 255)
		local v2149 = {}
		for _, v2150 in p2145:GetDescendants() do
			if v2150:IsA("BasePart") or v2150:IsA("UnionOperation") then
				table.insert(v2149, v2150)
			end
		end
		if p2146 and not table.find(v2149, p2146) then
			table.insert(v2149, p2146)
		end
		for v2151, v2152 in ipairs(v2149) do
			for _, v2153 in v2147 do
				if v2151 % 4 == 0 or v2152 == p2146 then
					local v2154 = v2153:Clone()
					v2154.Parent = v2152
					v2154.Enabled = true
					v2154:AddTag("Cleanup_Monsoon")
					v2154:AddTag("Effect")
				end
			end
			if not v2152:HasTag("Effect") then
				v_u_16[v2152] = v_u_16[v2152] or v2152.Color
				v_u_19[v2152] = v_u_19[v2152] or v2152.Material
				OriginalTransparency = OriginalTransparency or {}
				OriginalTransparency[v2152] = v2152.Transparency
				v2152.Color = v2148
				v2152.Material = Enum.Material.Neon
				v2152.Transparency = 0.8
				v2152:AddTag("MonsoonVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2155, p2156)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2159(p2157)
			for _, v2158 in p2157:GetDescendants() do
				if v2158:HasTag("Cleanup_Monsoon") then
					v2158:Destroy()
				end
			end
		end
		if p2156 then
			v2159(p2156)
		end
		if p2155 then
			v2159(p2155)
		end
		for _, v2160 in p2155:GetDescendants() do
			if (v2160:IsA("BasePart") or v2160:IsA("UnionOperation")) and v2160:HasTag("MonsoonVisual") then
				v2160.Color = v_u_16[v2160] or v2160.Color
				v_u_16[v2160] = nil
				v2160.Material = v_u_19[v2160] or v2160.Material
				v_u_19[v2160] = nil
				if OriginalTransparency and OriginalTransparency[v2160] then
					v2160.Transparency = OriginalTransparency[v2160]
					OriginalTransparency[v2160] = nil
				else
					v2160.Transparency = 0
				end
				v2160:RemoveTag("MonsoonVisual")
			end
		end
	end
}
v_u_926.Twilight = {
	["Id"] = "TW",
	["Name"] = "Twilight",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(170, 170, 255),
	["_AddFX"] = function(p2161, p2162, p2163)
		-- upvalues: (copy) v_u_16
		p2161:_RemoveFX(p2162, p2163)
		if p2163 then
			for _, v2164 in game.ServerStorage.Mutation_FX.Crepuscular:GetChildren() do
				local v2165 = v2164:Clone()
				v2165.Parent = p2163
				v2165.Enabled = true
				v2165:AddTag("Cleanup_Crepuscular")
				v2165:AddTag("Effect")
			end
		end
		for _, v2166 in p2162:GetDescendants() do
			if (v2166:IsA("BasePart") or v2166:IsA("UnionOperation")) and not v2166:HasTag("Effect") then
				v_u_16[v2166] = v_u_16[v2166] or v2166.Color
				v2166.Color = Color3.fromRGB(170, 170, 255)
				v2166.Reflectance = 0.3
				v2166:AddTag("CrepuscularVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2167, p2168)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2168 then
			for _, v2169 in p2168:GetChildren() do
				if v2169:HasTag("Cleanup_Crepuscular") then
					v2169:Destroy()
				end
			end
		end
		for _, v2170 in p2167:GetDescendants() do
			if (v2170:IsA("BasePart") or v2170:IsA("UnionOperation")) and v2170:HasTag("CrepuscularVisual") then
				v2170.Color = v_u_16[v2170] or v2170.Color
				v_u_16[v2170] = nil
				v2170.Reflectance = 0
				v2170:RemoveTag("CrepuscularVisual")
				local v2171 = v_u_19[v2170]
				if v2171 then
					v2170.Material = v2171
					v_u_19[v2170] = nil
				end
			end
		end
	end
}
v_u_926.Typhoon = {
	["Id"] = "TY",
	["Name"] = "Typhoon",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(0, 174, 255),
	["_AddFX"] = function(p2172, p2173, p2174)
		p2172:_RemoveFX(p2173, p2174)
		local v2175 = game.ServerStorage.Mutation_FX.Typhoon:GetChildren()
		if p2174 then
			for _, v2176 in v2175 do
				if not p2174:FindFirstChild(v2176.Name) then
					local v2177 = v2176:Clone()
					v2177.Parent = p2174
					v2177.Enabled = true
					v2177:AddTag("Cleanup_Typhoon")
				end
			end
		end
		local v2178 = 0
		for _, v2179 in p2173:GetDescendants() do
			if v2179:IsA("BasePart") and v2179 ~= p2174 then
				v2178 = v2178 + 1
				if v2178 % 3 == 0 then
					local v2180 = v2175[math.random(1, #v2175)]:Clone()
					v2180.Parent = v2179
					v2180.Enabled = true
					v2180:AddTag("Cleanup_Typhoon")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2181, p2182)
		local function v2185(p2183)
			for _, v2184 in p2183:GetDescendants() do
				if v2184:HasTag("Cleanup_Typhoon") then
					v2184:Destroy()
				end
			end
		end
		if p2182 then
			v2185(p2182)
		end
		if p2181 then
			v2185(p2181)
		end
	end
}
v_u_926.Wildfast = {
	["Id"] = "WF",
	["Name"] = "Wildfast",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p2186, p2187, p2188)
		p2186:_RemoveFX(p2187, p2188)
		if p2188 then
			for _, v2189 in game.ServerStorage.Mutation_FX.Wildfast:GetChildren() do
				local v2190 = v2189:Clone()
				v2190.Parent = p2188
				v2190:AddTag("Cleanup_Wildfast")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p2191)
		if p2191 then
			for _, v2192 in p2191:GetChildren() do
				if v2192:HasTag("Cleanup_Wildfast") then
					v2192:Destroy()
				end
			end
		end
	end
}
v_u_926.Tempered = {
	["Id"] = "TE",
	["Name"] = "Tempered",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(255, 96, 17),
	["_AddFX"] = function(p2193, p2194, p2195)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2193:_RemoveFX(p2194, p2195)
		if p2195 then
			for _, v2196 in game.ServerStorage.Mutation_FX.Tempered:GetChildren() do
				local v2197 = v2196:Clone()
				v2197.Parent = p2195
				v2197.Enabled = true
				v2197:AddTag("Cleanup_Tempered")
			end
		end
		for v2198, v2199 in p2194:GetDescendants() do
			if v2199:IsA("BasePart") or v2199:IsA("UnionOperation") then
				local _ = v2198 % 5 == 0
				if not v2199:HasTag("Effect") then
					v_u_16[v2199] = v_u_16[v2199] or v2199.Color
					v_u_19[v2199] = v_u_19[v2199] or v2199.Material
					v2199.Color = Color3.fromRGB(255, 100, 28)
					v2199.Material = Enum.Material.Neon
					v2199:AddTag("TemperedVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2200, p2201)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2204(p2202)
			for _, v2203 in p2202:GetDescendants() do
				if v2203:HasTag("Cleanup_Tempered") then
					v2203:Destroy()
				end
			end
		end
		if p2201 then
			v2204(p2201)
		end
		if p2200 then
			v2204(p2200)
		end
		for _, v2205 in p2200:GetDescendants() do
			if (v2205:IsA("BasePart") or v2205:IsA("UnionOperation")) and v2205:HasTag("TemperedVisual") then
				v2205:RemoveTag("TemperedVisual")
				v2205.Color = v_u_16[v2205] or v2205.Color
				v_u_16[v2205] = nil
				if v_u_19[v2205] then
					v2205.Material = v_u_19[v2205]
					v_u_19[v2205] = nil
				end
				v2205.Reflectance = 0
			end
		end
	end
}
v_u_926.Charcoal = {
	["Id"] = "CH",
	["Name"] = "Charcoal",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(71, 71, 71),
	["_AddFX"] = function(p2206, p2207, p2208)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2206:_RemoveFX(p2207, p2208)
		if p2208 then
			for _, v2209 in game.ServerStorage.Mutation_FX.Charcoal:GetChildren() do
				local v2210 = v2209:Clone()
				v2210.Parent = p2208
				v2210.Enabled = true
				v2210:AddTag("Cleanup_Charcoal")
			end
		end
		for v2211, v2212 in p2207:GetDescendants() do
			if v2212:IsA("BasePart") or v2212:IsA("UnionOperation") then
				local _ = v2211 % 5 == 0
				if not v2212:HasTag("Effect") then
					v_u_16[v2212] = v_u_16[v2212] or v2212.Color
					v_u_19[v2212] = v_u_19[v2212] or v2212.Material
					v2212.Color = Color3.fromRGB(71, 71, 71)
					v2212.Material = Enum.Material.Sand
					v2212:AddTag("CharcoalVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2213, p2214)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2217(p2215)
			for _, v2216 in p2215:GetDescendants() do
				if v2216:HasTag("Cleanup_Charcoal") then
					v2216:Destroy()
				end
			end
		end
		if p2214 then
			v2217(p2214)
		end
		if p2213 then
			v2217(p2213)
		end
		for _, v2218 in p2213:GetDescendants() do
			if (v2218:IsA("BasePart") or v2218:IsA("UnionOperation")) and v2218:HasTag("CharcoalVisual") then
				v2218:RemoveTag("CharcoalVisual")
				v2218.Color = v_u_16[v2218] or v2218.Color
				v_u_16[v2218] = nil
				if v_u_19[v2218] then
					v2218.Material = v_u_19[v2218]
					v_u_19[v2218] = nil
				end
				v2218.Reflectance = 0
			end
		end
	end
}
v_u_926.Geode = {
	["Id"] = "GD",
	["Name"] = "Geode",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 0, 0),
	["_AddFX"] = function(p2219, p2220, p2221)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2219:_RemoveFX(p2220, p2221)
		local v2222 = game.ServerStorage.Mutation_FX.Geode:GetChildren()
		if #v2222 == 0 then
			return
		else
			local v2223 = {}
			for _, v2224 in p2220:GetDescendants() do
				if v2224:IsA("BasePart") and (not v2224:HasTag("Effect") and v2224.Transparency < 0.9) then
					table.insert(v2223, v2224)
				end
			end
			if #v2223 ~= 0 then
				local v2225 = #v2223 * 0.25
				local v2226 = math.floor(v2225)
				local v2227 = math.max(4, v2226)
				local v2228 = Random.new(tick())
				local v2229 = {}
				while #v2229 < v2227 and #v2223 > 0 do
					local v2230 = v2228:NextInteger(1, #v2223)
					local v2231 = table.remove
					table.insert(v2229, v2231(v2223, v2230))
				end
				local v2232 = {
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
				for _, v2233 in v2229 do
					local v2234 = v2222[v2228:NextInteger(1, #v2222)]:Clone()
					v2234.Parent = v2233
					v2234.Enabled = true
					v2234:AddTag("Cleanup_Geode")
					v2234:AddTag("Effect")
					local v2235 = v2232[v2228:NextInteger(1, #v2232)]
					v_u_16[v2233] = v_u_16[v2233] or v2233.Color
					v_u_19[v2233] = v_u_19[v2233] or v2233.Material
					v2233.Color = v2235.Color
					v2233.Material = v2235.Material
					v2233:AddTag("GeodeVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2236, p2237)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2240(p2238)
			for _, v2239 in p2238:GetDescendants() do
				if v2239:HasTag("Cleanup_Geode") then
					v2239:Destroy()
				end
			end
		end
		if p2237 then
			v2240(p2237)
		end
		if p2236 then
			v2240(p2236)
		end
		for _, v2241 in p2236:GetDescendants() do
			if (v2241:IsA("BasePart") or v2241:IsA("UnionOperation")) and v2241:HasTag("GeodeVisual") then
				v2241.Color = v_u_16[v2241] or v2241.Color
				v_u_16[v2241] = nil
				if v_u_19[v2241] then
					v2241.Material = v_u_19[v2241]
					v_u_19[v2241] = nil
				end
				v2241:RemoveTag("GeodeVisual")
			end
		end
	end
}
v_u_926.Supernatural = {
	["Id"] = "SU",
	["Name"] = "Supernatural",
	["ValueMulti"] = 37,
	["Color"] = Color3.fromRGB(79, 28, 110),
	["_AddFX"] = function(p2242, p2243, p2244)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2247(p2245)
			for _, v2246 in p2245:GetDescendants() do
				if v2246:IsA("ParticleEmitter") or (v2246:IsA("Trail") or (v2246:IsA("Beam") or (v2246:IsA("Smoke") or (v2246:IsA("Sparkles") or v2246:IsA("PointLight"))))) then
					v2246.Enabled = true
				end
			end
		end
		p2242:_RemoveFX(p2243, p2244)
		local v2248 = game.ServerStorage.Mutation_FX.Supernatural:GetChildren()
		if #v2248 ~= 0 then
			if p2244 then
				for _, v2249 in v2248 do
					local v2250 = v2249:Clone()
					v2250.Parent = p2244
					v2247(v2250)
					v2250:AddTag("Cleanup_Supernatural")
					v2250:AddTag("Effect")
				end
			end
			for _, v2251 in p2243:GetDescendants() do
				if v2251:IsA("BasePart") then
					v_u_16[v2251] = v_u_16[v2251] or v2251.Color
					v_u_19[v2251] = v_u_19[v2251] or v2251.Material
					v2251.Color = Color3.fromRGB(170, 215, 230)
					v2251.Material = Enum.Material.Neon
					v2251.Transparency = 0.6
					v2251:AddTag("SupernaturalVisual")
				end
			end
			local v2252 = {}
			for _, v2253 in p2243:GetDescendants() do
				if v2253:IsA("BasePart") and (v2253 ~= p2244 and not v2253:HasTag("Effect")) then
					table.insert(v2252, v2253)
				end
			end
			local v2254 = #v2248 > 6 and 3 or 2
			for v2255, v2256 in ipairs(v2252) do
				if v2255 % v2254 == 0 then
					local v2257 = v2248[math.random(1, #v2248)]:Clone()
					v2257.Parent = v2256
					v2247(v2257)
					v2257:AddTag("Cleanup_Supernatural")
					v2257:AddTag("Effect")
					if math.random() < 0.22 then
						local v2258 = v2248[math.random(1, #v2248)]:Clone()
						v2258.Parent = v2256
						v2247(v2258)
						v2258:AddTag("Cleanup_Supernatural")
						v2258:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2259, p2260)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2263(p2261)
			for _, v2262 in p2261:GetDescendants() do
				if v2262:HasTag("Cleanup_Supernatural") then
					v2262:Destroy()
				end
			end
		end
		if p2260 then
			v2263(p2260)
		end
		if p2259 then
			v2263(p2259)
		end
		for _, v2264 in p2259:GetDescendants() do
			if v2264:IsA("BasePart") and v2264:HasTag("SupernaturalVisual") then
				v2264:RemoveTag("SupernaturalVisual")
				v2264.Color = v_u_16[v2264] or v2264.Color
				v_u_16[v2264] = nil
				local v2265 = v_u_19[v2264]
				if v2265 then
					v2264.Material = v2265
					v_u_19[v2264] = nil
				end
				v2264.Transparency = 0
			end
		end
	end
}
v_u_926.Stormbound = {
	["Id"] = "STB",
	["Name"] = "Stormbound",
	["ValueMulti"] = 270,
	["Color"] = Color3.fromRGB(25, 46, 89),
	["_AddFX"] = function(p2266, p2267, p2268)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2271(p2269)
			for _, v2270 in p2269:GetDescendants() do
				if v2270:IsA("ParticleEmitter") or (v2270:IsA("Trail") or (v2270:IsA("Beam") or (v2270:IsA("Smoke") or (v2270:IsA("Sparkles") or v2270:IsA("PointLight"))))) then
					v2270.Enabled = true
				end
			end
		end
		p2266:_RemoveFX(p2267, p2268)
		local v2272 = game.ServerStorage.Mutation_FX.Stormbound:GetChildren()
		if #v2272 ~= 0 then
			if p2268 then
				for _, v2273 in v2272 do
					local v2274 = v2273:Clone()
					v2274.Parent = p2268
					v2271(v2274)
					v2274:AddTag("Cleanup_Stormbound")
					v2274:AddTag("Effect")
				end
			end
			local v2275 = {}
			for _, v2276 in p2267:GetDescendants() do
				if v2276:IsA("BasePart") and not v2276:HasTag("Effect") then
					v_u_16[v2276] = v_u_16[v2276] or v2276.Color
					v_u_19[v2276] = v_u_19[v2276] or v2276.Material
					table.insert(v2275, v2276)
				end
			end
			local v2277 = #v2275 * 1
			for _ = 1, math.ceil(v2277) do
				local v2278 = math.random(1, #v2275)
				local v2279 = table.remove(v2275, v2278)
				v2279.Material = Enum.Material.Neon
				v2279.Transparency = 0.4
				v2279:AddTag("StormboundVisual")
				v2279.Color = Color3.fromRGB(60, 75, 120)
			end
			local v2280 = #v2272 <= 4 and 2 or 3
			for v2281, v2282 in ipairs(v2275) do
				if v2281 % v2280 == 0 then
					local v2283 = v2272[math.random(1, #v2272)]:Clone()
					v2283.Parent = v2282
					v2271(v2283)
					v2283:AddTag("Cleanup_Stormbound")
					v2283:AddTag("Effect")
					if math.random() < 0.15 then
						local v2284 = v2272[math.random(1, #v2272)]:Clone()
						v2284.Parent = v2282
						v2271(v2284)
						v2284:AddTag("Cleanup_Stormbound")
						v2284:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2285, p2286)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2289(p2287)
			for _, v2288 in p2287:GetDescendants() do
				if v2288:HasTag("Cleanup_Stormbound") then
					v2288:Destroy()
				end
			end
		end
		if p2286 then
			v2289(p2286)
		end
		if p2285 then
			v2289(p2285)
		end
		for _, v2290 in p2285:GetDescendants() do
			if v2290:IsA("BasePart") and v2290:HasTag("StormboundVisual") then
				v2290:RemoveTag("StormboundVisual")
				v2290.Color = v_u_16[v2290] or v2290.Color
				v_u_16[v2290] = nil
				local v2291 = v_u_19[v2290]
				if v2291 then
					v2290.Material = v2291
					v_u_19[v2290] = nil
				end
				v2290.Transparency = 0
			end
		end
	end
}
v_u_926.SunScorched = {
	["Id"] = "SCO",
	["Name"] = "SunScorched",
	["ValueMulti"] = 32,
	["Color"] = Color3.fromRGB(210, 115, 30),
	["_AddFX"] = function(p2292, p2293, p2294)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2297(p2295)
			for _, v2296 in p2295:GetDescendants() do
				if v2296:IsA("ParticleEmitter") or (v2296:IsA("Trail") or (v2296:IsA("Beam") or (v2296:IsA("Smoke") or (v2296:IsA("Sparkles") or v2296:IsA("PointLight"))))) then
					v2296.Enabled = true
				end
			end
		end
		p2292:_RemoveFX(p2293, p2294)
		local v2298 = game.ServerStorage.Mutation_FX.SunScorched:GetChildren()
		if #v2298 ~= 0 then
			if p2294 then
				for _, v2299 in v2298 do
					local v2300 = v2299:Clone()
					v2300.Parent = p2294
					v2297(v2300)
					v2300:AddTag("Cleanup_SunScorched")
					v2300:AddTag("Effect")
				end
			end
			local v2301 = {}
			for _, v2302 in p2293:GetDescendants() do
				if v2302:IsA("BasePart") then
					v_u_16[v2302] = v_u_16[v2302] or v2302.Color
					v_u_19[v2302] = v_u_19[v2302] or v2302.Material
					v2302.Material = Enum.Material.Sand
					v2302.Color = Color3.fromRGB(210, 115, 30)
					v2302:AddTag("SunScorchedVisual")
					table.insert(v2301, v2302)
				end
			end
			local v2303 = #v2298 > 5 and 3 or 2
			for v2304, v2305 in ipairs(v2301) do
				if v2304 % v2303 == 0 then
					local v2306 = v2298[math.random(1, #v2298)]:Clone()
					v2306.Parent = v2305
					v2297(v2306)
					v2306:AddTag("Cleanup_SunScorched")
					v2306:AddTag("Effect")
					if math.random() < 0.18 then
						local v2307 = v2298[math.random(1, #v2298)]:Clone()
						v2307.Parent = v2305
						v2297(v2307)
						v2307:AddTag("Cleanup_SunScorched")
						v2307:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2308, p2309)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2312(p2310)
			for _, v2311 in p2310:GetDescendants() do
				if v2311:HasTag("Cleanup_SunScorched") then
					v2311:Destroy()
				end
			end
		end
		if p2309 then
			v2312(p2309)
		end
		if p2308 then
			v2312(p2308)
		end
		for _, v2313 in p2308:GetDescendants() do
			if v2313:IsA("BasePart") and v2313:HasTag("SunScorchedVisual") then
				v2313:RemoveTag("SunScorchedVisual")
				v2313.Color = v_u_16[v2313] or v2313.Color
				v_u_16[v2313] = nil
				local v2314 = v_u_19[v2313]
				if v2314 then
					v2313.Material = v2314
					v_u_19[v2313] = nil
				end
				v2313.Transparency = 0
			end
		end
	end
}
v_u_926.Riptide = {
	["Id"] = "RP",
	["Name"] = "Riptide",
	["ValueMulti"] = 80,
	["Color"] = Color3.fromRGB(15, 151, 178),
	["_AddFX"] = function(p2315, p2316, p2317)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2320(p2318)
			for _, v2319 in p2318:GetDescendants() do
				if v2319:IsA("ParticleEmitter") or (v2319:IsA("Trail") or (v2319:IsA("Beam") or (v2319:IsA("Smoke") or (v2319:IsA("Sparkles") or v2319:IsA("PointLight"))))) then
					v2319.Enabled = true
				end
			end
		end
		p2315:_RemoveFX(p2316, p2317)
		local v2321 = game.ServerStorage.Mutation_FX.Riptide:GetChildren()
		if #v2321 ~= 0 then
			if p2317 then
				for _, v2322 in v2321 do
					local v2323 = v2322:Clone()
					v2323.Parent = p2317
					v2320(v2323)
					v2323:AddTag("Cleanup_Riptide")
					v2323:AddTag("Effect")
				end
			end
			local v2324 = {}
			for _, v2325 in p2316:GetDescendants() do
				if v2325:IsA("BasePart") then
					v_u_16[v2325] = v_u_16[v2325] or v2325.Color
					v_u_19[v2325] = v_u_19[v2325] or v2325.Material
					v2325.Material = Enum.Material.Glass
					v2325.Color = Color3.fromRGB(15, 151, 178)
					v2325.Transparency = 0.3
					v2325:AddTag("RiptideVisual")
					table.insert(v2324, v2325)
				end
			end
			for v2326, v2327 in ipairs(v2324) do
				if v2326 % 2 == 0 then
					local v2328 = v2321[math.random(1, #v2321)]:Clone()
					v2328.Parent = v2327
					v2320(v2328)
					v2328:AddTag("Cleanup_Riptide")
					v2328:AddTag("Effect")
					if math.random() < 0.18 then
						local v2329 = v2321[math.random(1, #v2321)]:Clone()
						v2329.Parent = v2327
						v2320(v2329)
						v2329:AddTag("Cleanup_Riptide")
						v2329:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2330, p2331)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2334(p2332)
			for _, v2333 in p2332:GetDescendants() do
				if v2333:HasTag("Cleanup_Riptide") then
					v2333:Destroy()
				end
			end
		end
		if p2331 then
			v2334(p2331)
		end
		if p2330 then
			v2334(p2330)
		end
		for _, v2335 in p2330:GetDescendants() do
			if v2335:IsA("BasePart") and v2335:HasTag("RiptideVisual") then
				v2335:RemoveTag("RiptideVisual")
				v2335.Color = v_u_16[v2335] or v2335.Color
				v_u_16[v2335] = nil
				local v2336 = v_u_19[v2335]
				if v2336 then
					v2335.Material = v2336
					v_u_19[v2335] = nil
				end
				v2335.Transparency = 0
			end
		end
	end
}
v_u_926.Grim = {
	["Id"] = "GRM",
	["Name"] = "Grim",
	["ValueMulti"] = 170,
	["Color"] = Color3.fromRGB(6, 7, 23),
	["_AddFX"] = function(p2337, p2338, p2339)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2342(p2340)
			for _, v2341 in p2340:GetDescendants() do
				if v2341:IsA("ParticleEmitter") or (v2341:IsA("Trail") or (v2341:IsA("Beam") or (v2341:IsA("Smoke") or (v2341:IsA("Sparkles") or v2341:IsA("PointLight"))))) then
					v2341.Enabled = true
				end
			end
		end
		p2337:_RemoveFX(p2338, p2339)
		local v2343 = game.ServerStorage.Mutation_FX.Grim:GetChildren()
		if #v2343 ~= 0 then
			if p2339 then
				for _, v2344 in v2343 do
					local v2345 = v2344:Clone()
					v2345.Parent = p2339
					v2342(v2345)
					v2345:AddTag("Cleanup_Grim")
					v2345:AddTag("Effect")
				end
			end
			for _, v2346 in p2338:GetDescendants() do
				if v2346:IsA("BasePart") then
					v_u_16[v2346] = v_u_16[v2346] or v2346.Color
					v_u_19[v2346] = v_u_19[v2346] or v2346.Material
					v2346.Color = Color3.fromRGB(10, 10, 25)
					v2346:AddTag("GrimVisual")
				end
			end
			local v2347 = {}
			for _, v2348 in p2338:GetDescendants() do
				if v2348:IsA("BasePart") and (v2348 ~= p2339 and not v2348:HasTag("Effect")) then
					table.insert(v2347, v2348)
				end
			end
			for v2349, v2350 in ipairs(v2347) do
				if v2349 % 2 == 0 then
					local v2351 = v2343[math.random(1, #v2343)]:Clone()
					v2351.Parent = v2350
					v2342(v2351)
					v2351:AddTag("Cleanup_Grim")
					v2351:AddTag("Effect")
					if math.random() < 0.2 then
						local v2352 = v2343[math.random(1, #v2343)]:Clone()
						v2352.Parent = v2350
						v2342(v2352)
						v2352:AddTag("Cleanup_Grim")
						v2352:AddTag("Effect")
					end
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2353, p2354)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2357(p2355)
			for _, v2356 in p2355:GetDescendants() do
				if v2356:HasTag("Cleanup_Grim") then
					v2356:Destroy()
				end
			end
		end
		if p2354 then
			v2357(p2354)
		end
		if p2353 then
			v2357(p2353)
		end
		for _, v2358 in p2353:GetDescendants() do
			if v2358:IsA("BasePart") and v2358:HasTag("GrimVisual") then
				v2358:RemoveTag("NGrimVisual")
				v2358.Color = v_u_16[v2358] or v2358.Color
				v_u_16[v2358] = nil
				local v2359 = v_u_19[v2358]
				if v2359 then
					v2358.Material = v2359
					v_u_19[v2358] = nil
				end
				v2358.Transparency = 0
			end
		end
	end
}
v_u_926.Extraterrestrial = {
	["Id"] = "ET",
	["Name"] = "Extraterrestrial",
	["ValueMulti"] = 130,
	["Color"] = Color3.fromRGB(17, 0, 255),
	["_AddFX"] = function(p2360, p2361, p2362)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2360:_RemoveFX(p2361, p2362)
		local v2363 = Random.new()
		local v2364 = game.ServerStorage.Mutation_FX.Extraterrestrial
		if p2362 then
			for _, v2365 in v2364:GetChildren() do
				local v2366 = v2365:Clone()
				v2366.Parent = p2362
				v2366.Enabled = true
				v2366:AddTag("Cleanup_Extraterrestrial")
			end
		end
		local v2367 = {
			Color3.fromRGB(3, 23, 76),
			Color3.fromRGB(3, 96, 159),
			Color3.fromRGB(3, 142, 206),
			Color3.fromRGB(0, 149, 94),
			Color3.fromRGB(0, 255, 217),
			Color3.fromRGB(3, 23, 76)
		}
		for v2368, v2369 in p2361:GetDescendants() do
			if v2369:IsA("BasePart") or v2369:IsA("UnionOperation") then
				if v2368 % 5 == 0 then
					local v2370 = v2364:FindFirstChild("Sparkle")
					if v2370 then
						local v2371 = v2370:Clone()
						v2371.Parent = v2369
						v2371.Enabled = true
						v2371.Rate = v2363:NextNumber(17, 25) / 20
						v2371:AddTag("Cleanup_Extraterrestrial")
					end
					local v2372 = v2364:FindFirstChild("Swirls")
					if v2372 then
						local v2373 = v2372:Clone()
						v2373.Parent = v2369
						v2373.Enabled = true
						v2373.Rate = v2363:NextNumber(17, 25) / 30
						v2373:AddTag("Cleanup_Extraterrestrial")
					end
				end
				if not v2369:HasTag("Effect") and v2369.Transparency ~= 1 then
					v_u_16[v2369] = v_u_16[v2369] or v2369.Color
					v_u_19[v2369] = v_u_19[v2369] or v2369.Material
					if v2363:NextInteger(1, 9) == 1 then
						v2369.Material = Enum.Material.Marble
					else
						v2369.Material = Enum.Material.Neon
					end
					local v2374 = v2367[v2363:NextInteger(1, #v2367)]
					v2369.Color = v2369.Color:Lerp(v2374, 0.9)
					v2369:AddTag("ExtraterrestrialVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2375, p2376)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2379(p2377)
			for _, v2378 in p2377:GetDescendants() do
				if v2378:HasTag("Cleanup_Extraterrestrial") then
					v2378:Destroy()
				end
			end
		end
		if p2376 then
			v2379(p2376)
		end
		if p2375 then
			v2379(p2375)
		end
		for _, v2380 in p2375:GetDescendants() do
			if (v2380:IsA("BasePart") or v2380:IsA("UnionOperation")) and v2380:HasTag("ExtraterrestrialVisual") then
				v2380:RemoveTag("ExtraterrestrialVisual")
				v2380.Color = v_u_16[v2380] or v2380.Color
				v_u_16[v2380] = nil
				if v_u_19[v2380] then
					v2380.Material = v_u_19[v2380]
					v_u_19[v2380] = nil
				end
				v2380.Reflectance = 0
			end
		end
	end
}
v_u_926.Mineral = {
	["Id"] = "MN",
	["Name"] = "Mineral",
	["ValueMulti"] = 18,
	["Color"] = Color3.fromRGB(112, 88, 71),
	["_AddFX"] = function(p2381, p2382, p2383)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2381:_RemoveFX(p2382, p2383)
		if p2383 then
			for _, v2384 in game.ServerStorage.Mutation_FX.Mineral:GetChildren() do
				local v2385 = v2384:Clone()
				v2385.Parent = p2383
				v2385.Enabled = true
			end
		end
		for v2386, v2387 in p2382:GetDescendants() do
			if v2387:IsA("BasePart") or v2387:IsA("UnionOperation") then
				if v2386 % 3 == 0 then
					local v2388 = game.ServerStorage.Mutation_FX.Mineral.AmberParticle:Clone()
					v2388.Parent = v2387
					v2388.Enabled = true
					v2388.Rate = math.random(17, 25) / 20
					v2388:AddTag("Cleanup_Mineral")
					local v2389 = game.ServerStorage.Mutation_FX.Mineral.BurntSizzle:Clone()
					v2389.Parent = v2387
					v2389.Enabled = true
					v2389.Rate = math.random(17, 25) / 30
					v2389:AddTag("Cleanup_Mineral")
					local v2390 = game.ServerStorage.Mutation_FX.Mineral.CharcoalParticles:Clone()
					v2390.Parent = v2387
					v2390.Enabled = true
					v2390.Rate = math.random(17, 25) / 30
					v2390:AddTag("Cleanup_Mineral")
					local v2391 = game.ServerStorage.Mutation_FX.Mineral.ClayParticle:Clone()
					v2391.Parent = v2387
					v2391.Enabled = true
					v2391.Rate = math.random(17, 25) / 30
					v2391:AddTag("Cleanup_Mineral")
					local v2392 = game.ServerStorage.Mutation_FX.Mineral.brown:Clone()
					v2392.Parent = v2387
					v2392.Enabled = true
					v2392.Rate = math.random(17, 25) / 30
					v2392:AddTag("Cleanup_Mineral")
					local v2393 = game.ServerStorage.Mutation_FX.Mineral.green:Clone()
					v2393.Parent = v2387
					v2393.Enabled = true
					v2393.Rate = math.random(17, 25) / 30
					v2393:AddTag("Cleanup_Mineral")
				end
				Color3.new(0.0666667, 0.298039, 0.121569)
				if not v2387:HasTag("Effect") and v2387.Transparency ~= 1 then
					v_u_16[v2387] = v_u_16[v2387] or v2387.Color
					v_u_19[v2387] = v_u_19[v2387] or v2387.Material
					v2387.Material = Enum.Material.Rock
					local v2394 = Color3.new(0.298039, 0.266667, 0.137255)
					v2387.Color = v2387.Color:Lerp(v2394, 0.9)
					v2387:AddTag("MineralVisual")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2395, p2396)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2396 then
			for _, v2397 in p2396:GetChildren() do
				if v2397:HasTag("Cleanup_Mineral") then
					v2397:Destroy()
				end
			end
		end
		for _, v2398 in p2395:GetDescendants() do
			if (v2398:IsA("BasePart") or v2398:IsA("UnionOperation")) and v2398:HasTag("MineralVisual") then
				v2398:RemoveTag("MineralVisual")
				v2398.Color = v_u_16[v2398] or v2398.Color
				v_u_16[v2398] = nil
				v2398.Material = v_u_19[v2398] or v2398.Material
				v_u_19[v2398] = nil
				v2398.Reflectance = 0
			end
		end
	end
}
v_u_926.MindBender = {
	["Id"] = "MBR",
	["Name"] = "MindBender",
	["ValueMulti"] = 175,
	["Color"] = Color3.fromRGB(255, 48, 210),
	["_AddFX"] = function(p2399, p2400, p2401)
		p2399:_RemoveFX(p2400, p2401)
		if p2401 then
			for _, v2402 in game.ServerStorage.Mutation_FX.MindBender:GetChildren() do
				local v2403 = v2402:Clone()
				v2403.Parent = p2401
				v2403.Enabled = true
				v2403:AddTag("Cleanup_MindBender")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2404, p2405)
		local function v2408(p2406)
			for _, v2407 in p2406:GetDescendants() do
				if v2407:HasTag("Cleanup_MindBender") then
					v2407:Destroy()
				end
			end
		end
		if p2405 then
			v2408(p2405)
		end
		if p2404 then
			v2408(p2404)
		end
	end
}
v_u_926.Affluent = {
	["Id"] = "AF",
	["Name"] = "Affluent",
	["ValueMulti"] = 70,
	["Color"] = Color3.fromRGB(57, 238, 255),
	["_AddFX"] = function(p2409, p2410, p2411)
		p2409:_RemoveFX(p2410, p2411)
		p2411.Material = Enum.Material.Neon
		local v2412 = Color3.new(0.14902, 0.898039, 0.898039)
		p2411.Color = p2411.Color:Lerp(v2412, 0.9)
		p2411:AddTag("AffluentVisual")
		if p2411 then
			for _, v2413 in game.ServerStorage.Mutation_FX.Affluent:GetChildren() do
				local v2414 = v2413:Clone()
				v2414.Parent = p2411
				v2414.Enabled = true
				v2414:AddTag("Cleanup_Affluent")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2415, p2416)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2419(p2417)
			for _, v2418 in p2417:GetDescendants() do
				if v2418:HasTag("Cleanup_Affluent") then
					v2418:Destroy()
				end
			end
		end
		if p2416 then
			v2419(p2416)
		end
		if p2415 then
			v2419(p2415)
		end
		if p2416:HasTag("AffluentVisual") then
			p2416:RemoveTag("AffluentVisual")
			p2416.Color = v_u_16[p2416] or p2416.Color
			v_u_16[p2416] = nil
			p2416.Material = v_u_19[p2416] or p2416.Material
			v_u_19[p2416] = nil
			p2416.Reflectance = 0
		end
	end
}
v_u_926.Fractured = {
	["Id"] = "FD",
	["Name"] = "Fractured",
	["ValueMulti"] = 92,
	["Color"] = Color3.fromRGB(255, 3, 3),
	["_AddFX"] = function(p2420, p2421, p2422)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2420:_RemoveFX(p2421, p2422)
		for _, v2423 in p2421:GetDescendants() do
			if (v2423:IsA("BasePart") or v2423:IsA("UnionOperation")) and (not v2423:HasTag("Effect") and v2423.Transparency ~= 1) then
				v_u_16[v2423] = v_u_16[v2423] or v2423.Color
				v_u_19[v2423] = v_u_19[v2423] or v2423.Material
				v2423.Material = Enum.Material.CrackedLava
				local v2424 = Color3.new(0.937255, 0.0352941, 0.0352941)
				v2423.Color = v2423.Color:Lerp(v2424, 0.9)
				v2423:AddTag("FracturedVisual")
			end
		end
		if p2422 then
			for _, v2425 in game.ServerStorage.Mutation_FX.Fractured:GetChildren() do
				local v2426 = v2425:Clone()
				v2426.Parent = p2422
				v2426.Enabled = true
				v2426:AddTag("Cleanup_Fractured")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2427, p2428)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2431(p2429)
			for _, v2430 in p2429:GetDescendants() do
				if v2430:HasTag("Cleanup_Fractured") then
					v2430:Destroy()
				end
			end
		end
		if p2428 then
			v2431(p2428)
		end
		if p2427 then
			v2431(p2427)
		end
		if p2428:HasTag("FracturedVisual") then
			p2428:RemoveTag("FracturedVisual")
			p2428.Color = v_u_16[p2428] or p2428.Color
			v_u_16[p2428] = nil
			p2428.Material = v_u_19[p2428] or p2428.Material
			v_u_19[p2428] = nil
			p2428.Reflectance = 0
		end
	end
}
v_u_926.Coin = {
	["Id"] = "CN",
	["Name"] = "Coin",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(255, 216, 0),
	["_AddFX"] = function(p2432, p2433, p2434)
		-- upvalues: (copy) v_u_19
		p2432:_RemoveFX(p2433, p2434)
		if p2434 then
			for _, v2435 in game.ServerStorage.Mutation_FX.Coin:GetChildren() do
				local v2436 = v2435:Clone()
				v2436.Parent = p2434
				v2436.Enabled = true
				v2436:AddTag("Cleanup_Coin")
			end
		end
		for _, v2437 in p2433:GetDescendants() do
			if (v2437:IsA("BasePart") or v2437:IsA("UnionOperation")) and not v2437:HasTag("Effect") then
				v_u_19[v2437] = v_u_19[v2437] or v2437.Material
				v2437.Material = Enum.Material.SmoothPlastic
				v2437:AddTag("CoinVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2438, p2439)
		-- upvalues: (copy) v_u_19
		local function v2442(p2440)
			for _, v2441 in p2440:GetDescendants() do
				if v2441:HasTag("Cleanup_Coin") then
					v2441:Destroy()
				end
			end
		end
		if p2439 then
			v2442(p2439)
		end
		if p2438 then
			v2442(p2438)
		end
		for _, v2443 in p2438:GetDescendants() do
			if (v2443:IsA("BasePart") or v2443:IsA("UnionOperation")) and v2443:HasTag("CoinVisual") then
				v2443:RemoveTag("CoinVisual")
				if v_u_19[v2443] then
					v2443.Material = v_u_19[v2443]
					v_u_19[v2443] = nil
				end
				v2443.Reflectance = 0
			end
		end
	end
}
v_u_926.Arctic = {
	["Id"] = "AT",
	["Name"] = "Arctic",
	["ValueMulti"] = 12,
	["Color"] = Color3.fromRGB(255, 255, 255),
	["_AddFX"] = function(p2444, p2445, p2446)
		p2444:_RemoveFX(p2445, p2446)
		if p2446 then
			for _, v2447 in game.ServerStorage.Mutation_FX.Arctic:GetChildren() do
				local v2448 = v2447:Clone()
				v2448.Parent = p2446
				v2448:AddTag("Cleanup_Arctic")
				if v2448:IsA("ParticleEmitter") then
					v2448.Enabled = true
				end
			end
		end
		for _, v2449 in p2445:GetDescendants() do
			if (v2449:IsA("BasePart") or v2449:IsA("UnionOperation")) and (not v2449:HasTag("Effect") and (not v2449.Transparency or v2449.Transparency ~= 1)) then
				v2449.Color = v2449.Color:Lerp(Color3.fromRGB(255, 255, 255), 0.5)
				v2449:AddTag("ArcticVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2450, p2451)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2454(p2452)
			for _, v2453 in p2452:GetDescendants() do
				if v2453:HasTag("Arctic") then
					v2453:Destroy()
				end
			end
		end
		if p2451 then
			v2454(p2451)
		end
		for _, v2455 in p2450:GetDescendants() do
			if (v2455:IsA("BasePart") or v2455:IsA("UnionOperation")) and v2455:HasTag("ArcticVisual") then
				v2455.Color = v_u_16[v2455] or v2455.Color
				v_u_16[v2455] = nil
				v2455:RemoveTag("ArcticVisual")
				if v_u_19[v2455] then
					v2455.Material = v_u_19[v2455]
					v_u_19[v2455] = nil
				end
			end
		end
	end
}
v_u_926.Ornamented = {
	["Id"] = "Orn",
	["Name"] = "Ornamented",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(34, 102, 50),
	["_AddFX"] = function(p2456, p2457, p2458)
		-- upvalues: (copy) v_u_75, (copy) v_u_16
		p2456:_RemoveFX(p2457, p2458)
		local v2459 = false
		for v2460, v2461 in p2457:GetDescendants() do
			if (v2461:IsA("BasePart") or v2461:IsA("UnionOperation")) and v2461.Transparency ~= 1 then
				if v2460 % 5 == 0 or v2459 == false then
					v2459 = true
					local v2462 = v_u_75(v2461, p2457, game.ServerStorage.Mutation_FX.Ornamented.OrnamentTemplate, 0.15, 0)
					if v2462 then
						v2462.PrimaryPart.Sparkles.Rate = math.random(2, 5) / 10
						v2462.PrimaryPart.Sparkles.Enabled = true
					end
				end
				if not v2461:HasTag("Effect") then
					v_u_16[v2461] = v_u_16[v2461] or v2461.Color
					local v2463 = Color3.new(0.121569, 0.364706, 0.176471)
					v2461.Color = v2461.Color:Lerp(v2463, 0.8)
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2464, p2465)
		-- upvalues: (copy) v_u_16
		if p2465 then
			for _, v2466 in p2465:GetChildren() do
				if v2466:HasTag("Cleanup_Ornamented") then
					v2466:Destroy()
				end
			end
		end
		for _, v2467 in p2464:GetDescendants() do
			if v2467:IsA("BasePart") or v2467:IsA("UnionOperation") then
				if v2467:HasTag("OrnamentedVisual") then
					v2467:RemoveTag("OrnamentedVisual")
					v2467.Color = v_u_16[v2467] or v2467.Color
					v_u_16[v2467] = nil
					v2467.Reflectance = 0
				elseif v2467:HasTag("OrnamentedDecal") then
					v2467:Destroy()
				end
			end
		end
	end
}
v_u_926.Glacial = {
	["Id"] = "Gla",
	["Name"] = "Glacial",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(134, 255, 251),
	["_AddFX"] = function(p2468, p2469, p2470)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2468:_RemoveFX(p2469, p2470)
		if p2470 then
			for _, v2471 in game.ServerStorage.Mutation_FX.Glacial:GetChildren() do
				local v2472 = v2471:Clone()
				v2472.Parent = p2470
				v2472.Enabled = true
				v2472:AddTag("Cleanup_Glacial")
			end
		end
		for v2473, v2474 in p2469:GetDescendants() do
			if v2474:IsA("BasePart") or v2474:IsA("UnionOperation") then
				if v2473 % 6 == 0 then
					local v2475 = game.ServerStorage.Mutation_FX.Glacial.Bits:Clone()
					v2475.Parent = v2474
					v2475.Enabled = true
					v2475.Rate = math.random(8, 25) / 20
					v2475:AddTag("Cleanup_Glacial")
					local v2476 = game.ServerStorage.Mutation_FX.Glacial.Frost:Clone()
					v2476.Parent = v2474
					v2476.Enabled = true
					v2476.Rate = math.random(8, 25) / 20
					v2476:AddTag("Cleanup_Glacial")
					local v2477 = game.ServerStorage.Mutation_FX.Glacial.Snowflake:Clone()
					v2477.Parent = v2474
					v2477.Enabled = true
					v2477.Rate = math.random(8, 25) / 20
					v2477:AddTag("Cleanup_Glacial")
				end
				if not v2474:HasTag("Effect") then
					if v2474.Transparency ~= 1 then
						v_u_16[v2474] = v_u_16[v2474] or v2474.Color
						v_u_19[v2474] = v_u_19[v2474] or v2474.Material
						v2474.Material = "Ice"
						local v2478 = Color3.new(0.454902, 1, 1)
						v2474.Color = v2474.Color:Lerp(v2478, 0.65)
					end
					v_u_19[v2474] = v_u_19[v2474] or v2474.Material
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2479, p2480)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2480 then
			for _, v2481 in p2480:GetChildren() do
				if v2481:HasTag("Cleanup_Glacial") then
					v2481:Destroy()
				end
			end
		end
		for _, v2482 in p2479:GetDescendants() do
			if v2482:IsA("BasePart") or v2482:IsA("UnionOperation") then
				if v2482:HasTag("GlacialVisual") then
					v2482:RemoveTag("GlacialVisual")
					v2482.Color = v_u_16[v2482] or v2482.Color
					v2482.Material = v_u_19[v2482] or v2482.Material
					v_u_16[v2482] = nil
					v2482.Reflectance = 0
				elseif v2482:HasTag("GlacialDecal") then
					v2482:Destroy()
				end
			end
		end
	end
}
v_u_926.Snowtouched = {
	["Id"] = "Snot",
	["Name"] = "Snowtouched",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(209, 209, 209),
	["_AddFX"] = function(p2483, p2484, p2485)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2483:_RemoveFX(p2484, p2485)
		if p2485 then
			for _, v2486 in game.ServerStorage.Mutation_FX.Snowtouched:GetChildren() do
				local v2487 = v2486:Clone()
				v2487.Parent = p2485
				v2487.Enabled = true
				v2487:AddTag("Cleanup_Snowtouched")
			end
		end
		local v2488 = false
		for v2489, v2490 in p2484:GetDescendants() do
			if (v2490:IsA("BasePart") or v2490:IsA("UnionOperation")) and not v2490:HasTag("Effect") then
				if v2490.Transparency ~= 1 then
					v_u_16[v2490] = v_u_16[v2490] or v2490.Color
					v_u_19[v2490] = v_u_19[v2490] or v2490.Material
					if v2489 % 5 == 0 or v2488 == false then
						v2490.Material = "Ice"
						local v2491 = Color3.new(0.466667, 0.886275, 1)
						v2490.Color = v2490.Color:Lerp(v2491, 0.65)
						local v2492 = game.ServerStorage.Mutation_FX.Snowtouched.Frost:Clone()
						v2492.Parent = v2490
						v2492.Rate = math.random(2, 4) / 10
						v2492.Enabled = true
						v2492:AddTag("Cleanup_Snowtouched")
						v2488 = true
					else
						local v2493 = Color3.new(1, 1, 1)
						v2490.Color = v2490.Color:Lerp(v2493, 0.65)
						local v2494 = game.ServerStorage.Mutation_FX.Snowtouched.Snow:Clone()
						v2494.Parent = v2490
						v2494.Rate = math.random(4, 12) / 10
						v2494.Enabled = true
						v2494:AddTag("Cleanup_Snowtouched")
					end
				end
				v_u_19[v2490] = v_u_19[v2490] or v2490.Material
			end
		end
	end,
	["_RemoveFX"] = function(_, p2495, p2496)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2496 then
			for _, v2497 in p2496:GetChildren() do
				if v2497:HasTag("Cleanup_Snowtouched") then
					v2497:Destroy()
				end
			end
		end
		for _, v2498 in p2495:GetDescendants() do
			if v2498:IsA("BasePart") or v2498:IsA("UnionOperation") then
				if v2498:HasTag("SnowtouchedVisual") then
					v2498:RemoveTag("SnowtouchedVisual")
					v2498.Color = v_u_16[v2498] or v2498.Color
					v2498.Material = v_u_19[v2498] or v2498.Material
					v_u_16[v2498] = nil
					v2498.Reflectance = 0
				elseif v2498:HasTag("SnowtouchedDecal") then
					v2498:Destroy()
				end
			end
		end
	end
}
v_u_926.Snowy = {
	["Id"] = "SN",
	["Name"] = "Snowy",
	["ValueMulti"] = 2,
	["Color"] = Color3.fromRGB(157, 217, 255),
	["_AddFX"] = function(p2499, p2500, p2501)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2499:_RemoveFX(p2500, p2501)
		if p2501 then
			for _, v2502 in game.ServerStorage.Mutation_FX.Snowy:GetChildren() do
				local v2503 = v2502:Clone()
				v2503.Parent = p2501
				v2503.Enabled = true
				v2503:AddTag("Cleanup_Snowy")
			end
		end
		for _, v2504 in p2500:GetDescendants() do
			if (v2504:IsA("BasePart") or v2504:IsA("UnionOperation")) and not v2504:HasTag("Effect") then
				v_u_16[v2504] = v_u_16[v2504] or v2504.Color
				v_u_19[v2504] = v_u_19[v2504] or v2504.Material
				v2504.Color = Color3.fromRGB(143, 155, 158)
				v2504.Material = Enum.Material.Neon
				v2504:AddTag("SnowyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2505, p2506)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2509(p2507)
			for _, v2508 in p2507:GetDescendants() do
				if v2508:HasTag("Cleanup_Snowy") then
					v2508:Destroy()
				end
			end
		end
		if p2506 then
			v2509(p2506)
		end
		if p2505 then
			v2509(p2505)
		end
		for _, v2510 in p2505:GetDescendants() do
			if (v2510:IsA("BasePart") or v2510:IsA("UnionOperation")) and v2510:HasTag("SnowyVisual") then
				v2510:RemoveTag("SnowyVisual")
				v2510.Color = v_u_16[v2510] or v2510.Color
				v_u_16[v2510] = nil
				if v_u_19[v2510] then
					v2510.Material = v_u_19[v2510]
					v_u_19[v2510] = nil
				end
				v2510.Reflectance = 0
			end
		end
	end
}
v_u_926.Eggnog = {
	["Id"] = "EG",
	["Name"] = "Eggnog",
	["ValueMulti"] = 8,
	["Color"] = Color3.fromRGB(255, 188, 144),
	["_AddFX"] = function(p2511, p2512, p2513)
		p2511:_RemoveFX(p2512, p2513)
		if p2513 then
			for _, v2514 in game.ServerStorage.Mutation_FX.Eggnog:GetChildren() do
				local v2515 = v2514:Clone()
				v2515.Parent = p2513
				v2515.Enabled = true
				v2515:AddTag("Cleanup_Eggnog")
				v2515:AddTag("Effect")
			end
		end
		for _, v2516 in p2512:GetDescendants() do
			if (v2516:IsA("BasePart") or v2516:IsA("UnionOperation")) and not v2516:HasTag("Effect") then
				v2516:AddTag("EggnogVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2517, p2518)
		-- upvalues: (copy) v_u_19
		if p2518 then
			for _, v2519 in p2518:GetChildren() do
				if v2519:HasTag("Cleanup_Eggnog") then
					v2519:Destroy()
				end
			end
		end
		for _, v2520 in p2517:GetDescendants() do
			if (v2520:IsA("BasePart") or v2520:IsA("UnionOperation")) and v2520:HasTag("EggnogVisual") then
				v2520:RemoveTag("EggnogVisual")
				local v2521 = v_u_19[v2520]
				if v2521 then
					v2520.Material = v2521
					v_u_19[v2520] = nil
				end
			end
		end
	end
}
v_u_926.Blizzard = {
	["Id"] = "BD",
	["Name"] = "Blizzard",
	["ValueMulti"] = 40,
	["Color"] = Color3.fromRGB(0, 170, 255),
	["_AddFX"] = function(p2522, p2523, p2524)
		-- upvalues: (copy) v_u_153, (copy) v_u_19, (copy) v_u_20, (copy) v_u_16
		p2522:_RemoveFX(p2523, p2524)
		v_u_153(p2522, p2523, p2524, 0.4)
		if p2524 then
			for _, v2525 in game.ServerStorage.Mutation_FX.Blizzard:GetChildren() do
				local v2526 = v2525:Clone()
				v2526.Parent = p2524
				v2526:AddTag("Cleanup_Blizzard")
				if v2526:IsA("ParticleEmitter") then
					v2526.Enabled = true
				end
			end
		end
		for _, v2527 in p2523:GetChildren() do
			if v2527:IsA("BasePart") or v2527:IsA("UnionOperation") then
				v2527.Reflectance = 0.35
			end
		end
		for _, v2528 in p2523:GetDescendants() do
			if (v2528:IsA("BasePart") or v2528:IsA("UnionOperation")) and (not v2528:HasTag("Effect") and (not v2528.Transparency or v2528.Transparency ~= 1)) then
				v_u_19[v2528] = v_u_19[v2528] or v2528.Material
				v2528.Material = Enum.Material.Plastic
				v_u_20[v2528] = v_u_20[v2528] or v2528.MaterialVariant
				v2528.MaterialVariant = "Studs 2x2 Plastic Metal"
				v_u_16[v2528] = v_u_16[v2528] or v2528.Color
				v2528.Color = v2528.Color:Lerp(Color3.fromRGB(0, 255, 255), 0.5)
				v2528:AddTag("BlizzardVisual")
			end
		end
	end,
	["_RemoveFX"] = function(p2529, p2530, p2531)
		-- upvalues: (copy) v_u_162, (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		v_u_162(p2529, p2530, p2531)
		local function v2534(p2532)
			for _, v2533 in p2532:GetDescendants() do
				if v2533:HasTag("Cleanup_Blizzard") then
					v2533:Destroy()
				end
			end
		end
		if p2531 then
			v2534(p2531)
		end
		if p2530 then
			v2534(p2530)
		end
		for _, v2535 in p2530:GetDescendants() do
			if v2535:IsA("BasePart") or v2535:IsA("UnionOperation") then
				v2535.Reflectance = 0
				if v2535:HasTag("BlizzardVisual") then
					v2535.Color = v_u_16[v2535] or v2535.Color
					v_u_16[v2535] = nil
					v2535:RemoveTag("BlizzardVisual")
					v2535.MaterialVariant = v_u_20[v2535] or v2535.MaterialVariant
					v_u_20[v2535] = nil
					if v_u_19[v2535] then
						v2535.Material = v_u_19[v2535]
						v_u_19[v2535] = nil
					end
				end
			end
		end
	end
}
v_u_926.Opulent = {
	["Id"] = "OP",
	["Name"] = "Opulent",
	["ValueMulti"] = 5,
	["Color"] = Color3.fromRGB(255, 67, 255),
	["_AddFX"] = function(p2536, p2537, p2538)
		-- upvalues: (copy) v_u_16
		p2536:_RemoveFX(p2537, p2538)
		if p2538 then
			for _, v2539 in game.ServerStorage.Mutation_FX.Opulent:GetChildren() do
				local v2540 = v2539:Clone()
				v2540.Parent = p2538
				v2540:AddTag("Cleanup_Opulent")
			end
		end
		for _, v2541 in p2537:GetDescendants() do
			if (v2541:IsA("BasePart") or v2541:IsA("UnionOperation")) and (not v2541:HasTag("Effect") and (not v2541.Transparency or v2541.Transparency ~= 1)) then
				v_u_16[v2541] = v_u_16[v2541] or v2541.Color
				v2541.Color = v2541.Color:Lerp(Color3.fromRGB(247, 15, 255), 0.5)
				v2541:AddTag("OpulentVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2542, p2543)
		-- upvalues: (copy) v_u_16, (copy) v_u_20, (copy) v_u_19
		if p2543 then
			for _, v2544 in p2543:GetChildren() do
				if v2544:HasTag("Cleanup_Opulent") then
					v2544:Destroy()
				end
			end
		end
		for _, v2545 in p2542:GetDescendants() do
			if v2545:IsA("BasePart") or v2545:IsA("UnionOperation") then
				v2545.Reflectance = 0
				if v2545:HasTag("OpulentVisual") then
					v2545.Color = v_u_16[v2545] or v2545.Color
					v_u_16[v2545] = nil
					v2545:RemoveTag("OpulentVisual")
					v2545.MaterialVariant = v_u_20[v2545] or v2545.MaterialVariant
					v_u_20[v2545] = nil
					if v_u_19[v2545] then
						v2545.Material = v_u_19[v2545]
						v_u_19[v2545] = nil
					end
				end
			end
		end
	end
}
v_u_926.Gale = {
	["Id"] = "GA",
	["Name"] = "Gale",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(138, 149, 167),
	["_AddFX"] = function(p2546, p2547, p2548)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2546:_RemoveFX(p2547, p2548)
		if p2548 then
			for _, v2549 in game.ServerStorage.Mutation_FX.Gale:GetChildren() do
				local v2550 = v2549:Clone()
				v2550.Parent = p2548
				v2550.Enabled = true
				v2550:AddTag("Cleanup_Gale")
			end
		end
		for v2551, v2552 in p2547:GetDescendants() do
			if v2552:IsA("BasePart") or v2552:IsA("UnionOperation") then
				if v2551 % 6 == 0 then
					local v2553 = game.ServerStorage.Mutation_FX.Gale.Bits:Clone()
					v2553.Parent = v2552
					v2553.Enabled = true
					v2553.Rate = math.random(8, 25) / 20
					v2553:AddTag("Cleanup_Gale")
					local v2554 = game.ServerStorage.Mutation_FX.Gale.Frost:Clone()
					v2554.Parent = v2552
					v2554.Enabled = true
					v2554.Rate = math.random(8, 25) / 20
					v2554:AddTag("Cleanup_Gale")
					local v2555 = game.ServerStorage.Mutation_FX.Gale.Snowflake:Clone()
					v2555.Parent = v2552
					v2555.Enabled = true
					v2555.Rate = math.random(8, 25) / 20
					v2555:AddTag("Cleanup_Gale")
				end
				if not v2552:HasTag("Effect") then
					if v2552.Transparency ~= 1 then
						v_u_16[v2552] = v_u_16[v2552] or v2552.Color
						v_u_19[v2552] = v_u_19[v2552] or v2552.Material
						v2552.Material = "Ice"
						local v2556 = Color3.new(0.521569, 0.568627, 0.603922)
						v2552.Color = v2552.Color:Lerp(v2556, 0.65)
					end
					v_u_19[v2552] = v_u_19[v2552] or v2552.Material
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2557, p2558)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2558 then
			for _, v2559 in p2558:GetChildren() do
				if v2559:HasTag("Cleanup_Glacial") then
					v2559:Destroy()
				end
			end
		end
		for _, v2560 in p2557:GetDescendants() do
			if v2560:IsA("BasePart") or v2560:IsA("UnionOperation") then
				if v2560:HasTag("GlacialVisual") then
					v2560:RemoveTag("GlacialVisual")
					v2560.Color = v_u_16[v2560] or v2560.Color
					v2560.Material = v_u_19[v2560] or v2560.Material
					v_u_16[v2560] = nil
					v2560.Reflectance = 0
				elseif v2560:HasTag("GlacialDecal") then
					v2560:Destroy()
				end
			end
		end
	end
}
v_u_926.Sleepy = {
	["Id"] = "SY",
	["Name"] = "Sleepy",
	["ValueMulti"] = 3,
	["Color"] = Color3.fromRGB(139, 139, 139),
	["_AddFX"] = function(p2561, p2562, p2563)
		p2561:_RemoveFX(p2562, p2563)
		if p2563 then
			for _, v2564 in game.ServerStorage.Mutation_FX.Sleepy:GetChildren() do
				local v2565 = v2564:Clone()
				v2565.Parent = p2563
				v2565.Enabled = true
				v2565:AddTag("Cleanup_Sleepy")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p2566)
		if p2566 then
			for _, v2567 in p2566:GetChildren() do
				if v2567:HasTag("Cleanup_Sleepy") then
					v2567:Destroy()
				end
			end
		end
	end
}
v_u_926.Firework = {
	["Id"] = "FW",
	["Name"] = "Firework",
	["ValueMulti"] = 26,
	["Color"] = Color3.fromRGB(255, 85, 0),
	["_AddFX"] = function(p2568, p2569, p2570)
		p2568:_RemoveFX(p2569, p2570)
		if p2570 then
			for _, v2571 in game.ServerStorage.Mutation_FX.Firework:GetChildren() do
				local v2572 = v2571:Clone()
				v2572.Parent = p2570
				v2572.Enabled = true
				v2572:AddTag("Cleanup_Firework")
			end
		end
	end,
	["_RemoveFX"] = function(_, _, p2573)
		if p2573 then
			for _, v2574 in p2573:GetChildren() do
				if v2574:HasTag("Cleanup_Firework") then
					v2574:Destroy()
				end
			end
		end
	end
}
v_u_926.Fiery = {
	["Id"] = "fry",
	["Name"] = "Fiery",
	["ValueMulti"] = 2,
	["Color"] = Color3.fromRGB(255, 115, 0),
	["_AddFX"] = function(p2575, p2576, p2577)
		-- upvalues: (copy) v_u_16
		p2575:_RemoveFX(p2576, p2577)
		local v2578 = game.ServerStorage.Mutation_FX.Fiery:GetChildren()
		local v2579 = {
			"Neon orange",
			"Br. yellowish orange",
			"Bright orange",
			"Bright red",
			"Bright yellow"
		}
		if p2577 then
			for _, v2580 in v2578 do
				local v2581 = v2580:Clone()
				v2581.Parent = p2577
				v2581.Enabled = true
				v2581:AddTag("Cleanup_Fiery")
			end
		end
		local v2582 = 0
		for _, v2583 in p2576:GetDescendants() do
			if v2583:IsA("BasePart") then
				v2582 = v2582 + 1
				v_u_16[v2583] = v_u_16[v2583] or v2583.Color
				v2583.Color = v2583.Color:Lerp(BrickColor.new(v2579[math.random(1, #v2579)]).Color, 0.75)
				v2583:AddTag("FieryVisual")
				if v2583 ~= p2577 and (v2582 % 2 == 0 and #v2578 > 0) then
					local v2584 = v2578[math.random(1, #v2578)]:Clone()
					v2584.Parent = v2583
					v2584.Enabled = true
					v2584:AddTag("Cleanup_Fiery")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2585, p2586)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2589(p2587)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v2588 in p2587:GetDescendants() do
				if v2588:HasTag("Cleanup_Fiery") then
					v2588:Destroy()
				end
				if v2588:HasTag("FieryVisual") then
					v2588.Color = v_u_16[v2588] or v2588.Color
					v_u_16[v2588] = nil
					v2588:RemoveTag("FieryVisual")
					if v_u_19[v2588] then
						v2588.Material = v_u_19[v2588]
						v_u_19[v2588] = nil
					end
				end
			end
		end
		if p2586 then
			v2589(p2586)
		end
		if p2585 then
			v2589(p2585)
		end
	end
}
v_u_926.Fierywork = {
	["Id"] = "fw",
	["Name"] = "Fierywork",
	["ValueMulti"] = 30,
	["Color"] = Color3.fromRGB(255, 234, 0),
	["_AddFX"] = function(p2590, p2591, p2592)
		-- upvalues: (copy) v_u_19, (copy) v_u_16
		p2590:_RemoveFX(p2591, p2592)
		local v2593 = game.ServerStorage.Mutation_FX.Fierywork:GetChildren()
		local v2594 = {
			"Neon orange",
			"Br. yellowish orange",
			"Bright orange",
			"Bright red",
			"Bright yellow"
		}
		if p2592 then
			for _, v2595 in v2593 do
				local v2596 = v2595:Clone()
				v2596.Parent = p2592
				v2596.Enabled = true
				v2596:AddTag("Cleanup_Fierywork")
			end
		end
		local v2597 = 0
		for _, v2598 in p2591:GetDescendants() do
			if v2598:IsA("BasePart") then
				v2597 = v2597 + 1
				v_u_19[v2598] = v_u_19[v2598] or v2598.Material
				v_u_16[v2598] = v_u_16[v2598] or v2598.Color
				v2598.Color = v2598.Color:Lerp(BrickColor.new(v2594[math.random(1, #v2594)]).Color, 0.5)
				v2598.Material = Enum.Material.Neon
				v2598:AddTag("FieryworkVisual")
				if v2598 ~= p2592 and (v2597 % 2 == 0 and #v2593 > 0) then
					local v2599 = v2593[math.random(1, #v2593)]:Clone()
					v2599.Parent = v2598
					v2599.Enabled = true
					v2599:AddTag("Cleanup_Fierywork")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2600, p2601)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2604(p2602)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v2603 in p2602:GetDescendants() do
				if v2603:HasTag("Cleanup_Fierywork") then
					v2603:Destroy()
				end
				if v2603:HasTag("FieryworkVisual") then
					v2603.Color = v_u_16[v2603] or v2603.Color
					v_u_16[v2603] = nil
					v2603:RemoveTag("FieryworkVisual")
					if v_u_19[v2603] then
						v2603.Material = v_u_19[v2603]
						v_u_19[v2603] = nil
					end
				end
			end
		end
		if p2601 then
			v2604(p2601)
		end
		if p2600 then
			v2604(p2600)
		end
	end
}
v_u_926.Whalebound = {
	["Id"] = "wh",
	["Name"] = "Whalebound",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(41, 73, 218),
	["_AddFX"] = function(p2605, p2606, p2607)
		p2605:_RemoveFX(p2606, p2607)
		if p2607 then
			for _, v2608 in game.ServerStorage.Mutation_FX.Whalebound:GetChildren() do
				local v2609 = v2608:Clone()
				v2609.Parent = p2607
				v2609.Enabled = true
				v2609:AddTag("Cleanup_Whalebound")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2610, p2611)
		local function v2614(p2612)
			for _, v2613 in p2612:GetDescendants() do
				if v2613:HasTag("Cleanup_Whalebound") then
					v2613:Destroy()
				end
			end
		end
		if p2611 then
			v2614(p2611)
		end
		if p2610 then
			v2614(p2610)
		end
	end
}
v_u_926.Festive = {
	["Id"] = "FE",
	["Name"] = "Festive",
	["ValueMulti"] = 24,
	["Color"] = Color3.fromRGB(34, 102, 50),
	["_AddFX"] = function(p2615, p2616, p2617)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2615:_RemoveFX(p2616, p2617)
		if p2617 then
			for _, v2618 in game.ServerStorage.Mutation_FX.Festive:GetChildren() do
				local v2619 = v2618:Clone()
				v2619.Parent = p2617
				if v2619:IsA("ParticleEmitter") then
					v2619.Enabled = true
				end
				v2619:AddTag("Cleanup_Festive")
				v2619:AddTag("Effect")
			end
		end
		local v2620 = {}
		for _, v2621 in p2616:GetDescendants() do
			if (v2621:IsA("BasePart") or v2621:IsA("UnionOperation")) and (not v2621:HasTag("Effect") and v2621.Transparency < 1) then
				table.insert(v2620, v2621)
			end
		end
		if #v2620 ~= 0 then
			table.sort(v2620, function(p2622, p2623)
				return p2622.Position.Y < p2623.Position.Y
			end)
			local v2624 = #v2620
			local v2625 = v2624 * 0.33
			local v2626 = math.floor(v2625)
			local v2627 = v2624 * 0.66
			local v2628 = math.floor(v2627)
			local v2629 = Color3.fromRGB(10, 60, 10)
			local v2630 = Color3.fromRGB(20, 120, 20)
			local v2631 = Color3.fromRGB(40, 180, 40)
			for v2632, v2633 in v2620 do
				if v2633:IsA("UnionOperation") then
					v2633.UsePartColor = true
				end
				v_u_16[v2633] = v_u_16[v2633] or v2633.Color
				v_u_19[v2633] = v_u_19[v2633] or v2633.Material
				v2633.Material = Enum.Material.Metal
				v2633.Reflectance = 0.1
				if v2632 <= v2626 then
					v2633.Color = v2629
				elseif v2632 <= v2628 then
					v2633.Color = v2630
				else
					v2633.Color = v2631
				end
				v2633:AddTag("FestiveVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2634, p2635)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2638(p2636)
			for _, v2637 in p2636:GetDescendants() do
				if v2637:HasTag("Cleanup_Festive") then
					v2637:Destroy()
				end
			end
		end
		if p2635 then
			v2638(p2635)
		end
		if p2634 then
			v2638(p2634)
		end
		for _, v2639 in p2634:GetDescendants() do
			if (v2639:IsA("BasePart") or v2639:IsA("UnionOperation")) and v2639:HasTag("FestiveVisual") then
				v2639.Color = v_u_16[v2639] or v2639.Color
				v_u_16[v2639] = nil
				if v_u_19[v2639] then
					v2639.Material = v_u_19[v2639]
					v_u_19[v2639] = nil
				end
				v2639.Reflectance = 0
				v2639:RemoveTag("FestiveVisual")
			end
		end
	end
}
v_u_926.Clockwork = {
	["Id"] = "cw",
	["Name"] = "Clockwork",
	["ValueMulti"] = 15,
	["Color"] = Color3.fromRGB(170, 128, 0),
	["_AddFX"] = function(p2640, p2641, p2642)
		p2640:_RemoveFX(p2641, p2642)
		if p2642 then
			for _, v2643 in game.ServerStorage.Mutation_FX.Clockwork:GetChildren() do
				local v2644 = v2643:Clone()
				v2644.Parent = p2642
				v2644.Enabled = true
				v2644:AddTag("Cleanup_Clockwork")
				v2644:AddTag("Effect")
			end
		end
		for _, v2645 in p2641:GetDescendants() do
			if (v2645:IsA("BasePart") or v2645:IsA("UnionOperation")) and not v2645:HasTag("Effect") then
				v2645:AddTag("ClockworkVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2646, p2647)
		-- upvalues: (copy) v_u_19
		if p2647 then
			for _, v2648 in p2647:GetChildren() do
				if v2648:HasTag("Cleanup_Clockwork") then
					v2648:Destroy()
				end
			end
		end
		for _, v2649 in p2646:GetDescendants() do
			if (v2649:IsA("BasePart") or v2649:IsA("UnionOperation")) and v2649:HasTag("ClockworkVisual") then
				v2649:RemoveTag("ClockworkVisual")
				local v2650 = v_u_19[v2649]
				if v2650 then
					v2649.Material = v2650
					v_u_19[v2649] = nil
				end
			end
		end
	end
}
v_u_926.Whimsical = {
	["Id"] = "WL",
	["Name"] = "Whimsical",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(255, 255, 0),
	["_AddFX"] = function(p2651, p2652, p2653)
		p2651:_RemoveFX(p2652, p2653)
		if p2653 then
			for _, v2654 in game.ServerStorage.Mutation_FX.Whimsical:GetChildren() do
				local v2655 = v2654:Clone()
				v2655.Parent = p2653
				v2655.Enabled = true
				v2655:AddTag("Cleanup_Whimsicalt")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2656, p2657)
		local function v2660(p2658)
			for _, v2659 in p2658:GetDescendants() do
				if v2659:HasTag("Cleanup_Whimsical") then
					v2659:Destroy()
				end
			end
		end
		if p2657 then
			v2660(p2657)
		end
		if p2656 then
			v2660(p2656)
		end
	end
}
v_u_926.Ash = {
	["Id"] = "AH",
	["Name"] = "Ash",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(40, 40, 40),
	["_AddFX"] = function(p2661, p2662, p2663)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2661:_RemoveFX(p2662, p2663)
		if p2663 then
			for _, v2664 in game.ServerStorage.Mutation_FX.Ash:GetChildren() do
				local v2665 = v2664:Clone()
				v2665.Parent = p2663
				v2665.Enabled = true
				v2665:AddTag("Cleanup_Ash")
			end
		end
		for _, v2666 in p2662:GetDescendants() do
			if (v2666:IsA("BasePart") or v2666:IsA("UnionOperation")) and not v2666:HasTag("Effect") then
				v_u_16[v2666] = v_u_16[v2666] or v2666.Color
				v2666.Color = Color3.fromRGB(40, 40, 40)
				v_u_19[v2666] = v_u_19[v2666] or v2666.Material
				v2666.Material = Enum.Material.Slate
				v2666.Reflectance = 0.05
				v2666:AddTag("AshVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2667, p2668)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2671(p2669)
			for _, v2670 in p2669:GetDescendants() do
				if v2670:HasTag("Cleanup_Ash") then
					v2670:Destroy()
				end
			end
		end
		if p2668 then
			v2671(p2668)
		end
		if p2667 then
			v2671(p2667)
		end
		for _, v2672 in p2667:GetDescendants() do
			if (v2672:IsA("BasePart") or v2672:IsA("UnionOperation")) and v2672:HasTag("AshVisual") then
				v2672.Reflectance = 0
				v2672.Color = v_u_16[v2672] or v2672.Color
				v_u_16[v2672] = nil
				v2672:RemoveTag("AshVisual")
				if v_u_19[v2672] then
					v2672.Material = v_u_19[v2672]
					v_u_19[v2672] = nil
				end
			end
		end
	end
}
v_u_926.Haze = {
	["Id"] = "HZ",
	["Name"] = "Haze",
	["ValueMulti"] = 6,
	["Color"] = Color3.fromRGB(70, 70, 70),
	["_AddFX"] = function(p2673, p2674, p2675)
		-- upvalues: (copy) v_u_16
		p2673:_RemoveFX(p2674, p2675)
		if p2675 then
			for _, v2676 in game.ServerStorage.Mutation_FX.Haze:GetChildren() do
				local v2677 = v2676:Clone()
				v2677.Parent = p2675
				v2677.Enabled = true
				v2677:AddTag("Cleanup_Haze")
				v2677:AddTag("Effect")
			end
		end
		for _, v2678 in p2674:GetDescendants() do
			if (v2678:IsA("BasePart") or v2678:IsA("UnionOperation")) and not v2678:HasTag("Effect") then
				v_u_16[v2678] = v_u_16[v2678] or v2678.Color
				v2678.Color = Color3.fromRGB(70, 70, 70)
				v2678:AddTag("HazeVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2679, p2680)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		if p2680 then
			for _, v2681 in p2680:GetChildren() do
				if v2681:HasTag("Cleanup_Haze") then
					v2681:Destroy()
				end
			end
		end
		for _, v2682 in p2679:GetDescendants() do
			if (v2682:IsA("BasePart") or v2682:IsA("UnionOperation")) and v2682:HasTag("HazeVisual") then
				v2682.Color = v_u_16[v2682] or v2682.Color
				v_u_16[v2682] = nil
				v2682:RemoveTag("HazeVisual")
				local v2683 = v_u_19[v2682]
				if v2683 then
					v2682.Material = v2683
					v_u_19[v2682] = nil
				end
			end
		end
	end
}
v_u_926.Smoldering = {
	["Id"] = "SM",
	["Name"] = "Smoldering",
	["ValueMulti"] = 66,
	["Color"] = Color3.fromRGB(170, 0, 0),
	["_AddFX"] = function(p2684, p2685, p2686)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2684:_RemoveFX(p2685, p2686)
		local v2687 = game.ServerStorage.Mutation_FX.Smoldering:GetChildren()
		local v2688 = {
			Color3.fromRGB(255, 255, 0),
			Color3.fromRGB(255, 170, 0),
			Color3.fromRGB(255, 85, 0),
			Color3.fromRGB(255, 0, 0),
			Color3.fromRGB(170, 0, 0)
		}
		if p2686 then
			for _, v2689 in v2687 do
				local v2690 = v2689:Clone()
				v2690.Parent = p2686
				v2690.Enabled = true
				v2690:AddTag("Cleanup_Smoldering")
			end
		end
		local v2691 = 0
		for _, v2692 in p2685:GetDescendants() do
			if v2692:IsA("BasePart") then
				v2691 = v2691 + 1
				v_u_16[v2692] = v_u_16[v2692] or v2692.Color
				v_u_19[v2692] = v_u_19[v2692] or v2692.Material
				v2692.Color = v2688[math.random(1, #v2688)]
				v2692.Material = Enum.Material.Neon
				v2692:AddTag("SmolderingVisual")
				if v2691 % 3 == 0 then
					local v2693 = Instance.new("Attachment", v2692)
					local v2694 = Instance.new("Attachment", v2692)
					v2693.Position = Vector3.new(0, 0.15, 0)
					v2694.Position = Vector3.new(0, -0.15, 0)
					v2693:AddTag("Cleanup_Smoldering")
					v2694:AddTag("Cleanup_Smoldering")
					local v2695 = Instance.new("Trail")
					v2695.Color = ColorSequence.new(Color3.fromRGB(255, 0, 0))
					v2695.LightInfluence = 0
					v2695.Brightness = 3
					v2695.Attachment0 = v2693
					v2695.Attachment1 = v2694
					v2695.Lifetime = 0.3
					v2695.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0), NumberSequenceKeypoint.new(1, 1) })
					v2695.WidthScale = NumberSequence.new(2)
					v2695.Parent = v2692
					v2695:AddTag("Cleanup_Smoldering")
				end
				if v2692 ~= p2686 and #v2687 > 0 then
					local v2696 = v2687[math.random(1, #v2687)]:Clone()
					v2696.Parent = v2692
					v2696.Enabled = true
					v2696:AddTag("Cleanup_Smoldering")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2697, p2698)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		local function v2701(p2699)
			-- upvalues: (ref) v_u_16, (ref) v_u_19
			for _, v2700 in p2699:GetDescendants() do
				if v2700:HasTag("Cleanup_Smoldering") then
					v2700:Destroy()
				end
				if v2700:HasTag("SmolderingVisual") then
					v2700.Color = v_u_16[v2700] or v2700.Color
					v_u_16[v2700] = nil
					v2700:RemoveTag("SmolderingVisual")
					if v_u_19[v2700] then
						v2700.Material = v_u_19[v2700]
						v_u_19[v2700] = nil
					end
				end
			end
		end
		if p2698 then
			v2701(p2698)
		end
		if p2697 then
			v2701(p2697)
		end
	end
}
v_u_926.Gummy = {
	["Id"] = "GU",
	["Name"] = "Gummy",
	["ValueMulti"] = 4,
	["Color"] = Color3.fromRGB(255, 80, 80),
	["_AddFX"] = function(p2702, p2703, p2704)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2702:_RemoveFX(p2703, p2704)
		local v2705 = p2703:FindFirstChild("Item_Seed") and (p2703.Item_Seed.Value or 1) or 1
		local v2706 = Random.new(v2705)
		local v2707 = {
			Color3.fromRGB(80, 170, 255),
			Color3.fromRGB(80, 255, 120),
			Color3.fromRGB(255, 170, 80),
			Color3.fromRGB(190, 100, 255),
			Color3.fromRGB(255, 80, 80),
			Color3.fromRGB(255, 230, 90)
		}
		local v2708 = v2707[v2706:NextInteger(1, #v2707)]
		OriginalTransparency = OriginalTransparency or {}
		for _, v2709 in p2703:GetDescendants() do
			if (v2709:IsA("BasePart") or v2709:IsA("UnionOperation")) and not v2709:HasTag("Effect") then
				v_u_16[v2709] = v_u_16[v2709] or v2709.Color
				v_u_19[v2709] = v_u_19[v2709] or v2709.Material
				OriginalTransparency[v2709] = OriginalTransparency[v2709] or v2709.Transparency
				v2709.Color = v2708
				v2709.Material = Enum.Material.Glass
				v2709.Transparency = 0.35
				v2709:AddTag("GummyVisual")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2710, _)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		OriginalTransparency = OriginalTransparency or {}
		for _, v2711 in p2710:GetDescendants() do
			if (v2711:IsA("BasePart") or v2711:IsA("UnionOperation")) and v2711:HasTag("GummyVisual") then
				v2711.Color = v_u_16[v2711] or v2711.Color
				v_u_16[v2711] = nil
				if v_u_19[v2711] then
					v2711.Material = v_u_19[v2711]
					v_u_19[v2711] = nil
				end
				v2711.Transparency = OriginalTransparency[v2711] or 0
				OriginalTransparency[v2711] = nil
				v2711:RemoveTag("GummyVisual")
			end
		end
	end
}
v_u_926.Floral = {
	["Id"] = "FRL",
	["Name"] = "Floral",
	["ValueMulti"] = 25,
	["Color"] = Color3.fromRGB(255, 182, 193),
	["_AddFX"] = function(p2712, p2713, p2714)
		-- upvalues: (copy) v_u_16
		p2712:_RemoveFX(p2713, p2714)
		local v2715 = p2713:FindFirstChild("Item_Seed") and (p2713.Item_Seed.Value or 1) or 1
		local v2716 = Random.new(v2715)
		local v2717 = game.ServerStorage.Mutation_FX.Floral:GetChildren()
		local v2718 = {
			Color3.fromRGB(255, 214, 224),
			Color3.fromRGB(255, 196, 214),
			Color3.fromRGB(255, 182, 193),
			Color3.fromRGB(245, 168, 200),
			Color3.fromRGB(232, 162, 196),
			Color3.fromRGB(220, 150, 190)
		}
		if p2714 then
			for _, v2719 in v2717 do
				local v2720 = v2719:Clone()
				v2720.Parent = p2714
				if v2720:IsA("ParticleEmitter") then
					v2720.Enabled = true
				end
				v2720:AddTag("Cleanup_Floral")
			end
		end
		for _, v2721 in p2713:GetDescendants() do
			if (v2721:IsA("BasePart") or v2721:IsA("UnionOperation")) and (not v2721:HasTag("Effect") and (v2721.Transparency < 1 and v2716:NextNumber() <= 1)) then
				v_u_16[v2721] = v_u_16[v2721] or v2721.Color
				v2721.Color = v2718[v2716:NextInteger(1, #v2718)]
				v2721:AddTag("FloralVisual")
				if v2721 ~= p2714 and #v2717 > 0 then
					local v2722 = v2717[v2716:NextInteger(1, #v2717)]:Clone()
					v2722.Parent = v2721
					if v2722:IsA("ParticleEmitter") then
						v2722.Enabled = true
					end
					v2722:AddTag("Cleanup_Floral")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2723, p2724)
		-- upvalues: (copy) v_u_16
		local function v2727(p2725)
			for _, v2726 in p2725:GetDescendants() do
				if v2726:HasTag("Cleanup_Floral") then
					v2726:Destroy()
				end
			end
		end
		if p2724 then
			v2727(p2724)
		end
		if p2723 then
			v2727(p2723)
		end
		for _, v2728 in p2723:GetDescendants() do
			if (v2728:IsA("BasePart") or v2728:IsA("UnionOperation")) and v2728:HasTag("FloralVisual") then
				v2728.Color = v_u_16[v2728] or v2728.Color
				v_u_16[v2728] = nil
				v2728:RemoveTag("FloralVisual")
			end
		end
	end
}
v_u_926.Blossoming = {
	["Id"] = "BM",
	["Name"] = "Blossoming",
	["ValueMulti"] = 50,
	["Color"] = Color3.fromRGB(236, 128, 255),
	["_AddFX"] = function(p2729, p2730, p2731)
		-- upvalues: (copy) v_u_16
		p2729:_RemoveFX(p2730, p2731)
		local v2732 = p2730:FindFirstChild("Item_Seed") and (p2730.Item_Seed.Value or 1) or 1
		local v2733 = Random.new(v2732)
		local v2734 = game.ServerStorage.Mutation_FX.Blossoming:GetChildren()
		local v2735 = { Color3.fromRGB(105, 158, 255), Color3.fromRGB(236, 128, 255), Color3.fromRGB(255, 129, 211) }
		for _, v2736 in p2730:GetDescendants() do
			if (v2736:IsA("BasePart") or v2736:IsA("UnionOperation")) and (not v2736:HasTag("Effect") and v2736.Transparency < 1) then
				v_u_16[v2736] = v_u_16[v2736] or v2736.Color
				v2736.Color = v2735[v2733:NextInteger(1, #v2735)]
				v2736:AddTag("BlossomingVisual")
				if #v2734 > 0 then
					local v2737 = v2734[v2733:NextInteger(1, #v2734)]:Clone()
					v2737.Parent = v2736
					if v2737:IsA("ParticleEmitter") then
						v2737.Enabled = true
					end
					v2737:AddTag("Cleanup_Blossoming")
				end
			end
		end
	end,
	["_RemoveFX"] = function(_, p2738, p2739)
		-- upvalues: (copy) v_u_16
		local function v2742(p2740)
			for _, v2741 in p2740:GetDescendants() do
				if v2741:HasTag("Cleanup_Blossoming") then
					v2741:Destroy()
				end
			end
		end
		if p2739 then
			v2742(p2739)
		end
		if p2738 then
			v2742(p2738)
		end
		for _, v2743 in p2738:GetDescendants() do
			if (v2743:IsA("BasePart") or v2743:IsA("UnionOperation")) and v2743:HasTag("BlossomingVisual") then
				v2743.Color = v_u_16[v2743] or v2743.Color
				v_u_16[v2743] = nil
				v2743:RemoveTag("BlossomingVisual")
			end
		end
	end
}
v_u_926.Candy = {
	["Id"] = "CD",
	["Name"] = "Candy",
	["ValueMulti"] = 10,
	["Color"] = Color3.fromRGB(255, 89, 89),
	["_AddFX"] = function(p2744, p2745, p2746)
		-- upvalues: (copy) v_u_16
		p2744:_RemoveFX(p2745, p2746)
		local v2747 = p2745:FindFirstChild("Item_Seed") and (p2745.Item_Seed.Value or 1) or 1
		local v2748 = Random.new(v2747)
		local v2749 = game.ServerStorage.Mutation_FX.Candy:GetChildren()
		local v2750 = { Color3.fromRGB(248, 248, 248), Color3.fromRGB(255, 89, 89) }
		if p2746 then
			for _, v2751 in v2749 do
				local v2752 = v2751:Clone()
				v2752.Parent = p2746
				if v2752:IsA("ParticleEmitter") then
					v2752.Enabled = true
				end
				v2752:AddTag("Cleanup_Candy")
			end
		end
		local v2753 = {}
		for _, v2754 in p2745:GetDescendants() do
			if (v2754:IsA("BasePart") or v2754:IsA("UnionOperation")) and (not v2754:HasTag("Effect") and v2754.Transparency < 1) then
				table.insert(v2753, v2754)
			end
		end
		table.sort(v2753, function(p2755, p2756)
			return p2755.Position.Y < p2756.Position.Y
		end)
		for v2757, v2758 in v2753 do
			v_u_16[v2758] = v_u_16[v2758] or v2758.Color
			v2758.Color = v2750[v2757 % 2 + 1]
			v2758:AddTag("CandyVisual")
			if v2758 ~= p2746 and (#v2749 > 0 and v2748:NextNumber() <= 0.5) then
				local v2759 = v2749[v2748:NextInteger(1, #v2749)]:Clone()
				v2759.Parent = v2758
				if v2759:IsA("ParticleEmitter") then
					v2759.Enabled = true
				end
				v2759:AddTag("Cleanup_Candy")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2760, p2761)
		-- upvalues: (copy) v_u_16
		local function v2764(p2762)
			for _, v2763 in p2762:GetDescendants() do
				if v2763:HasTag("Cleanup_Candy") then
					v2763:Destroy()
				end
			end
		end
		if p2761 then
			v2764(p2761)
		end
		if p2760 then
			v2764(p2760)
		end
		for _, v2765 in p2760:GetDescendants() do
			if (v2765:IsA("BasePart") or v2765:IsA("UnionOperation")) and v2765:HasTag("CandyVisual") then
				v2765.Color = v_u_16[v2765] or v2765.Color
				v_u_16[v2765] = nil
				v2765:RemoveTag("CandyVisual")
			end
		end
	end
}
v_u_926.Confection = {
	["Id"] = "CF",
	["Name"] = "Confection",
	["ValueMulti"] = 18,
	["Color"] = Color3.fromRGB(255, 160, 190),
	["_AddFX"] = function(p2766, p2767, p2768)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		p2766:_RemoveFX(p2767, p2768)
		local v2769 = p2767:FindFirstChild("Item_Seed") and (p2767.Item_Seed.Value or 1) or 1
		local v2770 = Random.new(v2769)
		local v2771 = game.ServerStorage.Mutation_FX.Confection:GetChildren()
		local v2772 = { Color3.fromRGB(255, 170, 200), Color3.fromRGB(255, 135, 185), Color3.fromRGB(255, 110, 160) }
		local v2773 = {
			Color3.fromRGB(255, 89, 89),
			Color3.fromRGB(248, 248, 248),
			Color3.fromRGB(80, 170, 255),
			Color3.fromRGB(80, 255, 120),
			Color3.fromRGB(255, 170, 80),
			Color3.fromRGB(190, 100, 255),
			Color3.fromRGB(255, 230, 90)
		}
		OriginalTransparency = OriginalTransparency or {}
		local v2774 = {}
		for _, v2775 in p2767:GetDescendants() do
			if (v2775:IsA("BasePart") or v2775:IsA("UnionOperation")) and (not v2775:HasTag("Effect") and v2775.Transparency < 1) then
				table.insert(v2774, v2775)
			end
		end
		table.sort(v2774, function(p2776, p2777)
			return p2776.Position.Y < p2777.Position.Y
		end)
		if p2768 then
			for _, v2778 in v2771 do
				local v2779 = v2778:Clone()
				v2779.Parent = p2768
				if v2779:IsA("ParticleEmitter") then
					v2779.Enabled = true
					v2779:FindFirstChildWhichIsA("NumberValue")
				end
				if v2779:IsA("ParticleEmitter") then
					v2779.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v2773[v2770:NextInteger(1, #v2773)]), ColorSequenceKeypoint.new(1, v2773[v2770:NextInteger(1, #v2773)]) })
				end
				v2779:AddTag("Cleanup_Confection")
			end
		end
		for _, v2780 in v2774 do
			v_u_16[v2780] = v_u_16[v2780] or v2780.Color
			v_u_19[v2780] = v_u_19[v2780] or v2780.Material
			OriginalTransparency[v2780] = OriginalTransparency[v2780] or v2780.Transparency
			v2780.Color = v2772[v2770:NextInteger(1, #v2772)]
			v2780.Material = Enum.Material.Glass
			v2780.Transparency = 0.2
			v2780:AddTag("ConfectionVisual")
			if v2780 ~= p2768 and #v2771 > 0 then
				local v2781 = v2771[v2770:NextInteger(1, #v2771)]:Clone()
				v2781.Parent = v2780
				if v2781:IsA("ParticleEmitter") then
					v2781.Enabled = true
					v2781.Color = ColorSequence.new({ ColorSequenceKeypoint.new(0, v2773[v2770:NextInteger(1, #v2773)]), ColorSequenceKeypoint.new(1, v2773[v2770:NextInteger(1, #v2773)]) })
				end
				v2781:AddTag("Cleanup_Confection")
			end
		end
	end,
	["_RemoveFX"] = function(_, p2782, p2783)
		-- upvalues: (copy) v_u_16, (copy) v_u_19
		OriginalTransparency = OriginalTransparency or {}
		local function v2786(p2784)
			for _, v2785 in p2784:GetDescendants() do
				if v2785:HasTag("Cleanup_Confection") then
					v2785:Destroy()
				end
			end
		end
		if p2783 then
			v2786(p2783)
		end
		if p2782 then
			v2786(p2782)
		end
		for _, v2787 in p2782:GetDescendants() do
			if (v2787:IsA("BasePart") or v2787:IsA("UnionOperation")) and v2787:HasTag("ConfectionVisual") then
				v2787.Color = v_u_16[v2787] or v2787.Color
				v_u_16[v2787] = nil
				if v_u_19[v2787] then
					v2787.Material = v_u_19[v2787]
					v_u_19[v2787] = nil
				end
				v2787.Transparency = OriginalTransparency[v2787] or 0
				OriginalTransparency[v2787] = nil
				v2787:RemoveTag("ConfectionVisual")
			end
		end
	end
}
local v_u_2788 = {}
local v_u_2789 = {}
for v2790, v2791 in v_u_926 do
	v_u_2788[v2790] = v2791.Id
end
for v2792, v2793 in v_u_926 do
	if v_u_2789[v2793.Id] then
		error((("MutationHandler | Duplicate Enum for %* and %*"):format(v2792, v_u_2789[v2793.Id])))
	end
	v_u_2789[v2793.Id] = v2792
end
table.freeze(v_u_2788)
table.freeze(v_u_2789)
table.freeze(v_u_926)
function v_u_14.GetMutationsToEnums(_)
	-- upvalues: (copy) v_u_2788
	return v_u_2788
end
function v_u_14.GetEnumsToMutations(_)
	-- upvalues: (copy) v_u_2789
	return v_u_2789
end
function v_u_14.GetMutations(_)
	-- upvalues: (copy) v_u_926
	return v_u_926
end
function v_u_14.AddMutation(_, p2794, p2795, p2796)
	-- upvalues: (copy) v_u_13, (copy) v_u_3, (copy) v_u_7
	if p2794 then
		local v2797 = v_u_13.InfGrowPlants[p2794.Name]
		if v2797 and not v2797.CanBeMutated then
			warn((("Cannot mutate InfGrowPlant %*"):format(p2794.Name)))
		else
			p2794:SetAttribute(p2795.Name, true)
			if v_u_3:IsServer() and not p2796 then
				local v2798 = game:GetService("ServerScriptService")
				local v2799 = require(v2798.Modules.GardenGuideService)
				local v2800 = v_u_7(p2794)
				if not v2800 then
					return
				end
				v2799:IncrementMutationCount(v2800, p2795.Name, "Applied")
			end
		end
	else
		warn("MutationHandler:AddMutation | No plant")
		return
	end
end
function v_u_14.RemoveMutation(_, p2801, p2802)
	if p2801 then
		p2801:SetAttribute(p2802.Name, nil)
	else
		warn("MutationHandler:RemoveMutation | No plant")
	end
end
function v_u_14.GetPlantMutations(_, p2803, p2804)
	-- upvalues: (copy) v_u_926
	local v2805 = 0
	local v2806 = {}
	local v2807 = p2804 and {} or nil
	for _, v2808 in v_u_926 do
		if p2803:GetAttribute(v2808.Name) then
			v2805 = v2805 + 1
			v2806[v2805] = v2808
			if v2807 then
				v2807[v2805] = v2808.Name
			end
		end
	end
	return v2806, v2805, v2807
end
function v_u_14.GetPlantMutationsCount(_, p2809)
	-- upvalues: (copy) v_u_926
	local v2810 = 0
	for _, v2811 in v_u_926 do
		if p2809:GetAttribute(v2811.Name) then
			v2810 = v2810 + 1
		end
	end
	return v2810
end
function v_u_14.GetPlantMutationsAsEnums(_, p2812)
	-- upvalues: (copy) v_u_14
	local v2813 = {}
	for _, v2814 in v_u_14:GetPlantMutations(p2812) do
		local v2815 = v2814.Id
		table.insert(v2813, v2815)
	end
	return v2813
end
function v_u_14.GetMutationsAsString(_, p2816, p2817)
	-- upvalues: (copy) v_u_926
	local v2818 = ""
	for _, v2819 in v_u_926 do
		local v2820 = v2819.Name
		if p2816:GetAttribute(v2820) then
			if v2818 ~= "" then
				v2818 = v2818 .. ", "
			end
			v2818 = v2818 .. v2820
		end
	end
	if v2818 ~= "" and p2817 then
		v2818 = "[" .. v2818 .. "]"
	end
	return v2818
end
function v_u_14.ExtractMutationsFromEnumArray(_, p2821)
	-- upvalues: (copy) v_u_2789, (copy) v_u_926
	local v2822 = {}
	for _, v2823 in p2821 do
		local v2824 = v_u_2789[v2823]
		if v2824 then
			local v2825 = v_u_926[v2824]
			table.insert(v2822, v2825)
		else
			warn((("MutationHandler:ExtractMutationsFromEnumArray | Mutation does not exist for %*"):format(v2823)))
		end
	end
	return v2822
end
function v_u_14.ExtractMutationsFromString(_, p2826)
	-- upvalues: (copy) v_u_14
	local v2827 = {}
	if not p2826 or p2826 == "" then
		return v2827
	end
	local v2828 = p2826:gsub("%[", ""):gsub("%]", ""):gsub("%s+", "")
	for v2829 in string.gmatch(v2828, "([^,]+)") do
		local v2830 = false
		for _, v2831 in v_u_14:GetMutations() do
			if v2831.Name == v2829 then
				table.insert(v2827, v2831)
				v2830 = true
			end
		end
		if not v2830 then
			warn((("MutationHandler:ExtractMutationsFromString | Mutation name: %* does not exist"):format(v2829)))
		end
	end
	return v2827
end
function v_u_14.TransferMutations(_, p2832, p2833)
	-- upvalues: (copy) v_u_13, (copy) v_u_14
	local v2834 = v_u_13.InfGrowPlants[p2833.Name]
	if v2834 and not v2834.CanBeMutated then
		warn((("Cannot mutate InfGrowPlant %*"):format(p2833.Name)))
	else
		for _, v2835 in v_u_14:GetMutations() do
			if p2832:GetAttribute(v2835.Name) then
				v_u_14:AddMutation(p2833, v2835)
				v_u_14:RemoveMutation(p2832, v2835)
			end
		end
		p2833:SetAttribute("WeightMulti", p2832:GetAttribute("WeightMulti") or 1)
	end
end
function v_u_14.CalcValueMultiFromMuts(_, p2836)
	local v2837 = 1
	for _, v2838 in p2836 do
		v2837 = v2837 + (v2838.ValueMulti - 1)
	end
	return math.max(1, v2837)
end
function v_u_14.CalcValueMulti(_, p2839)
	-- upvalues: (copy) v_u_14
	return v_u_14:CalcValueMultiFromMuts((v_u_14:GetPlantMutations(p2839)))
end
function v_u_14.SetToolName(_, p_u_2840)
	-- upvalues: (copy) v_u_2, (copy) v_u_6, (copy) v_u_14, (copy) v_u_10
	if p_u_2840:IsA("Tool") then
		task.spawn(function()
			-- upvalues: (ref) v_u_2, (copy) p_u_2840, (ref) v_u_6, (ref) v_u_14, (ref) v_u_10
			local v2841 = game:GetService("ServerScriptService")
			local v2842 = require(v2841.Modules.InventoryService)
			local v2843 = require(v_u_2.Data.EnumRegistry.InventoryServiceEnums)
			local v2844
			if p_u_2840:FindFirstChild("Item_String") then
				v2844 = p_u_2840.Item_String.Value
			else
				v2844 = nil
			end
			local v2845
			if p_u_2840:FindFirstChild("Weight") then
				v2845 = p_u_2840.Weight
			else
				v2845 = nil
			end
			local v2846, v2847
			if p_u_2840:GetAttribute(v2843.OWNER) then
				local v2848 = v2842:GetToolData(p_u_2840)
				v2844 = v2844 or v2848.ItemName
				if not v2848 then
					return
				end
				v2846 = v2848.Variant or "Normal"
				v2847 = v2848.Seed
			else
				local v2849 = p_u_2840:WaitForChild("Variant", 0.3)
				if not v2849 then
					return
				end
				local v2850 = p_u_2840:WaitForChild("Item_Seed", 0.3)
				if not v2850 then
					return
				end
				v2846 = v2849.Value
				v2847 = v2850.Value
			end
			if v2846 and (v2847 and v2844) then
				local v2851 = v_u_6.Calculate_Weight(v2847, v2844) * (p_u_2840:GetAttribute("WeightMulti") or 1)
				if p_u_2840:HasTag("WaitForWeightValue") and v2845 then
					if not v2845:GetAttribute("SetWeight") then
						repeat
							task.wait(0.5)
						until v2845:GetAttribute("SetWeight")
					end
					v2851 = v2845.Value
				end
				local v2852 = v_u_14:GetMutationsAsString(p_u_2840)
				if v2846 and (v2846 ~= "" and v2846 ~= "Normal") then
					v2852 = v2852 .. (#v2852 > 0 and ", " or "") .. v2846
				end
				local v2853 = v2852 == "" and "" or (("[%*] "):format(v2852) or "")
				local v2854 = string.format("%.2f", v2851) .. "kg"
				if v_u_10.EasterSlot[v2844] then
					p_u_2840.Name = "[" .. v2854 .. "] " .. v2853 .. v2844
				else
					p_u_2840.Name = v2853 .. v2844 .. " [" .. v2854 .. "]"
				end
			else
				return
			end
		end)
	end
end
local v_u_2855 = {}
for _, v2856 in v_u_926 do
	v_u_2855[v2856.Name] = v2856.Name
end
v_u_14.MutationNames = v_u_2855
local v_u_2857 = {}
function v_u_14.CheckTimedPlants(_)
	-- upvalues: (copy) v_u_2857, (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_926
	local v2858 = require(game.ServerStorage.Data_Module)
	local v2859 = workspace:GetServerTimeNow()
	for v2860, _ in v_u_2857 do
		local v2861 = v_u_7(v2860)
		if v2861 then
			local v2862 = v2858.GetFruitData(v2861, v2860)
			local v2863 = v_u_8.MutationTimes
			if not v2862 then
				v2862 = v2858.GetPlantData(v2861, v2860)
				v2863 = v_u_9.MutationTimes
			end
			if v2862 then
				if v2862[v2863] then
					local v2864 = 0
					for v2865, v2866 in v2862[v2863] do
						local v2867 = v_u_14:GetEnumsToMutations()[v2865]
						local v2868 = v_u_926[v2867]
						if v2868 then
							local v2869 = v2868.TimeData
							if v2869 and (v2869.TimeToChange and v2869.AddMutationName) then
								v2864 = v2864 + 1
								if v2859 - v2866 >= v2869.TimeToChange then
									v2860:SetAttribute(v2869.AddMutationName, true)
								end
							else
								warn((("Invalid or nil TimeData for %*, despite being in mutaionTimes"):format(v2867)))
							end
						else
							warn((("No mutation for %*:%*"):format(v2865, v2867)))
						end
					end
					if v2864 <= 0 then
						warn((("%* in timedPlants, but no valid muts!"):format(v2860.Name)))
					end
				else
					warn(("No Mutation Times for %* >"):format(v2860.Name), v2860)
				end
			else
				warn(("No Plant Data for %* >"):format((v2860:GetFullName())), v2860)
			end
		end
	end
end
local function v_u_2884(p2870)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_9, (copy) v_u_14, (copy) v_u_926, (copy) v_u_2857
	if p2870:IsA("Tool") then
		return
	elseif p2870:HasTag("FoodModel") then
		return
	elseif p2870:HasTag("TESTING") then
		return
	elseif p2870:GetAttribute("CommunityGarden") then
		return
	else
		local v2871 = p2870:FindFirstAncestor("Farm")
		if v2871 and v2871:GetAttribute("CommunityGarden") then
			return
		else
			local v2872 = require(game.ServerStorage.Data_Module)
			local v2873 = v_u_7(p2870)
			if v2873 then
				local v2874 = v2872.GetFruitData(v2873, p2870)
				local v2875 = v_u_8.MutationTimes
				if not v2874 then
					v2874 = v2872.GetPlantData(v2873, p2870)
					v2875 = v_u_9.MutationTimes
				end
				if v2874 then
					local v2876 = workspace:GetServerTimeNow()
					local v2877 = math.floor(v2876)
					v2874[v2875] = v2874[v2875] or {}
					for v2878, _ in v2874[v2875] do
						local v2879 = v_u_14:GetEnumsToMutations()[v2878]
						local v2880 = v_u_926[v2879]
						if not (p2870:GetAttribute(v2879) and v2880.TimeData) then
							v2874[v2875][v2878] = nil
						end
					end
					for v2881, _ in p2870:GetAttributes() do
						local v2882 = v_u_926[v2881]
						if v2882 and v2882.TimeData then
							local v2883 = v_u_14:GetMutationsToEnums()[v2881]
							if not v2874[v2875][v2883] then
								v2874[v2875][v2883] = v2877
							end
						end
					end
					if next(v2874[v2875]) == nil then
						v2874[v2875] = nil
						if v_u_2857[p2870] then
							v_u_2857[p2870] = nil
							return
						end
					elseif not v_u_2857[p2870] then
						v_u_2857[p2870] = true
					end
				else
					warn(("No Plant Data for %* >"):format((p2870:GetFullName())), p2870)
				end
			else
				warn("No player for plant >", p2870)
				return
			end
		end
	end
end
local v_u_2885 = v12.new(50, 0.25)
local v_u_2886 = {}
local function v2897(p_u_2887)
	-- upvalues: (copy) v_u_2855, (copy) v_u_2886, (copy) v_u_2885, (copy) v_u_11, (copy) v_u_2884, (copy) v_u_189, (copy) v_u_14, (copy) v_u_16, (copy) v_u_19, (copy) v_u_2857
	if p_u_2887:HasTag("IGNORE_GROWABLE") then
		return
	else
		if p_u_2887:GetAttribute("GrowthType") == "Fruit" then
			local v2888 = p_u_2887:FindFirstAncestorWhichIsA("Model")
			if v2888 and v2888:HasTag("IGNORE_GROWABLE") then
				return
			end
		end
		local v2889 = require(script.MutationCombos)
		if p_u_2887 then
			p_u_2887.AttributeChanged:Connect(function(p2890)
				-- upvalues: (ref) v_u_2855, (copy) p_u_2887, (ref) v_u_2886, (ref) v_u_2885, (ref) v_u_11, (ref) v_u_2884, (ref) v_u_189, (ref) v_u_14
				if v_u_2855[p2890] then
					local v_u_2891 = p_u_2887
					if not v_u_2886[v_u_2891] then
						local v_u_2892 = require(script.MutationCombos)
						v_u_2886[v_u_2891] = true
						v_u_2885:Enqueue(v_u_11.new(function()
							-- upvalues: (ref) v_u_2884, (copy) v_u_2891, (copy) v_u_2892, (ref) v_u_189, (ref) v_u_14, (ref) v_u_2886
							v_u_2884(v_u_2891)
							v_u_2892:HandleCombos(v_u_2891)
							v_u_189(v_u_2891):Await()
							if v_u_2891:HasTag("PlantGenerated") and not v_u_2891:FindFirstAncestorWhichIsA("PlayerGui") then
								v_u_14:SetToolName(v_u_2891)
							end
							task.wait(0.1)
							v_u_2886[v_u_2891] = nil
						end))
					end
				else
					return
				end
			end)
			v_u_2884(p_u_2887)
			v2889:HandleCombos(p_u_2887)
			if not v_u_2886[p_u_2887] then
				local v_u_2893 = require(script.MutationCombos)
				v_u_2886[p_u_2887] = true
				v_u_2885:Enqueue(v_u_11.new(function()
					-- upvalues: (ref) v_u_2884, (copy) p_u_2887, (copy) v_u_2893, (ref) v_u_189, (ref) v_u_14, (ref) v_u_2886
					v_u_2884(p_u_2887)
					v_u_2893:HandleCombos(p_u_2887)
					v_u_189(p_u_2887):Await()
					if p_u_2887:HasTag("PlantGenerated") and not p_u_2887:FindFirstAncestorWhichIsA("PlayerGui") then
						v_u_14:SetToolName(p_u_2887)
					end
					task.wait(0.1)
					v_u_2886[p_u_2887] = nil
				end))
			end
			task.delay(nil, function()
				-- upvalues: (copy) p_u_2887, (ref) v_u_14
				if p_u_2887 then
					if p_u_2887:HasTag("PlantGenerated") and not p_u_2887:FindFirstAncestorWhichIsA("PlayerGui") then
						v_u_14:SetToolName(p_u_2887)
					end
				end
			end)
			local v_u_2895 = p_u_2887.DescendantRemoving:Connect(function(p2894)
				-- upvalues: (ref) v_u_16, (ref) v_u_19
				v_u_16[p2894] = nil
				v_u_19[p2894] = nil
			end)
			p_u_2887.Destroying:Once(function()
				-- upvalues: (ref) v_u_2857, (copy) p_u_2887, (copy) v_u_2895, (ref) v_u_16, (ref) v_u_19
				v_u_2857[p_u_2887] = nil
				v_u_2895:Disconnect()
				for _, v2896 in p_u_2887:GetDescendants() do
					if v2896:IsA("BasePart") then
						v_u_16[v2896] = nil
						v_u_19[v2896] = nil
					end
				end
			end)
		else
			warn("MutationHandler.MutatableAdded | No plant")
		end
	end
end
if v_u_3:IsServer() then
	v1:GetInstanceAddedSignal("Harvestable"):Connect(v2897)
	v1:GetInstanceAddedSignal("FruitTool"):Connect(v2897)
	v1:GetInstanceAddedSignal("FoodGenerated"):Connect(v2897)
	v1:GetInstanceAddedSignal("PlantScaled"):Connect(function(p_u_2898)
		-- upvalues: (copy) v_u_14, (copy) v_u_2886, (copy) v_u_2885, (copy) v_u_11, (copy) v_u_2884, (copy) v_u_189
		if v_u_14:CanBeMutated(p_u_2898) then
			if p_u_2898:IsA("Model") or p_u_2898:IsA("Tool") then
				if not v_u_2886[p_u_2898] then
					local v_u_2899 = require(script.MutationCombos)
					v_u_2886[p_u_2898] = true
					v_u_2885:Enqueue(v_u_11.new(function()
						-- upvalues: (ref) v_u_2884, (copy) p_u_2898, (copy) v_u_2899, (ref) v_u_189, (ref) v_u_14, (ref) v_u_2886
						v_u_2884(p_u_2898)
						v_u_2899:HandleCombos(p_u_2898)
						v_u_189(p_u_2898):Await()
						if p_u_2898:HasTag("PlantGenerated") and not p_u_2898:FindFirstAncestorWhichIsA("PlayerGui") then
							v_u_14:SetToolName(p_u_2898)
						end
						task.wait(0.1)
						v_u_2886[p_u_2898] = nil
					end))
				end
				v_u_14:SetToolName(p_u_2898)
			end
		else
			return
		end
	end)
	task.spawn(function()
		-- upvalues: (copy) v_u_14
		while true do
			task.wait(60)
			xpcall(function()
				-- upvalues: (ref) v_u_14
				v_u_14:CheckTimedPlants()
			end, warn)
		end
	end)
end
return v_u_14
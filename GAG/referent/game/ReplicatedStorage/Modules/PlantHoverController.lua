local v_u_1 = game:GetService("RunService")
local v_u_2 = game:GetService("UserInputService")
local v3 = game:GetService("GuiService")
game:GetService("CollectionService")
game:GetService("TweenService")
local v4 = game:GetService("ReplicatedStorage")
local v_u_5 = game:GetService("Players")
local v6 = v4:WaitForChild("Modules")
require(v6:WaitForChild("TimeHelper"))
local v_u_7 = v_u_5.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PlantHover_UI")
local v_u_8 = v_u_7:WaitForChild("Frame")
local v_u_9 = v_u_8:WaitForChild("PlantName")
local v_u_10 = v_u_8:WaitForChild("PlantInfo")
local v_u_11 = v_u_8:WaitForChild("FertInfo")
local v_u_12 = v_u_8:WaitForChild("PlantValue")
local v_u_13 = v_u_8:WaitForChild("PlantMuts")
local v14 = require(v4.Modules.CreateTagHandler)
local v_u_15 = require(v4.Data.GrowableData)
require(v4.Modules.NumberUtil)
local v16 = require(v4.Modules.Trove)
local v_u_17 = require(v4.Data.SeedData)
local v_u_18 = require(v4.Item_Module)
local v_u_19 = require(v4.Comma_Module)
local v_u_20 = require(v4.Modules.CalculatePlantValue)
local v21 = require(v4.Modules.MutationHandler)
local v_u_22 = require(v4.Data.VariantColors)
local v_u_23 = require(v4.Modules.DataService)
local v_u_24 = require(v4.Modules.NumberUtil)
local v25 = require(v4.Modules.Signal)
require(v4.Modules.Chalk)
local v_u_26 = require(v4.Data.InfGrowPlantData)
local v_u_27 = v21:GetMutations()
local v_u_28 = script.Range
local v_u_29 = nil
local v_u_30 = {}
local v_u_31 = {
	["Weeping Branch"] = Vector3.new(70, 0.1, 70),
	["Great Pumpkin"] = Vector3.new(70, 0.1, 70),
	["Severed Spine"] = Vector3.new(20, 0.1, 20),
	["Trinity Fruit"] = Vector3.new(60, 0.1, 60),
	["Four Leaf Clover"] = Vector3.new(60, 0.1, 60),
	["Peppermint Vine"] = Vector3.new(50, 0.1, 50),
	["Spirit Sparkle"] = Vector3.new(50, 0.1, 50),
	["Reindeer Root"] = Vector3.new(60, 0.1, 60),
	["Sparkle Slice"] = Vector3.new(50, 0.1, 50),
	["Colorpop Crop"] = Vector3.new(50, 0.1, 50),
	["Kernel Curl"] = Vector3.new(70, 0.1, 70),
	["Bonanza Bloom"] = Vector3.new(70, 0.1, 70)
}
local v_u_32 = {
	["CurrentPlant"] = nil,
	["OnCurrentPlantChange"] = v25.new()
}
local v_u_33 = workspace.CurrentCamera
workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
	-- upvalues: (copy) v_u_33
	workspace.CurrentCamera = v_u_33
end)
local v_u_34 = require(v4.Modules.GetMouseToWorld)
local v_u_35 = 0
local v_u_36 = nil
local v_u_37 = {}
local v_u_38 = {}
local v_u_39 = workspace:GetAttribute("CurrentWeatherEvent") or "Default"
local v_u_40 = v_u_15:GetDataForWeather(v_u_39)
workspace:GetAttributeChangedSignal("CurrentWeatherEvent"):Connect(function()
	-- upvalues: (ref) v_u_39, (ref) v_u_40, (copy) v_u_15
	v_u_39 = workspace:GetAttribute("CurrentWeatherEvent") or "Default"
	v_u_40 = v_u_15:GetDataForWeather(v_u_39)
end)
local v_u_41 = RaycastParams.new()
local v_u_42 = false
local v_u_43 = {}
local function v_u_46()
	-- upvalues: (ref) v_u_42, (copy) v_u_43, (copy) v_u_30, (copy) v_u_41
	v_u_42 = false
	table.clear(v_u_43)
	for v44 in v_u_30 do
		local v45 = v_u_43
		table.insert(v45, v44)
	end
	v_u_41.FilterDescendantsInstances = v_u_43
end
v_u_41.FilterType = Enum.RaycastFilterType.Include
v_u_42 = false
table.clear(v_u_43)
local v_u_47 = v_u_42
local v_u_48 = v_u_40
for v49 in v_u_30 do
	table.insert(v_u_43, v49)
end
v_u_41.FilterDescendantsInstances = v_u_43
v14({
	["Tag"] = "Growable",
	["OnInstanceAdded"] = function(p50)
		-- upvalues: (copy) v_u_30, (ref) v_u_47, (copy) v_u_46
		if p50:IsDescendantOf(workspace) then
			v_u_30[p50] = true
			if not v_u_47 then
				v_u_47 = true
				task.delay(0.25, v_u_46)
			end
		end
	end,
	["OnInstanceRemoved"] = function(p51)
		-- upvalues: (copy) v_u_30, (copy) v_u_37, (copy) v_u_38, (ref) v_u_47, (copy) v_u_46
		v_u_30[p51] = nil
		v_u_37[p51] = nil
		v_u_38[p51] = nil
		if not v_u_47 then
			v_u_47 = true
			task.delay(0.25, v_u_46)
		end
	end
})
local v_u_52 = false
local v53 = v16.new()
local function v_u_63(p54)
	-- upvalues: (copy) v_u_15, (copy) v_u_38, (copy) v_u_37
	if p54 then
		local v55 = v_u_15:GetDataForPlant(p54)
		if v55 then
			local v56 = p54:WaitForChild("Grow", 1)
			local v57
			if v56 then
				v57 = v56:WaitForChild("Age", 1)
			else
				v57 = nil
			end
			if v57 then
				local v58 = v55.GrowTickTime
				local v59 = (p54:GetAttribute("MaxAge") or 1) - v57.Value
				local v60 = Random.new(p54.Item_Seed.Value):NextNumber() * (v58.Max - v58.Min) + v58.Min
				local v61 = v_u_38
				local v62 = v59 / v55.GrowRate
				v61[p54] = math.ceil(v62) * v60
				v_u_37[p54] = nil
			end
		else
			return
		end
	else
		return
	end
end
v4.GameEvents.Plant.Update.OnClientEvent:Connect(function(p64)
	-- upvalues: (ref) v_u_52, (copy) v_u_63
	if v_u_52 then
		pcall(v_u_63, p64)
	end
end)
if not v_u_52 then
	v_u_52 = true
	local v_u_65 = 0
	local function v76(p66)
		-- upvalues: (ref) v_u_65, (copy) v_u_30, (copy) v_u_38, (ref) v_u_48, (copy) v_u_37, (copy) v_u_63
		v_u_65 = v_u_65 + p66
		if v_u_65 >= 0.2 then
			local v67 = v_u_65
			v_u_65 = 0
			for v68, _ in v_u_30 do
				local v69 = v_u_38[v68]
				if v69 then
					if v69 > 0 then
						local v70 = (v68:GetAttribute("TendablePlantGrowRateMulti") or v68:GetAttribute("GrowRateMulti") or 1) * v_u_48.GrowRateMulti
						local v71 = v_u_38
						v71[v68] = v71[v68] - v67 * v70
					end
				else
					local v72 = v68:FindFirstChild("Grow")
					if v72 then
						local v73 = v72:FindFirstChild("Age")
						if v73 and v68:GetAttribute("MaxAge") then
							local v74 = v73.Value
							local v75 = v_u_37[v68]
							if v75 ~= v74 or v74 == 0 then
								if v75 and not v_u_38[v68] then
									v_u_63(v68)
								else
									v_u_37[v68] = v74
								end
							end
						end
					end
				end
			end
		end
	end
	v53:Add(v_u_1.PostSimulation:Connect(v76))
end
local v_u_77 = 0
local v_u_78 = false
v3:GetGuiInset()
local function v_u_80(p79)
	while p79 and p79 ~= workspace do
		if p79:IsA("Model") and p79:HasTag("Growable") then
			return p79
		end
		p79 = p79:FindFirstAncestorWhichIsA("Model")
	end
	return nil
end
local v_u_81 = {}
local function v_u_92(p_u_82, p_u_83, p_u_84)
	-- upvalues: (copy) v_u_81, (copy) v_u_1
	if v_u_81[p_u_82] then
		v_u_81[p_u_82]:Disconnect()
	end
	local v_u_85 = 0
	local v_u_86 = Color3.fromHSV(v_u_85, 1, 1)
	local v87 = v_u_86
	local v_u_88 = string.format("#%02X%02X%02X", v87.R * 255, v87.G * 255, v87.B * 255)
	local v_u_89 = string.format("<font color=\"#%s\">%s</font>", v_u_88, p_u_84)
	p_u_82.Text = p_u_83:gsub("\240\159\140\136", v_u_89)
	v_u_81[p_u_82] = v_u_1.RenderStepped:Connect(function(p90)
		-- upvalues: (ref) v_u_85, (ref) v_u_86, (ref) v_u_88, (ref) v_u_89, (copy) p_u_84, (copy) p_u_82, (copy) p_u_83
		v_u_85 = (v_u_85 + p90 * 0.2) % 1
		v_u_86 = Color3.fromHSV(v_u_85, 1, 1)
		local v91 = v_u_86
		v_u_88 = string.format("#%02X%02X%02X", v91.R * 255, v91.G * 255, v91.B * 255)
		v_u_89 = string.format("<font color=\"#%s\">%s</font>", v_u_88, p_u_84)
		p_u_82.Text = p_u_83:gsub("\240\159\140\136", v_u_89)
	end)
end
local function v_u_103(p_u_93, p_u_94, p_u_95)
	-- upvalues: (copy) v_u_81, (copy) v_u_1
	if v_u_81[p_u_93] then
		v_u_81[p_u_93]:Disconnect()
	end
	local v_u_96 = Color3.fromHSV(0.72, 1, 1)
	local v97 = v_u_96
	local v_u_98 = string.format("#%02X%02X%02X", v97.R * 255, v97.G * 255, v97.B * 255)
	local v_u_99 = string.format("<font color=\"#%s\">%s</font>", v_u_98, p_u_95)
	p_u_93.Text = p_u_94:gsub("\240\159\146\156", v_u_99)
	v_u_81[p_u_93] = v_u_1.RenderStepped:Connect(function()
		-- upvalues: (ref) v_u_96, (ref) v_u_98, (ref) v_u_99, (copy) p_u_95, (copy) p_u_93, (copy) p_u_94
		local v100 = tick() * 1.5
		local v101 = math.sin(v100) * 0.03 + 0.72
		v_u_96 = Color3.fromHSV(v101, 1, 1)
		local v102 = v_u_96
		v_u_98 = string.format("#%02X%02X%02X", v102.R * 255, v102.G * 255, v102.B * 255)
		v_u_99 = string.format("<font color=\"#%s\">%s</font>", v_u_98, p_u_95)
		p_u_93.Text = p_u_94:gsub("\240\159\146\156", v_u_99)
	end)
end
local function v_u_113(p104)
	-- upvalues: (copy) v_u_23, (copy) v_u_5, (copy) v_u_24, (copy) v_u_11, (copy) v_u_81, (copy) v_u_22
	local v105 = p104:FindFirstChild("Item_Seed")
	local v106 = ("%*-%*"):format(v105 and v105.Value or 0, p104.Name)
	local v107 = v_u_23:GetData(v_u_5)
	local v108 = v107 and v107.Fertilizer
	if v108 then
		v108 = v107.Fertilizer.FertilizedPlants
	end
	local v109 = nil
	local v110 = nil
	if v108 then
		v108 = v108[v106]
	end
	if v108 then
		v109 = v108.NewVarient
		local v111 = (v108.EndTime or 0) - workspace:GetServerTimeNow()
		local v112 = math.max(0, v111)
		v110 = v112 > 0 and v112 and v112 or nil
	end
	v_u_11.Text = not (v109 and v110) and "" or ("%* \240\159\167\170 %*"):format(v109, (v_u_24.compactFormat(v110)))
	v_u_11.Visible = v_u_11.Text ~= ""
	if v109 ~= "Rainbow" then
		if v_u_81[v_u_11] then
			v_u_81[v_u_11]:Disconnect()
			v_u_81[v_u_11] = nil
		end
		if v109 then
			v_u_11.TextColor3 = v_u_22:GetColor3(v109) or v_u_11.TextColor3
		end
	end
	return v109
end
local function v185(p114)
	-- upvalues: (copy) v_u_2, (copy) v_u_7, (ref) v_u_77, (copy) v_u_34, (copy) v_u_41, (copy) v_u_80, (ref) v_u_78, (copy) v_u_8, (ref) v_u_36, (copy) v_u_32, (copy) v_u_81, (ref) v_u_29, (copy) v_u_113, (ref) v_u_35, (copy) v_u_38, (copy) v_u_10, (copy) v_u_24, (copy) v_u_26, (copy) v_u_11, (copy) v_u_1, (copy) v_u_17, (copy) v_u_18, (copy) v_u_92, (copy) v_u_9, (copy) v_u_103, (copy) v_u_20, (copy) v_u_19, (copy) v_u_12, (copy) v_u_22, (copy) v_u_27, (copy) v_u_13, (copy) v_u_31, (copy) v_u_28
	local v115 = v_u_2:GetMouseLocation()
	v_u_7.Frame.Position = UDim2.new(0.01, v115.X, 0, v115.Y)
	v_u_77 = v_u_77 + p114
	if v_u_77 < 0.1 then
		return
	else
		v_u_77 = 0
		local v116 = v_u_34(v_u_41, 1000)
		local v117 = nil
		if v116 and v116.Instance then
			local v118 = v116.Instance
			local v119 = v_u_80(v118)
			if v119:GetAttribute("Inspected") or not v118:FindFirstAncestor("Fruits") then
				v117 = v119
			end
		end
		if v117 and v117:GetAttribute("IsOutlined") then
			v117 = nil
		end
		if v117 then
			local v120 = v117:GetAttribute("Inspected")
			local v121 = v_u_113(v117)
			if v117 == v_u_36 then
				local v122 = v_u_36:GetAttribute("MaxAge")
				local v123 = v_u_36:FindFirstChild("Grow")
				if v123 then
					local v124 = v123:FindFirstChild("Age")
					if v122 and (v123 and v124) then
						local v125 = v124.Value / v122 * 100
						local v126 = math.clamp(v125, 0, 100)
						local v127 = v_u_35
						local v128 = v126 - v_u_35
						local v129 = p114 * 10
						v_u_35 = v127 + v128 * math.clamp(v129, 0, 1)
						if v_u_35 ~= v_u_35 or (v_u_35 == (1 / 0) or v_u_35 == (-1 / 0)) then
							v_u_35 = 0
						end
						local v130 = v_u_38[v_u_36] or 0
						local v131 = v_u_10
						local v132
						if v130 <= 0 then
							v132 = ""
						elseif v130 < 60 then
							v132 = ("%**"):format((string.format("%.1fs", v130)))
						else
							v132 = ("%**"):format((v_u_24.compactFormat(v130)))
						end
						v131.Text = v132
					end
					if v_u_26.InfGrowPlants[v117.Name] then
						local v133 = v_u_10
						local v134 = v117:FindFirstChild("Weight").Value * 100
						v133.Text = ("%*kg"):format(math.floor(v134) / 100)
					end
					v_u_10.Visible = v_u_10.Text ~= ""
				end
			else
				v_u_36 = v117
				v_u_32.CurrentPlant = v117
				v_u_32.OnCurrentPlantChange:Fire(v117)
				local v135 = v_u_36:GetAttribute("MaxAge")
				local v136 = v_u_36.Grow:FindFirstChild("Age")
				if v135 and v136 then
					local v137 = v136.Value / v135 * 100
					local v138 = math.clamp(v137, 0, 100)
					v_u_35 = v138
					for _, v139 in pairs(v_u_81) do
						v139:Disconnect()
					end
					table.clear(v_u_81)
					if v121 == "Rainbow" then
						local v_u_140 = 0
						local v_u_141 = Color3.new(1, 0, 0)
						v_u_81[v_u_11] = v_u_1.RenderStepped:Connect(function(p142)
							-- upvalues: (ref) v_u_140, (ref) v_u_141, (ref) v_u_11
							v_u_140 = (v_u_140 + p142 * 0.2) % 1
							v_u_141 = Color3.fromHSV(v_u_140, 1, 1)
							v_u_11.TextColor3 = v_u_141
						end)
					end
					local v143 = v_u_36.Name
					local v144 = v143 == "Four Leaf Clover" and "EGG LUCK BOOST\240\159\141\128" or v143
					local v145 = v_u_17[v144]
					local v146 = v145
					if v146 then
						v146 = v145.SeedRarity
					end
					local v147
					if v146 then
						v147 = v_u_18.Return_Rarity_Data(v146)
					else
						v147 = v146
					end
					if v146 == "Prismatic" then
						v_u_92(v_u_9, "\240\159\140\136", v144)
					elseif v146 == "Transcendent" then
						v_u_103(v_u_9, "\240\159\146\156", v144)
					elseif v147 then
						local v148 = v147[2]
						local v149 = string.format("#%02X%02X%02X", v148.R * 255, v148.G * 255, v148.B * 255)
						v_u_9.Text = string.format("<font color=\"%s\">%s</font>", v149, v144)
					else
						v_u_9.Text = v144
					end
					if v138 >= 100 then
						v_u_10.Text = ""
					else
						local v150 = v_u_38[v_u_36] or 0
						local v151 = v_u_10
						local v152
						if v150 <= 0 then
							v152 = ""
						elseif v150 < 60 then
							v152 = ("%**"):format((string.format("%.1fs", v150)))
						else
							v152 = ("%**"):format((v_u_24.compactFormat(v150)))
						end
						v151.Text = v152
					end
					if v_u_26.InfGrowPlants[v117.Name] then
						local v153 = v_u_10
						local v154 = v117:FindFirstChild("Weight").Value * 100
						v153.Text = ("%*kg"):format(math.floor(v154) / 100)
					end
					v_u_10.Visible = v_u_10.Text ~= ""
					if v120 then
						local v155 = v_u_20(v117)
						v_u_19.Comma(v155)
						v_u_12.Text = v_u_24.DisplaySheckles(v155)
					else
						v_u_12.Text = ""
					end
					v_u_12.Visible = v_u_12.Text ~= ""
					local v156 = nil
					local v157 = nil
					local v158 = v117:FindFirstChild("Variant")
					local v159
					if v158 and v158:IsA("StringValue") then
						v159 = v158.Value
						if v159 == "" or (v159 == "Normal" or v159 == v121) then
							v159 = v156
						else
							v157 = v_u_22:GetHex(v159)
						end
					else
						v159 = v156
					end
					local v160 = {}
					for v161, v162 in pairs(v_u_27) do
						if v117:GetAttribute(v161) then
							local v163 = {
								["Name"] = v161
							}
							local v164
							if v162.Color then
								local v165 = v162.Color
								v164 = string.format("#%02X%02X%02X", v165.R * 255, v165.G * 255, v165.B * 255) or "#FFFFFF"
							else
								v164 = "#FFFFFF"
							end
							v163.Color = v164
							table.insert(v160, v163)
						end
					end
					local v166 = {}
					if v159 then
						local v167 = v159 == "Rainbow" and "\240\159\140\136" or string.format("<font color=\"%s\">%s</font>", v157, v159)
						table.insert(v166, v167)
					end
					for _, v168 in ipairs(v160) do
						local v169 = string.format
						local v170 = v168.Color
						local v171 = v168.Name
						table.insert(v166, v169("<font color=\"%s\">%s</font>", v170, v171))
					end
					if #v166 > 0 then
						local v172 = table.concat(v166, " <font color=\"#FFFFFF\">+</font> ")
						v_u_13.Text = v172
						if v159 == "Rainbow" then
							v_u_92(v_u_13, v172, "Rainbow")
						end
					else
						v_u_13.Text = ""
					end
					v_u_13.Visible = v_u_13.Text ~= ""
					if v_u_31[v117.Name] then
						if v_u_29 then
							v_u_29:Destroy()
							v_u_29 = nil
						end
						v_u_29 = v_u_28:Clone()
						v_u_29.Parent = workspace.Visuals or workspace
						local v173 = v_u_31[v117.Name]
						if v159 == "Rainbow" then
							local v174 = v173.X * 1.5
							local v175 = v173.Y * 1.5
							local v176 = v173.Z * 1.5
							v173 = Vector3.new(v174, v175, v176)
						end
						v_u_29.Size = v173
						if v117.PrimaryPart then
							local v177 = v117.PrimaryPart
							local v178 = v177.Position.Y - v177.Size.Y / 2
							local v179 = v_u_29
							local v180 = CFrame.new
							local v181 = v177.Position.X
							local v182 = v178 + 0.05
							local v183 = v177.Position.Z
							v179.CFrame = v180((Vector3.new(v181, v182, v183)))
							v_u_29.CanQuery = false
						end
					end
					if not v_u_78 then
						v_u_78 = true
						v_u_8.Show_Val.Value = true
						v_u_8.Visible = true
					end
				end
			end
		else
			if v_u_78 then
				v_u_78 = false
				v_u_8.Show_Val.Value = false
				v_u_8.Visible = false
				if v_u_36 then
					v_u_36 = nil
					v_u_32.CurrentPlant = nil
					v_u_32.OnCurrentPlantChange:Fire(nil)
				end
				for _, v184 in pairs(v_u_81) do
					v184:Disconnect()
				end
				table.clear(v_u_81)
			end
			if v_u_29 then
				v_u_29:Destroy()
				v_u_29 = nil
			end
			return
		end
	end
end
v_u_1.PostSimulation:Connect(v185)
local function v186()
	-- upvalues: (copy) v_u_8, (copy) v_u_2
	v_u_8.UIScale.Scale = v_u_2.PreferredInput == Enum.PreferredInput.Touch and 1.5 or 1
end
v_u_2:GetPropertyChangedSignal("PreferredInput"):Connect(v186)
task.spawn(v186)
return v_u_32
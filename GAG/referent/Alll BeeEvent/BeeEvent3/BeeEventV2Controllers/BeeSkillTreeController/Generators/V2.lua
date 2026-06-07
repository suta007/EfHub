local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("SoundService")
local v_u_3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.NumberUtil)
local v_u_5 = require(v1.Modules.Spring)
local v_u_6 = require(v1.Modules.UpdateService)
local v_u_7 = v1.GameEvents.BeeSkillTreeService.PurchaseUpgrade
local v_u_8 = v1.GameEvents.BeeSkillTreeService.PurchaseCombatUpgrade
local v9 = require(script.Parent.Parent.Config)
local v_u_10 = v9.UPGRADE_CONFIG
local v_u_11 = v9.PAGE_NODES
local v_u_12 = v9.SUB_TREE_CONFIGS
local v_u_13 = v9.SUB_TREE_ORIGIN
local v14 = {}
v14.__index = v14
local v_u_15 = script.Parent.Parent.Node
local v_u_16 = {
	Vector2.new(1, 0),
	Vector2.new(0.5, 1),
	Vector2.new(-0.5, 1),
	Vector2.new(-1, 0),
	Vector2.new(-0.5, -1),
	Vector2.new(0.5, -1)
}
local function v_u_19(p17) -- name: Emit
	for _, v18 in p17:QueryDescendants("ParticleEmitter") do
		v18:Emit(v18:GetAttribute("EmitCount") or 1)
	end
end
local v_u_20 = Vector2.new(5.095199966430664, 4.527950119972229)
local function v_u_33(p21, p22, p23) -- name: brightenWhiten
	local v24 = p21.R + (1 - p21.R) * p23
	local v25 = p21.G + (1 - p21.G) * p23
	local v26 = p21.B + (1 - p21.B) * p23
	local v27 = Color3.new
	local v28 = v24 * p22
	local v29 = math.min(v28, 1)
	local v30 = v25 * p22
	local v31 = math.min(v30, 1)
	local v32 = v26 * p22
	return v27(v29, v31, (math.min(v32, 1)))
end
local v_u_34 = {}
local function v_u_43() -- name: pickColor
	-- upvalues: (ref) v_u_34
	local v35 = 0
	while true do
		local v36 = math.random()
		local v37 = false
		for _, v38 in v_u_34 do
			local v39 = v36 - v38
			local v40 = math.abs(v39)
			local v41 = 1 - v40
			if math.min(v40, v41) < 0.15 then
				v37 = true
			end
		end
		v35 = v35 + 1
		if not v37 or v35 > 100 then
			local v42 = v_u_34
			table.insert(v42, v36)
			return Color3.fromHSV(v36, 0.7, 0.9)
		end
	end
end
local function v_u_48(p44, p45, p46) -- name: formatLabel
	return (p46 or p44:gsub("(%u)", function(p47)
		return " " .. p47
	end):gsub("^ ", "")) .. "<br/>" .. (({
		"I",
		"II",
		"III",
		"IV",
		"V",
		"VI",
		"VII",
		"VIII",
		"IX",
		"X"
	})[p45] or tostring(p45))
end
local function v_u_56(p49, p50) -- name: applyPanelState
	local v51 = p49.Surface:FindFirstChild("Background")
	if v51 then
		local v52 = v51:FindFirstChild("Hidden")
		local v53 = v51:FindFirstChild("Revealed")
		if v52 then
			v52.Visible = not p50
		end
		if v53 then
			v53.Visible = p50
		end
	end
	local v54 = p49.Surface:FindFirstChild("Hidden")
	local v55 = p49.Surface:FindFirstChild("Revealed")
	if v54 then
		v54.Visible = not p50
	end
	if v55 then
		v55.Visible = p50
	end
end
local function v_u_64(p57, p58) -- name: applyNodeColor
	-- upvalues: (copy) v_u_33
	local v59 = p57.Surface:FindFirstChild("Background")
	if v59 then
		local v60 = v59:FindFirstChild("Revealed")
		local v61 = v60 and v60:FindFirstChild("Background")
		if v61 then
			v61.ImageColor3 = p58
		end
	end
	local v62 = p57.Surface:FindFirstChild("Revealed")
	local v63 = v62 and v62:FindFirstChild("Glow")
	if v63 then
		v63.ImageColor3 = v_u_33(p58, 1.35, 0.4)
	end
end
local function v_u_72(p_u_65, p66) -- name: applyPageNodeStyle
	-- upvalues: (copy) v_u_64, (copy) v_u_56, (copy) v_u_5
	v_u_64(p_u_65, p66)
	v_u_56(p_u_65, true)
	local v67 = p_u_65.Surface:FindFirstChild("Revealed")
	local v_u_68 = v67 and v67:FindFirstChild("Glow")
	if v_u_68 then
		task.spawn(function()
			-- upvalues: (copy) p_u_65, (ref) v_u_5, (copy) v_u_68
			local v69 = 0
			while p_u_65.Parent do
				v69 = v69 + task.wait(0.05)
				local v70 = v69 * 2.5
				local v71 = (math.sin(v70) + 1) * 0.5
				v_u_5.target(v_u_68, 0.3, 4, {
					["ImageTransparency"] = v71 * 0.5 + 0.2
				})
			end
		end)
	end
end
function v14.generate(p73, p_u_74, p75, p_u_76, p_u_77, p_u_78) -- name: generate
	-- upvalues: (ref) v_u_34, (copy) v_u_16, (copy) v_u_56, (copy) v_u_5, (copy) v_u_64, (copy) v_u_4, (copy) v_u_3, (copy) v_u_72, (copy) v_u_8, (copy) v_u_7, (copy) v_u_19, (copy) v_u_2, (copy) v_u_10, (copy) v_u_12, (copy) v_u_15, (copy) v_u_20, (copy) v_u_43, (copy) v_u_48, (copy) v_u_11, (copy) v_u_6, (copy) v_u_13
	local v_u_79 = workspace:FindFirstChild("SkillTree") or Instance.new("Folder")
	v_u_79.Name = "SkillTree"
	v_u_79.Parent = workspace
	math.randomseed(p73)
	v_u_34 = {}
	local v80 = #v_u_16
	local v81 = {}
	local v_u_82 = {}
	local v_u_83 = {}
	local v_u_84 = nil
	for _, v85 in p75 do
		if v85.IsOrigin then
			v_u_84 = v85
		else
			table.insert(v81, v85)
		end
	end
	local function v_u_92(p_u_86, p87)
		-- upvalues: (ref) v_u_56, (copy) v_u_79, (ref) v_u_5
		if p_u_86.state == "hidden" then
			p_u_86.state = "adjacent"
			local v_u_88 = p_u_86.node
			v_u_56(v_u_88, false)
			v_u_88.Parent = v_u_79
			task.delay(p87 or 0, function()
				-- upvalues: (copy) p_u_86, (ref) v_u_5, (copy) v_u_88
				if p_u_86.state == "adjacent" then
					v_u_5.target(v_u_88, 1, 3, {
						["Color"] = nil,
						["Size"] = Vector3.new(4.632, 0.107, 5.327),
						["Color"] = Color3.fromRGB(80, 80, 80)
					})
					local v89 = v_u_88:FindFirstChild("Idle")
					for _, v90 in v89 and v89:GetChildren() or {} do
						if v90:IsA("ParticleEmitter") then
							v90.Enabled = false
						end
					end
					local v91 = v_u_88:FindFirstChild("Highlight")
					if v91 then
						v_u_5.target(v91, 1, 3, {
							["Color"] = Color3.fromRGB(30, 30, 30)
						})
					end
				end
			end)
		end
	end
	local function v_u_117(p_u_93, p94)
		-- upvalues: (ref) v_u_64, (ref) v_u_56, (ref) v_u_5, (copy) v_u_79, (ref) v_u_16, (copy) v_u_82, (ref) v_u_92, (copy) p_u_76, (ref) v_u_4, (ref) v_u_3, (ref) v_u_72
		if p_u_93.state == "adjacent" or p_u_93.state == "hidden" then
			p_u_93.state = "revealed"
			local v_u_95 = p_u_93.node
			local v96 = v_u_95:FindFirstChildOfClass("ClickDetector")
			if v96 then
				v96:Destroy()
			end
			v_u_64(v_u_95, p_u_93.color)
			v_u_56(v_u_95, true)
			local v97 = v_u_95:FindFirstChild("Idle")
			for _, v98 in v97 and v97:GetChildren() or {} do
				if v98:IsA("ParticleEmitter") then
					v98.Enabled = false
				end
			end
			local v99 = v_u_95.Surface:FindFirstChild("Revealed")
			if v99 then
				local v100 = v99:FindFirstChild("Icon")
				local v101 = v99:FindFirstChild("Name")
				if v100 then
					v100.Image = p_u_93.icon
					v_u_5.target(v100, 1, 3, {
						["Size"] = p_u_93.iconSize
					})
				end
				if v101 then
					if p_u_93.isPageNode or (p_u_93.isBackNode or p_u_93.isAbilityNode) then
						v101.Text = p_u_93.label
					elseif p_u_93.levels > 1 then
						v101.Text = p_u_93.label .. "<br/>(0/" .. p_u_93.levels .. ")"
					else
						v101.Text = p_u_93.label .. "<br/>(0/1)"
					end
				end
			end
			v_u_95.Color = p_u_93.color
			local v102 = v_u_95:FindFirstChild("Highlight")
			if v102 then
				local v103 = p_u_93.color
				v102.Color = Color3.new(v103.R * 0.25, v103.G * 0.25, v103.B * 0.25)
			end
			task.delay(p94 or 0, function()
				-- upvalues: (ref) v_u_5, (copy) v_u_95, (copy) p_u_93
				v_u_5.stop(v_u_95, "Color")
				v_u_5.stop(v_u_95, "Size")
				v_u_5.target(v_u_95, 1, 3, {
					["Color"] = nil,
					["Size"] = Vector3.new(4.632, 0.107, 5.327),
					["Color"] = p_u_93.color
				})
			end)
			v_u_95.Parent = v_u_79
			for _, v104 in v_u_16 do
				local v105 = v_u_82
				local v106 = p_u_93.q + v104.X
				local v107 = p_u_93.r + v104.Y
				local v108 = v106 * 10
				local v109 = math.round(v108)
				local v110 = v107 * 10
				local v111 = v105[v109 .. "," .. math.round(v110)]
				if v111 and v111.state == "hidden" then
					v_u_92(v111, (p94 or 0) + 0.1)
				end
			end
			local v112 = Instance.new("ClickDetector")
			v112.CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
			v112.MaxActivationDistance = 1000
			v112.Parent = v_u_95
			if p_u_76 then
				p_u_76(p_u_93)
			end
			local v_u_113
			if v99 then
				v_u_113 = v99:FindFirstChild("PriceLabel")
			else
				v_u_113 = v99
			end
			if v99 then
				v99 = v99:FindFirstChild("CurrencyIcon")
			end
			if v_u_113 then
				if p_u_93.isPageNode or p_u_93.isBackNode then
					v_u_113.Visible = false
				else
					v_u_113.Visible = true
					v_u_113.Text = v_u_4.FormatCompactPrice(p_u_93.cost)
				end
			end
			if v99 then
				v99.Visible = not (p_u_93.isPageNode or p_u_93.isBackNode)
			end
			local function v116() -- name: updateAffordability
				-- upvalues: (ref) v_u_3, (copy) v_u_113, (copy) p_u_93
				local v114 = v_u_3:GetData()
				local v115 = v114 and (v114.SpecialCurrency and v114.SpecialCurrency.HoneyCoins) or 0
				if v_u_113 then
					v_u_113.TextColor3 = p_u_93.cost <= v115 and Color3.new(1, 1, 1) or Color3.fromRGB(255, 60, 60)
				end
			end
			v116()
			if p_u_93.isPageNode then
				v_u_72(v_u_95, p_u_93.color)
			elseif p_u_93.isAbilityNode then
				v_u_72(v_u_95, p_u_93.color)
			end
			p_u_93.priceConn = v_u_3:GetPathSignal("SpecialCurrency/HoneyCoins"):Connect(v116)
		end
	end
	local function v_u_136(p118, p119, p120)
		-- upvalues: (ref) v_u_5, (ref) v_u_64, (ref) v_u_56, (copy) v_u_79
		p118.state = "purchased"
		local v_u_121 = p118.node
		if not v_u_121:FindFirstChildOfClass("ClickDetector") then
			local v122 = Instance.new("ClickDetector")
			v122.CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
			v122.MaxActivationDistance = 1000
			v122.Parent = v_u_121
		end
		v_u_5.stop(v_u_121, "Color")
		v_u_5.stop(v_u_121, "Size")
		v_u_121.Color = p118.color
		local v123 = v_u_121:FindFirstChild("Highlight")
		if v123 then
			local v124 = p118.color
			v123.Color = Color3.new(v124.R * 0.25, v124.G * 0.25, v124.B * 0.25)
		end
		v_u_64(v_u_121, p118.color)
		v_u_56(v_u_121, true)
		local v125 = v_u_121.Surface:FindFirstChild("Revealed")
		if v125 then
			local v126 = v125:FindFirstChild("Icon")
			local v127 = v125:FindFirstChild("Name")
			local v128 = v125:FindFirstChild("PriceLabel")
			local v129 = v125:FindFirstChild("CurrencyIcon")
			if v126 then
				v126.Image = p118.icon
				v126.Size = p118.iconSize
			end
			if v127 then
				v127.Text = p118.label
			end
			if v128 then
				v128.Visible = false
			end
			if v129 then
				v129.Visible = false
			end
		end
		v_u_121.Parent = v_u_79
		if p119 then
			v_u_121.Size = Vector3.new(0, 0, 0)
			local v130 = p118.q ^ 2 + p118.r ^ 2
			local v131 = math.sqrt(v130) * 0.15
			task.delay(p120 or v131, function()
				-- upvalues: (ref) v_u_5, (copy) v_u_121
				v_u_5.target(v_u_121, 1, 3, {
					["Size"] = Vector3.new(4.632, 0.107, 5.327)
				})
				local v132 = v_u_121:FindFirstChild("Idle")
				for _, v133 in v132 and v132:GetChildren() or {} do
					if v133:IsA("ParticleEmitter") then
						v133.Enabled = true
					end
				end
			end)
		else
			v_u_5.target(v_u_121, 1, 3, {
				["Color"] = nil,
				["Size"] = Vector3.new(4.632, 0.107, 5.327),
				["Color"] = p118.color
			})
			local v134 = v_u_121:FindFirstChild("Idle")
			for _, v135 in v134 and v134:GetChildren() or {} do
				if v135:IsA("ParticleEmitter") then
					v135.Enabled = true
				end
			end
		end
	end
	local function v_u_174(p_u_137)
		-- upvalues: (ref) v_u_8, (copy) p_u_78, (ref) v_u_7, (ref) v_u_136, (ref) v_u_19, (copy) v_u_82, (ref) v_u_5, (ref) v_u_16, (ref) v_u_117, (ref) v_u_2, (copy) p_u_77, (ref) v_u_3, (ref) v_u_10, (ref) v_u_12, (ref) v_u_4
		if p_u_137.isPageNode or p_u_137.isBackNode then
			return
		elseif p_u_137.state == "revealed" then
			local v138
			if p_u_137.isAbilityNode then
				v138 = v_u_8:InvokeServer(p_u_78.subTreeName, p_u_137.abilityName, 1)
			elseif p_u_78 and (p_u_78.isSubTree and p_u_78.subTreeName) then
				v138 = v_u_8:InvokeServer(p_u_78.subTreeName, p_u_137.upgradeName, p_u_137.tier)
			else
				v138 = v_u_7:InvokeServer(p_u_137.upgradeName, p_u_137.tier)
			end
			if v138 and v138 ~= false then
				p_u_137.progress = v138.progress
				p_u_137.levels = v138.levels
				local v139 = p_u_137.node.Surface:FindFirstChild("Revealed")
				local v140
				if v139 then
					v140 = v139:FindFirstChild("Name")
				else
					v140 = v139
				end
				if v138.tierComplete then
					v_u_136(p_u_137)
					if p_u_137.priceConn then
						pcall(p_u_137.priceConn.Disconnect, p_u_137.priceConn)
						p_u_137.priceConn = nil
					end
					v_u_19(p_u_137.node.Upgrade)
					local v_u_141 = p_u_137.node.Position
					local v_u_142 = p_u_137.node.CFrame.UpVector
					for _, v_u_143 in v_u_82 do
						if v_u_143 ~= p_u_137 then
							local v144 = p_u_137.q
							local v145 = p_u_137.r
							local v146 = v_u_143.q
							local v147 = v_u_143.r
							local v148 = v144 - v146
							local v149 = math.abs(v148)
							local v150 = v144 - v146 + v145 - v147
							local v151 = v149 + math.abs(v150)
							local v152 = v145 - v147
							local v153 = (v151 + math.abs(v152)) / 2 * 0.14
							task.delay(v153, function()
								-- upvalues: (copy) v_u_143, (copy) v_u_141, (copy) v_u_142, (copy) p_u_137, (ref) v_u_5
								if v_u_143.node and v_u_143.node.Parent then
									local v154 = v_u_143.originalCFrame
									local v155 = v154.Position
									local v156 = v155 - v_u_141
									local v157
									if v156.Magnitude > 0.001 then
										local v158 = v156.Unit:Cross(v_u_142)
										if v158.Magnitude > 0.001 then
											v157 = v158.Unit
										else
											v157 = p_u_137.node.CFrame.LookVector
										end
									else
										v157 = p_u_137.node.CFrame.LookVector
									end
									v_u_5.stop(v_u_143.node, "Size")
									v_u_5.stop(v_u_143.node, "CFrame")
									v_u_143.node.Size = Vector3.new(5.3268, 0.12305, 6.12605)
									local v159 = CFrame.fromAxisAngle(v157, 2.9670597283903604)
									v_u_143.node.CFrame = v159 * (v154 - v155) + v155
									v_u_5.target(v_u_143.node, 0.65, 1.4, {
										["Size"] = Vector3.new(4.632, 0.107, 5.327)
									})
									v_u_5.target(v_u_143.node, 0.7, 1.4, {
										["CFrame"] = v154
									})
								end
							end)
						end
					end
					for _, v160 in v_u_16 do
						local v161 = v_u_82
						local v162 = p_u_137.q + v160.X
						local v163 = p_u_137.r + v160.Y
						local v164 = v162 * 10
						local v165 = math.round(v164)
						local v166 = v163 * 10
						local v167 = v161[v165 .. "," .. math.round(v166)]
						if v167 and (v167.state == "hidden" or v167.state == "adjacent") then
							v_u_117(v167)
							v_u_2.SkillTreeSounds.Flip:Play()
						end
					end
				else
					if v140 then
						v140.Text = p_u_137.label .. "<br/>(" .. p_u_137.progress .. "/" .. p_u_137.levels .. ")"
					end
					if p_u_77 then
						p_u_77(p_u_137)
					end
					local v168 = v_u_3:GetData()
					local v169 = v168 and (v168.SpecialCurrency and v168.SpecialCurrency.HoneyCoins) or 0
					if v139 then
						v139 = v139:FindFirstChild("PriceLabel")
					end
					if v139 then
						local v170 = not v_u_10[p_u_137.upgradeName] and p_u_78 and (p_u_78.subTreeName and v_u_12[p_u_78.subTreeName])
						if v170 then
							v170 = v_u_12[p_u_78.subTreeName][p_u_137.upgradeName]
						end
						local v171 = v170 and (v170.CostPerTier[p_u_137.tier] or 0) or 0
						local v172 = v170 and v170.CostScalePerTier and (v170.CostScalePerTier[p_u_137.tier] or 1) or 1
						if p_u_137.progress ~= 0 or not v171 then
							local v173 = v171 * v172
							v171 = math.round(v173)
						end
						p_u_137.cost = v171
						v139.Text = v_u_4.FormatCompactPrice(v171)
						v139.TextColor3 = v171 <= v169 and Color3.new(1, 1, 1) or Color3.fromRGB(255, 60, 60)
					end
				end
			else
				return
			end
		else
			return
		end
	end
	local function v208(p175, p176, p177, p178, p179, p180, p181, p182, p183) -- name: placeNode
		-- upvalues: (copy) v_u_82, (ref) v_u_15, (copy) p_u_74, (ref) v_u_20, (ref) v_u_56, (ref) v_u_10, (copy) p_u_78, (ref) v_u_12, (ref) v_u_174, (copy) v_u_83
		local v184 = p175 * 10
		local v185 = math.round(v184)
		local v186 = p176 * 10
		local v187 = v185 .. "," .. math.round(v186)
		if v_u_82[v187] then
			warn("[SkillTree] Collision at", v187, "for", p181, p182, "existing:", v_u_82[v187].upgradeName, v_u_82[v187].tier)
			return nil
		end
		local v188 = v_u_15:Clone()
		v188.Size = Vector3.new(0, 0, 0)
		local v189 = CFrame.new
		local v190 = p_u_74
		local v191 = v190.X + p175 * v_u_20.X
		local v192 = v190.Y
		local v193 = v190.Z + p176 * v_u_20.Y
		v188.CFrame = v189((Vector3.new(v191, v192, v193)))
		v188.Color = p177
		local v194 = v188:FindFirstChild("Highlight")
		if v194 then
			v194.Color = Color3.new(p177.R * 0.25, p177.G * 0.25, p177.B * 0.25)
		end
		v_u_56(v188, false)
		local v195 = v188.Surface:FindFirstChild("Revealed")
		if v195 then
			local v196 = v195:FindFirstChild("PriceLabel")
			local v197 = v195:FindFirstChild("CurrencyIcon")
			if v196 then
				v196.Visible = false
			end
			if v197 then
				v197.Visible = false
			end
		end
		v188.Parent = nil
		if v195 then
			v195 = v195:FindFirstChild("Icon")
		end
		local v198 = v195 and v195.Size or UDim2.fromScale(0.8, 0.8)
		local v199 = v_u_10[p181]
		if not v199 and (p_u_78 and p_u_78.subTreeName) then
			v199 = v_u_12[p_u_78.subTreeName]
			if v199 then
				v199 = v199[p181]
			end
		end
		local v201 = {
			["node"] = nil,
			["q"] = nil,
			["r"] = nil,
			["color"] = nil,
			["icon"] = nil,
			["label"] = nil,
			["description"] = nil,
			["state"] = "hidden",
			["iconSize"] = nil,
			["upgradeName"] = nil,
			["tier"] = nil,
			["delay"] = nil,
			["cost"] = nil,
			["levels"] = nil,
			["progress"] = 0,
			["purchase"] = nil,
			["originalCFrame"] = nil,
			["node"] = v188,
			["q"] = p175,
			["r"] = p176,
			["color"] = p177,
			["icon"] = p178,
			["label"] = p179,
			["description"] = p183,
			["iconSize"] = v198,
			["upgradeName"] = p181,
			["tier"] = p182,
			["delay"] = p180,
			["cost"] = v199 and v199.CostPerTier and (v199.CostPerTier[p182] or 0) or 0,
			["levels"] = v199 and (v199.LevelsPerTier and v199.LevelsPerTier[p182] or 1) or 1,
			["purchase"] = function(p200) -- name: purchase
				-- upvalues: (ref) v_u_174
				v_u_174(p200)
			end
		}
		local v202 = CFrame.new
		local v203 = p_u_74
		local v204 = v203.X + p175 * v_u_20.X
		local v205 = v203.Y
		local v206 = v203.Z + p176 * v_u_20.Y
		v201.originalCFrame = v202((Vector3.new(v204, v205, v206)))
		v_u_82[v187] = v201
		local v207 = v_u_83
		table.insert(v207, v201)
		return v201
	end
	local v_u_209 = v_u_136
	local v_u_210 = v_u_117
	local v211 = {}
	for v212 = 1, v80 do
		table.insert(v211, v212)
	end
	local v213 = v_u_43()
	local v_u_214 = v208(0, 0, v213, v_u_84.Icon, v_u_48(v_u_84.Name, 1, v_u_84.DisplayName), 0, v_u_84.Name, 1, v_u_84.Description)
	if v_u_84.Tiers > 1 then
		local v215 = table.remove(v211, math.random(#v211))
		local v216 = v_u_16[v215]
		local v217 = v_u_16[(v215 - 2) % v80 + 1]
		local v218 = v216.X
		local v219 = v216.Y
		for v220 = 2, v_u_84.Tiers do
			local v221 = v220 % 2 == 0 and v216 and v216 or v217
			local v222 = v_u_84.Icon
			local v223 = v_u_48(v_u_84.Name, v220, v_u_84.DisplayName)
			local v224 = v218 ^ 2 + v219 ^ 2
			v208(v218, v219, v213, v222, v223, math.sqrt(v224) * 0.15, v_u_84.Name, v220, v_u_84.Description)
			v218 = v218 + v221.X
			v219 = v219 + v221.Y
		end
	end
	for _, v225 in v81 do
		if #v211 <= 0 then
			warn("[SkillTree] No available directions left for group:", v225.Name)
			break
		end
		local v226 = v_u_43()
		local v227 = table.remove(v211, math.random(#v211))
		local v228 = v_u_16[v227]
		local v229 = v_u_16[(v227 - 2) % v80 + 1]
		local v230 = v228.X
		local v231 = v228.Y
		for v232 = 1, v225.Tiers do
			local v233 = v232 % 2 == 1 and v228 and v228 or v229
			local v234 = v225.Icon
			local v235 = v_u_48(v225.Name, v232, v225.DisplayName)
			local v236 = v230 ^ 2 + v231 ^ 2
			v208(v230, v231, v226, v234, v235, math.sqrt(v236) * 0.15, v225.Name, v232, v225.Description)
			v230 = v230 + v233.X
			v231 = v231 + v233.Y
		end
	end
	local v237 = script.Parent.Parent.Background:Clone()
	v237:PivotTo(CFrame.new(workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -35).Position) * CFrame.Angles(1.5707963267948966, 3.141592653589793, -1.5707963267948966))
	v237.Parent = workspace.SkillTree
	if not (p_u_78 and p_u_78.isSubTree) then
		for v238, v239 in v_u_11 do
			if not (v239.UpdateGate and v_u_6:IsHiddenFromUpdate(v239.UpdateGate)) then
				local v240 = v239.AttachTo
				local v241 = nil
				if v240 == "__origin__" then
					v241 = v_u_214
				else
					for _, v242 in v_u_83 do
						if v242.upgradeName == v240 and (not v241 or v242.tier > v241.tier) then
							v241 = v242
						end
					end
				end
				if v241 then
					local v243 = nil
					local v244 = nil
					if v240 == "__origin__" then
						for v245 = #v211, 1, -1 do
							local v246 = v_u_16[v211[v245]]
							local v247 = v_u_214.q + v246.X
							local v248 = v_u_214.r + v246.Y
							local v249 = v247 * 10
							local v250 = math.round(v249)
							local v251 = v248 * 10
							if not v_u_82[v250 .. "," .. math.round(v251)] then
								v243 = v246.X
								v244 = v246.Y
								table.remove(v211, v245)
								break
							end
						end
						if not v243 then
							for _, v252 in v_u_16 do
								local v253 = v_u_214.q + v252.X
								local v254 = v_u_214.r + v252.Y
								local v255 = v253 * 10
								local v256 = math.round(v255)
								local v257 = v254 * 10
								if not v_u_82[v256 .. "," .. math.round(v257)] then
									v243 = v252.X
									v244 = v252.Y
									break
								end
							end
						end
					elseif v241.tier > 1 then
						local v258 = nil
						for _, v259 in v_u_83 do
							if v259.upgradeName == v240 and v259.tier == v241.tier - 1 then
								v258 = v259
								break
							end
						end
						if v258 then
							v243 = v241.q - v258.q
							v244 = v241.r - v258.r
						end
					end
					if not v243 then
						for _, v260 in v_u_16 do
							local v261 = v241.q + v260.X
							local v262 = v241.r + v260.Y
							local v263 = v261 * 10
							local v264 = math.round(v263)
							local v265 = v262 * 10
							if not v_u_82[v264 .. "," .. math.round(v265)] then
								v243 = v260.X
								v244 = v260.Y
								break
							end
						end
					end
					if v243 then
						local v266 = v241.q + v243
						local v267 = v241.r + v244
						local v268 = v266 * 10
						local v269 = math.round(v268)
						local v270 = v267 * 10
						if not v_u_82[v269 .. "," .. math.round(v270)] then
							local v271 = v239.Color or Color3.fromRGB(230, 160, 40)
							local v272 = v239.Icon
							local v273 = v239.Label
							local v274 = v266 ^ 2 + v267 ^ 2
							local v275 = v208(v266, v267, v271, v272, v273, math.sqrt(v274) * 0.15, "__page__" .. v238, 1, v239.Description)
							v275.isPageNode = true
							v275.pageName = v238
							v275.requiresTier = v239.RequiresTier or 1
							v275.attachUpgrade = v240
						end
					end
				end
			end
		end
	end
	if p_u_78 and (p_u_78.isSubTree and p_u_78.subTreeName) then
		local v276 = v_u_12[p_u_78.subTreeName]
		local v277 = v276
		if v277 then
			v277 = v276.BeeAbilities
		end
		if v277 and v277.BranchCaps then
			local v278 = Color3.fromRGB(255, 80, 200)
			for _, v279 in v277.BranchCaps do
				local v280 = nil
				for _, v281 in v_u_83 do
					if v281.upgradeName == v279.AttachTo and (not v280 or v281.tier > v280.tier) then
						v280 = v281
					end
				end
				if v280 then
					local v282 = nil
					local v283 = nil
					if v280.tier > 1 then
						local v284 = nil
						for _, v285 in v_u_83 do
							if v285.upgradeName == v279.AttachTo and v285.tier == v280.tier - 1 then
								v284 = v285
								break
							end
						end
						if v284 then
							v282 = v280.q - v284.q
							v283 = v280.r - v284.r
						end
					end
					if not v282 then
						for _, v286 in v_u_16 do
							local v287 = v280.q + v286.X
							local v288 = v280.r + v286.Y
							local v289 = v287 * 10
							local v290 = math.round(v289)
							local v291 = v288 * 10
							if not v_u_82[v290 .. "," .. math.round(v291)] then
								v282 = v286.X
								v283 = v286.Y
								break
							end
						end
					end
					if v282 then
						local v292 = v280.q + v282
						local v293 = v280.r + v283
						local v294 = v292 * 10
						local v295 = math.round(v294)
						local v296 = v293 * 10
						if not v_u_82[v295 .. "," .. math.round(v296)] then
							local v297 = v279.Name or v279.AttachTo .. "Ability"
							local v298 = v279.DisplayName or (v279.TierName or v297)
							local v299 = v279.Icon or v277.Icon
							local v300 = v292 ^ 2 + v293 ^ 2
							local v301 = v208(v292, v293, v278, v299, v298, math.sqrt(v300) * 0.15, v297, 1, v279.Description or v277.Description)
							v301.isAbilityNode = true
							v301.abilityName = v297
							v301.displayName = v298
							v301.attachTo = v279.AttachTo
							v301.abilityCost = v279.Cost
							v301.cost = v279.Cost
						end
					end
				end
			end
		end
	end
	local v_u_302 = nil
	if p_u_78 and (p_u_78.isSubTree and p_u_78.subTreeName) then
		local v303 = v_u_13[p_u_78.subTreeName]
		if v303 and v_u_214.upgradeName == "__back__" then
			v_u_214.isBackNode = true
			v_u_214.icon = v303.Icon
			v_u_214.label = v303.Label
			v_u_214.description = v303.Description
			v_u_302 = v_u_214
		end
	end
	task.spawn(function()
		-- upvalues: (ref) v_u_3, (copy) v_u_214, (ref) v_u_210, (copy) p_u_78, (copy) v_u_83, (ref) v_u_2, (ref) v_u_209, (ref) v_u_84, (ref) v_u_11, (ref) v_u_12, (ref) v_u_302, (ref) v_u_56, (ref) v_u_64
		local v304 = v_u_3:GetData()
		if not v304 then
			v_u_214.state = "adjacent"
			v_u_210(v_u_214)
			return
		end
		local v305
		if p_u_78 and (p_u_78.isSubTree and p_u_78.subTreeName) then
			v305 = v304.BeeEventData and v304.BeeEventData.CombatSkillTree or {}
		else
			v305 = v304.BeeEventData and v304.BeeEventData.BeeSkillTree or {}
		end
		local v306 = table.clone(v_u_83)
		table.sort(v306, function(p307, p308)
			return p307.tier < p308.tier
		end)
		local v309 = #v306 - 1
		local v_u_310 = 0.75 / math.max(v309, 1)
		local v_u_311 = 0
		for _, v312 in v306 do
			if not v312.isPageNode and (not v312.isBackNode and (not v312.isAbilityNode and (v305[v312.upgradeName] or 0) >= v312.tier)) then
				v_u_209(v312, true, v_u_311 * 0.1)
				local v313 = v_u_311 * 0.1
				task.delay(v313, function()
					-- upvalues: (ref) v_u_2, (copy) v_u_311, (copy) v_u_310
					if workspace:FindFirstChild("SkillTree") then
						local v314 = v_u_2.SkillTreeSounds.Reveal:Clone()
						v314.PitchShiftSoundEffect.Octave = 0.75 + v_u_311 * v_u_310
						v314.Parent = v_u_2
						v314:Play()
						game:GetService("Debris"):AddItem(v314, 2)
					end
				end)
				v_u_311 = v_u_311 + 1
			end
		end
		local v315 = v305[v_u_84.Name] or 0
		for _, v316 in v306 do
			if not (v316.isPageNode or (v316.isBackNode or v316.isAbilityNode)) then
				local v317 = v305[v316.upgradeName] or 0
				if v316.tier == v317 + 1 and (v316.state == "hidden" or v316.state == "adjacent") then
					local v318 = p_u_78
					if v318 then
						v318 = p_u_78.isSubTree
					end
					if v318 or (v316.upgradeName == v_u_84.Name or (v316.tier ~= 1 or v315 ~= 0)) and (v316.upgradeName == v_u_84.Name or (v315 > 0 or v317 > 0)) then
						v_u_210(v316, v_u_311 * 0.1)
						local v319 = v_u_311 * 0.1
						task.delay(v319, function()
							-- upvalues: (ref) v_u_2, (copy) v_u_311, (copy) v_u_310
							if workspace:FindFirstChild("SkillTree") then
								local v320 = v_u_2.SkillTreeSounds.Reveal:Clone()
								v320.PitchShiftSoundEffect.Octave = 0.75 + v_u_311 * v_u_310
								v320.Parent = v_u_2
								v320:Play()
								game:GetService("Debris"):AddItem(v320, 2)
							end
						end)
						v_u_311 = v_u_311 + 1
					end
				end
			end
		end
		if not (p_u_78 and p_u_78.isSubTree) and (not v305[v_u_84.Name] or v305[v_u_84.Name] == 0) then
			v_u_214.state = "adjacent"
			v_u_210(v_u_214, 0)
		end
		for _, v321 in v306 do
			if v321.state == "revealed" then
				local v322 = v305[v321.upgradeName .. "_" .. v321.tier] or 0
				local v323 = v321.levels
				local v324 = math.clamp(v322, 0, v323)
				if v324 > 0 and v321.state == "revealed" then
					v321.progress = v324
					local v325 = v321.node.Surface:FindFirstChild("Revealed")
					if v325 then
						v325 = v325:FindFirstChild("Name")
					end
					if v325 then
						v325.Text = v321.label .. "<br/>(" .. v324 .. "/" .. v321.levels .. ")"
					end
				end
			end
		end
		if not (p_u_78 and p_u_78.isSubTree) then
			for _, v326 in v306 do
				if v326.isPageNode then
					local v327 = v_u_11[v326.pageName]
					if v327 then
						local v328 = v327.RequiresUpgrade or v327.AttachTo
						if v328 == "__origin__" then
							v328 = v_u_84.Name
						end
						if (v305[v328] or 0) >= (v326.requiresTier or 1) and (v326.state == "hidden" or v326.state == "adjacent") then
							v326.state = "adjacent"
							local v329 = v326.q ^ 2 + v326.r ^ 2
							local v330 = math.sqrt(v329) * 0.15
							v_u_210(v326, v330)
							task.delay(v330, function()
								-- upvalues: (ref) v_u_2, (copy) v_u_311, (copy) v_u_310
								if workspace:FindFirstChild("SkillTree") then
									local v331 = v_u_2.SkillTreeSounds.Reveal:Clone()
									v331.PitchShiftSoundEffect.Octave = 0.75 + v_u_311 * v_u_310
									v331.Parent = v_u_2
									v331:Play()
									game:GetService("Debris"):AddItem(v331, 2)
								end
							end)
							v_u_311 = v_u_311 + 1
						end
					end
				end
			end
		end
		if p_u_78 and (p_u_78.isSubTree and p_u_78.subTreeName) then
			local v332 = v_u_12[p_u_78.subTreeName]
			local v333
			if v332 then
				v333 = v332.BeeAbilities
			else
				v333 = v332
			end
			if v333 and v333.BranchCaps then
				for _, v334 in v333.BranchCaps do
					local v335 = nil
					for _, v336 in v_u_83 do
						if v336.isAbilityNode and v336.attachTo == v334.AttachTo then
							v335 = v336
							break
						end
					end
					if v335 then
						local v337 = v305[v334.Name or v334.AttachTo .. "Ability"] == 1
						local v338 = v332[v334.AttachTo]
						local v339 = v338 and v338.MaxTier or 0
						local v340 = v305[v334.AttachTo] or 0
						if v337 then
							if v335.state == "hidden" or v335.state == "adjacent" then
								v_u_209(v335, true, v_u_311 * 0.1)
								v_u_311 = v_u_311 + 1
							end
						elseif v339 <= v340 and (v335.state == "hidden" or v335.state == "adjacent") then
							v335.state = "adjacent"
							v_u_210(v335, v_u_311 * 0.1)
							v_u_311 = v_u_311 + 1
						end
					end
				end
			end
		end
		if v_u_302 then
			v_u_302.color = Color3.fromRGB(120, 120, 140)
			v_u_302.state = "adjacent"
			v_u_210(v_u_302)
			local v341 = v_u_302.node
			v_u_56(v341, true)
			v_u_64(v341, Color3.fromRGB(120, 120, 140))
			local v342 = v_u_302.node:FindFirstChildOfClass("ClickDetector")
			if v342 then
				v342:Destroy()
			end
			local v343 = Instance.new("ClickDetector")
			v343.CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
			v343.MaxActivationDistance = 1000
			v343.Parent = v_u_302.node
			v343.MouseClick:Connect(function()
				-- upvalues: (ref) p_u_78
				if p_u_78 and p_u_78.onBackClicked then
					p_u_78.onBackClicked()
				end
			end)
			function v_u_302.purchase()
				-- upvalues: (ref) p_u_78
				if p_u_78 and p_u_78.onBackClicked then
					p_u_78.onBackClicked()
				end
			end
		end
	end)
	return v_u_83, v_u_82
end
return v14
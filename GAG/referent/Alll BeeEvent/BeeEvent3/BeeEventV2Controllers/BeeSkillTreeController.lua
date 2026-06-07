local v_u_1 = game:GetService("ContextActionService")
local v_u_2 = game:GetService("ReplicatedStorage")
local v_u_3 = game:GetService("UserInputService")
local v_u_4 = game:GetService("RunService")
local v5 = game:GetService("Players")
local v_u_6 = game:GetService("GamepadService")
local v_u_7 = v5.LocalPlayer
local v_u_8 = v_u_7:WaitForChild("PlayerGui")
local v_u_9 = v_u_8:WaitForChild("BeeSkillTreeUI")
v_u_8:WaitForChild("BackpackGui")
v_u_8:WaitForChild("Teleport_UI")
local v_u_10 = game:GetService("SoundService")
local v_u_11 = require(v_u_2.Modules.GuiController)
local v_u_12 = require(v_u_2.Modules.SetupButton)
local v_u_13 = require(v_u_2.Modules.DataService)
local v_u_14 = require(v_u_2.Modules.Spring)
local v_u_15 = require(script.Config)
local v_u_16 = require(v_u_2.Modules.UpdateService)
local v17 = {}
local v_u_18 = {
	["ZoomLimit"] = nil,
	["DragResistance"] = 0.5,
	["DragBounds"] = 15,
	["ZoomLimit"] = NumberRange.new(-14.4, 15)
}
local v_u_19 = require(script.Generators.V2)
local v_u_20 = v_u_10:WaitForChild("SkillTreeSounds")
v_u_8:WaitForChild("Honey_UI"):WaitForChild("Frame")
local v_u_21 = v_u_8:WaitForChild("HoneyCoinCurrency_UI"):WaitForChild("Frame")
local v_u_22 = require(v_u_7:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")):GetControls()
local v_u_23 = UDim2.fromScale(0.45, 0.95)
local v_u_24 = {
	{
		["Name"] = "BeeCapacity",
		["Tiers"] = nil,
		["Icon"] = "rbxassetid://124630016104719",
		["IsOrigin"] = true,
		["Description"] = "Increases the maximum number of bees you can have.",
		["Tiers"] = v_u_15.UPGRADE_CONFIG.BeeCapacity.MaxTier
	},
	{
		["Name"] = "BeeSpeed",
		["Tiers"] = nil,
		["Icon"] = "rbxassetid://128750030198922",
		["Description"] = "Increases the speed at which your bees fly.",
		["Tiers"] = v_u_15.UPGRADE_CONFIG.BeeSpeed.MaxTier
	},
	{
		["Name"] = "CompressorCapacity",
		["Tiers"] = nil,
		["Icon"] = "rbxassetid://103724535075252",
		["Description"] = "Increases how much honey your compressor can hold.",
		["Tiers"] = v_u_15.UPGRADE_CONFIG.CompressorCapacity.MaxTier
	},
	{
		["Name"] = "CompressorSpeed",
		["Tiers"] = nil,
		["Icon"] = "rbxassetid://96122069254577",
		["Description"] = "Increases how fast your compressor processes honey.",
		["Tiers"] = v_u_15.UPGRADE_CONFIG.CompressorSpeed.MaxTier
	},
	{
		["Name"] = "PollinationAmount",
		["Tiers"] = nil,
		["Icon"] = "rbxassetid://104381156132379",
		["Description"] = "Increases the amount of honey coins receieved.",
		["DisplayName"] = "Extra Honey Coins",
		["Tiers"] = v_u_15.UPGRADE_CONFIG.PollinationAmount.MaxTier
	}
}
local v_u_25 = v_u_21.Position
local v_u_26 = v_u_21:FindFirstChildOfClass("UIScale")
local v_u_27 = v_u_26 and (v_u_26.Scale or 1) or 1
local function v_u_29(p28) -- name: ScaleNode
	if p28:GetAttribute("BeeSkillTreeScaled") then
		return
	else
		p28:SetAttribute("BeeSkillTreeScaled", true)
		if p28:IsA("Model") then
			p28:ScaleTo(p28:GetScale() * 1)
		elseif p28:IsA("BasePart") then
			p28.Size = p28.Size * 1
		end
	end
end
function v17.Start() -- name: Start
	-- upvalues: (copy) v_u_9, (copy) v_u_11, (copy) v_u_14, (copy) v_u_13, (copy) v_u_10, (copy) v_u_2, (copy) v_u_15, (copy) v_u_19, (copy) v_u_29, (copy) v_u_3, (copy) v_u_12, (copy) v_u_18, (copy) v_u_24, (copy) v_u_22, (copy) v_u_1, (ref) v_u_26, (copy) v_u_27, (copy) v_u_21, (copy) v_u_25, (copy) v_u_8, (copy) v_u_7, (copy) v_u_23, (copy) v_u_20, (copy) v_u_4, (copy) v_u_16, (copy) v_u_6
	local v_u_30 = {}
	local function v_u_33() -- name: destroyTopTree
		-- upvalues: (copy) v_u_30
		local v31 = v_u_30[#v_u_30]
		if v31 then
			for _, v32 in v31.registry do
				if v32.node and v32.node.Parent then
					v32.node:Destroy()
				end
			end
			if v31.folder and v31.folder.Parent then
				v31.folder:Destroy()
			end
			v_u_30[#v_u_30] = nil
		end
	end
	local v_u_34 = false
	local v_u_35 = false
	v_u_9.Enabled = false
	local v_u_36 = v_u_11:GetStateForGui(v_u_9)
	v_u_36.ChangeEnabled:Set(true)
	local v_u_37 = nil
	local v_u_38 = nil
	local v_u_39 = false
	local v_u_40 = nil
	local v_u_41 = nil
	local v_u_42 = 0
	local v_u_43 = 0.025
	local v_u_44 = 1
	local v_u_45 = nil
	local v_u_46 = 0
	local v_u_47 = Vector2.new(0, 0)
	local v_u_48 = 0
	local v_u_49 = false
	local v_u_50 = nil
	local v_u_51 = nil
	local v_u_52 = CFrame.Angles(-1.5707963267948966, 0, 1.5707963267948966)
	local v_u_53 = nil
	local v_u_54 = CFrame.new(500, -4.5, 0) * v_u_52
	local v_u_55 = v_u_9:WaitForChild("Upgrade")
	local v_u_56 = v_u_55:WaitForChild("Main"):WaitForChild("Upgrade")
	local v_u_57 = v_u_56:WaitForChild("Claim"):WaitForChild("Folder"):WaitForChild("Label")
	local v_u_58 = v_u_55:WaitForChild("Main"):WaitForChild("Title")
	local v_u_59 = v_u_55:WaitForChild("Main"):WaitForChild("UpgradeText")
	local v_u_60 = v_u_55:WaitForChild("Main"):WaitForChild("Icon")
	local v_u_61 = v_u_55:WaitForChild("Main"):WaitForChild("Description")
	local v_u_62 = nil
	local v_u_63 = nil
	local v_u_64 = v_u_55:FindFirstChildOfClass("UIScale")
	if not v_u_64 then
		v_u_64 = Instance.new("UIScale")
		v_u_64.Parent = v_u_55
	end
	local v_u_65 = v_u_55.AbsoluteSize
	v_u_64.Scale = 0
	local function v_u_66() -- name: hideUpgradeFrame
		-- upvalues: (ref) v_u_62, (ref) v_u_63, (ref) v_u_14, (ref) v_u_64, (copy) v_u_55
		v_u_62 = nil
		if v_u_63 then
			v_u_63:Disconnect()
			v_u_63 = nil
		end
		v_u_14.stop(v_u_64, "Scale")
		v_u_14.target(v_u_64, 0.85, 7, {
			["Scale"] = 0
		})
		task.delay(0.4, function()
			-- upvalues: (ref) v_u_62, (ref) v_u_55
			if not v_u_62 then
				v_u_55.Visible = false
			end
		end)
	end
	local v_u_67 = nil
	local function v_u_73(p_u_68) -- name: showUpgradeFrame
		-- upvalues: (ref) v_u_62, (copy) v_u_56, (copy) v_u_58, (copy) v_u_60, (copy) v_u_61, (copy) v_u_59, (copy) v_u_57, (ref) v_u_67, (ref) v_u_14, (ref) v_u_64, (copy) v_u_55, (ref) v_u_13, (ref) v_u_63
		v_u_62 = p_u_68
		local v69 = p_u_68.state == "purchased"
		v_u_56.Visible = not v69
		v_u_58.Text = p_u_68.label:gsub("<br/>.*", "")
		v_u_60.Image = p_u_68.icon
		v_u_61.Text = p_u_68.description or ""
		if p_u_68.levels and p_u_68.levels > 1 then
			local v70 = p_u_68.progress or 0
			v_u_59.Text = ("LVL: %* -> %* (%*/%*)"):format(p_u_68.tier - 1, p_u_68.tier, v70, p_u_68.levels)
		else
			v_u_59.Text = ("LVL: %* -> %*"):format(p_u_68.tier - 1, p_u_68.tier)
		end
		if v69 then
			v_u_59.Text = "Purchased"
			v_u_57.Text = ""
		elseif p_u_68.isPageNode then
			v_u_59.Text = "Opens: " .. (p_u_68.pageName or "Sub-tree")
			v_u_57.Text = "Free"
			v_u_57.TextColor3 = Color3.new(0.4, 1, 0.6)
		elseif p_u_68.isBackNode then
			v_u_59.Text = "Navigate back"
			v_u_57.Text = "\226\134\144"
			v_u_57.TextColor3 = Color3.new(1, 1, 1)
		end
		v_u_67()
		v_u_14.stop(v_u_64, "Scale")
		v_u_64.Scale = 0
		v_u_55.Visible = true
		v_u_14.target(v_u_64, 0.55, 6, {
			["Scale"] = 1
		})
		local function v72() -- name: updateAffordability
			-- upvalues: (copy) p_u_68, (ref) v_u_57, (ref) v_u_13
			if p_u_68.state == "purchased" then
				v_u_57.Text = ""
			else
				local v71 = v_u_13:GetData()
				v_u_57.TextColor3 = (v71 and (v71.SpecialCurrency and v71.SpecialCurrency.HoneyCoins) or 0) >= p_u_68.cost and Color3.new(1, 1, 1) or Color3.fromRGB(255, 60, 60)
			end
		end
		v72()
		if v_u_63 then
			v_u_63:Disconnect()
		end
		v_u_63 = v_u_13:GetPathSignal("SpecialCurrency/HoneyCoins"):Connect(v72)
	end
	v_u_67 = function()
		-- upvalues: (ref) v_u_62, (copy) v_u_66, (copy) v_u_55, (ref) v_u_64, (ref) v_u_65
		if not (v_u_62 and (v_u_62.node and v_u_62.node.Parent)) then
			v_u_66()
			return
		end
		local v74 = v_u_62.node
		local v75 = workspace.CurrentCamera
		local v76 = v74.Position
		local v77, v78 = v75:WorldToViewportPoint(v76)
		if not v78 then
			v_u_55.Visible = false
			return
		end
		v_u_55.Visible = true
		local v79 = v75.ViewportSize
		if v_u_64.Scale >= 0.99 then
			v_u_65 = v_u_55.AbsoluteSize
		end
		local v80 = v_u_65.X
		local v81 = v_u_65.Y
		local v82 = v74.Size.X * 0.5
		local v83 = v75:WorldToViewportPoint(v76 + Vector3.new(v82, 0, 0))
		local v84 = v74.Size.Z * 0.5
		local v85 = v75:WorldToViewportPoint(v76 + Vector3.new(0, 0, v84))
		local v86 = v83.X - v77.X
		local v87 = math.abs(v86)
		local v88 = v85.X - v77.X
		local v89 = math.abs(v88)
		local v90 = v83.Y - v77.Y
		local v91 = math.abs(v90)
		local v92 = v85.Y - v77.Y
		local v93 = math.abs(v92)
		local v94 = math.max(v87, v89, v91, v93, 30)
		local v95 = v77.X
		local v96 = v77.Y
		local v97 = v79.X - v80 - 16
		local v98 = math.max(v97, 16)
		local v99 = v79.Y - v81 - 16
		local v100 = math.max(v99, 16)
		local v101 = {
			{
				["x"] = nil,
				["y"] = nil,
				["primary"] = "x",
				["x"] = v95 - v94 - 12 - v80,
				["y"] = v96 - v81 * 0.5
			},
			{
				["x"] = nil,
				["y"] = nil,
				["primary"] = "x",
				["x"] = v95 + v94 + 12,
				["y"] = v96 - v81 * 0.5
			},
			{
				["x"] = nil,
				["y"] = nil,
				["primary"] = "y",
				["x"] = v95 - v80 * 0.5,
				["y"] = v96 - v94 - 12 - v81
			},
			{
				["x"] = nil,
				["y"] = nil,
				["primary"] = "y",
				["x"] = v95 - v80 * 0.5,
				["y"] = v96 + v94 + 12
			}
		}
		local v102 = nil
		local v103 = nil
		for _, v104 in v101 do
			local v105
			if v104.primary == "x" then
				if v104.x >= 16 then
					v105 = v104.x <= v98
				else
					v105 = false
				end
			elseif v104.y >= 16 then
				v105 = v104.y <= v100
			else
				v105 = false
			end
			if v105 then
				local v106 = v104.x
				v102 = math.clamp(v106, 16, v98)
				local v107 = v104.y
				v103 = math.clamp(v107, 16, v100)
				break
			end
		end
		if not v102 then
			local v108 = v101[1]
			local v109 = v108.x
			v102 = math.clamp(v109, 16, v98)
			local v110 = v108.y
			v103 = math.clamp(v110, 16, v100)
		end
		local v111 = v_u_55.AnchorPoint
		v_u_55.Position = UDim2.fromOffset(v102 + v80 * v111.X, v103 + v81 * v111.Y)
	end
	local v_u_112 = nil
	local function v_u_117(p_u_113)
		-- upvalues: (ref) v_u_10, (ref) v_u_112
		local v114 = p_u_113.node
		local v115 = v114:FindFirstChildOfClass("ClickDetector")
		if v115 then
			v115:Destroy()
			local v116 = Instance.new("ClickDetector")
			v116.CursorIcon = "rbxasset://textures/Cursors/KeyboardMouse/ArrowCursor.png"
			v116.MaxActivationDistance = 1000
			v116.Parent = v114
			v116.MouseClick:Connect(function()
				-- upvalues: (copy) p_u_113, (ref) v_u_10, (ref) v_u_112
				if p_u_113.state == "revealed" then
					v_u_10.SkillTreeSounds.Click:Play()
					if p_u_113.isPageNode then
						v_u_112(p_u_113.pageName)
					else
						p_u_113:purchase()
					end
				else
					return
				end
			end)
		end
	end
	v_u_112 = function(p118)
		-- upvalues: (copy) v_u_66, (ref) v_u_10, (ref) v_u_2, (ref) v_u_15, (ref) v_u_34, (ref) v_u_35, (ref) v_u_39, (ref) v_u_42, (ref) v_u_53, (ref) v_u_47, (ref) v_u_14, (copy) v_u_54, (ref) v_u_19, (ref) v_u_117, (ref) v_u_62, (copy) v_u_73, (copy) v_u_33, (ref) v_u_38, (copy) v_u_30, (ref) v_u_29
		v_u_66()
		v_u_10.SkillTreeSounds.Open:Play()
		local v119 = workspace:FindFirstChild("SkillTree")
		if v119 then
			v119.Name = "SkillTree_Main"
			v119.Parent = v_u_2
		end
		local v120 = v_u_15.PAGE_NODES[p118]
		if v120 then
			local v121 = v120.SubTree
			local v122 = v_u_15.SUB_TREE_CONFIGS[v121]
			if v122 then
				local v123 = {
					{
						["Name"] = "__back__",
						["Tiers"] = 1,
						["Icon"] = nil,
						["IsOrigin"] = true,
						["Description"] = nil,
						["DisplayName"] = nil,
						["Icon"] = v_u_15.SUB_TREE_ORIGIN[v121].Icon,
						["Description"] = v_u_15.SUB_TREE_ORIGIN[v121].Description,
						["DisplayName"] = v_u_15.SUB_TREE_ORIGIN[v121].Label
					}
				}
				local v124 = v122.Order
				if v124 then
					for _, v125 in v124 do
						local v126 = v122[v125]
						if v126 and v126.MaxTier then
							local v127 = {
								["Name"] = nil,
								["Tiers"] = nil,
								["Icon"] = nil,
								["IsOrigin"] = false,
								["Description"] = nil,
								["DisplayName"] = nil,
								["Name"] = v125,
								["Tiers"] = v126.MaxTier,
								["Icon"] = v126.Icon,
								["Description"] = v126.Description,
								["DisplayName"] = v126.DisplayName
							}
							table.insert(v123, v127)
						end
					end
				else
					for v128, v129 in v122 do
						if type(v129) == "table" and v129.MaxTier then
							local v130 = {
								["Name"] = nil,
								["Tiers"] = nil,
								["Icon"] = nil,
								["IsOrigin"] = false,
								["Description"] = nil,
								["DisplayName"] = nil,
								["Name"] = v128,
								["Tiers"] = v129.MaxTier,
								["Icon"] = v129.Icon,
								["Description"] = v129.Description,
								["DisplayName"] = v129.DisplayName
							}
							table.insert(v123, v130)
						end
					end
					table.sort(v123, function(p131, p132)
						return p131.Name < p132.Name
					end)
				end
				if v123[1] then
					v123[1].IsOrigin = true
				end
				v_u_34 = false
				v_u_35 = false
				v_u_39 = false
				v_u_42 = 0
				v_u_53 = nil
				v_u_47 = Vector2.new(0, 0)
				v_u_14.stop(workspace.CurrentCamera, "CFrame")
				workspace.CurrentCamera.CFrame = v_u_54
				local v134 = {
					["isSubTree"] = true,
					["subTreeName"] = nil,
					["onPageNodeClicked"] = nil,
					["onBackClicked"] = nil,
					["subTreeName"] = v121,
					["onPageNodeClicked"] = function(_) -- name: onPageNodeClicked end,
					["onBackClicked"] = function() -- name: onBackClicked
						-- upvalues: (ref) v_u_66, (ref) v_u_33, (ref) v_u_2, (ref) v_u_34, (ref) v_u_35, (ref) v_u_39, (ref) v_u_42, (ref) v_u_53, (ref) v_u_47, (ref) v_u_14, (ref) v_u_54, (ref) v_u_10, (ref) v_u_38, (ref) v_u_30
						v_u_66()
						v_u_33()
						local v133 = v_u_2:FindFirstChild("SkillTree_Main")
						if v133 then
							v133.Name = "SkillTree"
							v133.Parent = workspace
						end
						v_u_34 = false
						v_u_35 = false
						v_u_39 = false
						v_u_42 = 0
						v_u_53 = nil
						v_u_47 = Vector2.new(0, 0)
						v_u_14.stop(workspace.CurrentCamera, "CFrame")
						workspace.CurrentCamera.CFrame = v_u_54
						v_u_10.SkillTreeSounds.Open:Play()
						v_u_38 = v_u_30[#v_u_30] and v_u_30[#v_u_30].registry or nil
					end
				}
				local _, v137 = v_u_19.generate(tonumber(v121:byte(1)) * 1000 + 42, (workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -25)).Position, v123, function(p135)
					-- upvalues: (ref) v_u_117
					v_u_117(p135)
				end, function(p136)
					-- upvalues: (ref) v_u_62, (ref) v_u_73
					if v_u_62 == p136 then
						v_u_73(p136)
					end
				end, v134)
				if v137 then
					for _, v138 in v137 do
						if v138.node then
							v_u_29(v138.node)
						end
					end
				end
				local v139 = v_u_30
				local v140 = {
					["registry"] = v137,
					["folder"] = workspace:FindFirstChild("SkillTree"),
					["subTreeName"] = v121
				}
				table.insert(v139, v140)
				v_u_38 = v137
			end
		else
			return
		end
	end
	v_u_56.Active = false
	local v141 = v_u_56:FindFirstChild("Claim")
	if v141 then
		if v141:IsA("GuiObject") then
			v141.BackgroundTransparency = 1
		end
		if v141:IsA("ImageLabel") or v141:IsA("ImageButton") then
			v141.ImageTransparency = 1
		end
		for _, v142 in v141:GetChildren() do
			if v142.Name ~= "Folder" then
				if v142:IsA("UIStroke") then
					v142.Enabled = false
				elseif v142:IsA("ImageLabel") or v142:IsA("ImageButton") then
					v142.ImageTransparency = 1
					v142.BackgroundTransparency = 1
				elseif v142:IsA("GuiObject") then
					v142.BackgroundTransparency = 1
				end
			end
		end
	end
	local v_u_143 = nil
	local v_u_144 = nil
	local v_u_145 = false
	v_u_3.InputBegan:Connect(function(p146, p147)
		-- upvalues: (copy) v_u_36, (ref) v_u_38, (ref) v_u_144, (ref) v_u_145, (copy) v_u_66, (ref) v_u_143, (copy) v_u_73
		if p147 then
			return
		end
		if p146.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		if not v_u_36.Visible:Get() then
			return
		end
		local v148 = workspace:FindFirstChild("SkillTree")
		if not (v148 and v_u_38) then
			return
		end
		local v149 = RaycastParams.new()
		v149.FilterType = Enum.RaycastFilterType.Include
		v149.FilterDescendantsInstances = { v148 }
		local v150 = workspace.CurrentCamera:ViewportPointToRay(p146.Position.X, p146.Position.Y)
		local v151 = workspace:Raycast(v150.Origin, v150.Direction * 100, v149)
		if not (v151 and v151.Instance) then
			return
		end
		local v152 = v151.Instance
		while v152 and not v152:FindFirstChildOfClass("ClickDetector") do
			v152 = v152.Parent
			if v152 == v148 or v152 == workspace then
				v152 = nil
				break
			end
		end
		if v152 then
			for _, v_u_153 in v_u_38 do
				if v_u_153.node == v152 and v_u_153.state == "revealed" then
					if v_u_144 then
						pcall(task.cancel, v_u_144)
						v_u_144 = nil
					end
					if v_u_145 then
						v_u_66()
						v_u_145 = false
					end
					v_u_143 = nil
					v_u_143 = v_u_153
					v_u_144 = task.delay(0.35, function()
						-- upvalues: (ref) v_u_143, (copy) v_u_153, (ref) v_u_73, (ref) v_u_145, (ref) v_u_144
						if v_u_143 == v_u_153 then
							v_u_73(v_u_153)
							v_u_145 = true
						end
						v_u_144 = nil
					end)
					return
				end
			end
		end
	end)
	v_u_3.InputEnded:Connect(function(p154)
		-- upvalues: (ref) v_u_144, (ref) v_u_145, (copy) v_u_66, (ref) v_u_143
		if p154.UserInputType == Enum.UserInputType.Touch then
			if v_u_144 then
				pcall(task.cancel, v_u_144)
				v_u_144 = nil
			end
			if v_u_145 then
				v_u_66()
				v_u_145 = false
			end
			v_u_143 = nil
		end
	end)
	v_u_12({
		["instance"] = v_u_9.CloseButton,
		["onclick"] = function() -- name: onclick
			-- upvalues: (copy) v_u_66, (copy) v_u_30, (copy) v_u_33, (ref) v_u_2, (ref) v_u_38, (ref) v_u_11, (ref) v_u_9
			v_u_66()
			while #v_u_30 > 0 do
				v_u_33()
			end
			local v155 = v_u_2:FindFirstChild("SkillTree_Main")
			if v155 then
				v155:Destroy()
			end
			v_u_38 = nil
			v_u_11:Close(v_u_9)
		end
	})
	v_u_9.CloseButton.Active = true
	v_u_9.CloseButton.Selectable = true
	local v_u_156 = Instance.new("Highlight")
	v_u_156.Name = "SkillTreeHighlight"
	v_u_156.FillTransparency = 1
	v_u_156.OutlineColor = Color3.new(1, 1, 1)
	v_u_156.OutlineTransparency = 1
	v_u_156.Parent = v_u_2
	local v_u_157 = RaycastParams.new()
	v_u_157.FilterType = Enum.RaycastFilterType.Include
	local v_u_158 = nil
	local v_u_159 = {}
	local function v_u_169() -- name: buildMainTree
		-- upvalues: (ref) v_u_19, (ref) v_u_24, (ref) v_u_117, (ref) v_u_62, (copy) v_u_73, (ref) v_u_112, (ref) v_u_38, (copy) v_u_30, (ref) v_u_29
		local v161 = {
			["isSubTree"] = false,
			["onPageNodeClicked"] = nil,
			["onPageNodeClicked"] = function(p160) -- name: onPageNodeClicked
				-- upvalues: (ref) v_u_112
				v_u_112(p160)
			end
		}
		local _, v164 = v_u_19.generate(67683, (workspace.CurrentCamera.CFrame * CFrame.new(0, 0, -25)).Position, v_u_24, function(p162)
			-- upvalues: (ref) v_u_117
			v_u_117(p162)
		end, function(p163)
			-- upvalues: (ref) v_u_62, (ref) v_u_73
			if v_u_62 == p163 then
				v_u_73(p163)
			end
		end, v161)
		v_u_38 = v164
		local v165 = v_u_30
		local v166 = {
			["registry"] = v164,
			["folder"] = workspace:FindFirstChild("SkillTree")
		}
		table.insert(v165, v166)
		local v167 = v_u_38
		if v167 then
			for _, v168 in v167 do
				if v168.node then
					v_u_29(v168.node)
				end
			end
		end
	end
	v_u_36.Visible:Observe(function(p170)
		-- upvalues: (copy) v_u_156, (copy) v_u_66, (ref) v_u_158, (ref) v_u_22, (ref) v_u_34, (ref) v_u_35, (ref) v_u_39, (ref) v_u_1, (ref) v_u_14, (ref) v_u_9, (ref) v_u_159, (ref) v_u_26, (ref) v_u_27, (ref) v_u_21, (ref) v_u_25, (ref) v_u_8, (ref) v_u_7, (ref) v_u_23, (ref) v_u_20, (ref) v_u_4, (ref) v_u_18, (copy) v_u_52, (ref) v_u_3, (ref) v_u_62, (ref) v_u_67, (copy) v_u_157, (ref) v_u_38, (ref) v_u_13, (copy) v_u_73, (ref) v_u_37, (ref) v_u_42, (ref) v_u_53, (ref) v_u_47, (copy) v_u_54, (copy) v_u_169, (copy) v_u_30, (copy) v_u_33, (ref) v_u_2
		v_u_156.Adornee = nil
		v_u_156.OutlineTransparency = 1
		v_u_66()
		if v_u_158 then
			v_u_158:Disconnect()
			v_u_158 = nil
		end
		v_u_22[("%*able"):format(p170 and "Dis" or "En")](v_u_22)
		if p170 then
			if v_u_7.Character:FindFirstChild("Humanoid") then
				v_u_7.Character.Humanoid:UnequipTools()
			end
			v_u_159 = {}
			for _, v171 in game.Players.LocalPlayer.PlayerGui:GetChildren() do
				if v171:IsA("LayerCollector") then
					v_u_159[v171] = v171.Enabled
					if v171.Name == "HoneyCoinCurrency_UI" then
						if not v_u_26 then
							v_u_26 = Instance.new("UIScale")
							v_u_26.Name = "BeeSkillTreeCurrencyScale"
							v_u_26.Scale = v_u_27
							v_u_26.Parent = v_u_21
						end
						v_u_21.Position = v_u_23
						v_u_26.Scale = 1.4
					elseif v171.Name ~= "RoyalJellyCurrency_UI" then
						v171.Enabled = false
					end
				end
			end
			v_u_20.Open:Play()
			v_u_1:BindActionAtPriority("SkillTreeZoom", function(_, p172, p173)
				-- upvalues: (ref) v_u_35, (ref) v_u_34
				if p173.KeyCode == Enum.KeyCode.ButtonL1 then
					v_u_35 = p172 == Enum.UserInputState.Begin
				elseif p173.KeyCode == Enum.KeyCode.ButtonR1 then
					v_u_34 = p172 == Enum.UserInputState.Begin
				end
				return Enum.ContextActionResult.Sink
			end, false, 9999, Enum.KeyCode.ButtonL1, Enum.KeyCode.ButtonR1)
			v_u_14.target(v_u_9.CloseButton, 0.8, 3, {
				["Position"] = UDim2.fromScale(0.95, 0.133)
			})
			v_u_158 = v_u_4.RenderStepped:Connect(function(p174)
				-- upvalues: (ref) v_u_34, (ref) v_u_35, (ref) v_u_18, (ref) v_u_52, (ref) v_u_3, (ref) v_u_62, (ref) v_u_67, (ref) v_u_156, (ref) v_u_157, (ref) v_u_14, (ref) v_u_20, (ref) v_u_38, (ref) v_u_13, (ref) v_u_73, (ref) v_u_66
				if v_u_34 or v_u_35 then
					local v175 = workspace.CurrentCamera
					local v176 = v175.CFrame.Position
					local v177 = 0
					if v_u_34 then
						v177 = v177 - 1
					end
					if v_u_35 then
						v177 = v177 + 1
					end
					local v178 = v176.Y + v177 * 22 * p174
					local v179 = v_u_18.ZoomLimit.Min
					local v180 = v_u_18.ZoomLimit.Max
					if v178 < v179 then
						local v181 = (v178 - v179) * 0.18
						v178 = v179 + math.max(v181, -4)
					elseif v180 < v178 then
						local v182 = (v178 - v180) * 0.12
						v178 = v180 + math.min(v182, 4)
					end
					v175.CFrame = CFrame.new(v176.X, v178, v176.Z) * v_u_52
				end
				for _, v183 in v_u_3:GetGamepadState(Enum.UserInputType.Gamepad1) do
					if v183.KeyCode == Enum.KeyCode.Thumbstick1 then
						local v184 = v183.Position.X
						local v185 = v183.Position.Y
						if math.abs(v184) > 0.15 or math.abs(v185) > 0.15 then
							local v186 = workspace.CurrentCamera
							local v187 = v186.CFrame.Position
							local v188 = v_u_18.DragBounds
							local v189 = v187.X - 500 - v185 * 0.15
							local v190 = v187.Z - v184 * 0.15
							local v191 = CFrame.new
							if v188 < v189 then
								v189 = v188 + (v189 - v188) * 0.2
							elseif v189 < -v188 then
								v189 = -v188 + (v189 + v188) * 0.2
							end
							local v192 = v189 + 500
							local v193 = v187.Y
							if v188 < v190 then
								v190 = v188 + (v190 - v188) * 0.2
							elseif v190 < -v188 then
								v190 = -v188 + (v190 + v188) * 0.2
							end
							v186.CFrame = v191(v192, v193, v190) * v_u_52
						end
					end
				end
				if v_u_62 then
					v_u_67()
				end
				local v194 = workspace:FindFirstChild("SkillTree")
				if not v194 then
					v_u_156.Adornee = nil
					return
				end
				local v195 = v_u_3.TouchEnabled
				if v195 then
					v195 = not v_u_3.MouseEnabled
				end
				if v195 then
					if v_u_156.Adornee then
						v_u_156.Adornee = nil
						v_u_156.OutlineTransparency = 1
					end
					return
				end
				v_u_157.FilterDescendantsInstances = { v194 }
				local v196 = v_u_3:GetMouseLocation()
				local v197 = workspace.CurrentCamera:ViewportPointToRay(v196.X, v196.Y)
				local v198 = workspace:Raycast(v197.Origin, v197.Direction * 100, v_u_157)
				if not (v198 and v198.Instance) then
					v_u_156.Adornee = nil
					v_u_156.OutlineTransparency = 1
					if v_u_62 then
						v_u_66()
					end
					return
				end
				local v199 = v198.Instance
				while v199 and not v199:FindFirstChildOfClass("ClickDetector") do
					v199 = v199.Parent
					if v199 == v194 or v199 == workspace then
						v199 = nil
						break
					end
				end
				if not v199 then
					v_u_156.Adornee = nil
					v_u_156.OutlineTransparency = 1
					if v_u_62 then
						v_u_66()
					end
					goto l80
				end
				if v_u_156.Adornee ~= v199 then
					v_u_156.Adornee = v199
					v_u_14.stop(v_u_156, "OutlineTransparency")
					v_u_156.OutlineTransparency = 1
					v_u_14.target(v_u_156, 1, 3, {
						["OutlineTransparency"] = 0
					})
					v_u_20.Hover:Play()
				end
				local v201 = v_u_38
				if v201 then
					for _, v201 in v_u_38 do
						if v201.node == v199 then
							goto l54
						end
					end
					v201 = nil
				end
				::l54::
				if v201 and (v201.state == "revealed" or v201.state == "purchased") then
					local v202 = v_u_13:GetData()
					local v203 = v202 and (v202.SpecialCurrency and v202.SpecialCurrency.HoneyCoins) or 0
					v_u_156.OutlineColor = (v201.state == "purchased" or v201.isPageNode or (v201.isBackNode or v201.cost <= v203)) and Color3.new(1, 1, 1) or Color3.fromRGB(255, 60, 60)
					if v_u_62 ~= v201 then
						v_u_73(v201)
					end
				else
					v_u_156.OutlineColor = Color3.new(1, 1, 1)
					if v_u_62 then
						v_u_66()
					end
				end
				::l80::
			end)
		else
			v_u_34 = false
			v_u_35 = false
			v_u_39 = false
			v_u_1:UnbindAction("SkillTreeZoom")
			v_u_14.stop(workspace.CurrentCamera, "CFrame")
			v_u_14.stop(v_u_9.CloseButton, "Position")
			v_u_9.CloseButton.Position = UDim2.fromScale(1.1, 0.133)
			for v204, v205 in v_u_159 do
				if v204:IsDescendantOf(game.Players.LocalPlayer) then
					v204.Enabled = v205
				end
			end
			if not v_u_26 then
				v_u_26 = Instance.new("UIScale")
				v_u_26.Name = "BeeSkillTreeCurrencyScale"
				v_u_26.Scale = v_u_27
				v_u_26.Parent = v_u_21
			end
			v_u_21.Position = v_u_25
			v_u_26.Scale = v_u_27
			task.spawn(function()
				-- upvalues: (ref) v_u_8
				v_u_8.Bottom_UI.Enabled = true
				v_u_8.GearHover_UI.Enabled = true
				v_u_8.Gift_Notification.Enabled = true
				v_u_8.Hud_UI.Enabled = true
				v_u_8.PetUI.Enabled = true
				v_u_8.PickupTally.Enabled = true
				v_u_8.PlantHover_UI.Enabled = true
				v_u_8.Pop_Effect.Enabled = true
				v_u_8.Rejoin_UI.Enabled = true
				v_u_8.Sheckles_UI.Enabled = true
				v_u_8.Teleport_UI.Enabled = true
				v_u_8.Top_Notification.Enabled = true
				v_u_8.Tutorial_UI.Enabled = true
				v_u_8.BackpackGui.Enabled = true
				if v_u_8:FindFirstChild("TouchGui") then
					v_u_8.TouchGui.Enabled = true
				end
			end)
		end
		workspace.CurrentCamera.CameraType = p170 and Enum.CameraType.Scriptable or Enum.CameraType.Custom
		if p170 then
			v_u_37 = workspace.CurrentCamera.CFrame.Rotation
			v_u_34 = false
			v_u_35 = false
			v_u_39 = false
			v_u_42 = 0
			v_u_53 = nil
			v_u_47 = Vector2.new(0, 0)
			v_u_14.stop(workspace.CurrentCamera, "CFrame")
			workspace.CurrentCamera.CFrame = v_u_54
			v_u_169()
		elseif v_u_37 then
			workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position) * v_u_37
			while #v_u_30 > 0 do
				v_u_33()
			end
			local v206 = v_u_2:FindFirstChild("SkillTree_Main")
			if v206 then
				v206:Destroy()
			end
			v_u_38 = nil
		end
	end)
	v_u_16.OnUpdated:Connect(function()
		-- upvalues: (copy) v_u_36, (copy) v_u_66, (copy) v_u_30, (copy) v_u_33, (ref) v_u_2, (ref) v_u_38, (ref) v_u_34, (ref) v_u_35, (ref) v_u_39, (ref) v_u_42, (ref) v_u_53, (ref) v_u_47, (ref) v_u_14, (copy) v_u_54, (copy) v_u_169
		if v_u_36.Visible:Get() then
			v_u_66()
			while #v_u_30 > 0 do
				v_u_33()
			end
			local v207 = v_u_2:FindFirstChild("SkillTree_Main")
			if v207 then
				v207:Destroy()
			end
			v_u_38 = nil
			v_u_34 = false
			v_u_35 = false
			v_u_39 = false
			v_u_42 = 0
			v_u_53 = nil
			v_u_47 = Vector2.new(0, 0)
			v_u_14.stop(workspace.CurrentCamera, "CFrame")
			workspace.CurrentCamera.CFrame = v_u_54
			v_u_169()
		end
	end)
	local v_u_208 = {
		[Enum.UserInputType.Gamepad1] = true,
		[Enum.UserInputType.Gamepad2] = true,
		[Enum.UserInputType.Gamepad3] = true,
		[Enum.UserInputType.Gamepad4] = true
	}
	v_u_3.InputChanged:Connect(function(p209)
		-- upvalues: (copy) v_u_36, (ref) v_u_39, (ref) v_u_18, (ref) v_u_14, (copy) v_u_52, (ref) v_u_48, (ref) v_u_42, (ref) v_u_40, (ref) v_u_43, (ref) v_u_44, (ref) v_u_41, (ref) v_u_46, (ref) v_u_45, (ref) v_u_47
		if v_u_36.Visible:Get() then
			if p209.UserInputType == Enum.UserInputType.MouseWheel then
				if not v_u_39 then
					local v_u_210 = workspace.CurrentCamera
					local v211 = v_u_18.ZoomLimit.Min
					local v212 = v_u_18.ZoomLimit.Max
					local v213 = v_u_210.CFrame.Position.Y
					local v214 = -p209.Position.Z * 3.5
					local v215
					if v213 < v211 and v214 < 0 or v212 < v213 and v214 > 0 then
						v215 = v213 + v214 * (v212 < v213 and v214 > 0 and 0.12 or 0.18)
					else
						v215 = v213 + v214
						if v215 < v211 then
							v215 = v211 + (v215 - v211) * 0.18
						end
						if v212 < v215 then
							v215 = v212 + (v215 - v212) * 0.12
						end
					end
					local v216 = v211 - 4
					local v217 = v212 + 4
					local v218 = math.clamp(v215, v216, v217)
					v_u_14.target(v_u_210, 0.9, 6, {
						["CFrame"] = CFrame.new(v_u_210.CFrame.Position.X, v218, v_u_210.CFrame.Position.Z) * v_u_52
					})
					v_u_48 = os.clock()
					local v_u_219 = v_u_48
					task.delay(0.2, function()
						-- upvalues: (ref) v_u_48, (copy) v_u_219, (copy) v_u_210, (ref) v_u_18, (ref) v_u_14, (ref) v_u_52
						if v_u_48 == v_u_219 then
							local v220 = v_u_210.CFrame.Position
							local v221 = v220.Y
							local v222 = v_u_18.ZoomLimit.Min
							local v223 = v_u_18.ZoomLimit.Max
							local v224 = math.clamp(v221, v222, v223)
							if v224 ~= v220.Y then
								v_u_14.target(v_u_210, 0.95, 4, {
									["CFrame"] = CFrame.new(v220.X, v224, v220.Z) * v_u_52
								})
							end
						end
					end)
				end
			else
				if v_u_39 and (v_u_42 < 2 and (p209.UserInputType == Enum.UserInputType.MouseMovement or p209.UserInputType == Enum.UserInputType.Touch)) then
					local v225 = p209.Position - v_u_40
					local v226 = v_u_43 * v_u_44
					local v227 = v_u_41.X - 500 - v225.Y * v226
					local v228 = v_u_41.Z + v225.X * v226
					local v229 = os.clock()
					local v230 = v229 - v_u_46
					if v_u_45 and v230 > 0 then
						local v231 = p209.Position - v_u_45
						local v232 = Vector2.new(v231.X, v231.Y) / v230
						local v233 = v_u_47
						local v234 = v230 * 30
						v_u_47 = v233:Lerp(v232, (math.clamp(v234, 0, 1)))
					end
					v_u_45 = p209.Position
					v_u_46 = v229
					local v235 = v_u_18.DragBounds
					if v235 < v227 then
						v227 = v235 + (v227 - v235) * 0.2
					elseif v227 < -v235 then
						v227 = -v235 + (v227 + v235) * 0.2
					end
					local v236 = v227 + 500
					if v235 < v228 then
						v228 = v235 + (v228 - v235) * 0.2
					elseif v228 < -v235 then
						v228 = -v235 + (v228 + v235) * 0.2
					end
					local v237 = workspace.CurrentCamera.CFrame.Position.Y
					workspace.CurrentCamera.CFrame = CFrame.new(v236, v237, v228) * v_u_52
				end
				return
			end
		else
			return
		end
	end)
	v_u_3.TouchPinch:Connect(function(_, p238, _, p239)
		-- upvalues: (copy) v_u_36, (ref) v_u_39, (ref) v_u_53, (ref) v_u_18, (ref) v_u_14, (copy) v_u_52
		if v_u_36.Visible:Get() then
			if p239 == Enum.UserInputState.Begin then
				v_u_39 = false
				v_u_53 = workspace.CurrentCamera.CFrame.Position.Y
			elseif p239 == Enum.UserInputState.End or p239 == Enum.UserInputState.Cancel then
				local v240 = workspace.CurrentCamera
				local v241 = v240.CFrame.Position
				local v242 = v241.Y
				local v243 = v_u_18.ZoomLimit.Min
				local v244 = v_u_18.ZoomLimit.Max
				local v245 = math.clamp(v242, v243, v244)
				if v245 ~= v241.Y then
					v_u_14.target(v240, 0.9, 5, {
						["CFrame"] = CFrame.new(v241.X, v245, v241.Z) * v_u_52
					})
					return
				end
			else
				local v246 = workspace.CurrentCamera
				local v247 = v_u_53 - (p238 - 1) * 28
				local v248 = v_u_18.ZoomLimit.Min
				local v249 = v_u_18.ZoomLimit.Max
				if v247 < v248 then
					local v250 = (v247 - v248) * 0.18
					v247 = v248 + math.max(v250, -4)
				elseif v249 < v247 then
					local v251 = (v247 - v249) * 0.12
					v247 = v249 + math.min(v251, 4)
				end
				v_u_14.target(v246, 0.8, 8, {
					["CFrame"] = CFrame.new(v246.CFrame.Position.X, v247, v246.CFrame.Position.Z) * v_u_52
				})
			end
		else
			return
		end
	end)
	v_u_3.InputBegan:Connect(function(p252, _)
		-- upvalues: (ref) v_u_42, (copy) v_u_36, (ref) v_u_39, (ref) v_u_40, (ref) v_u_41, (ref) v_u_50, (ref) v_u_62, (ref) v_u_49, (ref) v_u_3, (ref) v_u_51, (ref) v_u_8, (copy) v_u_55, (ref) v_u_43, (ref) v_u_18, (ref) v_u_44, (ref) v_u_45, (ref) v_u_46, (ref) v_u_47, (ref) v_u_14
		if p252.UserInputType == Enum.UserInputType.Touch then
			v_u_42 = v_u_42 + 1
		end
		if p252.UserInputType == Enum.UserInputType.MouseButton1 or p252.UserInputType == Enum.UserInputType.Touch then
			if not v_u_36.Visible:Get() then
				return
			end
			if v_u_42 > 1 then
				v_u_39 = false
				return
			end
			v_u_39 = true
			v_u_40 = p252.Position
			v_u_41 = workspace.CurrentCamera.CFrame.Position
			v_u_50 = v_u_62
			v_u_49 = false
			local v253 = v_u_3:GetMouseLocation()
			v_u_51 = v253
			if v_u_62 then
				for _, v254 in v_u_8:GetGuiObjectsAtPosition(v253.X, v253.Y) do
					if v254 == v_u_55 or v254:IsDescendantOf(v_u_55) then
						v_u_49 = true
						break
					end
				end
			end
			v_u_43 = p252.UserInputType == Enum.UserInputType.Touch and 0.1 or 0.045
			local v255 = v_u_18.ZoomLimit
			local v256 = (workspace.CurrentCamera.CFrame.Position.Y - v255.Min) / (v255.Max - v255.Min)
			v_u_44 = math.clamp(v256, 0, 1) * 1.3 + 0.5
			v_u_45 = p252.Position
			v_u_46 = os.clock()
			v_u_47 = Vector2.new(0, 0)
			v_u_14.stop(workspace.CurrentCamera, "CFrame")
		end
	end)
	v_u_3.InputEnded:Connect(function(p257)
		-- upvalues: (ref) v_u_42, (ref) v_u_39, (copy) v_u_36, (ref) v_u_18, (ref) v_u_46, (ref) v_u_47, (ref) v_u_43, (ref) v_u_44, (ref) v_u_14, (copy) v_u_52
		if p257.UserInputType == Enum.UserInputType.Touch then
			local v258 = v_u_42 - 1
			v_u_42 = math.max(v258, 0)
		end
		if p257.UserInputType == Enum.UserInputType.MouseButton1 or p257.UserInputType == Enum.UserInputType.Touch then
			local v259 = v_u_39
			v_u_39 = false
			if v_u_36.Visible:Get() then
				local v260 = workspace.CurrentCamera
				local v261 = v260.CFrame.Position
				local v262 = v_u_18.DragBounds
				local v263 = v261.X
				local v264 = v261.Z
				if v259 then
					if os.clock() - v_u_46 > 0.06 then
						v_u_47 = Vector2.new(0, 0)
					end
					local v265 = v_u_43 * v_u_44
					v263 = v261.X - v_u_47.Y * v265 * 0.1
					v264 = v261.Z + v_u_47.X * v265 * 0.1
				end
				local v266 = v263 - 500
				local v267 = -v262
				local v268 = math.clamp(v266, v267, v262) + 500
				local v269 = -v262
				local v270 = math.clamp(v264, v269, v262)
				if v268 ~= v261.X or v270 ~= v261.Z then
					v_u_14.target(v260, 0.9, 5, {
						["CFrame"] = CFrame.new(v268, v261.Y, v270) * v_u_52
					})
				end
			end
		else
			return
		end
	end)
	local v_u_271 = Instance.new("Frame")
	v_u_271.Name = "ConsoleLegend"
	v_u_271.AnchorPoint = Vector2.new(1, 1)
	v_u_271.Position = UDim2.new(1, -24, 1, -24)
	v_u_271.AutomaticSize = Enum.AutomaticSize.XY
	v_u_271.Size = UDim2.fromOffset(0, 0)
	v_u_271.BackgroundTransparency = 1
	v_u_271.Visible = false
	v_u_271.Parent = v_u_9
	local v272 = Instance.new("UIListLayout")
	v272.FillDirection = Enum.FillDirection.Vertical
	v272.HorizontalAlignment = Enum.HorizontalAlignment.Right
	v272.VerticalAlignment = Enum.VerticalAlignment.Bottom
	v272.Padding = UDim.new(0, 6)
	v272.SortOrder = Enum.SortOrder.LayoutOrder
	v272.Parent = v_u_271
	local v_u_273 = {}
	for v274, v275 in {
		{
			["keyCode"] = nil,
			["action"] = "Move between nodes",
			["keyCode"] = Enum.KeyCode.Thumbstick1
		},
		{
			["keyCode"] = nil,
			["action"] = "Confirm purchase",
			["keyCode"] = Enum.KeyCode.ButtonX
		},
		{
			["keyCode"] = nil,
			["action"] = "Back",
			["keyCode"] = Enum.KeyCode.ButtonB
		},
		{
			["keyCode"] = nil,
			["action"] = "Zoom out",
			["keyCode"] = Enum.KeyCode.ButtonL1
		},
		{
			["keyCode"] = nil,
			["action"] = "Zoom in",
			["keyCode"] = Enum.KeyCode.ButtonR1
		}
	} do
		local v276 = Instance.new("Frame")
		v276.LayoutOrder = v274
		v276.AutomaticSize = Enum.AutomaticSize.X
		v276.Size = UDim2.fromOffset(0, 36)
		v276.BackgroundTransparency = 1
		v276.Parent = v_u_271
		local v277 = Instance.new("UIListLayout")
		v277.FillDirection = Enum.FillDirection.Horizontal
		v277.VerticalAlignment = Enum.VerticalAlignment.Center
		v277.Padding = UDim.new(0, 6)
		v277.SortOrder = Enum.SortOrder.LayoutOrder
		v277.Parent = v276
		local v278 = Instance.new("ImageLabel")
		v278.LayoutOrder = 1
		v278.Size = UDim2.fromOffset(32, 32)
		v278.BackgroundTransparency = 1
		local v_u_279 = v275.keyCode
		local v280, v281 = pcall(function()
			-- upvalues: (ref) v_u_3, (copy) v_u_279
			return v_u_3:GetImageForKeyCode(v_u_279)
		end)
		v278.Image = (not v280 or (typeof(v281) ~= "string" or v281 == "")) and "" or v281
		v278.Parent = v276
		local v282 = Instance.new("TextLabel")
		v282.LayoutOrder = 2
		v282.AutomaticSize = Enum.AutomaticSize.X
		v282.Size = UDim2.fromOffset(0, 32)
		v282.BackgroundTransparency = 1
		v282.Text = v275.action
		v282.FontFace = Font.new("rbxasset://fonts/families/ComicNeueAngular.json", Enum.FontWeight.Bold)
		v282.TextSize = 20
		v282.TextColor3 = Color3.fromRGB(255, 255, 255)
		v282.TextXAlignment = Enum.TextXAlignment.Left
		local v283 = Instance.new("UIStroke")
		v283.Color = Color3.fromRGB(0, 0, 0)
		v283.Thickness = 2
		v283.Parent = v282
		v282.Parent = v276
		v_u_273[v275.keyCode] = v278
	end
	local function v289() -- name: refreshLegend
		-- upvalues: (copy) v_u_36, (ref) v_u_3, (copy) v_u_271, (copy) v_u_273, (ref) v_u_6
		local v284 = v_u_36.Visible:Get()
		if v284 then
			v284 = v_u_3.PreferredInput == Enum.PreferredInput.Gamepad
		end
		v_u_271.Visible = v284
		if v284 then
			for v_u_285, v286 in v_u_273 do
				local v287, v288 = pcall(function()
					-- upvalues: (ref) v_u_3, (copy) v_u_285
					return v_u_3:GetImageForKeyCode(v_u_285)
				end)
				v286.Image = (not v287 or (typeof(v288) ~= "string" or v288 == "")) and "" or v288
			end
			task.defer(function()
				-- upvalues: (ref) v_u_36, (ref) v_u_3, (ref) v_u_6
				if v_u_36.Visible:Get() and v_u_3.PreferredInput == Enum.PreferredInput.Gamepad then
					v_u_6:EnableGamepadCursor(nil)
				end
			end)
		else
			v_u_6:DisableGamepadCursor()
		end
	end
	v_u_36.Visible:Listen(v289)
	v_u_3:GetPropertyChangedSignal("PreferredInput"):Connect(v289)
	v289()
	v_u_3.InputBegan:Connect(function(p290, p291)
		-- upvalues: (copy) v_u_36, (copy) v_u_208, (ref) v_u_3, (ref) v_u_8, (ref) v_u_38, (ref) v_u_20
		if p291 then
			return
		end
		if not v_u_36.Visible:Get() then
			return
		end
		if not v_u_208[p290.UserInputType] then
			return
		end
		if p290.KeyCode ~= Enum.KeyCode.ButtonX then
			return
		end
		local v292 = v_u_3:GetMouseLocation()
		v_u_8:GetGuiObjectsAtPosition(v292.X, v292.Y)
		local v293 = workspace:FindFirstChild("SkillTree")
		if v293 and v_u_38 then
			local v294 = RaycastParams.new()
			v294.FilterType = Enum.RaycastFilterType.Include
			v294.FilterDescendantsInstances = { v293 }
			local v295 = workspace.CurrentCamera:ViewportPointToRay(v292.X, v292.Y)
			local v296 = workspace:Raycast(v295.Origin, v295.Direction * 100, v294)
			if v296 and v296.Instance then
				local v297 = v296.Instance
				while v297 and not v297:FindFirstChildOfClass("ClickDetector") do
					v297 = v297.Parent
					if v297 == v293 or v297 == workspace then
						v297 = nil
						break
					end
				end
				if v297 then
					for _, v298 in v_u_38 do
						if v298.node == v297 then
							if v298.state == "revealed" then
								v_u_20.Click:Play()
								v298:purchase()
							end
							return
						end
					end
				end
			end
		end
	end)
end
task.spawn(v17.Start)
return v17
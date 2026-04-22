local v1 = game:GetService("ReplicatedStorage")
game:GetService("RunService")
local v_u_2 = game:GetService("Players")
local v3 = require(v1.Modules.DataService)
local v_u_4 = require(v1.Modules.ActivePetsUIController)
local v5 = require(v1.Modules.UpdateService)
local v6 = v1.Modules.GardenGuideModules
local v_u_7 = require(v6.SortButtonsLogic)
local v_u_8 = require(v6.DetailsViewHandler)
local v_u_9 = require(v6.GridCellHandler)
local v_u_10 = require(v6.GGUI)
local v_u_11 = require(v6.GGButtonEffects)
local v_u_12 = require(v6.GGSearchBarHandler)
local v_u_13 = require(v6.VirtualList)
local v_u_14 = require(v6.DataModules.GGStaticData)
local v_u_15 = require(v6.DataModules.GGData)
local v_u_16 = require(v6.DataModules.GGUIReferences)
local v_u_17 = require(v1.Data.GardenGuideData)
local v_u_18 = require(v1.Modules.GardenGuideController)
local v_u_19 = require(v1.Modules.PlantTraitsData)
local v_u_20 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local v21 = {}
local v_u_22 = v6.Templates
local _ = v_u_22.MenuTemplate
local v_u_23 = {}
local v_u_24 = v_u_2.LocalPlayer
assert(v_u_24, "No player")
local v_u_25 = nil
local v_u_26 = 0
local function v_u_31(p27)
	-- upvalues: (copy) v_u_16
	if p27.Unlocked and p27.Total then
		local v28 = #p27.Unlocked / p27.Total
		local v29 = v_u_16.CompletionBar
		v29.Bar.Bar_Actual.Size = UDim2.fromScale(v28, 1)
		local v30 = ("%* / %* Discovered"):format(#p27.Unlocked, p27.Total)
		v29.Bar.PROGRESS.Text = v30
		v29.Bar.PROGRESS_SHADOW.Text = v30
	end
end
local function v_u_35(p32)
	-- upvalues: (copy) v_u_16
	local v33 = v_u_16.GridView:FindFirstChild(p32)
	if v33 then
		for _, v34 in v33:GetChildren() do
			if v34:IsA("Frame") then
				v34:Destroy()
			end
		end
	end
end
local function v_u_59()
	-- upvalues: (copy) v_u_16, (copy) v_u_23, (copy) v_u_31, (copy) v_u_15, (copy) v_u_11, (copy) v_u_10, (ref) v_u_25, (copy) v_u_35, (ref) v_u_26, (copy) v_u_7, (copy) v_u_13, (copy) v_u_24
	local v_u_36 = v_u_16.GridView
	local v37 = v_u_16.SideMenuButtons
	for _, v38 in v_u_36:GetChildren() do
		if v38:IsA("Frame") then
			local v39 = v38:GetAttribute("MenuId")
			if v39 then
				v_u_23[v39] = v38
			end
		end
	end
	for _, v40 in v37:GetChildren() do
		if v40:GetAttribute("MenuType") == "DataGrid" and v40:IsA("Frame") then
			local v_u_41 = v40.Name
			v40:SetAttribute("MenuId", v_u_41)
			v_u_31(v_u_15[v_u_41])
			local v42 = v40:FindFirstChild("SENSOR")
			v42.Activated:Connect(function()
				-- upvalues: (ref) v_u_11, (ref) v_u_23, (copy) v_u_41, (ref) v_u_10, (copy) v_u_36, (ref) v_u_25, (ref) v_u_35, (ref) v_u_26, (ref) v_u_15, (ref) v_u_7, (ref) v_u_16, (ref) v_u_13, (ref) v_u_31
				v_u_11.Click()
				if v_u_23[v_u_41] then
					if v_u_10.CurrentDetail then
						v_u_10.CurrentDetail:Destroy()
					end
					v_u_10.NewPageOrder(v_u_23[v_u_41], v_u_10.CurrentPage)
					v_u_36.Visible = true
					v_u_10.ChangeTopBar(v_u_41, true)
					v_u_23[v_u_41]:GetChildren()
					if v_u_25 ~= v_u_41 then
						task.spawn(function()
							-- upvalues: (ref) v_u_35, (ref) v_u_25
							v_u_35((("%*Menu"):format(v_u_25)))
						end)
						if v_u_36:FindFirstChild((("%*Menu"):format(v_u_41))).Visible then
							local v43 = v_u_41
							if v_u_25 ~= v43 then
								v_u_26 = v_u_26 + 1
								if v_u_25 then
									v_u_35(v_u_25)
								end
								v_u_25 = v43
								local v_u_44 = {}
								for _, v45 in v_u_15[v_u_25].Data do
									table.insert(v_u_44, v45)
								end
								v_u_7.FilterAndSort(v_u_44)
								local v_u_46 = ("%*Menu"):format(v_u_25)
								task.spawn(function()
									-- upvalues: (ref) v_u_16, (copy) v_u_46, (ref) v_u_13, (copy) v_u_44
									local v47 = v_u_16.GridView
									local v48 = v47:FindFirstChild(v_u_46)
									local v49 = v47.GridSFrame
									v48.Parent = v47
									v49.CanvasPosition = Vector2.zero
									v_u_13(v48, v49, v_u_44)
								end)
							end
						end
					end
					v_u_31(v_u_15[v_u_41])
				else
					warn((("There is no menu with Id: %*"):format(v_u_41)))
				end
			end)
			v_u_11.AddHoverEffect(v42)
		end
	end
	local v_u_50 = v_u_16.DailyQuestView
	local v51 = v37.DailyQuests.SENSOR
	local v_u_52 = "Daily Quests"
	v51.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_50, (ref) v_u_35, (ref) v_u_25, (copy) v_u_52, (copy) v_u_36
		v_u_11.Click()
		if v_u_10.CurrentDetail then
			v_u_10.CurrentDetail:Destroy()
		end
		v_u_10.NewPageOrder(v_u_50, v_u_10.CurrentPage)
		v_u_35((("%*Menu"):format(v_u_25)))
		v_u_25 = ""
		if v_u_10.CurrentDetail then
			v_u_10.CurrentDetail.Visible = false
		end
		v_u_10.ChangeTopBar(v_u_52, false)
		v_u_36.Visible = false
	end)
	v_u_11.AddHoverEffect(v51)
	local v_u_53 = v_u_16.PlayerStatsView
	local v_u_54 = ("%*\'s Profile"):format(v_u_24.Name)
	local v55 = v37.PlayerStats.SENSOR
	v55.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_53, (ref) v_u_35, (ref) v_u_25, (copy) v_u_54, (copy) v_u_36
		v_u_11.Click()
		if v_u_10.CurrentDetail then
			v_u_10.CurrentDetail:Destroy()
		end
		v_u_10.NewPageOrder(v_u_53, v_u_10.CurrentPage)
		v_u_35((("%*Menu"):format(v_u_25)))
		v_u_25 = ""
		if v_u_10.CurrentDetail then
			v_u_10.CurrentDetail.Visible = false
		end
		v_u_10.ChangeTopBar(v_u_54, false)
		v_u_36.Visible = false
	end)
	v_u_11.AddHoverEffect(v55)
	local v_u_56 = v_u_16.AchievementsView
	local v57 = v37.Achievements.SENSOR
	local v_u_58 = "Achievements"
	v57.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_56, (ref) v_u_35, (ref) v_u_25, (copy) v_u_58, (copy) v_u_36
		v_u_11.Click()
		if v_u_10.CurrentDetail then
			v_u_10.CurrentDetail:Destroy()
		end
		v_u_10.NewPageOrder(v_u_56, v_u_10.CurrentPage)
		v_u_35((("%*Menu"):format(v_u_25)))
		v_u_25 = ""
		if v_u_10.CurrentDetail then
			v_u_10.CurrentDetail.Visible = false
		end
		v_u_10.ChangeTopBar(v_u_58, false)
		v_u_36.Visible = false
	end)
	v_u_11.AddHoverEffect(v57)
end
local function v60()
	-- upvalues: (copy) v_u_10, (copy) v_u_16, (copy) v_u_35, (ref) v_u_25, (copy) v_u_24
	if v_u_10.CurrentDetail then
		v_u_10.CurrentDetail:Destroy()
	end
	v_u_10.NewPageOrder(v_u_16.PlayerStatsView, v_u_10.CurrentPage)
	v_u_35((("%*Menu"):format(v_u_25)))
	v_u_25 = ""
	if v_u_10.CurrentDetail then
		v_u_10.CurrentDetail.Visible = false
	end
	v_u_10.ChangeTopBar(("%*\'s Profile"):format(v_u_24.Name), false)
	v_u_16.GridView.Visible = false
end
local function v_u_121(p_u_61)
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_11, (copy) v_u_10, (copy) v_u_15, (ref) v_u_25, (ref) v_u_26, (copy) v_u_16, (copy) v_u_13, (copy) v_u_19, (copy) v_u_20
	local v_u_62 = p_u_61:FindFirstChild("ButtonHolder")
	local function v_u_70(p_u_63)
		-- upvalues: (copy) p_u_61, (copy) v_u_62, (ref) v_u_7
		if p_u_61.Name == "Filter" then
			if v_u_62.Traits.Visible then
				v_u_7.SetFilterStep("Traits", function(p64)
					-- upvalues: (copy) p_u_63
					for v65 = #p64, 1, -1 do
						local v66 = string.lower(p64[v65].Traits)
						local v67 = false
						for v68, v69 in p_u_63 do
							if v69 and string.find(v66, v68) then
								v67 = true
								break
							end
						end
						if not v67 then
							table.remove(p64, v65)
						end
					end
				end)
			else
				v_u_7.SetFilterStep("Traits", nil)
			end
		else
			return
		end
	end
	local v_u_71 = {}
	local function v_u_76()
		-- upvalues: (copy) p_u_61, (copy) v_u_62
		if p_u_61.Name == "Filter" then
			local v72 = v_u_62:FindFirstChildOfClass("UIListLayout")
			local v73 = 0
			for _, v74 in v_u_62:GetChildren() do
				if v74:IsA("Frame") and v74.Visible then
					v73 = v73 + (v74.Size.Y.Scale + (not v72 and 0 or v72.Padding.Scale))
					if v74:GetAttribute("Dropdrown") and v74.DropdownList.Visible then
						for _, v75 in v74.DropdownList:GetChildren() do
							if v75:IsA("Frame") and v75.Name ~= "Spacer" then
								v73 = v73 + v75.Size.Y.Scale * v74.DropdownList.Size.Y.Scale * v74.Size.Y.Scale
							end
						end
					end
				end
			end
			v_u_62.CanvasSize = UDim2.fromScale(0, v73)
		end
	end
	for _, v_u_77 in v_u_62:GetChildren() do
		if v_u_77:IsA("Frame") then
			if v_u_14.AnimatedColors[v_u_77.Name] then
				v_u_77:SetAttribute("Rarity", v_u_77.Name)
				v_u_14.AnimatedColors[v_u_77.Name](v_u_77)
			end
			local v_u_78 = v_u_77:GetAttribute("Dropdrown")
			local v79 = v_u_77:FindFirstChild("SENSOR")
			v79.Activated:Connect(function()
				-- upvalues: (copy) v_u_78, (copy) v_u_77, (copy) v_u_76, (ref) v_u_11, (ref) v_u_10, (copy) p_u_61, (ref) v_u_15, (ref) v_u_25, (ref) v_u_7, (ref) v_u_26, (ref) v_u_16, (ref) v_u_13, (copy) v_u_62, (ref) v_u_19, (copy) v_u_71, (copy) v_u_70
				if v_u_78 then
					v_u_77.DropdownList.Visible = not v_u_77.DropdownList.Visible
					v_u_76()
					return
				else
					v_u_11.Click()
					if v_u_10.CurrentPage then
						v_u_10.CurrentPage:GetChildren()
						local v80 = v_u_77:GetAttribute("Algorithm")
						if p_u_61.Name == "Sort" then
							v_u_10.SortAlgo = v80
						elseif p_u_61.Name == "Filter" then
							v_u_10.FilterAlgo = v80
							v_u_10.FilterType = v_u_77.Name
						end
						local v_u_81 = {}
						for _, v82 in v_u_15[v_u_25].Data do
							table.insert(v_u_81, v82)
						end
						v_u_7.FilterAndSort(v_u_81)
						local v_u_83 = ("%*Menu"):format(v_u_25)
						task.spawn(function()
							-- upvalues: (ref) v_u_16, (copy) v_u_83, (ref) v_u_13, (copy) v_u_81
							local v84 = v_u_16.GridView
							local v85 = v84:FindFirstChild(v_u_83)
							local v86 = v84.GridSFrame
							v85.Parent = v84
							v86.CanvasPosition = Vector2.zero
							v_u_13(v85, v86, v_u_81)
						end)
						v_u_16.MenuGrids.CanvasPosition = Vector2.zero
						if v_u_10.FilterAlgo == "Reset" then
							local v87 = v_u_62:FindFirstChild("Traits")
							if not v87 then
								return
							end
							local v88 = v87:FindFirstChild("DropdownList")
							for _, v89 in v_u_19.TraitNames do
								v_u_71[v89] = true
								local v90 = v88:FindFirstChild(v89)
								if v90 then
									local v91 = v90:FindFirstChild("CHECK_ON")
									local v92 = v90:FindFirstChild("CHECK_OFF")
									v91.Visible = true
									v92.Visible = false
								end
							end
							local v93 = {}
							for v94, v95 in v_u_71 do
								v93[string.lower(v94)] = v95
							end
							v_u_70(v93)
							local v_u_96 = {}
							for _, v97 in v_u_15[v_u_25].Data do
								table.insert(v_u_96, v97)
							end
							v_u_7.FilterAndSort(v_u_96)
							local v_u_98 = ("%*Menu"):format(v_u_25)
							task.spawn(function()
								-- upvalues: (ref) v_u_16, (copy) v_u_98, (ref) v_u_13, (copy) v_u_96
								local v99 = v_u_16.GridView
								local v100 = v99:FindFirstChild(v_u_98)
								local v101 = v99.GridSFrame
								v100.Parent = v99
								v101.CanvasPosition = Vector2.zero
								v_u_13(v100, v101, v_u_96)
							end)
						end
					else
						warn("MenuControl | No grid view to search")
					end
				end
			end)
			v_u_11.AddHoverEffect(v79)
			if v_u_78 then
				if v_u_77.Name == "Traits" then
					for _, v102 in v_u_19.TraitNames do
						if not v_u_20.PlantTraitsBlacklist[v102] then
							v_u_71[v102] = true
						end
					end
				end
				for v_u_103, v104 in v_u_71 do
					local v_u_105 = v_u_77.DropdownList.Segment:Clone()
					v_u_105.Name = v_u_103
					v_u_105.BUTTON_NAME.Text = v_u_103
					v_u_105.BUTTON_NAME_SHADOW.Text = v_u_103
					v_u_105.CHECK_ON.Visible = v104
					v_u_105.CHECK_OFF.Visible = not v104
					v_u_105.Visible = true
					v_u_105.Parent = v_u_77.DropdownList
					v_u_105.SENSOR.Activated:Connect(function()
						-- upvalues: (ref) v_u_11, (copy) v_u_71, (copy) v_u_103, (copy) v_u_105, (copy) v_u_77, (copy) v_u_70, (ref) v_u_15, (ref) v_u_25, (ref) v_u_7, (ref) v_u_26, (ref) v_u_16, (ref) v_u_13
						v_u_11.Click()
						v_u_71[v_u_103] = not v_u_71[v_u_103]
						local v106 = v_u_71[v_u_103]
						v_u_105.CHECK_ON.Visible = v106
						v_u_105.CHECK_OFF.Visible = not v106
						if v_u_77.Name == "Traits" then
							local v107 = {}
							for v108, v109 in v_u_71 do
								v107[string.lower(v108)] = v109
							end
							v_u_70(v107)
						end
						local v_u_110 = {}
						for _, v111 in v_u_15[v_u_25].Data do
							table.insert(v_u_110, v111)
						end
						v_u_7.FilterAndSort(v_u_110)
						local v_u_112 = ("%*Menu"):format(v_u_25)
						task.spawn(function()
							-- upvalues: (ref) v_u_16, (copy) v_u_112, (ref) v_u_13, (copy) v_u_110
							local v113 = v_u_16.GridView
							local v114 = v113:FindFirstChild(v_u_112)
							local v115 = v113.GridSFrame
							v114.Parent = v113
							v115.CanvasPosition = Vector2.zero
							v_u_13(v114, v115, v_u_110)
						end)
						v_u_16.MenuGrids.CanvasPosition = Vector2.zero
					end)
				end
				if v_u_77.Name == "Traits" then
					v_u_10.OnPageOrderUpdate:Connect(function()
						-- upvalues: (copy) v_u_62, (ref) v_u_10, (copy) v_u_71, (copy) v_u_70, (copy) v_u_76
						local v116 = v_u_62.Traits
						local v117 = v_u_10.CurrentPage
						if v117 then
							v117 = v_u_10.CurrentPage.Name == "PlantMenu"
						end
						v116.Visible = v117
						local v118 = {}
						for v119, v120 in v_u_71 do
							v118[string.lower(v119)] = v120
						end
						v_u_70(v118)
						v_u_76()
					end)
				end
			end
		end
	end
	v_u_10.OnPageOrderUpdate:Connect(v_u_76)
	v_u_76()
end
local function v_u_133()
	-- upvalues: (copy) v_u_16, (copy) v_u_11, (copy) v_u_18, (copy) v_u_17, (copy) v_u_2, (copy) v_u_10, (copy) v_u_121, (copy) v_u_12
	local v122 = v_u_16.ExitFrame:FindFirstChild("SENSOR")
	v122.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_18, (ref) v_u_17, (ref) v_u_2
		v_u_11.Click()
		v_u_18:Close()
		local v123 = v_u_17.UseTool and v_u_2.LocalPlayer.Character:FindFirstChild("Humanoid")
		if v123 then
			v123:UnequipTools()
		end
	end)
	v_u_11.AddHoverEffect(v122)
	local v124 = v_u_16.BackFrame:FindFirstChild("SENSOR")
	v124.Activated:Connect(function()
		-- upvalues: (ref) v_u_10
		v_u_10.GoBackPage()
	end)
	v_u_11.AddHoverEffect(v124)
	local v_u_125 = v_u_16.SortDropDown
	local v126 = v_u_16.SortButton
	local v_u_127 = v_u_16.FilterDropDown
	local v128 = v_u_16.FilterButton
	v_u_121(v_u_125)
	v126.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_125, (copy) v_u_127, (ref) v_u_16
		v_u_11.Click()
		local v129 = v_u_125
		local v130 = v_u_127
		if v130.Visible then
			v129.Visible = true
			v130.Visible = false
			v_u_16.DropDownMenus.Visible = v129.Visible
		else
			v129.Visible = not v129.Visible
			v_u_16.DropDownMenus.Visible = v129.Visible
		end
	end)
	v_u_11.AddHoverEffect(v126)
	v_u_121(v_u_127)
	v128.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_127, (copy) v_u_125, (ref) v_u_16
		v_u_11.Click()
		local v131 = v_u_127
		local v132 = v_u_125
		if v132.Visible then
			v131.Visible = true
			v132.Visible = false
			v_u_16.DropDownMenus.Visible = v131.Visible
		else
			v131.Visible = not v131.Visible
			v_u_16.DropDownMenus.Visible = v131.Visible
		end
	end)
	v_u_11.AddHoverEffect(v128)
	v_u_12.ConnectSearchBar()
end
(function()
	-- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_133, (copy) v_u_59, (copy) v_u_10, (copy) v_u_24
	local v134 = v_u_16.MenuGrids
	for _, v135 in {
		"Plant",
		"Pet",
		"Cosmetic",
		"Food",
		"Mutation"
	} do
		if not v134:FindFirstChild((("%*Menu"):format(v135))) then
			local v136 = v_u_22.GridHolderTemplate:Clone()
			v136.Name = ("%*Menu"):format(v135)
			v136:SetAttribute("MenuId", v135)
			v136.Visible = false
			v136.Parent = v_u_16.GridView
		end
	end
	v_u_133()
	v_u_59()
	v_u_10.ChangeTopBar(("%*\'s Profile"):format(v_u_24.Name), false)
	v_u_10.CurrentPage = v_u_16.PlayerStatsView
end)()
local v137 = v3:GetPathSignal("GardenGuide/@")
if v137 then
	v137:Connect(function(_, p138, p139)
		-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_9, (copy) v_u_16, (copy) v_u_13, (copy) v_u_7, (copy) v_u_31, (copy) v_u_8
		if p138 then
			local v140 = string.split(p139, "/")
			local v141
			if #v140 >= 3 then
				v141 = v140[3] or nil
			else
				v141 = nil
			end
			if v141 then
				local v_u_142 = v140[2]:gsub("Data", "")
				local v143 = v_u_15[v_u_142]
				if v143 then
					local v144 = v140[3]
					v143.UpdateData(v144)
					local v_u_145 = v_u_15[v_u_142].Data[v144]
					if v_u_145 then
						if v_u_10.CurrentPage.Name == ("%*Menu"):format(v_u_142) then
							v_u_9.UpdateGridCell(v_u_142, v_u_145, v144, v_u_16.MenuGrids)
							local v146 = v_u_13
							local v147 = v_u_10.CurrentPage
							local v148 = v_u_10.GridSFrame
							local v149 = {}
							for _, v150 in v_u_15[v_u_142].Data do
								table.insert(v149, v150)
							end
							v_u_7.FilterAndSort(v149)
							v146(v147, v148, v149)
							v_u_31(v143)
						end
						local v_u_151 = v_u_16.MainMenuFrame:FindFirstChild((("%*Details"):format(v144)))
						if v_u_151 then
							task.spawn(function()
								-- upvalues: (ref) v_u_8, (copy) v_u_151, (copy) v_u_145, (copy) v_u_142
								v_u_8.UpdateDetailsView(v_u_151, v_u_145, v_u_142)
							end)
						end
					else
						warn((("UpdateGridCells | No data in %* for %*"):format(v_u_142, v144)))
						return
					end
				else
					warn((("MenuControl | No data module %*"):format(v_u_142)))
					return
				end
			else
				warn(("No changes %*"):format(v141), v140)
				return
			end
		else
			return
		end
	end)
end
v_u_16.GardenGuideScreen:GetPropertyChangedSignal("Enabled"):Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_16, (copy) v_u_4
	v_u_2.LocalPlayer.PlayerGui.Teleport_UI.Enabled = not v_u_16.GardenGuideScreen.Enabled
	if v_u_16.GardenGuideScreen.Enabled then
		v_u_4:Close()
	end
end)
while not v5:IsUpdateDone() do
	task.wait(1)
end
task.spawn(v_u_15.Plant.RegatherData)
task.spawn(v_u_15.Pet.RegatherData)
task.spawn(v_u_15.Cosmetic.RegatherData)
task.spawn(v_u_15.Food.RegatherData)
task.spawn(v_u_15.Mutation.RegatherData)
v60()
return v21
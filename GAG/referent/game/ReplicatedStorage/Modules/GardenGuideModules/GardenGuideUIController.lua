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
local function v_u_56()
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
	local v_u_50 = v_u_16.PlayerStatsView
	local v_u_51 = ("%*\'s Profile"):format(v_u_24.Name)
	local v52 = v37.PlayerStats.SENSOR
	v52.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_50, (ref) v_u_35, (ref) v_u_25, (copy) v_u_51, (copy) v_u_36
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
		v_u_10.ChangeTopBar(v_u_51, false)
		v_u_36.Visible = false
	end)
	v_u_11.AddHoverEffect(v52)
	local v_u_53 = v_u_16.AchievementsView
	local v54 = v37.Achievements.SENSOR
	local v_u_55 = "Achievements"
	v54.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_10, (copy) v_u_53, (ref) v_u_35, (ref) v_u_25, (copy) v_u_55, (copy) v_u_36
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
		v_u_10.ChangeTopBar(v_u_55, false)
		v_u_36.Visible = false
	end)
	v_u_11.AddHoverEffect(v54)
end
local function v57()
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
local function v_u_118(p_u_58)
	-- upvalues: (copy) v_u_7, (copy) v_u_14, (copy) v_u_11, (copy) v_u_10, (copy) v_u_15, (ref) v_u_25, (ref) v_u_26, (copy) v_u_16, (copy) v_u_13, (copy) v_u_19, (copy) v_u_20
	local v_u_59 = p_u_58:FindFirstChild("ButtonHolder")
	local function v_u_67(p_u_60)
		-- upvalues: (copy) p_u_58, (copy) v_u_59, (ref) v_u_7
		if p_u_58.Name == "Filter" then
			if v_u_59.Traits.Visible then
				v_u_7.SetFilterStep("Traits", function(p61)
					-- upvalues: (copy) p_u_60
					for v62 = #p61, 1, -1 do
						local v63 = string.lower(p61[v62].Traits)
						local v64 = false
						for v65, v66 in p_u_60 do
							if v66 and string.find(v63, v65) then
								v64 = true
								break
							end
						end
						if not v64 then
							table.remove(p61, v62)
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
	local v_u_68 = {}
	local function v_u_73()
		-- upvalues: (copy) p_u_58, (copy) v_u_59
		if p_u_58.Name == "Filter" then
			local v69 = v_u_59:FindFirstChildOfClass("UIListLayout")
			local v70 = 0
			for _, v71 in v_u_59:GetChildren() do
				if v71:IsA("Frame") and v71.Visible then
					v70 = v70 + (v71.Size.Y.Scale + (not v69 and 0 or v69.Padding.Scale))
					if v71:GetAttribute("Dropdrown") and v71.DropdownList.Visible then
						for _, v72 in v71.DropdownList:GetChildren() do
							if v72:IsA("Frame") and v72.Name ~= "Spacer" then
								v70 = v70 + v72.Size.Y.Scale * v71.DropdownList.Size.Y.Scale * v71.Size.Y.Scale
							end
						end
					end
				end
			end
			v_u_59.CanvasSize = UDim2.fromScale(0, v70)
		end
	end
	for _, v_u_74 in v_u_59:GetChildren() do
		if v_u_74:IsA("Frame") then
			if v_u_14.AnimatedColors[v_u_74.Name] then
				v_u_74:SetAttribute("Rarity", v_u_74.Name)
				v_u_14.AnimatedColors[v_u_74.Name](v_u_74)
			end
			local v_u_75 = v_u_74:GetAttribute("Dropdrown")
			local v76 = v_u_74:FindFirstChild("SENSOR")
			v76.Activated:Connect(function()
				-- upvalues: (copy) v_u_75, (copy) v_u_74, (copy) v_u_73, (ref) v_u_11, (ref) v_u_10, (copy) p_u_58, (ref) v_u_15, (ref) v_u_25, (ref) v_u_7, (ref) v_u_26, (ref) v_u_16, (ref) v_u_13, (copy) v_u_59, (ref) v_u_19, (copy) v_u_68, (copy) v_u_67
				if v_u_75 then
					v_u_74.DropdownList.Visible = not v_u_74.DropdownList.Visible
					v_u_73()
					return
				else
					v_u_11.Click()
					if v_u_10.CurrentPage then
						v_u_10.CurrentPage:GetChildren()
						local v77 = v_u_74:GetAttribute("Algorithm")
						if p_u_58.Name == "Sort" then
							v_u_10.SortAlgo = v77
						elseif p_u_58.Name == "Filter" then
							v_u_10.FilterAlgo = v77
							v_u_10.FilterType = v_u_74.Name
						end
						local v_u_78 = {}
						for _, v79 in v_u_15[v_u_25].Data do
							table.insert(v_u_78, v79)
						end
						v_u_7.FilterAndSort(v_u_78)
						local v_u_80 = ("%*Menu"):format(v_u_25)
						task.spawn(function()
							-- upvalues: (ref) v_u_16, (copy) v_u_80, (ref) v_u_13, (copy) v_u_78
							local v81 = v_u_16.GridView
							local v82 = v81:FindFirstChild(v_u_80)
							local v83 = v81.GridSFrame
							v82.Parent = v81
							v83.CanvasPosition = Vector2.zero
							v_u_13(v82, v83, v_u_78)
						end)
						v_u_16.MenuGrids.CanvasPosition = Vector2.zero
						if v_u_10.FilterAlgo == "Reset" then
							local v84 = v_u_59:FindFirstChild("Traits")
							if not v84 then
								return
							end
							local v85 = v84:FindFirstChild("DropdownList")
							for _, v86 in v_u_19.TraitNames do
								v_u_68[v86] = true
								local v87 = v85:FindFirstChild(v86)
								if v87 then
									local v88 = v87:FindFirstChild("CHECK_ON")
									local v89 = v87:FindFirstChild("CHECK_OFF")
									v88.Visible = true
									v89.Visible = false
								end
							end
							local v90 = {}
							for v91, v92 in v_u_68 do
								v90[string.lower(v91)] = v92
							end
							v_u_67(v90)
							local v_u_93 = {}
							for _, v94 in v_u_15[v_u_25].Data do
								table.insert(v_u_93, v94)
							end
							v_u_7.FilterAndSort(v_u_93)
							local v_u_95 = ("%*Menu"):format(v_u_25)
							task.spawn(function()
								-- upvalues: (ref) v_u_16, (copy) v_u_95, (ref) v_u_13, (copy) v_u_93
								local v96 = v_u_16.GridView
								local v97 = v96:FindFirstChild(v_u_95)
								local v98 = v96.GridSFrame
								v97.Parent = v96
								v98.CanvasPosition = Vector2.zero
								v_u_13(v97, v98, v_u_93)
							end)
						end
					else
						warn("MenuControl | No grid view to search")
					end
				end
			end)
			v_u_11.AddHoverEffect(v76)
			if v_u_75 then
				if v_u_74.Name == "Traits" then
					for _, v99 in v_u_19.TraitNames do
						if not v_u_20.PlantTraitsBlacklist[v99] then
							v_u_68[v99] = true
						end
					end
				end
				for v_u_100, v101 in v_u_68 do
					local v_u_102 = v_u_74.DropdownList.Segment:Clone()
					v_u_102.Name = v_u_100
					v_u_102.BUTTON_NAME.Text = v_u_100
					v_u_102.BUTTON_NAME_SHADOW.Text = v_u_100
					v_u_102.CHECK_ON.Visible = v101
					v_u_102.CHECK_OFF.Visible = not v101
					v_u_102.Visible = true
					v_u_102.Parent = v_u_74.DropdownList
					v_u_102.SENSOR.Activated:Connect(function()
						-- upvalues: (ref) v_u_11, (copy) v_u_68, (copy) v_u_100, (copy) v_u_102, (copy) v_u_74, (copy) v_u_67, (ref) v_u_15, (ref) v_u_25, (ref) v_u_7, (ref) v_u_26, (ref) v_u_16, (ref) v_u_13
						v_u_11.Click()
						v_u_68[v_u_100] = not v_u_68[v_u_100]
						local v103 = v_u_68[v_u_100]
						v_u_102.CHECK_ON.Visible = v103
						v_u_102.CHECK_OFF.Visible = not v103
						if v_u_74.Name == "Traits" then
							local v104 = {}
							for v105, v106 in v_u_68 do
								v104[string.lower(v105)] = v106
							end
							v_u_67(v104)
						end
						local v_u_107 = {}
						for _, v108 in v_u_15[v_u_25].Data do
							table.insert(v_u_107, v108)
						end
						v_u_7.FilterAndSort(v_u_107)
						local v_u_109 = ("%*Menu"):format(v_u_25)
						task.spawn(function()
							-- upvalues: (ref) v_u_16, (copy) v_u_109, (ref) v_u_13, (copy) v_u_107
							local v110 = v_u_16.GridView
							local v111 = v110:FindFirstChild(v_u_109)
							local v112 = v110.GridSFrame
							v111.Parent = v110
							v112.CanvasPosition = Vector2.zero
							v_u_13(v111, v112, v_u_107)
						end)
						v_u_16.MenuGrids.CanvasPosition = Vector2.zero
					end)
				end
				if v_u_74.Name == "Traits" then
					v_u_10.OnPageOrderUpdate:Connect(function()
						-- upvalues: (copy) v_u_59, (ref) v_u_10, (copy) v_u_68, (copy) v_u_67, (copy) v_u_73
						local v113 = v_u_59.Traits
						local v114 = v_u_10.CurrentPage
						if v114 then
							v114 = v_u_10.CurrentPage.Name == "PlantMenu"
						end
						v113.Visible = v114
						local v115 = {}
						for v116, v117 in v_u_68 do
							v115[string.lower(v116)] = v117
						end
						v_u_67(v115)
						v_u_73()
					end)
				end
			end
		end
	end
	v_u_10.OnPageOrderUpdate:Connect(v_u_73)
	v_u_73()
end
local function v_u_130()
	-- upvalues: (copy) v_u_16, (copy) v_u_11, (copy) v_u_18, (copy) v_u_17, (copy) v_u_2, (copy) v_u_10, (copy) v_u_118, (copy) v_u_12
	local v119 = v_u_16.ExitFrame:FindFirstChild("SENSOR")
	v119.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (ref) v_u_18, (ref) v_u_17, (ref) v_u_2
		v_u_11.Click()
		v_u_18:Close()
		local v120 = v_u_17.UseTool and v_u_2.LocalPlayer.Character:FindFirstChild("Humanoid")
		if v120 then
			v120:UnequipTools()
		end
	end)
	v_u_11.AddHoverEffect(v119)
	local v121 = v_u_16.BackFrame:FindFirstChild("SENSOR")
	v121.Activated:Connect(function()
		-- upvalues: (ref) v_u_10
		v_u_10.GoBackPage()
	end)
	v_u_11.AddHoverEffect(v121)
	local v_u_122 = v_u_16.SortDropDown
	local v123 = v_u_16.SortButton
	local v_u_124 = v_u_16.FilterDropDown
	local v125 = v_u_16.FilterButton
	v_u_118(v_u_122)
	v123.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_122, (copy) v_u_124, (ref) v_u_16
		v_u_11.Click()
		local v126 = v_u_122
		local v127 = v_u_124
		if v127.Visible then
			v126.Visible = true
			v127.Visible = false
			v_u_16.DropDownMenus.Visible = v126.Visible
		else
			v126.Visible = not v126.Visible
			v_u_16.DropDownMenus.Visible = v126.Visible
		end
	end)
	v_u_11.AddHoverEffect(v123)
	v_u_118(v_u_124)
	v125.Activated:Connect(function()
		-- upvalues: (ref) v_u_11, (copy) v_u_124, (copy) v_u_122, (ref) v_u_16
		v_u_11.Click()
		local v128 = v_u_124
		local v129 = v_u_122
		if v129.Visible then
			v128.Visible = true
			v129.Visible = false
			v_u_16.DropDownMenus.Visible = v128.Visible
		else
			v128.Visible = not v128.Visible
			v_u_16.DropDownMenus.Visible = v128.Visible
		end
	end)
	v_u_11.AddHoverEffect(v125)
	v_u_12.ConnectSearchBar()
end
(function()
	-- upvalues: (copy) v_u_16, (copy) v_u_22, (copy) v_u_130, (copy) v_u_56, (copy) v_u_10, (copy) v_u_24
	local v131 = v_u_16.MenuGrids
	for _, v132 in {
		"Plant",
		"Pet",
		"Cosmetic",
		"Food",
		"Mutation"
	} do
		if not v131:FindFirstChild((("%*Menu"):format(v132))) then
			local v133 = v_u_22.GridHolderTemplate:Clone()
			v133.Name = ("%*Menu"):format(v132)
			v133:SetAttribute("MenuId", v132)
			v133.Visible = false
			v133.Parent = v_u_16.GridView
		end
	end
	v_u_130()
	v_u_56()
	v_u_10.ChangeTopBar(("%*\'s Profile"):format(v_u_24.Name), false)
	v_u_10.CurrentPage = v_u_16.PlayerStatsView
end)()
local v134 = v3:GetPathSignal("GardenGuide/@")
if v134 then
	v134:Connect(function(_, p135, p136)
		-- upvalues: (copy) v_u_15, (copy) v_u_10, (copy) v_u_9, (copy) v_u_16, (copy) v_u_13, (copy) v_u_7, (copy) v_u_31, (copy) v_u_8
		if p135 then
			local v137 = string.split(p136, "/")
			local v138
			if #v137 >= 3 then
				v138 = v137[3] or nil
			else
				v138 = nil
			end
			if v138 then
				local v_u_139 = v137[2]:gsub("Data", "")
				local v140 = v_u_15[v_u_139]
				if v140 then
					local v141 = v137[3]
					v140.UpdateData(v141)
					local v_u_142 = v_u_15[v_u_139].Data[v141]
					if v_u_142 then
						if v_u_10.CurrentPage.Name == ("%*Menu"):format(v_u_139) then
							v_u_9.UpdateGridCell(v_u_139, v_u_142, v141, v_u_16.MenuGrids)
							local v143 = v_u_13
							local v144 = v_u_10.CurrentPage
							local v145 = v_u_10.GridSFrame
							local v146 = {}
							for _, v147 in v_u_15[v_u_139].Data do
								table.insert(v146, v147)
							end
							v_u_7.FilterAndSort(v146)
							v143(v144, v145, v146)
							v_u_31(v140)
						end
						local v_u_148 = v_u_16.MainMenuFrame:FindFirstChild((("%*Details"):format(v141)))
						if v_u_148 then
							task.spawn(function()
								-- upvalues: (ref) v_u_8, (copy) v_u_148, (copy) v_u_142, (copy) v_u_139
								v_u_8.UpdateDetailsView(v_u_148, v_u_142, v_u_139)
							end)
						end
					else
						warn((("UpdateGridCells | No data in %* for %*"):format(v_u_139, v141)))
						return
					end
				else
					warn((("MenuControl | No data module %*"):format(v_u_139)))
					return
				end
			else
				warn(("No changes %*"):format(v138), v137)
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
v57()
return v21
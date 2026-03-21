local v1 = game:GetService("Players")
local v_u_2 = game:GetService("TweenService")
local v3 = game:GetService("ReplicatedStorage")
local v4 = game:GetService("UserInputService")
game:GetService("RunService")
local v_u_5 = v1.LocalPlayer
local v_u_6 = v_u_5:WaitForChild("PlayerGui")
require(v3.Modules.GuiController)
local v_u_7 = require(v3.Modules.DataService)
local v_u_8 = require(v3.Modules.PetServices.PetUtilities)
local v_u_9 = require(v3.Modules.PetServices.ActivePetsService)
local v_u_10 = require(v3.Modules.PetServices.PetCardUserInterfaceService)
local v_u_11 = require(v3.Modules.PetServices.PetsService)
local v_u_12 = require(v3.Modules.Notification)
local v_u_13 = require(v3.Modules.SetupButton)
local v_u_14 = require(v3.Data.PetRegistry)
local v_u_15 = v_u_14.PetList
local v_u_16 = require(v3.Modules.PetServices.PetActionUserInterfaceService)
local v_u_17 = require(v3.Data.PetRegistry.PetMutationRegistry)
local v_u_18 = require(v3.Modules.ConfirmationPromptController)
local v19 = v3:WaitForChild("GameEvents")
local v_u_20 = v19:WaitForChild("RefreshActivePetsUI")
local v_u_21 = v19:WaitForChild("PetsService")
local v_u_22 = v19:WaitForChild("PetCooldownsUpdated")
local v_u_23 = v19:WaitForChild("PetBoostService")
local v_u_24 = v_u_6:WaitForChild("ActivePetUI")
local v_u_25 = v_u_24.Frame:WaitForChild("Main")
local v_u_26 = v_u_25.Holder:WaitForChild("Header")
local v_u_27 = v_u_26.Exit.SENSOR
local v_u_28 = v_u_25.PetDisplay.ScrollingFrame
local v_u_29 = v_u_28:WaitForChild("PetTemplate")
local v_u_30 = v_u_24.Frame:WaitForChild("Opener")
local v_u_31 = v_u_30:WaitForChild("SENSOR")
local v_u_32 = v_u_30:WaitForChild("OPEN_BUTTON")
local v_u_33 = v_u_25:WaitForChild("PetLoadout")
local v_u_34 = {
	v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_1"),
	v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_2"),
	v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_3"),
	v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_4"),
	v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_5"),
	v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_6")
}
local v_u_35 = v_u_33.Main.ButtonHolder:WaitForChild("PET_LOADOUT_ADD")
local v_u_36 = {}
local v_u_37 = {}
local v_u_38 = {}
local v_u_39 = {}
local v_u_40 = false
local v_u_41 = os.clock()
local v_u_42 = false
local v_u_43 = v4.TouchEnabled
local v44 = v_u_43 and 0.475 or 0.5
local v_u_45 = UDim2.fromScale(2, v44)
local v_u_46 = UDim2.fromScale(0.85, v44)
local v_u_47 = UDim2.fromScale(1, 0.5)
local v_u_48 = UDim2.fromScale(-0.25, 0.5)
local v_u_49 = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local v_u_50 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local function v55(p51)
	local v52 = {}
	for _, v53 in p51.Detail:GetChildren() do
		if v53:IsA("Frame") then
			local v54 = v53.BackgroundColor3
			table.insert(v52, v54)
		end
	end
	return {
		["BG"] = p51.BackgroundColor3,
		["Stroke"] = p51.UIStroke.Color,
		["TextStroke"] = p51.TextLabel.UIStroke.Color,
		["Vignettes"] = v52
	}
end
local v_u_56 = v55(v_u_34[1])
local v_u_57 = v55(v_u_34[2])
local function v_u_62(p58, p59)
	p58.BackgroundColor3 = p59.BG
	p58.UIStroke.Color = p59.Stroke
	p58.TextLabel.UIStroke.Color = p59.TextStroke
	for v60, v61 in p58.Detail:GetChildren() do
		if v61:IsA("Frame") and p59.Vignettes[v60] then
			v61.BackgroundColor3 = p59.Vignettes[v60]
		end
	end
end
local v_u_63 = 1
local function v_u_73(p64)
	-- upvalues: (copy) v_u_29, (copy) v_u_28, (copy) v_u_13, (ref) v_u_41, (copy) v_u_5, (ref) v_u_42, (copy) v_u_12, (copy) v_u_23, (copy) v_u_8, (copy) v_u_9, (copy) v_u_10, (copy) v_u_36, (copy) v_u_16, (copy) v_u_39, (copy) v_u_37, (copy) v_u_11
	local v_u_65 = p64.UUID
	local v_u_66 = v_u_29:Clone()
	v_u_66.Name = v_u_65
	v_u_66.Visible = true
	v_u_66.Parent = v_u_28
	local v67 = v_u_66:WaitForChild("Dropdown")
	local v68 = v67.Main.Main.FEED_BUTTON.Holder
	local v69 = v67.Main.Main.VIEW_BUTTON.Holder
	local v70 = v67.Main.Main.PICKUP_BUTTON.Holder
	v_u_13({
		["instance"] = v68.Main.SENSOR,
		["scale"] = v68.UIScale,
		["offset"] = 0.1,
		["onclick"] = function()
			-- upvalues: (ref) v_u_41, (ref) v_u_5, (ref) v_u_42, (ref) v_u_12, (ref) v_u_23, (copy) v_u_65, (ref) v_u_8, (ref) v_u_9
			v_u_41 = os.clock()
			local v71 = v_u_5.Character
			if v71 then
				local v_u_72 = v71:FindFirstChildWhichIsA("Tool")
				if v_u_42 then
					if not (v_u_72 and v_u_72:HasTag("PetBoost")) then
						return v_u_12:CreateNotification("You are not holding a Pet Boost!")
					end
					v_u_23:FireServer("ApplyBoost", v_u_65)
					return
				elseif v_u_72 and v_u_72:HasTag("ActiveUIUsableGear") then
					xpcall(function()
						-- upvalues: (copy) v_u_72, (ref) v_u_8, (ref) v_u_65
						game.ReplicatedStorage.GameEvents.TryUseGear:FireServer(require(game.ReplicatedStorage.Modules.InventoryService):GetToolData(v_u_72).ItemType, v_u_8:FindLocalPetModel(v_u_65))
					end, warn)
				else
					if not (v_u_72 and (v_u_72:HasTag("FruitTool") or v_u_72:HasTag("FoodTool"))) then
						return v_u_12:CreateNotification("You are not holding a fruit!")
					end
					v_u_9:Feed(v_u_65)
				end
			else
				return
			end
		end
	})
	v_u_13({
		["instance"] = v69.Main.SENSOR,
		["scale"] = v69.UIScale,
		["offset"] = 0.1,
		["onclick"] = function()
			-- upvalues: (ref) v_u_10, (copy) v_u_65, (ref) v_u_5, (ref) v_u_36
			v_u_10:SetTargetFromUUID(v_u_65)
			v_u_10.TargetPlayer = v_u_5
			v_u_10:Toggle(true, function()
				-- upvalues: (ref) v_u_36
				v_u_36:Open()
			end)
			v_u_36:Close()
		end
	})
	v_u_13({
		["instance"] = v70.Main.SENSOR,
		["scale"] = v70.UIScale,
		["offset"] = 0.1,
		["onclick"] = function()
			-- upvalues: (ref) v_u_41, (ref) v_u_16, (ref) v_u_39, (copy) v_u_65, (copy) v_u_66, (ref) v_u_37, (ref) v_u_11
			v_u_41 = os.clock()
			v_u_16.Close()
			v_u_39[v_u_65] = true
			v_u_66:Destroy()
			v_u_37[v_u_65] = nil
			v_u_11:UnequipPet(v_u_65)
		end
	})
	v_u_37[v_u_65] = v_u_66
	return v_u_66
end
function v_u_36.UpdatePetStatic(_, p74, p75)
	-- upvalues: (copy) v_u_15, (copy) v_u_17
	local v76 = p74.PetData
	local v77 = v_u_15[p74.PetType]
	local v78 = v_u_17.EnumToPetMutation[v76.MutationType]
	local v79 = v76.Name or "Unnamed"
	p75.Main.PET_NAME.Text = v79
	p75.Main.PET_NAME_SHADOW.Text = v79
	local v80 = v78 and v78 ~= "Normal" and v78 .. " " .. (p74.PetType or "Unknown") or (p74.PetType or "Unknown")
	p75.Main.PET_TYPE.Text = v80
	p75.Main.PET_TYPE_SHADOW.Text = v80
	local v81 = v76.Level or "1"
	p75.Main.PET_AGE.Text = "Age: " .. v81
	p75.Main.PET_AGE_SHADOW.Text = "Age: " .. v81
	p75.Main.Item.PET_IMAGE.Image = v77 and (v77.Icon or "") or ""
	if not v77 then
		warn((("%* lacks RegistryData"):format(p74.PetType)))
	end
end
function v_u_36.RebuildPetList(p82)
	-- upvalues: (copy) v_u_7, (copy) v_u_8, (copy) v_u_5, (copy) v_u_26, (copy) v_u_39, (copy) v_u_37, (copy) v_u_73, (copy) v_u_30
	local v83 = v_u_7:GetData()
	local v84 = v83.PetsData.MutableStats.MaxEquippedPets
	local v85 = v83.PetsData.EquippedPets or {}
	local v86 = v_u_8:GetPetsSortedByAge(v_u_5, 0, false, true)
	v_u_26.Title.Text = ("Active Pets: %d/%d"):format(#v85, v84)
	for _, v87 in v86 do
		if not (v_u_39[v87.UUID] or v_u_37[v87.UUID]) then
			v_u_73(v87)
		end
	end
	local v88 = {}
	for _, v89 in v86 do
		if not v_u_39[v89.UUID] then
			v88[v89.UUID] = true
			p82:UpdatePetStatic(v89, v_u_37[v89.UUID])
		end
	end
	for v90, v91 in v_u_37 do
		if not v88[v90] then
			v91:Destroy()
			v_u_37[v90] = nil
		end
	end
	v_u_30.Visible = #v86 > 0
end
local v_u_92 = { "Movement Variation", "Block Wandering", "Tethered Pet Mutation" }
function v_u_36.UpdateDynamic(_)
	-- upvalues: (copy) v_u_37, (copy) v_u_8, (copy) v_u_5, (copy) v_u_15, (copy) v_u_14, (copy) v_u_38, (copy) v_u_92
	for v93, v94 in v_u_37 do
		local v95 = v_u_8:GetPetByUUID(v_u_5, v93)
		if v95 then
			local v96 = v95.PetData
			local v97 = v_u_15[v95.PetType]
			local v98 = (v96.Hunger or 0) / (v97.DefaultHunger or 1)
			local v99 = math.clamp(v98, 0, 1)
			v94.Main.Bars.HungerBar.Bar_Actual.Size = UDim2.fromScale(v99, 1)
			local v100 = v_u_8:GetCurrentLevelXPCost(v96.Level)
			local v101
			if v96.Level >= v_u_14.PetConfig.XP_CONFIG.MAX_LEVEL then
				v101 = 1
			else
				local v102 = (v96.LevelProgress or 0) / (v100 > 0 and v100 and v100 or 1)
				v101 = math.clamp(v102, 0, 1)
			end
			v94.Main.Bars.ExpBar.Bar_Actual.Size = UDim2.fromScale(v101, 1)
			local v103 = v_u_38[v93]
			local v104 = v94.Main.Cooldowns:FindFirstChild("COOLDOWN_1")
			local v105 = v94.Main.Cooldowns:FindFirstChild("COOLDOWN_2")
			local function v114(p106, p107)
				-- upvalues: (ref) v_u_92
				if not p106 then
					return
				end
				if not p107 then
					p106.Visible = false
					return
				end
				for _, v108 in v_u_92 do
					if p107.Passive == v108 then
						p106.Visible = false
						return
					end
				end
				local v109 = p107.Time
				local v110
				if v109 <= 0 then
					v110 = "\226\143\179 READY"
				else
					if v109 < 60 then
						::l13::
						v110 = "\226\143\179 " .. v109 .. "s"
						goto l11
					end
					local v111 = v109 / 60
					v110 = "\226\143\179 " .. math.floor(v111) .. ":" .. string.format("%02d", v109 % 60) .. "m"
					if not v110 then
						goto l13
					end
				end
				::l11::
				local v112 = p106:FindFirstChild("COOLDOWN_NAME")
				local v113 = p106:FindFirstChild("COOLDOWN_NAME_SHADOW")
				if v112 then
					v112.Text = v110
				end
				if v113 then
					v113.Text = v110
				end
				p106.Visible = true
			end
			if v103 and v103[1] then
				v114(v104, v103[1])
			elseif v104 then
				v104.Visible = false
			end
			if v103 and v103[2] then
				v114(v105, v103[2])
			elseif v105 then
				v105.Visible = false
			end
			local v115 = v94.Main:FindFirstChild("Boosts")
			if v115 then
				local v116 = { v115:FindFirstChild("BOOST_1"), v115:FindFirstChild("BOOST_2"), v115:FindFirstChild("BOOST_3") }
				local v117 = {}
				for _, v118 in v96.Boosts or {} do
					if v118 and (not v118.HideInUI and (v118.Time or 0) > 0) then
						table.insert(v117, v118)
					end
				end
				table.sort(v117, function(p119, p120)
					return (p119.Time or 0) < (p120.Time or 0)
				end)
				for v121 = 1, #v116 do
					local v122 = v116[v121]
					local v123 = v117[v121]
					if v122 then
						if v123 then
							local v124 = (v123.Time or 0) / 60
							local v125 = math.floor(v124)
							local v126 = (v123.Time or 0) % 60
							local v127 = string.format
							local v128 = v123.BoostType
							local v129 = v127("%s %d:%02d", v128 == "PET_XP_BOOST" and "\240\159\167\160" or (v128 == "PASSIVE_BOOST" and "\240\159\146\170" or "\226\157\147"), v125, v126)
							local v130 = v122:FindFirstChild("BOOST_NAME")
							local v131 = v122:FindFirstChild("BOOST_NAME_SHADOW")
							if v130 then
								v130.Text = v129
							end
							if v131 then
								v131.Text = v129
							end
							v122.Visible = true
						else
							v122.Visible = false
						end
					end
				end
			end
		end
	end
end
local function v_u_135()
	-- upvalues: (copy) v_u_7, (copy) v_u_34, (copy) v_u_35
	local v132 = v_u_7:GetData().PetsData.MaxLoadoutSlots or 3
	for v133, v134 in v_u_34 do
		v134.Visible = v133 <= v132
	end
	v_u_35.Visible = v132 < 6
end
function v_u_36.Toggle(_)
	-- upvalues: (ref) v_u_40, (copy) v_u_6, (copy) v_u_46, (copy) v_u_45, (copy) v_u_48, (copy) v_u_47, (copy) v_u_32, (copy) v_u_30, (copy) v_u_25, (copy) v_u_24, (copy) v_u_49, (copy) v_u_50, (copy) v_u_2
	v_u_40 = not v_u_40
	if v_u_6.GardenGuide.Enabled == true then
		v_u_40 = false
	end
	local v136 = v_u_40 and v_u_46 or v_u_45
	local v137 = v_u_40 and v_u_48 or v_u_47
	v_u_32.Text = v_u_40 and ">>" or "<<"
	v_u_30.Parent = v_u_40 and v_u_25 or v_u_24.Frame
	v_u_2:Create(v_u_25, v_u_40 and v_u_49 or v_u_50, {
		["Position"] = v136
	}):Play()
	v_u_30.Position = v137
end
function v_u_36.Open(p138)
	-- upvalues: (ref) v_u_40
	if not v_u_40 then
		p138:Toggle()
	end
end
function v_u_36.Close(p139)
	-- upvalues: (ref) v_u_40
	if v_u_40 then
		p139:Toggle()
	end
end
function v_u_36.SetOpen(p140, p141)
	-- upvalues: (ref) v_u_40
	if v_u_40 ~= p141 then
		p140:Toggle()
	end
end
function v_u_36.Start(p_u_142)
	-- upvalues: (copy) v_u_29, (copy) v_u_25, (copy) v_u_45, (copy) v_u_30, (copy) v_u_47, (copy) v_u_32, (copy) v_u_24, (copy) v_u_43, (copy) v_u_33, (copy) v_u_7, (ref) v_u_63, (copy) v_u_34, (copy) v_u_62, (copy) v_u_56, (copy) v_u_57, (copy) v_u_135, (copy) v_u_35, (ref) v_u_41, (copy) v_u_12, (copy) v_u_21, (copy) v_u_13, (copy) v_u_18, (copy) v_u_27, (copy) v_u_31, (ref) v_u_40, (copy) v_u_5, (copy) v_u_38, (copy) v_u_20, (copy) v_u_39, (copy) v_u_22
	v_u_29.Visible = false
	v_u_25.Position = v_u_45
	v_u_30.Position = v_u_47
	v_u_32.Text = "<<"
	v_u_24.IgnoreGuiInset = v_u_43
	v_u_33.AnchorPoint = Vector2.new(0, v_u_43 and 1 or 0)
	v_u_33.Position = UDim2.fromScale(-0.25, v_u_43 and 1 or 0)
	local v_u_143 = v_u_7:GetData()
	local function v148()
		-- upvalues: (copy) v_u_143, (ref) v_u_63, (ref) v_u_34, (ref) v_u_62, (ref) v_u_56, (ref) v_u_57
		local v144 = v_u_143 and (v_u_143.PetsData and v_u_143.PetsData.SelectedPetLoadout) or 1
		if v_u_63 ~= v144 then
			v_u_63 = v144
			local v145 = v_u_63
			for v146, v147 in v_u_34 do
				v_u_62(v147, v146 == v145 and v_u_56 or v_u_57)
			end
		end
	end
	v_u_7:GetPathSignal("PetsData/SelectedPetLoadout"):Connect(v148)
	task.spawn(v148)
	v_u_7:GetPathSignal("PetsData/MaxLoadoutSlots"):Connect(v_u_135)
	local v149 = v_u_7:GetData().PetsData.MaxLoadoutSlots or 3
	for v150, v151 in v_u_34 do
		v151.Visible = v150 <= v149
	end
	v_u_35.Visible = v149 < 6
	for v_u_152, v153 in v_u_34 do
		v153:WaitForChild("SENSOR").MouseButton1Click:Connect(function()
			-- upvalues: (ref) v_u_41, (ref) v_u_7, (copy) v_u_152, (ref) v_u_12, (ref) v_u_63, (ref) v_u_21
			v_u_41 = os.clock()
			if v_u_152 > (v_u_7:GetData().PetsData.MaxLoadoutSlots or 3) then
				return v_u_12:CreateNotification("You have not unlocked this loadout yet!")
			elseif v_u_63 ~= v_u_152 then
				v_u_21:FireServer("SwapPetLoadout", v_u_152)
			end
		end)
	end
	v_u_13({
		["instance"] = v_u_35.SENSOR,
		["offset"] = 0.1,
		["onclick"] = function()
			-- upvalues: (ref) v_u_41, (ref) v_u_7, (ref) v_u_12, (ref) v_u_21, (ref) v_u_18
			v_u_41 = os.clock()
			local v154 = v_u_7:GetData()
			if v154 then
				v154 = v154.PetsData
			end
			local v155 = v154 and v154.MaxLoadoutSlots or 3
			local v156, v157
			if v155 >= 6 then
				v156 = nil
				v157 = nil
			else
				v156 = v155 + 1
				v157 = v156 == 4 and "10T" or (v156 == 5 and "100T" or "1Q")
			end
			if not v156 then
				return v_u_12:CreateNotification("You already have all pet loadout slots.")
			end
			v_u_18:Open({
				["Title"] = "Buy Pet Loadout Slot",
				["Header"] = ("Unlock Pet Loadout %*?"):format(v156),
				["Middle"] = ("Cost: %* Sheckles"):format(v157),
				["Footer"] = "This will unlock an extra pet loadout slot."
			}, {
				["ConfirmEvent"] = v_u_21,
				["ConfirmEventData"] = { "BuyLoadoutSlot" }
			})
		end
	})
	v_u_27.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_41, (copy) p_u_142
		v_u_41 = os.clock()
		p_u_142:Close()
	end)
	v_u_31.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_41, (copy) p_u_142
		v_u_41 = os.clock()
		p_u_142:Toggle()
	end)
	v_u_25.InputBegan:Connect(function()
		-- upvalues: (ref) v_u_41
		v_u_41 = os.clock()
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_40, (ref) v_u_41, (ref) v_u_5, (copy) p_u_142
		while true do
			repeat
				task.wait(1)
			until v_u_40 and (os.clock() - v_u_41 > 8 and v_u_5:GetAttribute("AutoCloseActivePetsUI") ~= false)
			p_u_142:Close()
		end
	end)
	task.spawn(function()
		-- upvalues: (ref) v_u_40, (ref) v_u_38, (copy) p_u_142
		while true do
			repeat
				task.wait(1)
			until v_u_40
			for _, v158 in v_u_38 do
				for _, v159 in v158 do
					local v160 = v159.Time - 1
					v159.Time = math.max(0, v160)
				end
			end
			p_u_142:UpdateDynamic()
			p_u_142:RebuildPetList()
		end
	end)
	v_u_20.OnClientEvent:Connect(function()
		-- upvalues: (ref) v_u_39, (copy) p_u_142
		table.clear(v_u_39)
		p_u_142:RebuildPetList()
	end)
	v_u_22.OnClientEvent:Connect(function(p161, p162)
		-- upvalues: (ref) v_u_38
		v_u_38[p161] = p162
	end)
	p_u_142:RebuildPetList()
end
v_u_36:Start()
local function v_u_168(p_u_163)
	-- upvalues: (copy) v_u_37
	for v164, v_u_165 in v_u_37 do
		local v166, v167 = pcall(function()
			-- upvalues: (copy) v_u_165, (copy) p_u_163
			v_u_165.Dropdown.Main.Main.FEED_BUTTON.Holder.Main.TextLabel.Text = p_u_163
		end)
		if game:GetService("RunService"):IsStudio() and not v166 then
			warn("ActivePetsUIController:HandleBoostEquipped() | Failed to update feed button for" .. v_u_165.Name .. ":" .. v164)
			warn(v167)
		end
	end
end
local function v170()
	-- upvalues: (copy) v_u_5, (ref) v_u_42, (copy) v_u_168
	local v169 = v_u_5.Character:FindFirstChildWhichIsA("Tool")
	if v169 then
		v169 = v169:HasTag("PetBoost")
	end
	v_u_42 = v169
	if v_u_42 then
		v_u_168("Boost")
	else
		v_u_168("Feed")
	end
end
v_u_5.Character.ChildAdded:Connect(v170)
v_u_5.Character.ChildRemoved:Connect(v170)
local v171 = v_u_5.Character:FindFirstChildWhichIsA("Tool")
if v171 then
	v171 = v171:HasTag("PetBoost")
end
local v172 = v171
if v172 then
	v_u_168("Boost")
else
	v_u_168("Feed")
end
return v_u_36
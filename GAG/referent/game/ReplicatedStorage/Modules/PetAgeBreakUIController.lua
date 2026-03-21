local v_u_1 = game:GetService("Players").LocalPlayer
local v_u_2 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = require(v_u_2.Modules.PetServices.PetUtilities)
local v_u_5 = require(v_u_2.Modules.DataService)
local v6 = require(v_u_2.Data.PetRegistry)
local v_u_7 = require(v_u_2.Modules.GuiController)
local v_u_8 = require(v_u_2.Modules.CalculatePetValue)
require(v_u_2.Comma_Module)
local v_u_9 = require(v_u_2.Modules.NumberUtil)
require(v_u_2.Modules.PetServices.PetsService)
local v_u_10 = require(v_u_2.Modules.CountDictionary)
local v_u_11 = require(v_u_2.Data.PetAgeBreakMachineData)
local v_u_12 = require(v_u_2.Modules.PetServices.PetsService)
local v_u_13 = require(v_u_2.Modules.Notification)
local v_u_14 = require(v_u_2.Modules.ConfirmationPromptController)
local v_u_15 = v6.PetList
local v16 = v_u_2:WaitForChild("GameEvents")
local v_u_17 = v16:WaitForChild("PetAgeLimitBreak_Submit")
local v18 = v16:WaitForChild("Favorite_Item_BE")
local v_u_19 = v16.PetAgeLimitBreak_Cancel
local v_u_20 = v_u_1:WaitForChild("PlayerGui"):WaitForChild("PetAgeBreak_UI")
local v_u_21 = v_u_20:WaitForChild("Main")
local _ = v_u_21.Main.SellCosts.Main.Sell
local v_u_22 = v_u_21:WaitForChild("Details")
local v_u_23 = v_u_21:FindFirstChild("NoDupeText", true)
local v_u_24 = {}
local v_u_25 = {}
local v_u_26 = {}
local v_u_27 = nil
local v_u_28 = {}
local v_u_29 = nil
local function v_u_35(p30)
	-- upvalues: (copy) v_u_3, (copy) v_u_22
	local v31 = {
		["Position"] = p30 and UDim2.new(0.8, 0, 0.5, 0) or UDim2.new(0.6, 0, 0.5, 0)
	}
	local v32 = {
		["Scale"] = p30 and 1 or 0.1
	}
	local v33 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	v_u_3:Create(v_u_22, v33, v31):Play()
	local v34 = v_u_22:FindFirstChildWhichIsA("UIScale")
	if v34 then
		v_u_3:Create(v34, v33, v32):Play()
	end
end
local function v_u_40()
	-- upvalues: (ref) v_u_27, (copy) v_u_1
	v_u_27 = {}
	for _, v36 in v_u_1.Backpack:GetChildren() do
		local v37 = v36:GetAttribute("PET_UUID")
		if v37 then
			v_u_27[v37] = v36
		end
	end
	for _, v38 in v_u_1.Character:GetChildren() do
		local v39 = v38:GetAttribute("PET_UUID")
		if v39 then
			v_u_27[v39] = v38
		end
	end
end
local function v_u_47(p41)
	-- upvalues: (copy) v_u_15, (copy) v_u_4, (copy) v_u_22
	local v42 = v_u_15[p41.PetType]
	local v43 = p41.PetData
	local v44 = v43.Level
	local v45 = v_u_4:CalculateWeight(v43.BaseWeight, v44) * 100
	local v46 = math.round(v45) / 100
	v_u_22.Holder.Header.PET_TEXT.Text = p41.PetType or "Unknown"
	v_u_22.Holder.Display.Display.PET_NAME_CONFIG.Text = v43.Name or "Unnamed"
	v_u_22.Holder.Display.Display.PET_IMAGE.Image = v42.Icon or ""
	v_u_22.Holder.Description.Display.PET_DESCRIPTION.Text = v42.Description or "No description available."
	v_u_22.Holder.Stats.Holder.Weight.PET_WEIGHT.Text = ("Weight: %* KG"):format(v46)
	v_u_22.Holder.Stats.Holder.Age.PET_AGE.Text = ("Age: %*"):format(v44)
end
local function v_u_50(p48, p49)
	if p48:FindFirstChild("Display") then
		if p49 then
			p48.Display.BackgroundColor3 = Color3.fromRGB(30, 100, 14)
			p48.Display.UIStroke.Color = Color3.fromRGB(37, 238, 38)
			p48.Display.SELECTED_VIGNETTE.Visible = true
		else
			p48.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
			p48.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
			p48.Display.SELECTED_VIGNETTE.Visible = false
		end
	else
		return
	end
end
function v_u_24.UpdatePetCard(_, p_u_51, p_u_52)
	-- upvalues: (copy) v_u_21, (copy) v_u_28, (ref) v_u_29, (copy) v_u_50, (ref) v_u_27, (copy) v_u_24, (ref) v_u_26, (ref) v_u_25, (copy) v_u_35, (copy) v_u_47, (copy) v_u_10
	local _ = v_u_21.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame
	p_u_51.Favorite.Visible = p_u_52.PetData.IsFavorite and true or false
	if v_u_28[p_u_51.Name] ~= nil then
		v_u_28[p_u_51.Name]:Disconnect()
		v_u_28[p_u_51.Name] = nil
	end
	v_u_28[p_u_51.Name] = p_u_51.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_29, (copy) p_u_52, (ref) v_u_50, (copy) p_u_51, (ref) v_u_27, (ref) v_u_24, (ref) v_u_26, (ref) v_u_25, (ref) v_u_35, (ref) v_u_47, (ref) v_u_21, (ref) v_u_10
		local v53
		if v_u_29 == p_u_52.UUID then
			v53 = nil
		else
			v53 = p_u_52.UUID
		end
		v_u_29 = v53
		if not p_u_52.PetData.IsFavorite then
			v_u_50(p_u_51, not p_u_51.Display.SELECTED_VIGNETTE.Visible)
			local v54 = v_u_27[p_u_52.UUID]
			if not (v54 and v54:IsDescendantOf(game)) then
				warn("Tool not found or destroyed:", p_u_52.UUID)
				local v55 = p_u_51
				if v55:FindFirstChild("Display") then
					v55.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
					v55.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
					v55.Display.SELECTED_VIGNETTE.Visible = false
				end
			end
			v_u_24:ClearSelection()
			if p_u_51.Display.SELECTED_VIGNETTE.Visible then
				v_u_26[v54] = true
				v_u_25[p_u_52.UUID] = p_u_51
				v_u_47(p_u_52)
				v_u_35(true)
			else
				v_u_26[v54] = nil
				v_u_25[p_u_52.UUID] = nil
				v_u_35(false)
			end
			v_u_21.Main.SellCosts.Main.SelectedAmount.Text = v_u_10(v_u_26) .. " Selected"
		end
	end)
end
function v_u_24.GetPetFrame(_, p56)
	-- upvalues: (copy) v_u_21
	return v_u_21.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame:FindFirstChild(p56)
end
function v_u_24.ClearSelection(_)
	-- upvalues: (ref) v_u_25, (copy) v_u_21, (ref) v_u_26, (copy) v_u_35
	if next(v_u_25) ~= nil then
		for _, v57 in pairs(v_u_25) do
			if v57:FindFirstChild("Display") then
				v57.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
				v57.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
				v57.Display.SELECTED_VIGNETTE.Visible = false
			end
		end
		v_u_21.Main.SellCosts.Main.SelectedAmount.Text = 0 .. " Selected"
		v_u_25 = {}
		v_u_26 = {}
		v_u_35(false)
	end
end
function v_u_24.RefreshUI(_)
	-- upvalues: (ref) v_u_29, (copy) v_u_35, (copy) v_u_40, (copy) v_u_5, (copy) v_u_21, (copy) v_u_4, (copy) v_u_1, (copy) v_u_28, (ref) v_u_27, (copy) v_u_15, (copy) v_u_24, (copy) v_u_23, (copy) v_u_10, (copy) v_u_11, (copy) v_u_9
	v_u_29 = nil
	v_u_35(false)
	v_u_40()
	local v58 = v_u_5:GetData()
	local _ = v58.PetsData.MutableStats
	local v59 = v58.PetAgeBreakMachine
	if v59.SubmittedPet then
		local v60 = v_u_21.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame
		local v61 = v60:FindFirstChild("TEMPLATE")
		for _, v62 in v60:GetChildren() do
			if v62:IsA("ImageButton") and v62.Name ~= "TEMPLATE" then
				v62:Destroy()
			end
		end
		v61.Visible = false
		local v63 = v_u_4:GetPetsSortedByAge(v_u_1, 0, true, false)
		if v63 and #v63 ~= 0 then
			for _, v64 in v_u_28 do
				if v64 then
					v64:Disconnect()
				end
			end
			table.clear(v_u_28)
			for _, v65 in v63 do
				if v65.PetData.Level >= 0 then
					local v66 = v_u_27[v65.UUID]
					if v66 and (v66.Parent and v65.PetType == v59.SubmittedPet.PetType) then
						local v67 = v61:Clone()
						v67.Visible = true
						v67.Name = v65.UUID
						v67.Favorite.Visible = v65.PetData.IsFavorite and true or false
						local v68 = v_u_15[v65.PetType]
						v67.Display.PET_NAME.Text = v65.PetType
						local v69 = v67.Display.PET_AGE
						local v70 = v65.PetData.Level
						local v71 = v_u_4:CalculateWeight(v65.PetData.BaseWeight, v65.PetData.Level) * 100
						v69.Text = ("Age: %* \226\128\162 %* KG"):format(v70, math.round(v71) / 100)
						v67.Display.DetailHolder.PET_IMAGE.Image = v68.Icon
						if v67:FindFirstChild("Display") then
							v67.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
							v67.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
							v67.Display.SELECTED_VIGNETTE.Visible = false
						end
						v_u_24:UpdatePetCard(v67, v65)
						v67.Parent = v60
					end
				end
			end
			v_u_23.Visible = v_u_10(v_u_28) <= 0
			local v72 = (v59.SubmittedPet.PetData.Level + 1 - v_u_11.REQUIRED_PET_LEVEL) * v_u_11.AGEUP_PRICE
			v_u_21.Main.SellCosts.Main.CostAmount.Text = ("%* \194\162"):format((v_u_9.FormatCompactPrice(v72)))
		end
	else
		return
	end
end
function v_u_24.Start(_)
	-- upvalues: (copy) v_u_7, (copy) v_u_20, (ref) v_u_27, (ref) v_u_26, (copy) v_u_24, (copy) v_u_21, (copy) v_u_19, (copy) v_u_13, (copy) v_u_5, (copy) v_u_12, (copy) v_u_11, (copy) v_u_9, (copy) v_u_2, (copy) v_u_14, (copy) v_u_17, (ref) v_u_25, (ref) v_u_29
	v_u_7:UsePopupAnims(v_u_20)
	if v_u_27 ~= nil then
		table.clear(v_u_27)
		v_u_27 = {}
	end
	if v_u_26 ~= nil then
		table.clear(v_u_26)
		v_u_26 = {}
	end
	local v_u_73 = {}
	v_u_24:ClearSelection()
	v_u_24:RefreshUI()
	v_u_21.Main.Header.Exit.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_73, (ref) v_u_24, (ref) v_u_7, (ref) v_u_20
		local v74
		if v_u_73.ExitHeader and (nil or 0.5) > tick() - v_u_73.ExitHeader then
			v74 = true
		else
			v_u_73.ExitHeader = tick()
			v74 = false
		end
		if not v74 then
			v_u_24:ClearSelection()
			v_u_7:Close(v_u_20)
		end
	end)
	v_u_21.Main.Header.CancelAge.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_19, (ref) v_u_24, (ref) v_u_7, (ref) v_u_20
		v_u_19:FireServer()
		v_u_24:ClearSelection()
		v_u_7:Close(v_u_20)
	end)
	v_u_21.Main.SellCosts.Main.Clear.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_73, (ref) v_u_24
		local v75
		if v_u_73.Clear and (nil or 0.5) > tick() - v_u_73.Clear then
			v75 = true
		else
			v_u_73.Clear = tick()
			v75 = false
		end
		if not v75 then
			v_u_24:ClearSelection()
		end
	end)
	v_u_21.Main.SellCosts.Main.Sell.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_73, (ref) v_u_26, (ref) v_u_13, (ref) v_u_5, (ref) v_u_12, (ref) v_u_11, (ref) v_u_9, (ref) v_u_2, (ref) v_u_14, (ref) v_u_17, (ref) v_u_27, (ref) v_u_25, (ref) v_u_24, (ref) v_u_29, (ref) v_u_7, (ref) v_u_20
		local v76
		if v_u_73.Sell and (nil or 0.5) > tick() - v_u_73.Sell then
			v76 = true
		else
			v_u_73.Sell = tick()
			v76 = false
		end
		if v76 then
			return
		else
			local v77 = {}
			for v78, _ in v_u_26 do
				local v79 = v78:GetAttribute("PET_UUID")
				table.insert(v77, v79)
			end
			if #v77 == 1 then
				local v80 = v_u_5:GetData()
				local v81 = v80.PetAgeBreakMachine
				for _, v82 in v77 do
					local v83 = v_u_12:GetPlayerPetData(v82)
					if not v83 then
						v_u_13:CreateNotification("Invalid Pet Submitted!")
						return
					end
					if v83.PetType ~= v81.SubmittedPet.PetType then
						v_u_13:CreateNotification((("You can only submit %*."):format(v81.SubmittedPet.PetType)))
						return
					end
				end
				local v84 = (v81.SubmittedPet.PetData.Level + 1 - v_u_11.REQUIRED_PET_LEVEL) * v_u_11.AGEUP_PRICE
				if v80.Sheckles < v84 then
					v_u_13:CreateNotification((("You need %*"):format((v_u_9.DisplaySheckles(v84)))))
				else
					local v85 = v_u_12:GetPlayerPetData(v77[1])
					print(v85)
					local v86 = require(v_u_2.Data.PetRegistry.PetList)[v85.PetType]
					local v87 = not v86 and "Common" or v86.Rarity
					v_u_14:Open({
						["Title"] = "Pet Fuse Confirmation",
						["Header"] = "Are you sure you want to use this pet as the dupe?",
						["Middle"] = ("%* [Age %*]"):format(v85.PetType, v85.PetData.Level),
						["Footer"] = "This will fuse this pet into the higher level pet!",
						["AnimatedWords"] = {
							[("%*"):format(v85.PetType)] = v87
						}
					}, {
						["ConfirmEvent"] = v_u_17,
						["ConfirmEventData"] = { v77 }
					})
					for _, v88 in v77 do
						v_u_27[v88] = nil
						if v_u_25[v88] then
							v_u_25[v88]:Destroy()
							v_u_25[v88] = nil
						end
					end
					v_u_24:ClearSelection()
					table.clear(v_u_26)
					table.clear(v_u_25)
					v_u_29 = nil
					v_u_24:RefreshUI()
					v_u_7:Close(v_u_20)
				end
			else
				v_u_13:CreateNotification("Please submit one pet only!")
				return
			end
		end
	end)
	v_u_5:GetPathSignal("PetAgeBreakMachine/SubmittedPet"):Connect(function()
		-- upvalues: (ref) v_u_5, (ref) v_u_24, (ref) v_u_7, (ref) v_u_20
		task.wait(0.5)
		local v89 = v_u_5:GetData().PetAgeBreakMachine
		v_u_24:RefreshUI()
		if not v89.SubmittedPet then
			v_u_7:Close(v_u_20)
		end
	end)
end
function v_u_24.Open(_)
	-- upvalues: (copy) v_u_24, (copy) v_u_7, (copy) v_u_20
	v_u_24:RefreshUI()
	v_u_7:Open(v_u_20)
end
v18.Event:Connect(function(p90)
	-- upvalues: (copy) v_u_12, (copy) v_u_24, (copy) v_u_8, (ref) v_u_27, (copy) v_u_40, (ref) v_u_26, (ref) v_u_25
	if p90 then
		local v91 = p90:GetAttribute("PET_UUID")
		if v91 then
			task.wait(0.25)
			local v92 = v_u_12:GetPlayerPetData(v91)
			if v92 then
				local v93 = v_u_24:GetPetFrame(v91)
				if v93 then
					if v93 then
						v_u_24:UpdatePetCard(v93, v92)
						if v93:FindFirstChild("Display") then
							v93.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
							v93.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
							v93.Display.SELECTED_VIGNETTE.Visible = false
						end
					else
						v_u_24:RefreshUI()
					end
					local v94 = v_u_8
					local v95 = v92.UUID
					if not v_u_27 then
						v_u_40()
					end
					v94(v_u_27[v95])
					if v92.PetData.IsFavorite and (v_u_26[p90] and v_u_25[v92.UUID]) then
						v_u_26[p90] = nil
						v_u_25[v92.UUID] = nil
					end
				end
			else
				return warn("PetAgeBreakUIController:Favorite_Item_BE | No pet data found!")
			end
		else
			return
		end
	else
		warn("PetAgeBreakUIController:Favorite_Item_BE | No pet tool!")
		return
	end
end)
task.spawn(v_u_24.Start, v_u_24)
return v_u_24
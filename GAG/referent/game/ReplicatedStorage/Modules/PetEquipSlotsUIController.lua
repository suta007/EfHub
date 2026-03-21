local v_u_1 = game:GetService("Players").LocalPlayer
local v2 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
local v_u_3 = game:GetService("TweenService")
local v_u_4 = v_u_1:WaitForChild("PlayerGui"):WaitForChild("PetEquipSlots_UI")
local v_u_5 = v_u_4:WaitForChild("Main")
local v_u_6 = v2:WaitForChild("GameEvents")
local v_u_7 = v_u_6:WaitForChild("SellAllPets_RE")
local v_u_8 = v_u_6:WaitForChild("SellPetShopSelected")
local v9 = v_u_6:WaitForChild("Favorite_Item_BE")
local v_u_10 = require(v2.Modules.PetServices.PetUtilities)
local v_u_11 = require(v2.Modules.DataService)
local v12 = require(v2.Data.PetRegistry)
local v_u_13 = require(v2.Modules.GuiController)
local v_u_14 = require(v2.Modules.CalculatePetValue)
require(v2.Comma_Module)
local v_u_15 = require(v2.Modules.NumberUtil)
local v_u_16 = require(v2.Modules.PetServices.PetsService)
local v_u_17 = require(v2.Modules.ConfirmationPromptController)
local v_u_18 = v12.PetList
local v19 = v_u_5.Main.Holder.TradeInButton
local v20 = v_u_5.Main.SellCosts.Main
local v_u_21 = v19.TradeIn
local v_u_22 = v19.Confirm
local v_u_23 = v19.Cancel
local _ = v20.Sell
local _ = v20.SellAll
local v_u_24 = v_u_5.Main.Holder.TextHolder.REQUIRED_AGE
local v_u_25 = v_u_5:WaitForChild("Details")
local v_u_26 = v_u_5.Main.SellCosts.Main.SelectedPetWorth
local v_u_27 = v_u_5.Main.SellCosts.Main.AllPetWorth
require(v2.Modules.PetEggOddsController)
require(v2.Data.PetEggData)
local v_u_28 = {}
local v_u_29 = {}
local v_u_30 = {}
local v_u_31 = nil
local v_u_32 = 0
local v_u_33 = {}
local v_u_34 = {
	["Pet"] = "Pet",
	["Egg"] = "Egg",
	["EggInfo"] = "EggInfo",
	["PetInventory"] = "PetInventory",
	["PetSell"] = "PetSell"
}
v_u_28.CurrentMode = v_u_34.Pet
local v_u_35 = nil
local v_u_36 = {
	[0] = UDim2.new(1, 0, 0, 0),
	[1] = UDim2.new(1, 0, 0.175, 0),
	[2] = UDim2.new(1, 0, 0.375, 0),
	[3] = UDim2.new(1, 0, 0.575, 0),
	[4] = UDim2.new(1, 0, 0.775, 0),
	[5] = UDim2.new(1, 0, 1, 0)
}
local v_u_37 = {
	[v_u_34.Pet] = {
		["Title"] = "Trade in Pets for extra Pet Equip slots!",
		["BaseColor"] = Color3.fromRGB(255, 175, 21),
		["Stroke"] = Color3.fromRGB(134, 87, 11)
	},
	[v_u_34.Egg] = {
		["Title"] = "Trade in Pets for extra Egg Equip slots!",
		["BaseColor"] = Color3.fromRGB(83, 171, 52),
		["Stroke"] = Color3.fromRGB(57, 100, 47)
	},
	[v_u_34.PetInventory] = {
		["Title"] = "Trade in Pets for extra Pet Inventory capacity!",
		["BaseColor"] = Color3.fromRGB(170, 0, 255),
		["Stroke"] = Color3.fromRGB(100, 0, 150)
	},
	[v_u_34.PetSell] = {
		["Title"] = "Sell your pets!",
		["BaseColor"] = Color3.fromRGB(255, 102, 204),
		["Stroke"] = Color3.fromRGB(104, 42, 83)
	}
}
local function v_u_43(p38)
	-- upvalues: (copy) v_u_3, (copy) v_u_25
	local v39 = {
		["Position"] = p38 and UDim2.new(0.8, 0, 0.5, 0) or UDim2.new(0.6, 0, 0.5, 0)
	}
	local v40 = {
		["Scale"] = p38 and 1 or 0.1
	}
	local v41 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	v_u_3:Create(v_u_25, v41, v39):Play()
	local v42 = v_u_25:FindFirstChildWhichIsA("UIScale")
	if v42 then
		v_u_3:Create(v42, v41, v40):Play()
	end
end
local function v_u_48()
	-- upvalues: (ref) v_u_31, (copy) v_u_1
	v_u_31 = {}
	for _, v44 in v_u_1.Backpack:GetChildren() do
		local v45 = v44:GetAttribute("PET_UUID")
		if v45 then
			v_u_31[v45] = v44
		end
	end
	for _, v46 in v_u_1.Character:GetChildren() do
		local v47 = v46:GetAttribute("PET_UUID")
		if v47 then
			v_u_31[v47] = v46
		end
	end
end
local function v_u_59()
	-- upvalues: (copy) v_u_1, (copy) v_u_11, (copy) v_u_14
	if not v_u_1.Character then
		return -1
	end
	local v49 = v_u_11:GetData()
	if not v49 then
		return -1
	end
	local v50 = v49.PetsData
	if not v50 then
		return -1
	end
	local v51 = v50.PetInventory.Data
	local v52 = {}
	for _, v53 in v_u_1.Backpack:GetChildren() do
		table.insert(v52, v53)
	end
	for _, v54 in v_u_1.Character:GetChildren() do
		table.insert(v52, v54)
	end
	local v55 = 0
	for _, v56 in v52 do
		local v57 = v56:GetAttribute("PET_UUID")
		if v57 then
			local v58 = v51[v57]
			if v58 and not v58.PetData.IsFavorite then
				v55 = v55 + v_u_14(v56)
			end
		end
	end
	return v55
end
local function v_u_66(p60)
	-- upvalues: (copy) v_u_18, (copy) v_u_10, (copy) v_u_25
	local v61 = v_u_18[p60.PetType]
	local v62 = p60.PetData
	local v63 = v62.Level
	local v64 = v_u_10:CalculateWeight(v62.BaseWeight, v63) * 100
	local v65 = math.round(v64) / 100
	v_u_25.Holder.Header.PET_TEXT.Text = p60.PetType or "Unknown"
	v_u_25.Holder.Display.Display.PET_NAME_CONFIG.Text = v62.Name or "Unnamed"
	v_u_25.Holder.Display.Display.PET_IMAGE.Image = v61.Icon or ""
	v_u_25.Holder.Description.Display.PET_DESCRIPTION.Text = v61.Description or "No description available."
	v_u_25.Holder.Stats.Holder.Weight.PET_WEIGHT.Text = ("Weight: %* KG"):format(v65)
	v_u_25.Holder.Stats.Holder.Age.PET_AGE.Text = ("Age: %*"):format(v63)
end
local function v_u_69(p67, p68)
	if p67:FindFirstChild("Display") then
		if p68 then
			p67.Display.BackgroundColor3 = Color3.fromRGB(30, 100, 14)
			p67.Display.UIStroke.Color = Color3.fromRGB(37, 238, 38)
			p67.Display.SELECTED_VIGNETTE.Visible = true
		else
			p67.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
			p67.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
			p67.Display.SELECTED_VIGNETTE.Visible = false
		end
	else
		return
	end
end
function v_u_28.UpdatePetCard(p70, p_u_71, p_u_72)
	-- upvalues: (copy) v_u_34, (copy) v_u_5, (copy) v_u_33, (ref) v_u_35, (copy) v_u_69, (copy) v_u_21, (copy) v_u_14, (ref) v_u_31, (copy) v_u_48, (ref) v_u_32, (ref) v_u_30, (ref) v_u_29, (copy) v_u_43, (copy) v_u_66, (copy) v_u_26, (copy) v_u_15
	local v_u_73 = p70.CurrentMode == v_u_34.PetSell
	local v_u_74 = v_u_73 and v_u_5.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame or v_u_5.Main.Holder.ScrollingFrame.Content
	p_u_71.Favorite.Visible = p_u_72.PetData.IsFavorite and true or false
	if v_u_33[p_u_71.Name] then
		v_u_33[p_u_71.Name]:Disconnect()
		v_u_33[p_u_71.Name] = nil
	end
	v_u_33[p_u_71.Name] = p_u_71.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_35, (copy) p_u_72, (copy) v_u_73, (copy) v_u_74, (ref) v_u_69, (ref) v_u_21, (copy) p_u_71, (ref) v_u_14, (ref) v_u_31, (ref) v_u_48, (ref) v_u_32, (ref) v_u_30, (ref) v_u_29, (ref) v_u_43, (ref) v_u_66, (ref) v_u_26, (ref) v_u_15
		local v75
		if v_u_35 == p_u_72.UUID then
			v75 = nil
		else
			v75 = p_u_72.UUID
		end
		v_u_35 = v75
		if v_u_73 then
			if not p_u_72.PetData.IsFavorite then
				v_u_69(p_u_71, not p_u_71.Display.SELECTED_VIGNETTE.Visible)
				local v76 = v_u_14
				local v77 = p_u_72.UUID
				if not v_u_31 then
					v_u_48()
				end
				local v78 = v76(v_u_31[v77])
				local v79 = v_u_31[p_u_72.UUID]
				if not (v79 and v79:IsDescendantOf(game)) then
					warn("Tool not found or destroyed:", p_u_72.UUID)
					local v80 = p_u_71
					if v80:FindFirstChild("Display") then
						v80.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
						v80.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
						v80.Display.SELECTED_VIGNETTE.Visible = false
					end
				end
				if p_u_71.Display.SELECTED_VIGNETTE.Visible then
					v_u_32 = v_u_32 + v78
					v_u_30[v79] = true
					v_u_29[p_u_72.UUID] = p_u_71
					v_u_66(p_u_72)
					v_u_43(true)
				else
					v_u_32 = v_u_32 - v78
					v_u_30[v79] = nil
					v_u_29[p_u_72.UUID] = nil
					v_u_43(false)
				end
				local v81 = v_u_32
				v_u_26.Text = v_u_15.DisplaySheckles(v81)
			end
		else
			for _, v82 in v_u_74:GetChildren() do
				if v82:IsA("ImageButton") and v82:FindFirstChild("Display") then
					v_u_69(v82, v82.Name == v_u_35)
				end
			end
			local v83 = v_u_35 ~= nil
			v_u_21.BackgroundTransparency = v83 and 0 or 0.5
			v_u_21.UIStroke.Transparency = v83 and 0 or 0.5
			v_u_21.TextLabel.TextTransparency = v83 and 0 or 0.5
		end
		if not v_u_73 then
			if v_u_35 then
				v_u_66(p_u_72)
				v_u_43(true)
				return
			end
			v_u_43(false)
		end
	end)
end
function v_u_28.GetPetFrame(p84, p85)
	-- upvalues: (copy) v_u_34, (copy) v_u_5
	return (p84.CurrentMode == v_u_34.PetSell and v_u_5.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame or v_u_5.Main.Holder.ScrollingFrame.Content):FindFirstChild(p85)
end
function v_u_28.SetMode(p86, p87)
	-- upvalues: (ref) v_u_35, (copy) v_u_43, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_34, (copy) v_u_5, (copy) v_u_37
	p86.CurrentMode = p87
	v_u_35 = nil
	v_u_43(false)
	v_u_21.BackgroundTransparency = 0.5
	v_u_21.UIStroke.Transparency = 0.5
	v_u_21.TextLabel.TextTransparency = 0.5
	v_u_21.Visible = true
	v_u_22.Visible = false
	v_u_23.Visible = false
	local v88 = (p87 == v_u_34.Pet or p87 == v_u_34.Egg) and true or p87 == v_u_34.PetInventory
	local v89 = p87 == v_u_34.PetSell
	local v90 = v_u_5.Main.Holder
	local v91 = {
		["BAR"] = v_u_5.Main.BAR,
		["EggInfo"] = v90.EggInfo,
		["ScrollingFrame"] = v90.ScrollingFrame,
		["TradeInButton"] = v90.TradeInButton,
		["OddsButton"] = v90.EggInfo.Content.TEMPLATE.Display.OddsButton,
		["TextHolder"] = v90.TextHolder,
		["SellScrollingFrame"] = v90.SellFrame.BackgroundFrame.SellScrollingFrame,
		["SellFrame"] = v90.SellFrame,
		["SellCosts"] = v_u_5.Main.SellCosts,
		["AgePrompt"] = v90.AgePromptText
	}
	if v89 then
		v91.BAR.Visible = false
		v91.ScrollingFrame.Visible = false
		v91.TradeInButton.Visible = false
		v91.TextHolder.Visible = false
		v91.AgePrompt.Visible = false
		v91.EggInfo.Visible = false
		v91.SellFrame.Visible = true
		v91.SellCosts.Visible = true
	else
		v91.BAR.Visible = v88
		v91.ScrollingFrame.Visible = v88
		v91.TradeInButton.Visible = v88
		v91.TextHolder.Visible = v88
		v91.AgePrompt.Visible = v88
		v91.EggInfo.Visible = not v88
		v91.OddsButton.Visible = not v88
		v91.SellCosts.Visible = false
		v91.SellFrame.Visible = false
	end
	if v_u_37[p87] then
		local v92 = v_u_37[p87]
		v_u_5.Main.Header.Title.Text = v92.Title
		v_u_5.Main.Header.BackgroundColor3 = v92.BaseColor
		v_u_5.Main.Header.Title.UIStroke.Color = v92.Stroke
	else
		v_u_5.Main.Header.Title.Text = "Egg Rarity Info"
		v_u_5.Main.Header.BackgroundColor3 = Color3.fromRGB(35, 150, 238)
		v_u_5.Main.Header.Title.UIStroke.Color = Color3.fromRGB(17, 74, 117)
	end
	p86:RefreshUI(v89)
end
function v_u_28.ClearSelection(_)
	-- upvalues: (ref) v_u_29, (copy) v_u_5, (ref) v_u_32, (ref) v_u_30, (copy) v_u_43
	if next(v_u_29) ~= nil then
		for _, v93 in v_u_29 do
			if v93:FindFirstChild("Display") then
				v93.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
				v93.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
				v93.Display.SELECTED_VIGNETTE.Visible = false
			end
		end
		v_u_5.Main.SellCosts.Main.SelectedPetWorth.Text = 0 .. "\194\162"
		v_u_32 = 0
		v_u_29 = {}
		v_u_30 = {}
		v_u_43(false)
	end
end
function v_u_28.RefreshUI(p94, p95)
	-- upvalues: (ref) v_u_35, (copy) v_u_34, (copy) v_u_43, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_48, (copy) v_u_11, (copy) v_u_24, (copy) v_u_5, (copy) v_u_36, (copy) v_u_59, (copy) v_u_27, (copy) v_u_15, (copy) v_u_10, (copy) v_u_1, (ref) v_u_32, (copy) v_u_33, (ref) v_u_31, (copy) v_u_18, (copy) v_u_28
	v_u_35 = nil
	if p95 == nil then
		p95 = p94.CurrentMode == v_u_34.Sell
	end
	v_u_43(false)
	v_u_21.BackgroundTransparency = 0.5
	v_u_21.UIStroke.Transparency = 0.5
	v_u_21.TextLabel.TextTransparency = 0.5
	v_u_21.Visible = true
	v_u_22.Visible = false
	v_u_23.Visible = false
	if p95 then
		v_u_48()
	end
	local v96 = v_u_11:GetData()
	local _ = v96.PetsData.MutableStats
	local v97 = p94.CurrentMode
	local v98 = v97 == v_u_34.Pet
	local v99 = v97 == v_u_34.Egg
	local v100 = v97 == v_u_34.PetInventory
	local v101 = 0
	if p95 then
		local v102 = v_u_59()
		v_u_27.Text = v_u_15.DisplaySheckles(v102)
	else
		local v103
		if v98 then
			v103 = v96.PetsData.PurchasedEquipSlots or 0
		elseif v99 then
			v103 = v96.PetsData.PurchasedEggSlots or 0
		else
			v103 = v100 and (v96.PetsData.PurchasedPetInventorySlots or 0) or 0
		end
		v101 = ({
			20,
			30,
			45,
			60,
			75
		})[v103 + 1] or 999
		if v103 >= 5 then
			v_u_24.Text = "You have reached the maximum number of slots!"
			v_u_5.Main.Holder.ScrollingFrame.Visible = false
			v_u_5.Main.Holder.TradeInButton.Visible = false
		else
			v_u_24.Text = ("Required age for next slot unlock: <font color=\"#ffbe19\">%*</font>"):format(v101)
		end
		v_u_5.Main.BAR.ACTUAL_BAR.Size = v_u_36[math.clamp(v103, 0, 5)] or v_u_36[0]
		local v104 = v_u_5.Main.BAR.IncrementalListing
		for v109, v106 in {
			"One",
			"Two",
			"Three",
			"Four",
			"Five"
		} do
			local v107 = v104:FindFirstChild(v106)
			if v107 then
				local v108 = v107:FindFirstChildWhichIsA("UIGradient")
				if v108 then
					v108.Enabled = v109 <= v103
				end
				if v100 then
					local v109 = v109 * 5 or v109
				end
				v107.Text = ("+%* Extra"):format(v109)
			end
		end
		local v110 = v104:FindFirstChild("Title")
		if v110 and v110:FindFirstChild("UIGradient") then
			v110.UIGradient.Enabled = v103 >= 5
		end
		if v103 >= 5 then
			return
		end
	end
	local v111 = p95 and v_u_5.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame or v_u_5.Main.Holder.ScrollingFrame.Content
	local v112 = v111:FindFirstChild("TEMPLATE")
	for _, v113 in v111:GetChildren() do
		if v113:IsA("ImageButton") and v113.Name ~= "TEMPLATE" then
			v113:Destroy()
		end
	end
	v112.Visible = false
	local v114 = v_u_10:GetPetsSortedByAge(v_u_1, 0, true, false)
	if not v114 or #v114 == 0 then
		return
	end
	v_u_32 = 0
	for _, v115 in v_u_33 do
		if v115 then
			v115:Disconnect()
		end
	end
	table.clear(v_u_33)
	for _, v116 in v114 do
		if v116.PetData.Level >= v101 then
			if p95 then
				local v117 = v_u_31[v116.UUID]
				if v117 and v117.Parent then
					goto l72
				end
			else
				::l72::
				local v118 = v112:Clone()
				v118.Visible = true
				v118.Name = v116.UUID
				v118.Visible = not v116.PetData.IsFavorite
				local v119 = v_u_18[v116.PetType]
				v118.Display.PET_NAME.Text = v116.PetType
				local v120 = v118.Display.PET_AGE
				local v121 = v116.PetData.Level
				local v122 = v_u_10:CalculateWeight(v116.PetData.BaseWeight, v116.PetData.Level) * 100
				v120.Text = ("Age: %* \226\128\162 %* KG"):format(v121, math.round(v122) / 100)
				if v119 then
					v118.Display.DetailHolder.PET_IMAGE.Visible = true
					v118.Display.DetailHolder.PET_IMAGE.Image = v119.Icon
				else
					v118.Display.DetailHolder.PET_IMAGE.Visible = false
				end
				if v118:FindFirstChild("Display") then
					v118.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
					v118.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
					v118.Display.SELECTED_VIGNETTE.Visible = false
				end
				v_u_28:UpdatePetCard(v118, v116)
				v118.Parent = v111
			end
		end
	end
end
local function v_u_127()
	-- upvalues: (ref) v_u_30, (ref) v_u_31, (ref) v_u_29, (copy) v_u_28, (ref) v_u_35, (ref) v_u_32, (copy) v_u_26, (copy) v_u_15, (copy) v_u_59, (copy) v_u_27, (copy) v_u_34, (copy) v_u_5
	for v123, _ in v_u_30 do
		local v124 = v123:GetAttribute("PET_UUID")
		v_u_31[v124] = nil
		if v_u_29[v124] then
			v_u_29[v124]:Destroy()
			v_u_29[v124] = nil
		end
	end
	v_u_28:ClearSelection()
	table.clear(v_u_30)
	table.clear(v_u_29)
	v_u_35 = nil
	local v125 = v_u_32
	v_u_26.Text = v_u_15.DisplaySheckles(v125)
	local v126 = v_u_59()
	v_u_27.Text = v_u_15.DisplaySheckles(v126)
	v_u_28:SetMode(v_u_34.PetSell)
	v_u_5.Main.SellCosts.Main.SelectedPetWorth.Text = 0 .. "\194\162"
	v_u_32 = 0
	v_u_28:RefreshUI(true)
end
function v_u_28.Start(_)
	-- upvalues: (copy) v_u_13, (copy) v_u_4, (ref) v_u_31, (ref) v_u_30, (copy) v_u_28, (copy) v_u_34, (copy) v_u_21, (ref) v_u_35, (copy) v_u_24, (copy) v_u_22, (copy) v_u_23, (copy) v_u_6, (copy) v_u_5, (copy) v_u_25, (ref) v_u_32, (copy) v_u_17, (copy) v_u_15, (copy) v_u_59, (copy) v_u_7, (copy) v_u_127, (ref) v_u_29, (copy) v_u_8, (copy) v_u_26, (copy) v_u_27
	v_u_13:UsePopupAnims(v_u_4)
	if v_u_31 ~= nil then
		table.clear(v_u_31)
		v_u_31 = {}
	end
	if v_u_30 ~= nil then
		table.clear(v_u_30)
		v_u_30 = {}
	end
	local v_u_128 = {}
	if v_u_28.CurrentMode == nil then
		v_u_28.CurrentMode = v_u_34.EggInfo
	end
	v_u_28:SetMode(v_u_28.CurrentMode)
	if v_u_28.CurrentMode == v_u_34.PetSell then
		v_u_28:ClearSelection()
	end
	v_u_28:RefreshUI(v_u_28.CurrentMode == v_u_34.PetSell)
	v_u_21.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_35, (ref) v_u_24, (ref) v_u_21, (ref) v_u_22, (ref) v_u_23
		local v129
		if v_u_128.TradeInStart and (nil or 0.5) > tick() - v_u_128.TradeInStart then
			v129 = true
		else
			v_u_128.TradeInStart = tick()
			v129 = false
		end
		if not v129 and v_u_35 then
			v_u_24.Text = "Are you sure you want to trade in this pet?"
			v_u_21.Visible = false
			v_u_22.Visible = true
			v_u_23.Visible = true
		end
	end)
	v_u_22.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_35, (ref) v_u_6, (ref) v_u_28, (ref) v_u_21, (ref) v_u_22, (ref) v_u_23
		local v130
		if v_u_128.TradeConfirm and (nil or 0.5) > tick() - v_u_128.TradeConfirm then
			v130 = true
		else
			v_u_128.TradeConfirm = tick()
			v130 = false
		end
		if not v130 and v_u_35 then
			v_u_6.UnlockSlotFromPet:FireServer(v_u_35, v_u_28.CurrentMode)
			task.wait(1)
			v_u_28:RefreshUI(false)
			v_u_35 = nil
			v_u_21.BackgroundTransparency = 0.5
			v_u_21.UIStroke.Transparency = 0.5
			v_u_21.TextLabel.TextTransparency = 0.5
			v_u_21.Visible = true
			v_u_22.Visible = false
			v_u_23.Visible = false
		end
	end)
	v_u_23.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_21, (ref) v_u_22, (ref) v_u_23, (ref) v_u_28
		local v131
		if v_u_128.TradeCancel and (nil or 0.5) > tick() - v_u_128.TradeCancel then
			v131 = true
		else
			v_u_128.TradeCancel = tick()
			v131 = false
		end
		if not v131 then
			v_u_21.Visible = true
			v_u_22.Visible = false
			v_u_23.Visible = false
			v_u_28:RefreshUI(false)
		end
	end)
	v_u_5.Main.Header.Exit.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28, (ref) v_u_13, (ref) v_u_4
		local v132
		if v_u_128.ExitHeader and (nil or 0.5) > tick() - v_u_128.ExitHeader then
			v132 = true
		else
			v_u_128.ExitHeader = tick()
			v132 = false
		end
		if not v132 then
			v_u_28:ClearSelection()
			v_u_13:Close(v_u_4)
		end
	end)
	v_u_25.Holder.Header.EXIT_BUTTON.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_35, (ref) v_u_21, (ref) v_u_28, (ref) v_u_34
		local v133
		if v_u_128.ExitDetails and (nil or 0.5) > tick() - v_u_128.ExitDetails then
			v133 = true
		else
			v_u_128.ExitDetails = tick()
			v133 = false
		end
		if not v133 then
			v_u_35 = nil
			v_u_21.BackgroundTransparency = 0.5
			v_u_21.UIStroke.Transparency = 0.5
			v_u_21.TextLabel.TextTransparency = 0.5
			v_u_28:SetMode(v_u_34.Pet)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.PetEquipSlots.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28, (ref) v_u_34
		local v134
		if v_u_128.PetButton and (nil or 0.5) > tick() - v_u_128.PetButton then
			v134 = true
		else
			v_u_128.PetButton = tick()
			v134 = false
		end
		if not v134 then
			v_u_28:SetMode(v_u_34.Pet)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.EggEquipSlots.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28, (ref) v_u_34
		local v135
		if v_u_128.EggButton and (nil or 0.5) > tick() - v_u_128.EggButton then
			v135 = true
		else
			v_u_128.EggButton = tick()
			v135 = false
		end
		if not v135 then
			v_u_28:SetMode(v_u_34.Egg)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.PetInventorySlots.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28, (ref) v_u_34
		local v136
		if v_u_128.InventoryButton and (nil or 0.5) > tick() - v_u_128.InventoryButton then
			v136 = true
		else
			v_u_128.InventoryButton = tick()
			v136 = false
		end
		if not v136 then
			v_u_28:SetMode(v_u_34.PetInventory)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.EggInfo.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28, (ref) v_u_34
		local v137
		if v_u_128.EggInfoButton and (nil or 0.5) > tick() - v_u_128.EggInfoButton then
			v137 = true
		else
			v_u_128.EggInfoButton = tick()
			v137 = false
		end
		if not v137 then
			v_u_28:SetMode(v_u_34.EggInfo)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.PetSell.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28, (ref) v_u_34, (ref) v_u_5, (ref) v_u_32
		local v138
		if v_u_128.PetSell and (nil or 0.5) > tick() - v_u_128.PetSell then
			v138 = true
		else
			v_u_128.PetSell = tick()
			v138 = false
		end
		if not v138 then
			v_u_28:SetMode(v_u_34.PetSell)
			v_u_5.Main.SellCosts.Main.SelectedPetWorth.Text = 0 .. "\194\162"
			v_u_32 = 0
			v_u_28:RefreshUI(true)
		end
	end)
	v_u_5.Main.SellCosts.Main.SellAll.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_13, (ref) v_u_4, (ref) v_u_17, (ref) v_u_15, (ref) v_u_59, (ref) v_u_7, (ref) v_u_127
		local v139
		if v_u_128.SellAll and (nil or 0.5) > tick() - v_u_128.SellAll then
			v139 = true
		else
			v_u_128.SellAll = tick()
			v139 = false
		end
		if not v139 then
			v_u_13:Close(v_u_4)
			v_u_17:Open({
				["Title"] = "Sell All Pets Confirmation",
				["Header"] = "Are you sure you want to sell all Unfavorited pets?",
				["Middle"] = ("You will receive: %*"):format((v_u_15.DisplaySheckles((v_u_59())))),
				["Footer"] = "This action is irreversible."
			}, {
				["ConfirmEvent"] = v_u_7,
				["ConfirmCallback"] = function()
					-- upvalues: (ref) v_u_127, (ref) v_u_13, (ref) v_u_4
					v_u_127()
					task.wait(0.25)
					v_u_13:Open(v_u_4)
				end,
				["RejectCallback"] = function()
					-- upvalues: (ref) v_u_127, (ref) v_u_13, (ref) v_u_4
					v_u_127()
					task.wait(0.25)
					v_u_13:Open(v_u_4)
				end
			})
		end
	end)
	v_u_5.Main.SellCosts.Main.Clear.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_28
		local v140
		if v_u_128.Clear and (nil or 0.5) > tick() - v_u_128.Clear then
			v140 = true
		else
			v_u_128.Clear = tick()
			v140 = false
		end
		if not v140 then
			v_u_28:ClearSelection()
		end
	end)
	v_u_5.Main.SellCosts.Main.Sell.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_128, (ref) v_u_30, (ref) v_u_31, (ref) v_u_29, (ref) v_u_8, (ref) v_u_28, (ref) v_u_32, (ref) v_u_35, (ref) v_u_26, (ref) v_u_15, (ref) v_u_59, (ref) v_u_27
		local v141
		if v_u_128.Sell and (nil or 0.5) > tick() - v_u_128.Sell then
			v141 = true
		else
			v_u_128.Sell = tick()
			v141 = false
		end
		if not v141 then
			for v142, _ in v_u_30 do
				local v143 = v142:GetAttribute("PET_UUID")
				v_u_31[v143] = nil
				if v_u_29[v143] then
					v_u_29[v143]:Destroy()
					v_u_29[v143] = nil
				end
				v_u_8:FireServer(v142)
				if v142.Parent then
					v142.AncestryChanged:Wait()
				end
			end
			v_u_28:ClearSelection()
			v_u_32 = 0
			table.clear(v_u_30)
			table.clear(v_u_29)
			v_u_35 = nil
			v_u_28:RefreshUI(true)
			local v144 = v_u_32
			v_u_26.Text = v_u_15.DisplaySheckles(v144)
			local v145 = v_u_59()
			v_u_27.Text = v_u_15.DisplaySheckles(v145)
		end
	end)
	local function v146()
		-- upvalues: (ref) v_u_4, (ref) v_u_28
		if v_u_4.Enabled then
			v_u_28:SetMode(v_u_28.CurrentMode)
		end
	end
	v_u_4:GetPropertyChangedSignal("Enabled"):Connect(v146)
end
v9.Event:Connect(function(p147)
	-- upvalues: (copy) v_u_16, (copy) v_u_28, (copy) v_u_34, (copy) v_u_14, (ref) v_u_31, (copy) v_u_48, (ref) v_u_30, (ref) v_u_29, (ref) v_u_32, (copy) v_u_26, (copy) v_u_15, (copy) v_u_59, (copy) v_u_27
	if p147 then
		local v148 = p147:GetAttribute("PET_UUID")
		if v148 then
			task.wait(0.25)
			local v149 = v_u_16:GetPlayerPetData(v148)
			if v149 then
				local v150 = v_u_28:GetPetFrame(v148)
				if v150 then
					if v150 then
						v_u_28:UpdatePetCard(v150, v149)
						if v150:FindFirstChild("Display") then
							v150.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
							v150.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
							v150.Display.SELECTED_VIGNETTE.Visible = false
						end
					else
						v_u_28:RefreshUI(v_u_28.CurrentMode == v_u_34.PetSell)
					end
					local v151 = v_u_14
					local v152 = v149.UUID
					if not v_u_31 then
						v_u_48()
					end
					local v153 = v151(v_u_31[v152])
					if v149.PetData.IsFavorite and (v_u_30[p147] and v_u_29[v149.UUID]) then
						v_u_32 = v_u_32 - v153
						local v154 = v_u_32
						local v155 = v_u_32
						v_u_32 = math.clamp(v154, 0, v155)
						v_u_30[p147] = nil
						v_u_29[v149.UUID] = nil
					end
					local v156 = v_u_32
					v_u_26.Text = v_u_15.DisplaySheckles(v156)
					local v157 = v_u_59()
					v_u_27.Text = v_u_15.DisplaySheckles(v157)
				end
			else
				return warn("PetEquipSlotsUIController:Favorite_Item_BE | No pet data found!")
			end
		else
			return
		end
	else
		warn("PetEquipSlotsUIController:Favorite_Item_BE | No pet tool!")
		return
	end
end)
task.spawn(v_u_28.Start, v_u_28)
return v_u_28
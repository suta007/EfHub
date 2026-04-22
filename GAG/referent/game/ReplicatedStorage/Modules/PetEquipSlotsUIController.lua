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
local v_u_12 = require(v2.Data.PetRegistry)
local v_u_13 = require(v2.Modules.GuiController)
local v_u_14 = require(v2.Modules.CalculatePetValue)
require(v2.Comma_Module)
local v_u_15 = require(v2.Modules.NumberUtil)
local v_u_16 = require(v2.Modules.PetServices.PetsService)
local v_u_17 = require(v2.Modules.ConfirmationPromptController)
local v_u_18 = v_u_12.PetList
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
local v_u_34 = {}
local v_u_35 = nil
local v_u_36 = {
	["Pet"] = "Pet",
	["Egg"] = "Egg",
	["EggInfo"] = "EggInfo",
	["PetInventory"] = "PetInventory",
	["PetSell"] = "PetSell"
}
v_u_28.CurrentMode = v_u_36.Pet
local v_u_37 = nil
local v_u_38 = {
	[0] = UDim2.new(1, 0, 0, 0),
	[1] = UDim2.new(1, 0, 0.175, 0),
	[2] = UDim2.new(1, 0, 0.375, 0),
	[3] = UDim2.new(1, 0, 0.575, 0),
	[4] = UDim2.new(1, 0, 0.775, 0),
	[5] = UDim2.new(1, 0, 1, 0)
}
local v_u_39 = {
	[v_u_36.Pet] = {
		["Title"] = "Trade in Pets for extra Pet Equip slots!",
		["BaseColor"] = Color3.fromRGB(255, 175, 21),
		["Stroke"] = Color3.fromRGB(134, 87, 11)
	},
	[v_u_36.Egg] = {
		["Title"] = "Trade in Pets for extra Egg Equip slots!",
		["BaseColor"] = Color3.fromRGB(83, 171, 52),
		["Stroke"] = Color3.fromRGB(57, 100, 47)
	},
	[v_u_36.PetInventory] = {
		["Title"] = "Trade in Pets for extra Pet Inventory capacity!",
		["BaseColor"] = Color3.fromRGB(170, 0, 255),
		["Stroke"] = Color3.fromRGB(100, 0, 150)
	},
	[v_u_36.PetSell] = {
		["Title"] = "Sell your pets!",
		["BaseColor"] = Color3.fromRGB(255, 102, 204),
		["Stroke"] = Color3.fromRGB(104, 42, 83)
	}
}
local function v_u_45(p40)
	-- upvalues: (copy) v_u_3, (copy) v_u_25
	local v41 = {
		["Position"] = p40 and UDim2.new(0.8, 0, 0.5, 0) or UDim2.new(0.6, 0, 0.5, 0)
	}
	local v42 = {
		["Scale"] = p40 and 1 or 0.1
	}
	local v43 = TweenInfo.new(0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	v_u_3:Create(v_u_25, v43, v41):Play()
	local v44 = v_u_25:FindFirstChildWhichIsA("UIScale")
	if v44 then
		v_u_3:Create(v44, v43, v42):Play()
	end
end
local function v_u_61(p_u_46, p_u_47)
	-- upvalues: (copy) v_u_34
	local v48 = v_u_34[p_u_46]
	if v48 then
		v48:Disconnect()
		v_u_34[p_u_46] = nil
	end
	local v_u_49 = p_u_47:FindFirstChildWhichIsA("UIStroke")
	local v_u_50 = 0
	v_u_34[p_u_46] = game:GetService("RunService").RenderStepped:Connect(function(p51)
		-- upvalues: (copy) p_u_47, (copy) p_u_46, (ref) v_u_34, (ref) v_u_50, (copy) v_u_49
		if p_u_47 and p_u_47.Parent then
			v_u_50 = (v_u_50 + p51 * 0.2) % 1
			local v52 = Color3.fromHSV(v_u_50, 1, 1)
			p_u_47.TextColor3 = v52
			if v_u_49 then
				local v53 = v_u_49
				local v54, v55, v56 = v52:ToHSV()
				local v57 = v56 + -0.4
				local v58 = math.clamp(v57, 0, 1)
				v53.Color = Color3.fromHSV(v54, v55, v58)
			end
		else
			local v59 = p_u_46
			local v60 = v_u_34[v59]
			if v60 then
				v60:Disconnect()
				v_u_34[v59] = nil
			end
		end
	end)
end
local function v_u_66()
	-- upvalues: (ref) v_u_31, (copy) v_u_1
	v_u_31 = {}
	for _, v62 in v_u_1.Backpack:GetChildren() do
		local v63 = v62:GetAttribute("PET_UUID")
		if v63 then
			v_u_31[v63] = v62
		end
	end
	for _, v64 in v_u_1.Character:GetChildren() do
		local v65 = v64:GetAttribute("PET_UUID")
		if v65 then
			v_u_31[v65] = v64
		end
	end
end
local function v_u_77()
	-- upvalues: (copy) v_u_1, (copy) v_u_11, (copy) v_u_14
	if not v_u_1.Character then
		return -1
	end
	local v67 = v_u_11:GetData()
	if not v67 then
		return -1
	end
	local v68 = v67.PetsData
	if not v68 then
		return -1
	end
	local v69 = v68.PetInventory.Data
	local v70 = {}
	for _, v71 in v_u_1.Backpack:GetChildren() do
		table.insert(v70, v71)
	end
	for _, v72 in v_u_1.Character:GetChildren() do
		table.insert(v70, v72)
	end
	local v73 = 0
	for _, v74 in v70 do
		local v75 = v74:GetAttribute("PET_UUID")
		if v75 then
			local v76 = v69[v75]
			if v76 and not v76.PetData.IsFavorite then
				v73 = v73 + v_u_14(v74)
			end
		end
	end
	return v73
end
local function v_u_94(p78)
	-- upvalues: (copy) v_u_18, (copy) v_u_10, (copy) v_u_12, (ref) v_u_35, (copy) v_u_25
	local v79 = v_u_18[p78.PetType]
	local v80 = p78.PetData
	local v81 = v80.Level
	local v82 = v_u_10:CalculateWeight(v80.BaseWeight, v81) * 100
	local v83 = math.round(v82) / 100
	local v_u_84 = p78.PetType or "Unknown"
	local v_u_85 = v79 and (v79.Rarity or "Common") or "Common"
	local v86 = v_u_12.PetRarities[v_u_85]
	local v87 = v86 and v86.Color or Color3.fromRGB(255, 255, 255)
	if v_u_35 then
		v_u_35:Disconnect()
		v_u_35 = nil
	end
	v_u_25.Holder.Header.PET_TEXT.RichText = true
	if v_u_85 == "Prismatic" then
		local v_u_88 = v_u_25.Holder.Header.PET_TEXT
		if v_u_35 then
			v_u_35:Disconnect()
			v_u_35 = nil
		end
		local v_u_89 = 0
		v_u_35 = game:GetService("RunService").RenderStepped:Connect(function(p90)
			-- upvalues: (ref) v_u_89, (copy) v_u_88, (copy) v_u_84, (copy) v_u_85
			v_u_89 = (v_u_89 + p90 * 0.2) % 1
			local v91 = Color3.fromHSV(v_u_89, 1, 1)
			local v92 = string.format("%02X%02X%02X", v91.R * 255, v91.G * 255, v91.B * 255)
			v_u_88.RichText = true
			v_u_88.Text = ("%* <font color=\"#%*\">[%*]</font>"):format(v_u_84, v92, v_u_85)
		end)
	else
		local v93 = string.format("%02X%02X%02X", v87.R * 255, v87.G * 255, v87.B * 255)
		v_u_25.Holder.Header.PET_TEXT.Text = ("%* <font color=\"#%*\">[%*]</font>"):format(v_u_84, v93, v_u_85)
	end
	v_u_25.Holder.Display.Display.PET_NAME_CONFIG.Text = v80.Name or "Unnamed"
	v_u_25.Holder.Display.Display.PET_IMAGE.Image = v79 and (v79.Icon or "") or ""
	v_u_25.Holder.Description.Display.PET_DESCRIPTION.Text = v79 and v79.Description or "No description available."
	v_u_25.Holder.Stats.Holder.Weight.PET_WEIGHT.Text = ("Weight: %* KG"):format(v83)
	v_u_25.Holder.Stats.Holder.Age.PET_AGE.Text = ("Age: %*"):format(v81)
end
local function v_u_97(p95, p96)
	if p95:FindFirstChild("Display") then
		if p96 then
			p95.Display.BackgroundColor3 = Color3.fromRGB(30, 100, 14)
			p95.Display.UIStroke.Color = Color3.fromRGB(37, 238, 38)
			p95.Display.SELECTED_VIGNETTE.Visible = true
		else
			p95.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
			p95.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
			p95.Display.SELECTED_VIGNETTE.Visible = false
		end
	else
		return
	end
end
function v_u_28.UpdatePetCard(p98, p_u_99, p_u_100)
	-- upvalues: (copy) v_u_36, (copy) v_u_5, (copy) v_u_33, (ref) v_u_37, (copy) v_u_97, (copy) v_u_21, (copy) v_u_14, (ref) v_u_31, (copy) v_u_66, (ref) v_u_32, (ref) v_u_30, (ref) v_u_29, (copy) v_u_45, (copy) v_u_94, (copy) v_u_26, (copy) v_u_15
	local v_u_101 = p98.CurrentMode == v_u_36.PetSell
	local v_u_102 = v_u_101 and v_u_5.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame or v_u_5.Main.Holder.ScrollingFrame.Content
	p_u_99.Favorite.Visible = p_u_100.PetData.IsFavorite and true or false
	if v_u_33[p_u_99.Name] then
		v_u_33[p_u_99.Name]:Disconnect()
		v_u_33[p_u_99.Name] = nil
	end
	v_u_33[p_u_99.Name] = p_u_99.MouseButton1Click:Connect(function()
		-- upvalues: (ref) v_u_37, (copy) p_u_100, (copy) v_u_101, (copy) v_u_102, (ref) v_u_97, (ref) v_u_21, (copy) p_u_99, (ref) v_u_14, (ref) v_u_31, (ref) v_u_66, (ref) v_u_32, (ref) v_u_30, (ref) v_u_29, (ref) v_u_45, (ref) v_u_94, (ref) v_u_26, (ref) v_u_15
		local v103
		if v_u_37 == p_u_100.UUID then
			v103 = nil
		else
			v103 = p_u_100.UUID
		end
		v_u_37 = v103
		if v_u_101 then
			if not p_u_100.PetData.IsFavorite then
				v_u_97(p_u_99, not p_u_99.Display.SELECTED_VIGNETTE.Visible)
				local v104 = v_u_14
				local v105 = p_u_100.UUID
				if not v_u_31 then
					v_u_66()
				end
				local v106 = v104(v_u_31[v105])
				local v107 = v_u_31[p_u_100.UUID]
				if not (v107 and v107:IsDescendantOf(game)) then
					warn("Tool not found or destroyed:", p_u_100.UUID)
					local v108 = p_u_99
					if v108:FindFirstChild("Display") then
						v108.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
						v108.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
						v108.Display.SELECTED_VIGNETTE.Visible = false
					end
				end
				if p_u_99.Display.SELECTED_VIGNETTE.Visible then
					v_u_32 = v_u_32 + v106
					v_u_30[v107] = true
					v_u_29[p_u_100.UUID] = p_u_99
					v_u_94(p_u_100)
					v_u_45(true)
				else
					v_u_32 = v_u_32 - v106
					v_u_30[v107] = nil
					v_u_29[p_u_100.UUID] = nil
					v_u_45(false)
				end
				local v109 = v_u_32
				v_u_26.Text = v_u_15.DisplaySheckles(v109)
			end
		else
			for _, v110 in v_u_102:GetChildren() do
				if v110:IsA("ImageButton") and v110:FindFirstChild("Display") then
					v_u_97(v110, v110.Name == v_u_37)
				end
			end
			local v111 = v_u_37 ~= nil
			v_u_21.BackgroundTransparency = v111 and 0 or 0.5
			v_u_21.UIStroke.Transparency = v111 and 0 or 0.5
			v_u_21.TextLabel.TextTransparency = v111 and 0 or 0.5
		end
		if not v_u_101 then
			if v_u_37 then
				v_u_94(p_u_100)
				v_u_45(true)
				return
			end
			v_u_45(false)
		end
	end)
end
function v_u_28.GetPetFrame(p112, p113)
	-- upvalues: (copy) v_u_36, (copy) v_u_5
	return (p112.CurrentMode == v_u_36.PetSell and v_u_5.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame or v_u_5.Main.Holder.ScrollingFrame.Content):FindFirstChild(p113)
end
function v_u_28.SetMode(p114, p115)
	-- upvalues: (ref) v_u_37, (ref) v_u_35, (copy) v_u_45, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_36, (copy) v_u_5, (copy) v_u_39
	p114.CurrentMode = p115
	v_u_37 = nil
	if v_u_35 then
		v_u_35:Disconnect()
		v_u_35 = nil
	end
	v_u_45(false)
	v_u_21.BackgroundTransparency = 0.5
	v_u_21.UIStroke.Transparency = 0.5
	v_u_21.TextLabel.TextTransparency = 0.5
	v_u_21.Visible = true
	v_u_22.Visible = false
	v_u_23.Visible = false
	local v116 = (p115 == v_u_36.Pet or p115 == v_u_36.Egg) and true or p115 == v_u_36.PetInventory
	local v117 = p115 == v_u_36.PetSell
	local v118 = v_u_5.Main.Holder
	local v119 = {
		["BAR"] = v_u_5.Main.BAR,
		["EggInfo"] = v118.EggInfo,
		["ScrollingFrame"] = v118.ScrollingFrame,
		["TradeInButton"] = v118.TradeInButton,
		["OddsButton"] = v118.EggInfo.Content.TEMPLATE.Display.OddsButton,
		["TextHolder"] = v118.TextHolder,
		["SellScrollingFrame"] = v118.SellFrame.BackgroundFrame.SellScrollingFrame,
		["SellFrame"] = v118.SellFrame,
		["SellCosts"] = v_u_5.Main.SellCosts,
		["AgePrompt"] = v118.AgePromptText
	}
	if v117 then
		v119.BAR.Visible = false
		v119.ScrollingFrame.Visible = false
		v119.TradeInButton.Visible = false
		v119.TextHolder.Visible = false
		v119.AgePrompt.Visible = false
		v119.EggInfo.Visible = false
		v119.SellFrame.Visible = true
		v119.SellCosts.Visible = true
	else
		v119.BAR.Visible = v116
		v119.ScrollingFrame.Visible = v116
		v119.TradeInButton.Visible = v116
		v119.TextHolder.Visible = v116
		v119.AgePrompt.Visible = v116
		v119.EggInfo.Visible = not v116
		v119.OddsButton.Visible = not v116
		v119.SellCosts.Visible = false
		v119.SellFrame.Visible = false
	end
	if v_u_39[p115] then
		local v120 = v_u_39[p115]
		v_u_5.Main.Header.Title.Text = v120.Title
		v_u_5.Main.Header.BackgroundColor3 = v120.BaseColor
		v_u_5.Main.Header.Title.UIStroke.Color = v120.Stroke
	else
		v_u_5.Main.Header.Title.Text = "Egg Rarity Info"
		v_u_5.Main.Header.BackgroundColor3 = Color3.fromRGB(35, 150, 238)
		v_u_5.Main.Header.Title.UIStroke.Color = Color3.fromRGB(17, 74, 117)
	end
	p114:RefreshUI(v117)
end
function v_u_28.ClearSelection(_)
	-- upvalues: (ref) v_u_29, (copy) v_u_5, (ref) v_u_32, (ref) v_u_30, (ref) v_u_35, (copy) v_u_45
	if next(v_u_29) ~= nil then
		for _, v121 in v_u_29 do
			if v121:FindFirstChild("Display") then
				v121.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
				v121.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
				v121.Display.SELECTED_VIGNETTE.Visible = false
			end
		end
		v_u_5.Main.SellCosts.Main.SelectedPetWorth.Text = 0 .. "\194\162"
		v_u_32 = 0
		v_u_29 = {}
		v_u_30 = {}
		if v_u_35 then
			v_u_35:Disconnect()
			v_u_35 = nil
		end
		v_u_45(false)
	end
end
function v_u_28.RefreshUI(p122, p123)
	-- upvalues: (ref) v_u_37, (copy) v_u_36, (copy) v_u_45, (copy) v_u_21, (copy) v_u_22, (copy) v_u_23, (copy) v_u_66, (copy) v_u_11, (copy) v_u_24, (copy) v_u_5, (copy) v_u_38, (copy) v_u_77, (copy) v_u_27, (copy) v_u_15, (copy) v_u_34, (copy) v_u_10, (copy) v_u_1, (ref) v_u_32, (copy) v_u_33, (ref) v_u_31, (copy) v_u_18, (copy) v_u_12, (copy) v_u_61, (copy) v_u_28
	v_u_37 = nil
	if p123 == nil then
		p123 = p122.CurrentMode == v_u_36.Sell
	end
	v_u_45(false)
	v_u_21.BackgroundTransparency = 0.5
	v_u_21.UIStroke.Transparency = 0.5
	v_u_21.TextLabel.TextTransparency = 0.5
	v_u_21.Visible = true
	v_u_22.Visible = false
	v_u_23.Visible = false
	if p123 then
		v_u_66()
	end
	local v124 = v_u_11:GetData()
	local _ = v124.PetsData.MutableStats
	local v125 = p122.CurrentMode
	local v126 = v125 == v_u_36.Pet
	local v127 = v125 == v_u_36.Egg
	local v128 = v125 == v_u_36.PetInventory
	local v129 = 0
	if p123 then
		local v130 = v_u_77()
		v_u_27.Text = v_u_15.DisplaySheckles(v130)
	else
		local v131
		if v126 then
			v131 = v124.PetsData.PurchasedEquipSlots or 0
		elseif v127 then
			v131 = v124.PetsData.PurchasedEggSlots or 0
		else
			v131 = v128 and (v124.PetsData.PurchasedPetInventorySlots or 0) or 0
		end
		v129 = ({
			20,
			30,
			45,
			60,
			75
		})[v131 + 1] or 999
		if v131 >= 5 then
			v_u_24.Text = "You have reached the maximum number of slots!"
			v_u_5.Main.Holder.ScrollingFrame.Visible = false
			v_u_5.Main.Holder.TradeInButton.Visible = false
		else
			v_u_24.Text = ("Required age for next slot unlock: <font color=\"#ffbe19\">%*</font>"):format(v129)
		end
		v_u_5.Main.BAR.ACTUAL_BAR.Size = v_u_38[math.clamp(v131, 0, 5)] or v_u_38[0]
		local v132 = v_u_5.Main.BAR.IncrementalListing
		for v137, v134 in {
			"One",
			"Two",
			"Three",
			"Four",
			"Five"
		} do
			local v135 = v132:FindFirstChild(v134)
			if v135 then
				local v136 = v135:FindFirstChildWhichIsA("UIGradient")
				if v136 then
					v136.Enabled = v137 <= v131
				end
				if v128 then
					local v137 = v137 * 5 or v137
				end
				v135.Text = ("+%* Extra"):format(v137)
			end
		end
		local v138 = v132:FindFirstChild("Title")
		if v138 and v138:FindFirstChild("UIGradient") then
			v138.UIGradient.Enabled = v131 >= 5
		end
		if v131 >= 5 then
			return
		end
	end
	local v139 = p123 and v_u_5.Main.Holder.SellFrame.BackgroundFrame.SellScrollingFrame or v_u_5.Main.Holder.ScrollingFrame.Content
	local v140 = v139:FindFirstChild("TEMPLATE")
	for _, v141 in v139:GetChildren() do
		if v141:IsA("ImageButton") and v141.Name ~= "TEMPLATE" then
			local v142 = v141.Name
			local v143 = v_u_34[v142]
			if v143 then
				v143:Disconnect()
				v_u_34[v142] = nil
			end
			v141:Destroy()
		end
	end
	v140.Visible = false
	local v144 = v_u_10:GetPetsSortedByAge(v_u_1, 0, true, false)
	if not v144 or #v144 == 0 then
		return
	end
	v_u_32 = 0
	for _, v145 in v_u_33 do
		if v145 then
			v145:Disconnect()
		end
	end
	table.clear(v_u_33)
	for v146, _ in v_u_34 do
		local v147 = v_u_34[v146]
		if v147 then
			v147:Disconnect()
			v_u_34[v146] = nil
		end
	end
	table.clear(v_u_34)
	for _, v148 in v144 do
		if v148.PetData.Level >= v129 then
			if p123 then
				local v149 = v_u_31[v148.UUID]
				if v149 and v149.Parent then
					goto l78
				end
			else
				::l78::
				local v150 = v140:Clone()
				v150.Visible = true
				v150.Name = v148.UUID
				v150.Visible = not v148.PetData.IsFavorite
				local v151 = v_u_18[v148.PetType]
				local v152 = v151 and (v151.Rarity or "Common") or "Common"
				local v153 = v_u_12.PetRarities[v152]
				local v154 = v153 and v153.Color or Color3.fromRGB(255, 255, 255)
				local v155, v156, v157 = v154:ToHSV()
				local v158 = v157 + -0.4
				local v159 = math.clamp(v158, 0, 1)
				local v160 = Color3.fromHSV(v155, v156, v159)
				v150.Display.PET_NAME.Text = v148.PetType
				local v161 = v150.Display.PET_AGE
				local v162 = v148.PetData.Level
				local v163 = v_u_10:CalculateWeight(v148.PetData.BaseWeight, v148.PetData.Level) * 100
				v161.Text = ("Age: %* \226\128\162 %* KG"):format(v162, math.round(v163) / 100)
				v150.Display.PET_RARITY.Text = v152
				local v164 = v150.Name
				local v165 = v_u_34[v164]
				if v165 then
					v165:Disconnect()
					v_u_34[v164] = nil
				end
				if v152 == "Prismatic" then
					v_u_61(v150.Name, v150.Display.PET_RARITY)
				else
					v150.Display.PET_RARITY.TextColor3 = v154
					local v166 = v150.Display.PET_RARITY:FindFirstChildWhichIsA("UIStroke")
					if v166 then
						v166.Color = v160
					end
				end
				if v151 then
					v150.Display.DetailHolder.PET_IMAGE.Visible = true
					v150.Display.DetailHolder.PET_IMAGE.Image = v151.Icon
				else
					v150.Display.DetailHolder.PET_IMAGE.Visible = false
				end
				if v150:FindFirstChild("Display") then
					v150.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
					v150.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
					v150.Display.SELECTED_VIGNETTE.Visible = false
				end
				v_u_28:UpdatePetCard(v150, v148)
				v150.Parent = v139
			end
		end
	end
end
local function v_u_171()
	-- upvalues: (ref) v_u_30, (ref) v_u_31, (ref) v_u_29, (copy) v_u_28, (ref) v_u_37, (ref) v_u_32, (copy) v_u_26, (copy) v_u_15, (copy) v_u_77, (copy) v_u_27, (copy) v_u_36, (copy) v_u_5
	for v167, _ in v_u_30 do
		local v168 = v167:GetAttribute("PET_UUID")
		v_u_31[v168] = nil
		if v_u_29[v168] then
			v_u_29[v168]:Destroy()
			v_u_29[v168] = nil
		end
	end
	v_u_28:ClearSelection()
	table.clear(v_u_30)
	table.clear(v_u_29)
	v_u_37 = nil
	local v169 = v_u_32
	v_u_26.Text = v_u_15.DisplaySheckles(v169)
	local v170 = v_u_77()
	v_u_27.Text = v_u_15.DisplaySheckles(v170)
	v_u_28:SetMode(v_u_36.PetSell)
	v_u_5.Main.SellCosts.Main.SelectedPetWorth.Text = 0 .. "\194\162"
	v_u_32 = 0
	v_u_28:RefreshUI(true)
end
function v_u_28.Start(_)
	-- upvalues: (copy) v_u_13, (copy) v_u_4, (ref) v_u_31, (ref) v_u_30, (copy) v_u_28, (copy) v_u_36, (copy) v_u_21, (ref) v_u_37, (copy) v_u_24, (copy) v_u_22, (copy) v_u_23, (copy) v_u_6, (copy) v_u_5, (copy) v_u_25, (ref) v_u_35, (ref) v_u_32, (copy) v_u_17, (copy) v_u_15, (copy) v_u_77, (copy) v_u_7, (copy) v_u_171, (ref) v_u_29, (copy) v_u_8, (copy) v_u_26, (copy) v_u_27
	v_u_13:UsePopupAnims(v_u_4)
	if v_u_31 ~= nil then
		table.clear(v_u_31)
		v_u_31 = {}
	end
	if v_u_30 ~= nil then
		table.clear(v_u_30)
		v_u_30 = {}
	end
	local v_u_172 = {}
	if v_u_28.CurrentMode == nil then
		v_u_28.CurrentMode = v_u_36.EggInfo
	end
	v_u_28:SetMode(v_u_28.CurrentMode)
	if v_u_28.CurrentMode == v_u_36.PetSell then
		v_u_28:ClearSelection()
	end
	v_u_28:RefreshUI(v_u_28.CurrentMode == v_u_36.PetSell)
	v_u_21.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_37, (ref) v_u_24, (ref) v_u_21, (ref) v_u_22, (ref) v_u_23
		local v173
		if v_u_172.TradeInStart and (nil or 0.5) > tick() - v_u_172.TradeInStart then
			v173 = true
		else
			v_u_172.TradeInStart = tick()
			v173 = false
		end
		if not v173 and v_u_37 then
			v_u_24.Text = "Are you sure you want to trade in this pet?"
			v_u_21.Visible = false
			v_u_22.Visible = true
			v_u_23.Visible = true
		end
	end)
	v_u_22.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_37, (ref) v_u_6, (ref) v_u_28, (ref) v_u_21, (ref) v_u_22, (ref) v_u_23
		local v174
		if v_u_172.TradeConfirm and (nil or 0.5) > tick() - v_u_172.TradeConfirm then
			v174 = true
		else
			v_u_172.TradeConfirm = tick()
			v174 = false
		end
		if not v174 and v_u_37 then
			v_u_6.UnlockSlotFromPet:FireServer(v_u_37, v_u_28.CurrentMode)
			task.wait(1)
			v_u_28:RefreshUI(false)
			v_u_37 = nil
			v_u_21.BackgroundTransparency = 0.5
			v_u_21.UIStroke.Transparency = 0.5
			v_u_21.TextLabel.TextTransparency = 0.5
			v_u_21.Visible = true
			v_u_22.Visible = false
			v_u_23.Visible = false
		end
	end)
	v_u_23.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_21, (ref) v_u_22, (ref) v_u_23, (ref) v_u_28
		local v175
		if v_u_172.TradeCancel and (nil or 0.5) > tick() - v_u_172.TradeCancel then
			v175 = true
		else
			v_u_172.TradeCancel = tick()
			v175 = false
		end
		if not v175 then
			v_u_21.Visible = true
			v_u_22.Visible = false
			v_u_23.Visible = false
			v_u_28:RefreshUI(false)
		end
	end)
	v_u_5.Main.Header.Exit.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28, (ref) v_u_13, (ref) v_u_4
		local v176
		if v_u_172.ExitHeader and (nil or 0.5) > tick() - v_u_172.ExitHeader then
			v176 = true
		else
			v_u_172.ExitHeader = tick()
			v176 = false
		end
		if not v176 then
			v_u_28:ClearSelection()
			v_u_13:Close(v_u_4)
		end
	end)
	v_u_25.Holder.Header.EXIT_BUTTON.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_37, (ref) v_u_21, (ref) v_u_35, (ref) v_u_28, (ref) v_u_36
		local v177
		if v_u_172.ExitDetails and (nil or 0.5) > tick() - v_u_172.ExitDetails then
			v177 = true
		else
			v_u_172.ExitDetails = tick()
			v177 = false
		end
		if not v177 then
			v_u_37 = nil
			v_u_21.BackgroundTransparency = 0.5
			v_u_21.UIStroke.Transparency = 0.5
			v_u_21.TextLabel.TextTransparency = 0.5
			if v_u_35 then
				v_u_35:Disconnect()
				v_u_35 = nil
			end
			v_u_28:SetMode(v_u_36.Pet)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.PetEquipSlots.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28, (ref) v_u_36
		local v178
		if v_u_172.PetButton and (nil or 0.5) > tick() - v_u_172.PetButton then
			v178 = true
		else
			v_u_172.PetButton = tick()
			v178 = false
		end
		if not v178 then
			v_u_28:SetMode(v_u_36.Pet)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.EggEquipSlots.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28, (ref) v_u_36
		local v179
		if v_u_172.EggButton and (nil or 0.5) > tick() - v_u_172.EggButton then
			v179 = true
		else
			v_u_172.EggButton = tick()
			v179 = false
		end
		if not v179 then
			v_u_28:SetMode(v_u_36.Egg)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.PetInventorySlots.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28, (ref) v_u_36
		local v180
		if v_u_172.InventoryButton and (nil or 0.5) > tick() - v_u_172.InventoryButton then
			v180 = true
		else
			v_u_172.InventoryButton = tick()
			v180 = false
		end
		if not v180 then
			v_u_28:SetMode(v_u_36.PetInventory)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.EggInfo.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28, (ref) v_u_36
		local v181
		if v_u_172.EggInfoButton and (nil or 0.5) > tick() - v_u_172.EggInfoButton then
			v181 = true
		else
			v_u_172.EggInfoButton = tick()
			v181 = false
		end
		if not v181 then
			v_u_28:SetMode(v_u_36.EggInfo)
		end
	end)
	v_u_5.Main.SideBar.ButtonList.PetSell.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28, (ref) v_u_36, (ref) v_u_5, (ref) v_u_32
		local v182
		if v_u_172.PetSell and (nil or 0.5) > tick() - v_u_172.PetSell then
			v182 = true
		else
			v_u_172.PetSell = tick()
			v182 = false
		end
		if not v182 then
			v_u_28:SetMode(v_u_36.PetSell)
			v_u_5.Main.SellCosts.Main.SelectedPetWorth.Text = 0 .. "\194\162"
			v_u_32 = 0
			v_u_28:RefreshUI(true)
		end
	end)
	v_u_5.Main.SellCosts.Main.SellAll.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_13, (ref) v_u_4, (ref) v_u_17, (ref) v_u_15, (ref) v_u_77, (ref) v_u_7, (ref) v_u_171
		local v183
		if v_u_172.SellAll and (nil or 0.5) > tick() - v_u_172.SellAll then
			v183 = true
		else
			v_u_172.SellAll = tick()
			v183 = false
		end
		if not v183 then
			v_u_13:Close(v_u_4)
			v_u_17:Open({
				["Title"] = "Sell All Pets Confirmation",
				["Header"] = "Are you sure you want to sell all Unfavorited pets?",
				["Middle"] = ("You will receive: %*"):format((v_u_15.DisplaySheckles((v_u_77())))),
				["Footer"] = "This action is irreversible."
			}, {
				["ConfirmEvent"] = v_u_7,
				["ConfirmCallback"] = function()
					-- upvalues: (ref) v_u_171, (ref) v_u_13, (ref) v_u_4
					v_u_171()
					task.wait(0.25)
					v_u_13:Open(v_u_4)
				end,
				["RejectCallback"] = function()
					-- upvalues: (ref) v_u_171, (ref) v_u_13, (ref) v_u_4
					v_u_171()
					task.wait(0.25)
					v_u_13:Open(v_u_4)
				end
			})
		end
	end)
	v_u_5.Main.SellCosts.Main.Clear.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_28
		local v184
		if v_u_172.Clear and (nil or 0.5) > tick() - v_u_172.Clear then
			v184 = true
		else
			v_u_172.Clear = tick()
			v184 = false
		end
		if not v184 then
			v_u_28:ClearSelection()
		end
	end)
	v_u_5.Main.SellCosts.Main.Sell.SENSOR.MouseButton1Click:Connect(function()
		-- upvalues: (copy) v_u_172, (ref) v_u_30, (ref) v_u_31, (ref) v_u_29, (ref) v_u_8, (ref) v_u_28, (ref) v_u_32, (ref) v_u_37, (ref) v_u_26, (ref) v_u_15, (ref) v_u_77, (ref) v_u_27
		local v185
		if v_u_172.Sell and (nil or 0.5) > tick() - v_u_172.Sell then
			v185 = true
		else
			v_u_172.Sell = tick()
			v185 = false
		end
		if not v185 then
			for v186, _ in v_u_30 do
				local v187 = v186:GetAttribute("PET_UUID")
				v_u_31[v187] = nil
				if v_u_29[v187] then
					v_u_29[v187]:Destroy()
					v_u_29[v187] = nil
				end
				v_u_8:FireServer(v186)
				if v186.Parent then
					v186.AncestryChanged:Wait()
				end
			end
			v_u_28:ClearSelection()
			v_u_32 = 0
			table.clear(v_u_30)
			table.clear(v_u_29)
			v_u_37 = nil
			v_u_28:RefreshUI(true)
			local v188 = v_u_32
			v_u_26.Text = v_u_15.DisplaySheckles(v188)
			local v189 = v_u_77()
			v_u_27.Text = v_u_15.DisplaySheckles(v189)
		end
	end)
	local function v190()
		-- upvalues: (ref) v_u_4, (ref) v_u_28
		if v_u_4.Enabled then
			v_u_28:SetMode(v_u_28.CurrentMode)
		end
	end
	v_u_4:GetPropertyChangedSignal("Enabled"):Connect(v190)
end
v9.Event:Connect(function(p191)
	-- upvalues: (copy) v_u_16, (copy) v_u_28, (copy) v_u_36, (copy) v_u_14, (ref) v_u_31, (copy) v_u_66, (ref) v_u_30, (ref) v_u_29, (ref) v_u_32, (copy) v_u_26, (copy) v_u_15, (copy) v_u_77, (copy) v_u_27
	if p191 then
		local v192 = p191:GetAttribute("PET_UUID")
		if v192 then
			task.wait(0.25)
			local v193 = v_u_16:GetPlayerPetData(v192)
			if v193 then
				local v194 = v_u_28:GetPetFrame(v192)
				if v194 then
					if v194 then
						v_u_28:UpdatePetCard(v194, v193)
						if v194:FindFirstChild("Display") then
							v194.Display.BackgroundColor3 = Color3.fromRGB(94, 44, 18)
							v194.Display.UIStroke.Color = Color3.fromRGB(103, 31, 0)
							v194.Display.SELECTED_VIGNETTE.Visible = false
						end
					else
						v_u_28:RefreshUI(v_u_28.CurrentMode == v_u_36.PetSell)
					end
					local v195 = v_u_14
					local v196 = v193.UUID
					if not v_u_31 then
						v_u_66()
					end
					local v197 = v195(v_u_31[v196])
					if v193.PetData.IsFavorite and (v_u_30[p191] and v_u_29[v193.UUID]) then
						v_u_32 = v_u_32 - v197
						local v198 = v_u_32
						local v199 = v_u_32
						v_u_32 = math.clamp(v198, 0, v199)
						v_u_30[p191] = nil
						v_u_29[v193.UUID] = nil
					end
					local v200 = v_u_32
					v_u_26.Text = v_u_15.DisplaySheckles(v200)
					local v201 = v_u_77()
					v_u_27.Text = v_u_15.DisplaySheckles(v201)
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
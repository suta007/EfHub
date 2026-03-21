local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = game:GetService("UserInputService")
game:GetService("GuiService")
require(script.Parent.GGAnimateColor)
local v_u_3 = require(script.Parent.ImageCycle)
local v_u_4 = require(script.Parent.DataModules.GGStaticData)
local v_u_5 = require(script.Parent.DataModules.GGData)
local v_u_6 = require(v1.Data.CropMasteryData)
local v_u_7 = require(v1.Data.SeedData)
local v_u_8 = require(v1.Modules.DataService)
require(v1.Data.SeasonPass.SeasonPassData)
local v9 = script.Parent.Templates
local v_u_10 = v9.DetailsTemplates
local v_u_11 = v9.RecipeTemplates.BroadIngrTemplate
local v_u_12 = v9.RecipeTemplates.SpecificIngrTemplate
local v_u_13 = v9.RecipeTemplates.IngredientTemplate
local v_u_14 = {}
local function v_u_23(p15)
	local v16 = string.split(p15, ",")
	if #v16 < 3 then
		warn("Invalid RGB string format. Expected \'R,G,B\'")
		return false
	end
	local v17 = v16[1]
	local v18 = tonumber(v17) or 0
	local v19 = v16[2]
	local v20 = tonumber(v19) or 0
	local v21 = v16[3]
	local v22 = tonumber(v21) or 0
	return 0.299 * v18 + 0.587 * v20 + 0.114 * v22 > 186
end
local function v_u_32(p24, p25)
	-- upvalues: (copy) v_u_4
	local v26 = p25:FindFirstChild("MainStats"):FindFirstChild("Main")
	v26:FindFirstChild("ImageFrame"):FindFirstChild("ITEM_IMAGE").Image = p24.ImageId
	for _, v27 in v26:FindFirstChild("Stats"):GetChildren() do
		if v27:IsA("Frame") then
			local v28 = v27:FindFirstChild("STAT_VALUE")
			if v27.Name == "Rarity" then
				local v29 = p24.Rarity
				v28:SetAttribute("Rarity", v29)
				if v_u_4.AnimatedColors[v29] then
					v_u_4.AnimatedColors[v29](v28)
				else
					v28.TextColor3 = v_u_4.RarityColorMap[v29] or Color3.fromRGB(255, 255, 255)
				end
			end
			local v30 = v27:FindFirstChild("STAT_VALUE_SHADOW")
			local v31 = ("%*"):format(p24[v27.Name])
			v28.Text = v31
			v30.Text = v31
		end
	end
end
local function v_u_52(p33, p34)
	-- upvalues: (copy) v_u_6, (copy) v_u_2
	local v35 = p33.MasteryProgress
	local v36 = p33.MasteryLevel
	local v37 = v_u_6.MaxMasteryLevel
	local v38 = v_u_6:GetMultipliers(p33.Name, v36)
	local v39 = p34:FindFirstChild("CropMastery")
	v39.Visible = true
	for _, v40 in v39:FindFirstChild("Content"):GetChildren() do
		if v40:IsA("Frame") then
			local v41 = v40:FindFirstChild("STAT_VALUE")
			local v42 = v40:FindFirstChild("STAT_VALUE_SHADOW")
			v41.Text = ("x%*"):format(v38[v40.Name])
			v42.Text = ("x%*"):format(v38[v40.Name])
		end
	end
	v39:FindFirstChild("Level"):FindFirstChild("LEVEL_VALUE").Text = ("%*"):format(v36)
	local v43 = v39:FindFirstChild("MasteryProgBar")
	local v44 = v43:FindFirstChild("Bar_Actual")
	local v45 = v43:FindFirstChild("PROGRESS")
	v44.Size = UDim2.fromScale(v35 % 1, 1)
	local v46 = v35 % 1 * 100
	v45.Text = ("%*%%"):format((math.round(v46)))
	if v36 == v37 then
		v44.Size = UDim2.fromScale(1, 1)
		v45.Text = "FULL MASTERY"
	end
	local v_u_47 = v39:FindFirstChild("Hover")
	local v48 = v39:FindFirstChild("Info"):FindFirstChild("Button")
	local v_u_49 = v48.Activated:Connect(function()
		-- upvalues: (ref) v_u_2, (copy) v_u_47
		if v_u_2.TouchEnabled then
			v_u_47.Visible = not v_u_47.Visible
		end
	end)
	local v_u_50 = v48.MouseEnter:Connect(function()
		-- upvalues: (copy) v_u_47
		v_u_47.Visible = true
	end)
	local v_u_51 = v48.MouseLeave:Connect(function()
		-- upvalues: (copy) v_u_47
		v_u_47.Visible = false
	end)
	v48.Destroying:Once(function()
		-- upvalues: (ref) v_u_50, (ref) v_u_51, (ref) v_u_49
		if v_u_50 then
			v_u_50:Disconnect()
		end
		v_u_50 = nil
		if v_u_51 then
			v_u_51:Disconnect()
		end
		v_u_51 = nil
		if v_u_49 then
			v_u_49:Disconnect()
		end
		v_u_49 = nil
	end)
end
local function v_u_64(p53, p54)
	-- upvalues: (copy) v_u_52
	local v55 = p54:FindFirstChild("MainStats"):FindFirstChild("Main"):FindFirstChild("Traits")
	local v56 = v55:FindFirstChild("Stats"):FindFirstChild("STAT_VALUE")
	local v57 = v55:FindFirstChild("Stats"):FindFirstChild("STAT_VALUE_SHADOW")
	local v58 = ("%*"):format(p53.Traits)
	local v59 = v58:gsub("<[^>]->", "")
	v56.Text = v58
	v57.Text = v59
	for _, v60 in p54:FindFirstChild("ExtraStats"):FindFirstChild("Content"):GetChildren() do
		if v60:IsA("Frame") then
			local v61 = v60:FindFirstChild("STAT_VALUE")
			local v62 = v60:FindFirstChild("STAT_VALUE_SHADOW")
			local v63 = p53[("%*Count"):format(v60.Name)]
			v61.Text = v63
			v62.Text = v63
		end
	end
	v_u_52(p53, p54)
end
local function v_u_95(p65, p66, p67, p68)
	-- upvalues: (copy) v_u_12, (copy) v_u_8, (copy) v_u_7, (copy) v_u_3, (copy) v_u_5, (copy) v_u_23, (copy) v_u_11, (copy) v_u_13
	local v69 = p66:FindFirstChild("KnownRecipes"):FindFirstChild("Main"):FindFirstChild("IngredientsList")
	local v70 = p65.RecipeData
	for _, v71 in v70.SpecificIngr do
		if not v69:FindFirstChild(v71.Name) then
			local v72 = v_u_12:Clone()
			v72.Parent = v69
			v72.Name = v71.Name
			if v71.Name == "Any Plant" then
				local v73 = v_u_8:GetData().GardenGuide.PlantData
				if not v73 then
					warn("ImageCycle | No Player PlantData")
					return
				end
				local v74 = {}
				for v75, _ in v73 do
					if v_u_7[v75] then
						table.insert(v74, {
							["DisplayName"] = v75,
							["Type"] = "Fruit",
							["Value"] = v75,
							["Quantity"] = 1
						})
					end
				end
				local v76 = v72.INGREDIENT_IMAGE
				v_u_3.CycleRewardImages(v76, nil, nil, p68, v74)
			else
				v72.INGREDIENT_IMAGE.Image = v71.ImageId
			end
			local v77 = v72.ItemName
			local v78 = v77.TITLE
			local v79 = v77.TITLE_SHADOW
			local v80 = v71.Name:gsub("(%l)(%u)", "%1 %2")
			v78.Text = v80
			v79.Text = v80
			if p67 == "Mutation" then
				v78.TextTransparency = 0
				local v81 = v_u_5.Mutation.Data[v71.Name].Color
				v78.TextColor3 = v81
				if not v_u_23((string.format("(%d, %d, %d)", v81.R * 255, v81.G * 255, v81.B * 255))) then
					v78:FindFirstChild("UIStroke").Color = v81:Lerp(Color3.fromRGB(255, 255, 255), 0.85)
				end
			end
		end
	end
	for v82, v83 in v70.BroadIngr do
		local v84 = v69:FindFirstChild(v82)
		if not v84 then
			v84 = v_u_11:Clone()
			v84.Parent = v69
			v84.Name = v82
		end
		local v85 = v84.ScrollingFrame.Content
		local v86 = v84.ItemName
		local v87 = v86.TITLE
		local v88 = v86.TITLE_SHADOW
		v87.Text = v82
		v88.Text = v82
		for _, v89 in v83 do
			if not v85:FindFirstChild(v89) then
				local v90 = v_u_13:Clone()
				v90.Parent = v85
				v90.Name = v89
				local v91 = v90.ITEM_NAME
				local v92 = v90.ITEM_NAME_SHADOW
				local v93 = v89:gsub("(%l)(%u)", "%1 %2")
				v91.Text = v93
				v92.Text = v93
				if p67 == "Mutation" then
					v91.TextTransparency = 0
					local v94 = v_u_5.Mutation.Data[v89].Color
					v91.TextColor3 = v94
					if not v_u_23((string.format("(%d, %d, %d)", v94.R * 255, v94.G * 255, v94.B * 255))) then
						v91:FindFirstChild("UIStroke").Color = v94:Lerp(Color3.fromRGB(255, 255, 255), 0.85)
					end
				end
			end
		end
	end
end
local function v_u_115(p96, p97, p98)
	local v99 = p97:FindFirstChild("MainStats"):FindFirstChild("Main"):FindFirstChild("Stats")
	local v100 = p97:FindFirstChild("KnownRecipes")
	local v101 = v100:FindFirstChild("Main")
	if p96.ComboType == "No Combo" then
		v100.Visible = false
		p98.CanvasSize = UDim2.fromScale(0, 1)
	else
		local v102 = v101:FindFirstChild("Item")
		local v103 = v102:FindFirstChild("TITLE")
		local v104 = v102:FindFirstChild("TITLE_SHADOW")
		local v105 = ("%*"):format(p96.ComboType)
		v103.Text = v105
		v104.Text = v105
	end
	local v106 = p96.ValueMultis
	if v106 then
		for _, v107 in v99:GetChildren() do
			if v107:IsA("Frame") and string.find(v107.Name, "ValueMulti") then
				local v108 = v106[v107.Name:gsub("ValueMulti", "")] or "-"
				local v109 = v107:FindFirstChild("STAT_VALUE")
				local v110 = v107:FindFirstChild("STAT_VALUE_SHADOW")
				v109.Text = v108
				v110.Text = v108
			end
		end
	end
	for _, v111 in p97:FindFirstChild("ExtraStats"):FindFirstChild("Content"):GetChildren() do
		if v111:IsA("Frame") then
			local v112 = v111:FindFirstChild("STAT_VALUE")
			local v113 = v111:FindFirstChild("STAT_VALUE_SHADOW")
			local v114 = p96[("%*Count"):format(v111.Name)]
			v112.Text = v114
			v113.Text = v114
		end
	end
end
local function v_u_122(p116, p117)
	local v118 = p117:FindFirstChild("Desc")
	local v119 = v118:FindFirstChild("Main")
	if p116.Description == "" then
		v118.Visible = false
	end
	local v120 = v119:FindFirstChild("ABILITY")
	local v121 = v119:FindFirstChild("ABILITY_SHADOW")
	v120.Text = p116.Description
	v121.Text = p116.Description
end
local function v_u_136(p123, p124)
	local v125 = 1
	for _, v126 in p124:FindFirstChild("BestRecords"):FindFirstChild("Main"):GetChildren() do
		if v126:IsA("Frame") then
			local v127 = v126:FindFirstChild("HIGHLIGHT_NAME")
			local v128 = v126:FindFirstChild("HIGHLIGHT_NAME_SHADOW")
			local v129 = p123.Records[v125].RecordName
			v127.Text = v129
			v128.Text = v129
			local v130 = v126:FindFirstChild("HIGHLIGHT_VALUE")
			local v131 = v126:FindFirstChild("HIGHLIGHT_VALUE_SHADOW")
			local _ = p123.Records[v125].RecordData
			local v132 = ("%*"):format(p123.Records[v125].RecordData)
			v130.Text = v132
			v131.Text = v132
			local v133 = v126:FindFirstChild("DATE")
			local v134 = v126:FindFirstChild("DATE_SHADOW")
			local v135 = ("Achieved on %*"):format(p123.Records[v125].RecordDate)
			v133.Text = v135
			v134.Text = v135
			v125 = v125 + 1
		end
	end
end
function v_u_14.CreateDetailsView(p137, p138, p139)
	-- upvalues: (copy) v_u_10, (copy) v_u_32, (copy) v_u_64, (copy) v_u_115, (copy) v_u_95, (copy) v_u_122, (copy) v_u_136
	local v140 = v_u_10:FindFirstChild((("%*DetailsTemplate"):format(p139)))
	if not v140 then
		warn((("No template w/ name %*"):format((("%*DetailsTemplate"):format(p139)))))
		return nil
	end
	local v141 = p137:FindFirstChild((("%*Details"):format(p138.Name)))
	if not v141 then
		v141 = v140:Clone()
		v141.Name = ("%*Details"):format(p138.Name)
	end
	local v142 = v141:FindFirstChild("ScrollingFrame")
	local v143 = v142:FindFirstChild("Content")
	task.spawn(v_u_32, p138, v143)
	if p139 == "Plant" then
		task.spawn(v_u_64, p138, v143)
	end
	if p139 == "Mutation" then
		task.spawn(v_u_115, p138, v143, v142)
		task.spawn(v_u_95, p138, v143, p139, v141)
	end
	if p139 == "Food" then
		task.spawn(v_u_95, p138, v143, p139, v141)
	end
	if p139 == "Pet" or (p139 == "Cosmetic" or p139 == "Plant") then
		task.spawn(v_u_122, p138, v143)
	end
	if p138.Records then
		task.spawn(v_u_136, p138, v143)
	end
	v141.Parent = p137
	return v141
end
function v_u_14.UpdateDetailsView(p144, p145, p146)
	-- upvalues: (copy) v_u_14
	local v147 = p144.Parent
	v_u_14.CreateDetailsView(v147, p145, p146)
end
return v_u_14
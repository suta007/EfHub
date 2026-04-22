game:GetService("UserInputService")
game:GetService("CollectionService")
local v1 = game:GetService("ReplicatedStorage")
game:GetService("TweenService")
local v_u_2 = game:GetService("RunService")
local v_u_3 = game:GetService("GuiService")
local v4 = game:GetService("ProximityPromptService")
local v5 = require(v1.Modules.MutationHandler)
local v_u_6 = require(v1.Modules.CalculatePlantValue)
local v_u_7 = require(v1.Comma_Module)
local v_u_8 = require(v1.Data.VariantColors)
local v_u_9 = require(v1.Modules.NumberUtil)
local v_u_10 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("FruitMutation_UI"):WaitForChild("Frame")
local v_u_11 = v_u_10:WaitForChild("FruitName")
local v_u_12 = v_u_10:WaitForChild("FruitMutation")
local v_u_13 = v_u_10:WaitForChild("FruitValue")
v1:WaitForChild("GameEvents")
require(v1.Modules.GetFarm)
local v_u_14 = require(v1.Data.SeedData)
require(v1.Modules.PlantTraitsData)
local v_u_15 = require(v1.Item_Module)
local _ = game.Players.LocalPlayer
local v_u_16 = workspace.CurrentCamera
local v_u_17 = Instance.new("Highlight")
v_u_17.Name = "Highlight"
v_u_17.DepthMode = Enum.HighlightDepthMode.Occluded
v_u_17.FillColor = Color3.fromRGB(255, 51, 51)
v_u_17.FillTransparency = 1
v_u_17.Parent = script
local v_u_18 = nil
local v_u_19 = v5:GetMutations()
local v_u_20 = {}
local v_u_21 = {}
local function v_u_29(p_u_22, p_u_23, p_u_24)
	-- upvalues: (copy) v_u_21, (copy) v_u_2
	if v_u_21[p_u_22] then
		v_u_21[p_u_22]:Disconnect()
	end
	local v25 = Color3.fromHSV(0, 1, 1):ToHex()
	p_u_22.Text = p_u_23:gsub("\240\159\140\136", string.format("<font color=\"#%s\">%s</font>", v25, p_u_24))
	local v_u_26 = 0
	v_u_21[p_u_22] = v_u_2.RenderStepped:Connect(function(p27)
		-- upvalues: (ref) v_u_26, (copy) p_u_24, (copy) p_u_22, (copy) p_u_23
		v_u_26 = (v_u_26 + p27 * 0.2) % 1
		local v28 = Color3.fromHSV(v_u_26, 1, 1)
		p_u_22.Text = p_u_23:gsub("\240\159\140\136", (string.format("<font color=\"#%s\">%s</font>", v28:ToHex(), p_u_24)))
	end)
end
local function v_u_61(p30)
	-- upvalues: (ref) v_u_18, (copy) v_u_17, (copy) v_u_10, (copy) v_u_21, (copy) v_u_14, (copy) v_u_15, (copy) v_u_29, (copy) v_u_11, (copy) v_u_2, (copy) v_u_6, (copy) v_u_7, (copy) v_u_13, (copy) v_u_9, (copy) v_u_8, (copy) v_u_19, (copy) v_u_12
	if p30 == v_u_18 then
		return
	elseif p30 == nil then
		if v_u_18 then
			v_u_17.Adornee = nil
			v_u_10.Visible = false
			v_u_18:SetAttribute("IsOutlined", nil)
			v_u_18 = nil
			for _, v31 in pairs(v_u_21) do
				v31:Disconnect()
			end
			table.clear(v_u_21)
		end
		return
	else
		for _, v32 in pairs(v_u_21) do
			v32:Disconnect()
		end
		table.clear(v_u_21)
		v_u_18 = p30
		v_u_18:SetAttribute("IsOutlined", true)
		if v_u_17.Adornee ~= p30 then
			v_u_17.FillTransparency = 1
		end
		v_u_17.Adornee = p30
		v_u_10.Visible = true
		local v_u_33 = p30:GetAttribute("DisplayName") or p30.Name
		local v34 = v_u_14[v_u_33]
		if v34 then
			v34 = v34.SeedRarity
		end
		local v35
		if v34 then
			v35 = v_u_15.Return_Rarity_Data(v34)
		else
			v35 = v34
		end
		if v34 == "Prismatic" then
			v_u_29(v_u_11, "\240\159\140\136", v_u_33)
		elseif v34 == "Transcendent" then
			local v_u_36 = v_u_11
			if v_u_21[v_u_36] then
				v_u_21[v_u_36]:Disconnect()
			end
			local v_u_37 = 0.75
			local v_u_38 = "\240\159\146\156"
			v_u_21[v_u_36] = v_u_2.RenderStepped:Connect(function(p39)
				-- upvalues: (ref) v_u_37, (copy) v_u_33, (copy) v_u_36, (copy) v_u_38
				v_u_37 = (v_u_37 + p39 * 0.05) % 1
				local v40 = tick() * 1.5
				local v41 = math.sin(v40) * 0.03 + 0.72
				local v42 = Color3.fromHSV(v41, 1, 1):ToHex()
				v_u_36.Text = v_u_38:gsub("\240\159\146\156", (string.format("<font color=\"#%s\">%s</font>", v42, v_u_33)))
			end)
		elseif v35 then
			local v43 = v35[2]:ToHex()
			v_u_11.Text = string.format("<font color=\"#%s\">%s</font>", v43, v_u_33)
		else
			v_u_11.Text = v_u_33
		end
		if p30:GetAttribute("Inspected") then
			local v44 = v_u_6(p30)
			v_u_7.Comma(v44)
			v_u_13.Text = v_u_9.DisplaySheckles(v44)
		else
			v_u_13.Text = ""
		end
		v_u_13.Visible = v_u_13.Text ~= ""
		local v45 = nil
		local v46 = nil
		local v47 = p30:FindFirstChild("Variant")
		if v47 and v47:IsA("StringValue") then
			local v48 = v47.Value
			if v48 ~= "" and v48 ~= "Normal" then
				v45 = v48
				v46 = v_u_8:GetHex(v45)
			end
		end
		local v49 = {}
		for v50, v51 in pairs(v_u_19) do
			if p30:GetAttribute(v50) then
				local v52 = {
					["Name"] = v50,
					["Color"] = v51.Color and ("%*"):format((v51.Color:ToHex())) or "FFFFFF"
				}
				table.insert(v49, v52)
			end
		end
		local v53 = {}
		if v45 then
			if v45 == "Rainbow" then
				table.insert(v53, "\240\159\140\136")
			else
				local v54 = string.format
				table.insert(v53, v54("<font color=\"%s\">%s</font>", v46, v45))
			end
		end
		for _, v55 in ipairs(v49) do
			local v56 = string.format
			local v57 = v55.Color
			local v58 = v55.Name
			table.insert(v53, v56("<font color=\"#%s\">%s</font>", v57, v58))
		end
		if #v53 > 0 then
			local v59 = table.concat(v53, " <font color=\"#FFFFFF\">+</font> ")
			v_u_12.Text = v59
			v_u_12.Visible = true
			if v45 == "Rainbow" then
				v_u_29(v_u_12, v59, "Rainbow")
			end
		else
			v_u_12.Visible = false
		end
		if #v49 > 0 then
			local v60 = v49[1].Color
			v_u_17.FillColor = Color3.fromHex(v60)
			return
		elseif v46 then
			v_u_17.FillColor = Color3.fromHex(v46)
		else
			v_u_17.FillColor = Color3.new(1, 1, 1)
		end
	end
end
v4.PromptShown:Connect(function(p62, _)
	-- upvalues: (copy) v_u_61
	local v63 = p62:FindFirstAncestorWhichIsA("Model")
	if v63 and v63:HasTag("Harvestable") then
		if not p62:HasTag("TendProximityPrompt") then
			p62.ActionText = "Collect"
			p62.HoldDuration = 0
			v_u_61(v63)
		end
	else
		return
	end
end)
v4.PromptHidden:Connect(function(p64)
	-- upvalues: (ref) v_u_18, (copy) v_u_17, (copy) v_u_10, (copy) v_u_21
	local v65 = p64:FindFirstAncestorWhichIsA("Model")
	if v65 and (v65:HasTag("Harvestable") and v_u_18 == v65) then
		if v_u_18 == nil then
			return
		end
		if v_u_18 then
			v_u_17.Adornee = nil
			v_u_10.Visible = false
			v_u_18:SetAttribute("IsOutlined", nil)
			v_u_18 = nil
			for _, v66 in pairs(v_u_21) do
				v66:Disconnect()
			end
			table.clear(v_u_21)
		end
	end
end)
function v_u_20.GetActivePrompt(_)
	-- upvalues: (ref) v_u_18
	if not v_u_18 then
		return nil
	end
	local v67 = nil
	for _, v68 in v_u_18:GetDescendants() do
		if v68:IsA("ProximityPrompt") and (v68.Enabled and not v68:HasTag("TendProximityPrompt")) then
			return v68
		end
	end
	return v67
end
v_u_2.RenderStepped:Connect(function()
	-- upvalues: (ref) v_u_18, (copy) v_u_10, (copy) v_u_20, (copy) v_u_16, (copy) v_u_3
	if v_u_18 then
		local v69 = v_u_20:GetActivePrompt()
		if v69 and v69.Parent:IsA("BasePart") then
			local v70, v71 = v_u_16:WorldToViewportPoint(v69.Parent.Position)
			if v71 then
				v_u_10.Position = UDim2.new(0, v70.X, 0, v70.Y + v_u_3.TopbarInset.Height)
				v_u_10.Visible = true
			else
				v_u_10.Visible = false
			end
		else
			v_u_10.Visible = false
			return
		end
	else
		v_u_10.Visible = false
		return
	end
end)
return v_u_20
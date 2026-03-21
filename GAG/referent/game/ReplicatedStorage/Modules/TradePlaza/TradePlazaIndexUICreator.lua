local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_4 = require(v1.Modules.TradeControllers.TradeItemHoverController)
local v_u_5 = require(v1.Modules.TradeTokens.TokenRAPController)
require(v1.Data.TradeData)
require(v1.Modules.GardenGuideModules.VirtualListGridCellCreator.VListTypes)
local v_u_6 = require(v1.Modules.PlayClickSound)
local v_u_7 = require(v1.Modules.TradeTokens.TokenRAPChartController)
local v_u_8 = require(v1.Modules.TradeControllers.TradeFindSellerController)
local v9 = v2.LocalPlayer.PlayerGui
local v_u_10 = v1.Data.TradePlaza.IndexTemplates.ItemTemplate
local v_u_11 = v3.RarityColorMap
local v_u_12 = v3.AnimatedColors
local v_u_13 = v9:WaitForChild("TradePlazaIndex").Frame.Sections
local v_u_14 = v_u_13.ItemsList
local v_u_15 = v_u_13.RAPHistory
local v_u_16 = nil
local v_u_35 = {
	["ToggleGGCellUI"] = function(p17, _, p18)
		local _ = p17.OBTAINED_IMAGE
		local v19 = p17.NewBanner
		local v20 = p17.Cover
		local v21 = p17.Mastery
		local v22 = p17:GetAttribute("Seen")
		p17.ITEM_NAME.Visible = v22
		p17.ITEM_NAME_SHADOW.Visible = v22
		v20.Visible = not v22
		local v23 = p17.ITEM_IMAGE
		local v24
		if v22 then
			v24 = Color3.fromRGB(255, 255, 255)
		else
			v24 = Color3.fromRGB(0, 0, 0)
		end
		v23.ImageColor3 = v24
		v21.Image = p17:GetAttribute("Mastered") and "rbxassetid://140518329666464" or "rbxassetid://99302990527020"
		local v25
		if v22 then
			v25 = p18.DataType == "Plant"
		else
			v25 = v22
		end
		v21.Visible = v25
		if v22 then
			v19.Visible = p17:GetAttribute("New")
		else
			v19.Visible = false
		end
	end,
	["RenderCell"] = function(p26, p27, _)
		-- upvalues: (copy) v_u_11, (copy) v_u_12, (copy) v_u_4
		local v28 = p27.DisplayName
		local v29 = p27.Rarity
		local v30 = p27.ImageId
		local v31 = p27.RAPValue
		local v32 = p27.Item
		p26:SetAttribute("Name", v28)
		p26:SetAttribute("Rarity", v29)
		p26:SetAttribute("ImageId", v30)
		p26:SetAttribute("RAPValue", v31)
		p26.ITEM_NAME.Text = v28
		p26.ITEM_NAME_SHADOW.Text = v28
		p26.ITEM_IMAGE.Image = v30
		p26.Name = v28
		if v29 then
			if v_u_11[v29] then
				if v_u_12[v29] then
					v_u_12[v29](p26)
				else
					p26.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v_u_11[v29], 0.75)
				end
			else
				p26.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			end
		else
			p26.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		end
		if v32 then
			local v33 = p27.Item.id
			local v34 = p27.Item.type
			p26:SetAttribute("ItemID", v33)
			p26:SetAttribute("ItemType", v34)
			p26:SetAttribute("UUID", v33)
			p26:AddTag("TradingUserInterfaceTargetable")
			v_u_4:AddItemToData(v33, p27.Item)
		end
	end
}
local function v_u_49(p36)
	-- upvalues: (copy) v_u_13, (copy) v_u_15, (ref) v_u_16, (copy) v_u_11, (copy) v_u_7, (copy) v_u_6, (copy) v_u_8, (copy) v_u_14
	local v37 = p36:GetAttribute("Name")
	local v38 = p36:GetAttribute("ImageId")
	local v39 = p36:GetAttribute("Rarity")
	local v40 = p36:GetAttribute("ItemID")
	local v41 = p36:GetAttribute("ItemType")
	local v_u_42 = v_u_13:FindFirstChild((("%*RAPHistory"):format(v40))) or v_u_15:Clone()
	v_u_16 = v_u_42
	v_u_42.Name = ("%*RAPHistory"):format(v40)
	v_u_42:SetAttribute("CurrentItem", v37)
	v_u_42:SetAttribute("CurrentItemType", v41)
	v_u_42.Title.Text = ("%*"):format(v37)
	v_u_42.ItemImg.Image = v38
	local v43 = v_u_42.RarityArea
	local v44
	if v39 then
		v44 = v_u_11[v39]
	else
		v44 = Color3.fromRGB()
	end
	v43.BackgroundColor3 = v44
	v43.TextLabel.Text = not v39 and "No Rarity" or ("%*"):format(v39)
	local _ = v_u_42.Price.Amount
	v_u_7:Show(v41, v40, v_u_42)
	v_u_42.Parent = v_u_13
	local v_u_47 = v_u_42.FindSellers.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_42, (ref) v_u_8
		v_u_6()
		local v45 = v_u_42:GetAttribute("CurrentItem")
		local v46 = v_u_42:GetAttribute("CurrentItemType")
		if v45 and v46 then
			v_u_8:Prompt(v46, v45)
		else
			warn((("No current item attribute set: %*"):format(v45)))
		end
	end)
	local v_u_48 = v_u_42.Back.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_42, (ref) v_u_16, (ref) v_u_14
		v_u_6()
		v_u_42:Destroy()
		v_u_16 = nil
		v_u_14.Visible = true
	end)
	v_u_42.Destroying:Once(function()
		-- upvalues: (ref) v_u_48, (ref) v_u_47
		if v_u_48 then
			v_u_48:Disconnect()
		end
		if v_u_47 then
			v_u_47:Disconnect()
		end
	end)
	return v_u_42
end
function v_u_35.RemakeGridCell(p50, _, p51, p52)
	-- upvalues: (copy) v_u_5, (copy) v_u_35
	local v53 = {
		["DisplayName"] = p51.data.ItemName or "Unknown",
		["Rarity"] = p51.data.Rarity,
		["ImageId"] = p51.data.ImageId or "rbxassetid://6937742258",
		["Item"] = p51,
		["RAPValue"] = v_u_5:GetRAPById(p51.type, p51.id) or 0
	}
	v_u_35.RenderCell(p50, v53, p52)
end
function v_u_35.CreateGridCell(p54, p55, _, p56)
	-- upvalues: (copy) v_u_10, (copy) v_u_35, (copy) v_u_6, (ref) v_u_16, (copy) v_u_49, (copy) v_u_14
	local v_u_57 = p56.ExistingCell or v_u_10:Clone()
	v_u_35.RemakeGridCell(v_u_57, p54, p55, p56)
	local v_u_58 = v_u_57.SENSOR.Activated:Connect(function()
		-- upvalues: (ref) v_u_6, (ref) v_u_16, (ref) v_u_49, (copy) v_u_57, (ref) v_u_14
		v_u_6()
		if not v_u_16 then
			v_u_49(v_u_57).Visible = true
			v_u_14.Visible = false
		end
	end)
	v_u_57.Destroying:Once(function()
		-- upvalues: (ref) v_u_58
		if v_u_58 then
			v_u_58:Disconnect()
			v_u_58 = nil
		end
	end)
	return v_u_57
end
return v_u_35
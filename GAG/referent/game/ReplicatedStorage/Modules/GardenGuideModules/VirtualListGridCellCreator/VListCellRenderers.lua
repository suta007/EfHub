local v1 = game:GetService("ReplicatedStorage")
local v2 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
require(script.Parent.VListTypes)
local v_u_3 = require(v1.Modules.TradeControllers.TradeItemHoverController)
local _ = v1.Data.TradePlaza.IndexTemplates.ItemTemplate
local v_u_4 = v2.RarityColorMap
local v_u_5 = v2.AnimatedColors
local v_u_31 = {
	["ToggleGGCellUI"] = function(p6, _, p7)
		local _ = p6.OBTAINED_IMAGE
		local v8 = p6.NewBanner
		local v9 = p6.Cover
		local v10 = p6.Mastery
		local v11 = p6:GetAttribute("Seen")
		p6.ITEM_NAME.Visible = v11
		p6.ITEM_NAME_SHADOW.Visible = v11
		v9.Visible = not v11
		local v12 = p6.ITEM_IMAGE
		local v13
		if v11 then
			v13 = Color3.fromRGB(255, 255, 255)
		else
			v13 = Color3.fromRGB(0, 0, 0)
		end
		v12.ImageColor3 = v13
		v10.Image = p6:GetAttribute("Mastered") and "rbxassetid://140518329666464" or "rbxassetid://99302990527020"
		local v14
		if v11 then
			v14 = p7.DataType == "Plant"
		else
			v14 = v11
		end
		v10.Visible = v14
		if v11 then
			v8.Visible = p6:GetAttribute("New")
		else
			v8.Visible = false
		end
	end,
	["RenderCell"] = function(p15, p16, p17)
		-- upvalues: (copy) v_u_4, (copy) v_u_5, (copy) v_u_3, (copy) v_u_31
		local v18 = p16.DisplayName
		local v19 = p16.Rarity
		local v20 = p16.New
		local v21 = p16.Seen
		local v22 = p16.Source
		local v23 = p16.Mastered
		local v24 = p16.Traits
		local v25 = p16.Color
		local v26 = p16.ImageId
		local v27 = p16.RAPValue
		local v28 = p16.Item
		p15:SetAttribute("Name", v18)
		p15:SetAttribute("Rarity", v19)
		p15:SetAttribute("ImageId", v26)
		p15:SetAttribute("RAPValue", v27)
		p15:SetAttribute("DetailsId", v18)
		p15:SetAttribute("New", v20)
		p15:SetAttribute("Seen", v21)
		p15:SetAttribute("Event", v22)
		p15:SetAttribute("Mastered", v23)
		p15.ITEM_NAME.Text = v18
		p15.ITEM_NAME_SHADOW.Text = v18
		p15.ITEM_IMAGE.Image = v26
		p15.Name = v18
		if v19 then
			if v_u_4[v19] then
				if v_u_5[v19] then
					v_u_5[v19](p15)
				else
					p15.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v_u_4[v19], 0.75)
				end
			else
				p15.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
			end
		else
			p15.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
		end
		if v24 then
			p15:SetAttribute("Traits", (v24:gsub("<[^>]->", "")))
		end
		if v25 then
			p15.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(p16.Color, 0.75)
		end
		if v28 then
			local v29 = p16.Item.id
			local v30 = p16.Item.type
			p15:SetAttribute("ItemID", v29)
			p15:SetAttribute("ItemType", v30)
			p15:SetAttribute("UUID", v29)
			p15:AddTag("TradingUserInterfaceTargetable")
			v_u_3:AddItemToData(v29, p16.Item)
		end
		if p17 then
			if p17.DataType then
				v_u_31.ToggleGGCellUI(p15, p16, p17)
				return
			end
			if p15:FindFirstChild("OBTAINED_IMAGE") then
				p15.OBTAINED_IMAGE:Destroy()
				p15.NewBanner:Destroy()
				p15.Cover:Destroy()
				p15.Mastery:Destroy()
			end
		end
	end
}
return v_u_31
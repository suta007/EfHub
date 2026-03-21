local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.ItemImageFinder)
local v_u_3 = require(v1.Modules.ItemNameFinder)
local v_u_4 = require(v1.Modules.ItemRarityFinder)
require(v1.Data.TradeData)
local v_u_5 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_6 = require(v1.Modules.NumberUtil)
local v_u_7 = require(v1.Modules.TradeTokens.TokenRAPController)
require(v1.Data.TradeBoothsData)
local _ = v1.Modules.TradeTokens.Templates.HoverableItemTemplate
return {
	["PopulateItemFrame"] = function(p8, p9)
		-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_4, (copy) v_u_5, (copy) v_u_6
		local v10 = p9.data.ItemData and p9.data.ItemData.ItemName or (p9.data.ItemName or p9.data.PetType or (p9.data.SkinID or "Unknown"))
		local v11 = v_u_3(v10, p9.type)
		local v12 = p8.ITEM_NAME
		local v13 = p8.ITEM_NAME_SHADOW
		v12.Text = ("%*"):format(v11)
		v13.Text = ("%*"):format(v11)
		p8.ITEM_IMAGE.Image = v_u_2(v10, p9.type)
		local v14 = v_u_4(v10, p9.type)
		p8:SetAttribute("Rarity", v14)
		local v15 = v_u_5.RarityColorMap[v14]
		if v15 then
			local v16 = v_u_5.AnimatedColors[v14]
			if v16 then
				v16(p8)
			else
				p8.BackgroundColor3 = Color3.fromRGB(133, 82, 51):Lerp(v15, 0.75)
			end
		else
			p8.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
		end
		if p9.listingPrice then
			p8.Price.Visible = true
			p8.Price.Amount.Text = p9.listingPrice and v_u_6.Comma(p9.listingPrice) or "???"
		else
			p8.Price.Visible = false
		end
	end,
	["SortTradeItems"] = function(p_u_17, p_u_18, p19)
		-- upvalues: (copy) v_u_3, (copy) v_u_4, (copy) v_u_5, (copy) v_u_7
		local v20 = table.clone(p19)
		table.sort(v20, function(p21, p22)
			-- upvalues: (ref) v_u_3, (copy) p_u_17, (ref) v_u_4, (ref) v_u_5, (ref) v_u_7, (copy) p_u_18
			local v23 = nil
			local v24 = nil
			local v25 = v_u_3(p21.data.Name or (p21.data.ItemName or p21.data.PetType or (p21.data.SkinID or "")), p21.type)
			local v26 = v_u_3(p22.data.Name or (p22.data.ItemName or p22.data.PetType or (p22.data.SkinID or "")), p22.type)
			if p_u_17 == "Name" then
				v23 = v_u_3(p21.data.Name or (p21.data.ItemName or p21.data.PetType or (p21.data.SkinID or "")), p21.type)
				v24 = v_u_3(p22.data.Name or (p22.data.ItemName or p22.data.PetType or (p22.data.SkinID or "")), p22.type)
			elseif p_u_17 == "Rarity" then
				local v27 = v_u_4(p21.data.Name or p21.data.ItemName or (p21.data.PetType or p21.data.SkinID), p21.type)
				local v28 = v_u_4(p22.data.Name or p22.data.ItemName or (p22.data.PetType or p22.data.SkinID), p22.type)
				v23 = v27 and v_u_5.RarityLayoutMap[v27] or 0
				v24 = v28 and v_u_5.RarityLayoutMap[v28] or 0
			elseif p_u_17 == "RAP" then
				v23 = v_u_7:GetRAP(p21.type, p21.data) or 0
				v24 = v_u_7:GetRAP(p22.type, p22.data) or 0
			elseif p_u_17 == "Price" then
				v23 = p21.listingPrice or 0
				v24 = p22.listingPrice or 0
			end
			if v23 == v24 then
				return v25 < v26
			elseif p_u_18 then
				return v23 < v24
			else
				return v24 < v23
			end
		end)
		return v20
	end
}
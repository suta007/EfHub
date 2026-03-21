local v1 = game:GetService("ReplicatedStorage")
local v_u_2 = require(v1.Modules.ItemImageFinder)
local v_u_3 = require(v1.Modules.ItemNameFinder)
local v_u_4 = require(v1.Modules.ItemRarityFinder)
require(v1.Data.TradeData)
local v_u_5 = require(v1.Modules.TradeTokens.TokenRAPController)
require(script.Parent.VListTypes)
return {
	["GardenGuide"] = function(p6)
		return {
			["DisplayName"] = p6.DisplayName or p6.Name,
			["Rarity"] = p6.Rarity,
			["ImageId"] = p6.ImageId,
			["New"] = p6.New,
			["Seen"] = p6.Seen,
			["Source"] = p6.Source,
			["Mastered"] = p6.Mastered,
			["Traits"] = p6.Traits,
			["Color"] = p6.Color
		}
	end,
	["TradePlazaIndex"] = function(p7)
		-- upvalues: (copy) v_u_5
		return {
			["DisplayName"] = p7.data.ItemName or "Unknown",
			["Rarity"] = p7.data.Rarity,
			["ImageId"] = p7.data.ImageId or "rbxassetid://6937742258",
			["Item"] = p7,
			["RAPValue"] = v_u_5:GetRAPById(p7.type, p7.id) or 0
		}
	end,
	["TradeBoothInventory"] = function(p8)
		-- upvalues: (copy) v_u_2, (copy) v_u_3, (copy) v_u_4, (copy) v_u_5
		local v9 = p8.data.Name or (p8.data.ItemName or p8.data.PetType or (p8.data.SkinID or "Unknown"))
		local v10 = v_u_2(v9, p8.type)
		return {
			["DisplayName"] = v_u_3(v9, p8.type) or "Unknown",
			["Rarity"] = v_u_4(v9, p8.type),
			["ImageId"] = v10 or "rbxassetid://6937742258",
			["Item"] = p8,
			["RAPValue"] = v_u_5:GetRAPById(p8.type, p8.id) or 0
		}
	end
}
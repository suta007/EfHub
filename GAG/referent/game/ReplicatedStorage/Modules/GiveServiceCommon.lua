local v_u_1 = game:GetService("ReplicatedStorage")
local v2 = require(script.Types)
require(v_u_1.Modules.CommaFormatNumber)
local v_u_3 = {
	["Types"] = v2
}
local v_u_4 = {
	["Seed"] = v2.Seed,
	["Gear"] = v2.Gear,
	["Seed Pack"] = v2.SeedPack,
	["Crate"] = v2.Crate,
	["Cosmetic"] = v2.Cosmetic,
	["Currency"] = v2.Currency,
	["Fences"] = v2.Fences,
	["Fruit"] = v2.Fruit,
	["Pet"] = v2.Pet,
	["Egg"] = v2.Egg,
	["TradeBoothSkin"] = v2.TradeBoothSkin
}
function v_u_3.Format(_, p5)
	-- upvalues: (copy) v_u_4
	local v6 = v_u_4[p5.Type]
	if not v6 then
		return "N/A"
	end
	if v6.Format then
		return v6:Format(p5) or "N/A"
	end
	warn((("Handler for %* does not have a Format function!"):format(p5.Type)))
	return "N/A"
end
function v_u_3.GetRarity(_, p7)
	-- upvalues: (copy) v_u_4
	if p7.RarityOverride then
		return p7.RarityOverride
	end
	local v8 = v_u_4[p7.Type]
	if not v8 then
		return "Common"
	end
	if v8.GetRarity then
		return v8:GetRarity(p7) or "Common"
	end
	warn((("Handler for %* does not have a GetRarity function!"):format(p7.Type)))
	return "Common"
end
function v_u_3.GetImage(_, p9)
	-- upvalues: (copy) v_u_4
	local v10 = v_u_4[p9.Type]
	if not v10 then
		return "rbxassetid://0"
	end
	if v10.GetImage then
		return v10:GetImage(p9)
	end
	warn((("Handler for %* does not have a GetImage function!"):format(p9.Type)))
	return "rbxassetid://0"
end
function v_u_3.GetRarityColor(_, p11)
	-- upvalues: (copy) v_u_1, (copy) v_u_3
	local v12 = require(v_u_1.Modules.GardenGuideModules.DataModules.GGStaticData)
	local v13 = v_u_3:GetRarity(p11)
	return v12.RarityColorMap[v13] or Color3.new(1, 1, 1)
end
local v_u_14 = {
	["Seed"] = "Seed",
	["Holdable"] = "Fruit",
	["Seed Pack"] = "Seed Pack",
	["PetEgg"] = "Egg",
	["Pet"] = "Pet"
}
local v_u_15 = {}
for v16, v17 in v_u_14 do
	v_u_15[v17] = v16
end
function v_u_3.InventoryToGiveType(_, p18)
	-- upvalues: (copy) v_u_14
	local v19 = v_u_14[p18]
	if not v19 then
		warn((("[GiveServiceCommon] No conversion for %* to GiveType"):format(p18)))
	end
	return v19
end
function v_u_3.GiveToInventoryType(_, p20)
	-- upvalues: (copy) v_u_15
	local v21 = v_u_15[p20]
	if not v21 then
		warn((("[GiveServiceCommon] No conversion for %* to InventoryType"):format(p20)))
	end
	return v21
end
function v_u_3.MatchesInventoryItem(_, p22, p23)
	-- upvalues: (copy) v_u_3
	if p22.ItemType ~= v_u_3:GiveToInventoryType(p23.Type) then
		return false
	end
	if p23.Type == "Seed Pack" then
		if p22.ItemData.Type == p23.Value then
			return true
		end
	else
		warn((("[GiveServiceCommon] Type match not implemented %*"):format(p23.Type)))
	end
	return false
end
return v_u_3
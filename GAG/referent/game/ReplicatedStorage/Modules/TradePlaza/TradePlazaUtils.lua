local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("Players")
local v3 = require(v1.Data.TradeBoothSkinRegistry)
local v4 = require(v1.Data.SeedData)
local v5 = require(v1.Data.PetRegistry.PetList)
local v6 = require(v1.Data.CosmeticCrateRegistry.CosmeticCrates)
local v7 = require(v1.Data.TradePlaza.TradePlazaBlacklist)
local v8 = require(v1.Modules.GardenGuideModules.DataModules.GGStaticData)
local v_u_9 = require(v1.Modules.TradeTokens.TokenRAPController)
local v_u_10 = require(v1.Modules.TradeTokens.TokenRAPUtil)
require(v1.Data.TradeData)
local v_u_11 = require(v1.Modules.UpdateService)
local v12 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local _ = v2.LocalPlayer.PlayerGui
local _ = v1.Data.TradePlaza.IndexTemplates.ItemTemplate
local v_u_13 = v8.RarityLayoutMap
local v_u_14 = {
	["Seeds"] = {
		["Data"] = v4,
		["TP"] = v7.SeedBlacklist,
		["GG"] = v12.PlantBlacklist
	},
	["Plants"] = {
		["Data"] = v4,
		["TP"] = v7.PlantBlacklist,
		["GG"] = v12.PlantBlacklist
	},
	["Pets"] = {
		["Data"] = v5,
		["TP"] = v7.PetBlacklist,
		["GG"] = v12.PetBlacklist
	},
	["Crates"] = {
		["Data"] = v6,
		["TP"] = v7.CrateBlacklist,
		["GG"] = v12.CosmeticBlacklist
	}
}
local v15 = {
	["Data"] = v3,
	["TP"] = {
		["Default"] = true
	},
	["GG"] = {}
}
v_u_14.TradeBoothSkins = v15
local v16 = {}
local function v_u_31(p17, p18, p19)
	-- upvalues: (copy) v_u_10, (copy) v_u_9
	local v20 = {
		["id"] = "-",
		["type"] = "Holdable"
	}
	if p17 == "Seeds" then
		return v20
	end
	if p17 == "Plants" then
		local v21 = v_u_10.GetItemId("Holdable", {
			["MutationString"] = "",
			["ItemName"] = p18
		})
		local v22 = v_u_9:GetRAPById("Holdable", v21) or 0
		local v23 = {
			["id"] = v21,
			["type"] = "Holdable",
			["data"] = {
				["ItemName"] = p18,
				["ImageId"] = p19.FruitIcon,
				["Rarity"] = p19.SeedRarity,
				["RAPValue"] = v22,
				["MutationString"] = "",
				["Variant"] = "Normal",
				["FakeItem"] = true
			}
		}
		return v23
	end
	if p17 ~= "Pets" then
		if p17 == "Crates" then
			return v20
		end
		if p17 == "TradeBoothSkins" then
			local v24 = v_u_10.GetItemId("TradeBoothSkin", {
				["SkinID"] = p18
			})
			local v25 = v_u_9:GetRAPById("TradeBoothSkin", v24) or 0
			v20 = {
				["id"] = v24,
				["type"] = "TradeBoothSkin",
				["data"] = {
					["ItemName"] = p18,
					["ImageId"] = p19.Icon,
					["Rarity"] = p19.Rarity,
					["RAPValue"] = v25,
					["SkinID"] = p18,
					["FakeItem"] = true
				}
			}
		end
		return v20
	end
	local v26 = {
		["PetType"] = p18,
		["PetData"] = {
			["MutationType"] = "",
			["Level"] = 0
		}
	}
	local v27 = v_u_10.GetItemId("Pet", v26)
	local v28 = v_u_9:GetRAPById("Pet", v27) or 0
	local v29 = {
		["id"] = v27,
		["type"] = "Pet"
	}
	local v30 = {
		["ItemName"] = p18,
		["ImageId"] = p19.Icon,
		["Rarity"] = p19.Rarity,
		["RAPValue"] = v28,
		["PetType"] = p18,
		["PetData"] = {
			["MutationType"] = "Normal",
			["Level"] = 1
		},
		["FakeItem"] = true
	}
	v29.data = v30
	return v29
end
function v16.GetItemsForCategory(p32, p33)
	-- upvalues: (copy) v_u_14, (copy) v_u_11, (copy) v_u_31
	local v34 = v_u_14[p32].Data
	local v35 = v_u_14[p32].TP
	local v36 = v_u_14[p32].GG
	local v37 = {}
	for v38, v39 in v34 do
		if not v_u_11:IsHiddenFromUpdate(v38) and (not v35[v38] and (not v36[v38] and string.find(string.lower(v38), string.lower(p33 or "")))) then
			local v40 = v_u_31(p32, v38, v39)
			table.insert(v37, v40)
		end
	end
	return v37
end
function v16.SortItems(p41, p_u_42)
	-- upvalues: (copy) v_u_13
	table.sort(p41, function(p43, p44)
		-- upvalues: (copy) p_u_42, (ref) v_u_13
		if p_u_42 == "RAP Value Desc" then
			if p43.data.RAPValue == p44.data.RAPValue then
				return p43.data.ItemName < p44.data.ItemName
			else
				return p43.data.RAPValue > p44.data.RAPValue
			end
		elseif p_u_42 == "Rarity Asc" then
			if v_u_13[p43.data.Rarity] == v_u_13[p44.data.Rarity] then
				return p43.data.ItemName < p44.data.ItemName
			else
				return v_u_13[p43.data.Rarity] < v_u_13[p44.data.Rarity]
			end
		elseif p_u_42 == "Rarity Desc" then
			if v_u_13[p43.data.Rarity] == v_u_13[p44.data.Rarity] then
				return p43.data.ItemName < p44.data.ItemName
			else
				return v_u_13[p43.data.Rarity] > v_u_13[p44.data.Rarity]
			end
		else
			return p43.data.RAPValue < p44.data.RAPValue
		end
	end)
end
return v16
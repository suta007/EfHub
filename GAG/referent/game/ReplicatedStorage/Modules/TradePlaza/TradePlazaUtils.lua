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
local v_u_12 = require(v1.Modules.StringUtils)
local v13 = v1.GameEvents.GardenGuide.GetGGBlacklist:InvokeServer()
local _ = v2.LocalPlayer.PlayerGui
local _ = v1.Data.TradePlaza.IndexTemplates.ItemTemplate
local v_u_14 = v8.RarityLayoutMap
local v_u_15 = {
	["Seeds"] = {
		["Data"] = v4,
		["TP"] = v7.SeedBlacklist,
		["GG"] = v13.PlantBlacklist
	},
	["Plants"] = {
		["Data"] = v4,
		["TP"] = v7.PlantBlacklist,
		["GG"] = v13.PlantBlacklist
	},
	["Pets"] = {
		["Data"] = v5,
		["TP"] = v7.PetBlacklist,
		["GG"] = v13.PetBlacklist
	},
	["Crates"] = {
		["Data"] = v6,
		["TP"] = v7.CrateBlacklist,
		["GG"] = v13.CosmeticBlacklist
	}
}
local v16 = {
	["Data"] = v3,
	["TP"] = {
		["Default"] = true
	},
	["GG"] = {}
}
v_u_15.TradeBoothSkins = v16
local v17 = {}
local function v_u_32(p18, p19, p20)
	-- upvalues: (copy) v_u_10, (copy) v_u_9
	local v21 = {
		["id"] = "-",
		["type"] = "Holdable"
	}
	if p18 == "Seeds" then
		return v21
	end
	if p18 == "Plants" then
		local v22 = v_u_10.GetItemId("Holdable", {
			["MutationString"] = "",
			["ItemName"] = p19
		})
		local v23 = v_u_9:GetRAPById("Holdable", v22) or 0
		local v24 = {
			["id"] = v22,
			["type"] = "Holdable",
			["data"] = {
				["ItemName"] = p19,
				["ImageId"] = p20.FruitIcon,
				["Rarity"] = p20.SeedRarity,
				["RAPValue"] = v23,
				["MutationString"] = "",
				["Variant"] = "Normal",
				["FakeItem"] = true
			}
		}
		return v24
	end
	if p18 ~= "Pets" then
		if p18 == "Crates" then
			return v21
		end
		if p18 == "TradeBoothSkins" then
			local v25 = v_u_10.GetItemId("TradeBoothSkin", {
				["SkinID"] = p19
			})
			local v26 = v_u_9:GetRAPById("TradeBoothSkin", v25) or 0
			v21 = {
				["id"] = v25,
				["type"] = "TradeBoothSkin",
				["data"] = {
					["ItemName"] = p19,
					["ImageId"] = p20.Icon,
					["Rarity"] = p20.Rarity,
					["RAPValue"] = v26,
					["SkinID"] = p19,
					["FakeItem"] = true
				}
			}
		end
		return v21
	end
	local v27 = {
		["PetType"] = p19,
		["PetData"] = {
			["MutationType"] = "",
			["Level"] = 0
		}
	}
	local v28 = v_u_10.GetItemId("Pet", v27)
	local v29 = v_u_9:GetRAPById("Pet", v28) or 0
	local v30 = {
		["id"] = v28,
		["type"] = "Pet"
	}
	local v31 = {
		["ItemName"] = p19,
		["ImageId"] = p20.Icon,
		["Rarity"] = p20.Rarity,
		["RAPValue"] = v29,
		["PetType"] = p19,
		["PetData"] = {
			["MutationType"] = "Normal",
			["Level"] = 1
		},
		["FakeItem"] = true
	}
	v30.data = v31
	return v30
end
function v17.GetItemsForCategory(p33, p34)
	-- upvalues: (copy) v_u_15, (copy) v_u_11, (copy) v_u_12, (copy) v_u_32
	local v35 = v_u_15[p33].Data
	local v36 = v_u_15[p33].TP
	local v37 = v_u_15[p33].GG
	local v38 = {}
	for v39, v40 in v35 do
		if not v_u_11:IsHiddenFromUpdate(v39) then
			local v41 = v_u_12:StipFlavourText(v39)
			if not v36[v39] and (not v36[v41] and (not v37[v39] and (not v37[v41] and string.find(string.lower(v39), string.lower(p34 or ""))))) then
				local v42 = v_u_32(p33, v39, v40)
				table.insert(v38, v42)
			end
		end
	end
	return v38
end
function v17.SortItems(p43, p_u_44)
	-- upvalues: (copy) v_u_14
	table.sort(p43, function(p45, p46)
		-- upvalues: (copy) p_u_44, (ref) v_u_14
		if p_u_44 == "RAP Value Desc" then
			if p45.data.RAPValue == p46.data.RAPValue then
				return p45.data.ItemName < p46.data.ItemName
			else
				return p45.data.RAPValue > p46.data.RAPValue
			end
		elseif p_u_44 == "Rarity Asc" then
			if v_u_14[p45.data.Rarity] == v_u_14[p46.data.Rarity] then
				return p45.data.ItemName < p46.data.ItemName
			else
				return v_u_14[p45.data.Rarity] < v_u_14[p46.data.Rarity]
			end
		elseif p_u_44 == "Rarity Desc" then
			if v_u_14[p45.data.Rarity] == v_u_14[p46.data.Rarity] then
				return p45.data.ItemName < p46.data.ItemName
			else
				return v_u_14[p45.data.Rarity] > v_u_14[p46.data.Rarity]
			end
		else
			return p45.data.RAPValue < p46.data.RAPValue
		end
	end)
end
return v17
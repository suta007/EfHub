local v_u_1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
require(v_u_1.Types.PetTypes)
local v_u_2 = require(v_u_1.Modules.MutationHandler)
local v_u_3 = require(v_u_1.Data.PetRegistry.PetMutationRegistry)
require(v_u_1.Data.DefaultData)
local v_u_42 = {
	["RAPCacheLifetime"] = 60,
	["ItemTypes"] = { "Pet", "Holdable", "TradeBoothSkin" },
	["NumItemTiers"] = {
		["Pet"] = 3,
		["Holdable"] = 10,
		["TradeBoothSkin"] = 1
	},
	["GetItemId"] = function(p4, p5)
		-- upvalues: (copy) v_u_42, (copy) v_u_2
		if p4 == "Pet" then
			local v6
			if p5.PetData then
				v6 = p5.PetData.MutationType
			else
				v6 = nil
			end
			local v7 = (not v6 or v6 == "") and "Normal" or v6
			local v8 = p5.PetData and (p5.PetData.Level or 1) or 1
			local v9 = math.max(v8, 1)
			local v10
			if v9 >= 100 then
				v10 = v_u_42.NumItemTiers.Pet
			else
				local v11 = v9 / 10
				local v12 = math.floor(v11) + 1
				local v13 = v_u_42.NumItemTiers.Pet - 1
				v10 = math.clamp(v12, 1, v13)
			end
			return ("Pet-%*-%*-T%*"):format(p5.PetType, v7, v10)
		end
		if p4 ~= "Holdable" then
			return p4 ~= "TradeBoothSkin" and "Unknown" or ("TradeBoothSkin-%*-T%*"):format(p5.SkinID, 1)
		end
		local v14 = not p5.Variant and "Normal" or p5.Variant
		local v15 = v_u_2:CalcValueMultiFromMuts((v_u_2:ExtractMutationsFromString(p5.MutationString)))
		local v16 = math.clamp(v15, 1, 100000)
		local v17 = math.log10(v16) / 5
		local v18 = 1 + (v_u_42.NumItemTiers.Holdable - 1) * v17 ^ 1.4285714285714286
		local v19 = math.floor(v18)
		local v20 = v_u_42.NumItemTiers.Holdable
		local v21 = math.clamp(v19, 1, v20)
		return ("Holdable-%*-%*-T%*"):format(p5.ItemName, v14, v21)
	end,
	["IsValidItem"] = function(p22, p23)
		-- upvalues: (copy) v_u_42, (copy) v_u_3, (copy) v_u_2, (copy) v_u_1
		if typeof(p22) == "string" and table.find(v_u_42.ItemTypes, p22) then
			if typeof(p23) == "table" then
				if p22 == "Pet" then
					local v24 = p23.PetData
					local v25
					if typeof(v24) == "table" then
						v25 = p23.PetData.MutationType
					else
						v25 = nil
					end
					local v26
					if v25 == nil or v25 == "Normal" then
						v26 = true
					elseif typeof(v25) == "string" then
						v26 = v_u_3.EnumToPetMutation[v25] ~= nil
					else
						v26 = false
					end
					local v27 = p23.PetData
					local v28
					if typeof(v27) == "table" then
						v28 = p23.PetData.Level
					else
						v28 = nil
					end
					local v29
					if v28 == nil then
						v29 = true
					elseif typeof(v28) == "number" and math.floor(v28) == v28 then
						v29 = math.clamp(v28, 0, 1000) == v28
					else
						v29 = false
					end
					return v26 and v29
				elseif p22 == "Holdable" then
					local v30 = not p23.Variant and "Normal" or p23.Variant
					local v31 = typeof(v30) == "string"
					local v32 = 0
					local v33 = v_u_2:ExtractMutationsFromString(p23.MutationString)
					local v34 = p23.MutationString
					if v34 then
						local v35 = v34:gsub("%[", ""):gsub("%]", ""):gsub("%s+", "")
						for _ in string.gmatch(v35, "([^,]+)") do
							v32 = v32 + 1
						end
					end
					return v31 and v32 == #v33
				elseif p22 == "TradeBoothSkin" then
					return require(v_u_1.Data.TradeBoothSkinRegistry)[p23.SkinID] ~= nil
				else
					return false
				end
			else
				return false
			end
		else
			return false
		end
	end,
	["GetItemData"] = function(p36, p37, p38)
		if p37 == "Holdable" or p37 == "Packaged Seed" then
			local v39 = p36.InventoryData[p38]
			if v39 then
				return v39.ItemData
			end
		else
			if p37 == "Pet" then
				return p36.PetsData.PetInventory.Data[p38]
			end
			if p37 == "TradeBoothSkin" and p36.TradeBoothSkinData.OwnedSkins[p38] then
				return {
					["SkinID"] = p38
				}
			end
		end
		return nil
	end,
	["GetDefaultItemData"] = function(p40, p41)
		return p40 == "Pet" and {
			["PetType"] = p41,
			["PetData"] = {
				["MutationType"] = "Normal",
				["Level"] = 0,
				["LevelProgress"] = 0,
				["Hunger"] = 0,
				["BaseWeight"] = 1,
				["Boosts"] = {}
			},
			["PetAbility"] = {}
		} or (p40 == "Holdable" and {
			["ItemName"] = p41,
			["MutationString"] = ""
		} or (p40 == "TradeBoothSkin" and {
			["SkinID"] = p41
		} or nil))
	end
}
return v_u_42
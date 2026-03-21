local v1 = game:GetService("ReplicatedStorage")
local v2 = game:GetService("ServerScriptService")
local v_u_3 = game:GetService("RunService")
local v_u_4 = game:GetService("Players")
require(v1.Item_Module)
local v_u_5 = require(v1.Modules.PetServices.PetUtilities)
local v_u_6 = require(v1.Data.PetRegistry)
require(v1.Data.EnumRegistry.InventoryServiceEnums)
local v_u_7 = require(v1.Modules.NumberUtil)
local v_u_8 = v_u_3:IsServer()
if v_u_8 then
	v_u_8 = require(v2.Modules.PetsServices.PetsService)
end
local v_u_9 = v_u_3:IsClient()
if v_u_9 then
	v_u_9 = require(v1.Modules.DataService)
end
require(v1.Data.EnumRegistry.ItemTypeEnums)
local function v_u_20(p10)
	-- upvalues: (copy) v_u_6, (copy) v_u_7, (copy) v_u_5
	local v11 = p10.HatchedFrom
	if not v11 or v11 == "" then
		warn("CalculatePetValue | No HatchedFrom value!")
		return 0
	end
	local v12 = v_u_6.PetEggs[v11]
	if not v12 then
		warn("CalculatePetValue | No egg data found!")
		return 0
	end
	local v13 = v12.RarityData.Items[p10.PetType]
	if not v13 then
		warn("CalculatePetValue | No pet data in egg!")
		return 0
	end
	local v14 = v13.GeneratedPetData.WeightRange
	if not v14 then
		warn("CalculatePetValue | No WeightRange found!")
		return 0
	end
	local v15 = v_u_7.ReverseLerp(v14[1], v14[2], p10.BaseWeight)
	local v16 = math.lerp(0.8, 1.2, v15)
	local v17 = v_u_5:GetLevelProgress(p10.Level)
	local v18 = v16 * math.lerp(0.15, 6, v17)
	local v19 = v_u_6.PetList[p10.PetType].SellPrice * v18
	return math.floor(v19)
end
return function(p21)
	-- upvalues: (copy) v_u_4, (copy) v_u_3, (copy) v_u_8, (copy) v_u_9, (copy) v_u_20
	if not p21 then
		warn("CalculatePetValue | No Pet Tool given!")
		return 0
	end
	local v22
	if type(p21) == "table" then
		v22 = p21
	else
		v22 = nil
	end
	if typeof(p21) == "Instance" then
		local v23 = v_u_4:GetPlayerFromCharacter((p21:FindFirstAncestorWhichIsA("Model"))) or p21:FindFirstAncestorWhichIsA("Player")
		if not v23 then
			warn("CalculatePetValue | No Player Ancestor found!")
			return 0
		end
		local v24 = p21:GetAttribute("PET_UUID")
		if not v24 then
			warn("CalculatePetValue | No UUID!")
			return 0
		end
		if v_u_3:IsServer() then
			v22 = v_u_8:GetPlayerPetData(v23, v24)
		else
			v22 = v_u_9:GetData().PetsData.PetInventory.Data[v24]
		end
		if not v22 then
			warn("CalculatePetValue | No pet data found!")
			return 0
		end
	end
	return v_u_20({
		["PetType"] = v22.PetType,
		["HatchedFrom"] = v22.PetData.HatchedFrom,
		["BaseWeight"] = v22.PetData.BaseWeight,
		["Level"] = v22.PetData.Level
	})
end
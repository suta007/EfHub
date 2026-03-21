local v1 = game:GetService("ReplicatedStorage")
game:GetService("ServerScriptService")
game:GetService("HttpService")
local v_u_2 = {}
local v_u_3 = require(v1.Modules.DataService)
local v4 = require(v1.Data.CosmeticRegistry)
local v_u_5 = require(v1.Modules.CountDictionary)
local v_u_6 = require(v1.Modules.CosmeticServices.CosmeticUtilities)
local v_u_7 = require(v1.Modules.CosmeticServices.CosmeticUpgradeService)
local v_u_8 = require(v1.Modules.Notification)
local v_u_9 = require(v1.Data.CosmeticRegistry.CosmeticMutableStats)
local v_u_10 = require(v1.Modules.SaveSlotControllers.SaveSlotController)
local v_u_11 = v1:WaitForChild("GameEvents"):WaitForChild("CosmeticService")
local v_u_12 = v4.InputConfig.DEFAULT_PLACEMENT_CONFIG
local _ = v4.CosmeticList
function v_u_2.HasMaxInventory(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_5
	local v13 = v_u_3:GetData()
	if v13 then
		local v14 = v13.CosmeticData
		if v14.MutableStats then
			local v15 = v_u_2:GetMutableStat("MaxCosmeticsInInventory")
			if v15 then
				local v16 = v14.Inventory
				if v16 then
					return v15 <= v_u_5(v16)
				else
					return warn("CosmeticService:HasMaxInventory Passed player has corrupted CosmeticData.Inventory!")
				end
			else
				return warn("CosmeticService:HasMaxInventory Passed player has corrupted MaxCosmeticsInInventory Stats!")
			end
		else
			return warn("CosmeticService:HasMaxInventory Passed player has corrupted MutableStats!")
		end
	else
		return
	end
end
function v_u_2.HasMaxEquipped(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_2, (copy) v_u_10, (copy) v_u_5
	local v17 = v_u_3:GetData()
	if v17 then
		if v17.CosmeticData.MutableStats then
			local v18 = v_u_2:GetMutableStat("MaxEquippedCosmetics")
			if v18 then
				local v19 = v_u_10:GetCurrentSaveSlot().EquippedCosmetics
				if v19 then
					return v18 <= v_u_5(v19)
				else
					return warn("CosmeticService:HasMaxInventory Passed player has corrupted CosmeticData.Inventory!")
				end
			else
				return warn("CosmeticService:HasMaxInventory Passed player has corrupted MaxEquippedCosmetics Stats!")
			end
		else
			return warn("CosmeticService:HasMaxInventory Passed player has corrupted MutableStats!")
		end
	else
		return
	end
end
function v_u_2.GetCosmeticArbitraryData(_, p20)
	-- upvalues: (copy) v_u_2
	local v21 = v_u_2:GetAllCosmetics()
	if v21 then
		local v22 = v21[p20]
		if v22 then
			return v22.Data
		end
	end
end
function v_u_2.GetMutableStat(_, p23)
	-- upvalues: (copy) v_u_3, (copy) v_u_9, (copy) v_u_7
	local v24 = v_u_3:GetData()
	if v24 then
		local v25 = v24.CosmeticData.MutableStats
		local v26 = v_u_9[p23]
		return (v26 and v26.Default or 0) + v_u_7:GetUpgradeValue(p23, v25[p23])
	end
end
function v_u_2.CanEquipAtLocation(_, p27)
	-- upvalues: (copy) v_u_12, (copy) v_u_6
	local v28 = p27.Character
	if v28 then
		return v_u_6:IsWithinFarm(p27, v28:GetPivot() * v_u_12.CFRAME_OFFSET)
	else
		return false
	end
end
function v_u_2.Equip(_, p29)
	-- upvalues: (copy) v_u_3, (copy) v_u_10, (copy) v_u_2, (copy) v_u_8, (copy) v_u_5, (copy) v_u_11
	local v30 = v_u_3:GetData()
	if v30 then
		local _ = v30.CosmeticData
		local v31 = v_u_10:GetCurrentSaveSlot().EquippedCosmetics
		if not v31 then
			return warn("CosmeticService:HasMaxInventory Passed player has corrupted CosmeticData.Inventory!")
		end
		if v_u_2:HasMaxEquipped() then
			return v_u_8:CreateNotification((("Cannot place anymore you have max placed objects! %*"):format((v_u_5(v31)))))
		end
		v_u_11:FireServer("Equip", p29)
		return true
	end
end
function v_u_2.Unequip(_, p32)
	-- upvalues: (copy) v_u_11
	v_u_11:FireServer("Unequip", p32)
	return true
end
function v_u_2.DestroyCosmetic(_, p33)
	-- upvalues: (copy) v_u_11
	v_u_11:FireServer("DestroyCosmetic", p33)
	return true
end
function v_u_2.UnequipAll(_)
	-- upvalues: (copy) v_u_11
	v_u_11:FireServer("UnequipAll")
	return true
end
function v_u_2.GetAllCosmetics(_)
	-- upvalues: (copy) v_u_3
	local v34 = v_u_3:GetData()
	if v34 then
		return v34.CosmeticData.Inventory or warn("CosmeticService:GetAllCosmetics Passed player has corrupted CosmeticData.Inventory!")
	end
end
function v_u_2.GetAllEquippedCosmetics(_)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	local v35 = v_u_3:GetData()
	if v35 then
		local _ = v35.CosmeticData
		return v_u_10:GetCurrentSaveSlot().EquippedCosmetics or warn("CosmeticService:HasMaxInventory Passed player has corrupted CosmeticData.Inventory!")
	end
end
function v_u_2.IsCosmeticEquipped(_, p36)
	-- upvalues: (copy) v_u_3, (copy) v_u_10
	local v37 = v_u_3:GetData()
	if v37 then
		local _ = v37.CosmeticData
		local v38 = v_u_10:GetCurrentSaveSlot().EquippedCosmetics
		if v38 then
			return v38[p36] ~= nil
		else
			return warn("CosmeticService:HasMaxInventory Passed player has corrupted CosmeticData.Inventory!")
		end
	else
		return
	end
end
return v_u_2